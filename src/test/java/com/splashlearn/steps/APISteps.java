package com.splashlearn.steps;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.splashlearn.context.APIContext;
import com.splashlearn.context.EntityContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.api.operations.StudentAPI;
import com.splashlearn.custom.api.operations.TeacherAPI;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.model.Student;
import com.splashlearn.custom.entity.model.Task;
import com.splashlearn.custom.entity.model.Teacher;
import com.splashlearn.custom.entity.operations.StudentOperations;
import com.splashlearn.custom.entity.operations.TeacherOperations;
import com.splashlearn.custom.dto.CompletePlayable;
import com.splashlearn.custom.dto.KlassBuildDTO;
import com.splashlearn.custom.dto.TeacherSignupDTO;
import com.splashlearn.custom.dto.TeachersDTO;
import io.cucumber.datatable.DataTable;
import io.cucumber.docstring.DocString;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.util.*;
import java.util.stream.IntStream;

import static org.apache.commons.lang.StringUtils.isBlank;
import static org.apache.commons.lang3.StringUtils.isNotBlank;

public class APISteps {

    private final Evaluator evaluator = new Evaluator();
    private EntityContext entityContext;
    private APIContext apiContext;
    private TeacherAPI teacherAPI;
    private TestContext testContext;

    public APISteps(TestContext testContext, TeacherAPI teacherAPI) {
        this.apiContext = testContext.getApiContext();
        this.entityContext = testContext.getEntityContext();
        this.teacherAPI = teacherAPI;
        this.testContext = testContext;
    }

    @DataTableType
    public CompletePlayable playableEntries(Map<String, String> entry) {

        if (Objects.isNull(entry.get("learningObjectiveId")) || Objects.isNull(entry.get("playableId")))
            return CompletePlayable.builder()
                    .studentFirstName(entry.getOrDefault("studentFirstName", null))
                    .subject(entry.getOrDefault("subject", null))
                    .build();

        return CompletePlayable.builder()
                .studentFirstName(entry.getOrDefault("studentFirstName", null))
                .subject(entry.getOrDefault("subject", null))
                .learningObjectiveId(Integer.parseInt(entry.getOrDefault("learningObjectiveId", null)))
                .playableId(Integer.parseInt(entry.getOrDefault("playableId", null)))
                .build();
    }

    @Given("send request for {string} to complete playable of {string} with {int} and {int}")
    public void completeSpecificPlayableForStudent(String studentFirstName, String subject, int learningObjectiveId, int playableId) {
        Student student = new StudentOperations(entityContext).getStudentByFirstName(studentFirstName);
        apiContext.getResponseMap().put("complete_playable_" + subject + "_" + learningObjectiveId + "_" + playableId, StudentAPI.completePlayable(student, subject, learningObjectiveId, playableId));
    }

    @Given("send request for {string} to complete path for subject: {string}")
    public void completeLearningPathForStudent(String studentFirstName, String subject) {
        Student student = new StudentOperations(entityContext).getStudentByFirstName(studentFirstName);
        apiContext.getResponseMap().put("", StudentAPI.completeLearningPath(student, subject));
    }


    @Given("send request for completing below playables:")
    public void sendRequestForCompletingBelowPlayables(List<CompletePlayable> completePlayableList) {

        Map<String, Response> completePlayableResponses = new HashMap<>();
        completePlayableList.forEach(playableRow -> {
            if (isBlank(playableRow.getStudentFirstName()))
                throw new RuntimeException("Student first name is mandatory field and must not be blank");
            String subject = "math";
            if (isNotBlank(playableRow.getSubject()))
                subject = playableRow.getSubject().toLowerCase();

            Student student = new StudentOperations(entityContext).getStudentByFirstName(playableRow.getStudentFirstName());

            if (isCompleteLearningPath(playableRow)) {
                Response completeLearningPath = StudentAPI.completeLearningPath(student, subject);
                apiContext.getResponseMap().put("complete_learning_path_" + playableRow.getStudentFirstName(), completeLearningPath);
            } else {
                Response completePlayableResponse = StudentAPI.completePlayable(student,
                        subject, playableRow.getLearningObjectiveId(), playableRow.getPlayableId());
                apiContext.getResponseMap().put("complete_playable_" + subject + "_" +
                        playableRow.getLearningObjectiveId() + "_" + playableRow.getPlayableId(), completePlayableResponse);
            }
        });
    }


    private Boolean isCompleteLearningPath(CompletePlayable completePlayable) {
        if (completePlayable.getPlayableId() == -1 && completePlayable.getLearningObjectiveId() == -1)
            return Boolean.TRUE;
        else return Boolean.FALSE;
    }

    @Given("Login to Teacher account using:")
    public void loginToTeacherAccountUsing(DataTable dataTable) {
        String email = dataTable.asMaps(String.class, String.class).get(0).get("email").trim();
        String password = dataTable.asMaps(String.class, String.class).get(0).get("password").trim();

        email = evaluator.evaluate(testContext.getData(), email);
        password = evaluator.evaluate(testContext.getData(), password);

        if (StringUtils.isAnyBlank(email, password))
            throw new RuntimeException("email or password can't be blank");

        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        teacherAPI.signin(email, password);
    }


    @When("mark all assignments as complete for klass {string}")
    public void markAllAssignmentsAsCompleteForKlass(String klassName) {

        klassName = evaluator.evaluate(testContext.getData(), klassName);

        Optional<Klass> klass = new TeacherOperations(entityContext).getKlassByName(klassName);

        String gradeId;
        if (klass.isPresent())
            gradeId = klass.get().getGradeID();
        else
            throw new RuntimeException("Klass not present with klassname:" + klassName);

        List<Task> unfinishedTasks = new TeacherOperations(entityContext).getUnfinishedTasks(klassName);

        unfinishedTasks.forEach(task -> {
            teacherAPI.markAssignmentAsComplete(task, teacherAPI.getGradeCode(gradeId));
        });

    }

    @Given("user creates a teacher account on Splashlearn with below details:")
    public void userCreatesATeacherAccountOnSplashlearnWithBelowDetails(DocString docString) throws JsonProcessingException, SQLException {

        TeacherSignupDTO teacherSignup = new ObjectMapper().readValue(docString.getContent(), TeacherSignupDTO.class);

        teacherSignup.setFirstName(evaluator.evaluate(testContext.getData(), teacherSignup.getFirstName()));
        teacherSignup.setLastName(evaluator.evaluate(testContext.getData(), teacherSignup.getLastName()));
        teacherSignup.setSchoolName(evaluator.evaluate(testContext.getData(), teacherSignup.getSchoolName()));
        teacherSignup.setEmail(evaluator.evaluate(testContext.getData(), teacherSignup.getEmail()));
        teacherSignup.setPassword(evaluator.evaluate(testContext.getData(), teacherSignup.getPassword()));

        teacherAPI.signup(teacherSignup);

    }

    @Given("user creates {int} teacher accounts on Splashlearn with below details:")
    public void userCreatesTeacherAccountsOnSplashlearnWithBelowDetails(int teachersToCreate, DocString docString) throws SQLException, JsonProcessingException {
        for (int x = 1; x <= teachersToCreate; x++) {
            userCreatesATeacherAccountOnSplashlearnWithBelowDetails(docString);
        }
    }


    @Then("user creates a new class with below details:")
    public void userCreatesANewClassWithBelowDetails(DocString buildKlassJson) throws JsonProcessingException {
        KlassBuildDTO klassBuildDTO = new ObjectMapper().readValue(buildKlassJson.getContent(), KlassBuildDTO.class);
        klassBuildDTO.setKlassName(evaluator.evaluate(testContext.getData(), klassBuildDTO.getKlassName()));

        DataGenerator dataGenerator = new DataGenerator();
        String klassName = klassBuildDTO.getKlassName();
        Response teacherProfile = teacherAPI.getTeacherProfile();
        String teacherId = teacherProfile.jsonPath().get("teacher.id");
        String teacherEmail = teacherProfile.jsonPath().get("teacher.email");

        teacherAPI.addKlass(klassName, teacherId, klassBuildDTO.getGradeCode(), klassBuildDTO.getSubjectPreference());
        teacherProfile = teacherAPI.getTeacherProfile();
        String klassId = teacherProfile.jsonPath().get("klasses[0].id");
        List<String> students = new ArrayList<>();
        IntStream.range(0, klassBuildDTO.getStudentsCount()).forEach(i -> {
            students.add(dataGenerator.firstName() + " " + dataGenerator.lastName());
        });
        String klassSlug = teacherProfile.getBody().jsonPath().param("klassName", klassName).get("klasses.find { it.name = klassName}.slug");
        teacherAPI.addStudents(klassSlug, students);

        Klass klass = Klass.builder()
                .id(klassId)
                .klassSlug(klassSlug)
                .klassName(klassName)
                .gradeCode(klassBuildDTO.getGradeCode())
                .build();

        Teacher teacher = Teacher.builder()
                .id(teacherId)
                .email(teacherEmail)
                .build();

        storeInTeachersDTO(teacher, klass);

    }

    private void storeInTeachersDTO(Teacher teacher, Klass klass) {

        StudentResponse[] studentResponses = teacherAPI.getStudents(klass.getId());

        List<Student> studentsList = new ArrayList();
        Arrays.stream(studentResponses).forEach(student -> {
            studentsList.add(
                    Student.builder()
                            .id(student.getId())
                            .firstName(student.getFirstName())
                            .lastName(student.getLastName())
                            .plainTextPassword(student.getPlainTextPassword())
                            .picturePassword(student.getPicturePassword())
                            .build()
            );
        });

        klass.setStudents(studentsList);
        teacher.setKlasses(Set.of(klass));
        TeachersDTO.getTeacherList().add(teacher);
    }

}
