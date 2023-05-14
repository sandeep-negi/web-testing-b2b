package com.splashlearn.custom.api.operations;

import com.splashlearn.context.APIContext;
import com.splashlearn.context.APITokens;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.database.DatabaseHelper;
import com.splashlearn.custom.api.endpoints.APIGateway;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.request.teachersignin.TeacherSignin;
import com.splashlearn.custom.api.model.request.teachersignin.User;
import com.splashlearn.custom.api.model.response.userworksheet.SavedWorksheets;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.model.Student;
import com.splashlearn.custom.entity.model.Task;
import com.splashlearn.custom.database.sql.SQLQuery;
import com.splashlearn.custom.dto.TeacherSignupDTO;
import io.restassured.http.ContentType;
import io.restassured.http.Cookie;
import io.restassured.http.Header;
import io.restassured.response.Response;
import lombok.Getter;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.apache.groovy.util.Maps;
import org.jsoup.Jsoup;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.splashlearn.constants.SplashLearnConstants.*;
import static com.splashlearn.custom.api.RestAssuredHelper.getRequestSpecificationForMicroservices;
import static com.splashlearn.custom.api.RestAssuredHelper.getRequestSpecificationFromEnvironment;
import static com.splashlearn.steps.MySQLSteps.getUUIDFromByteArray;
import static io.restassured.RestAssured.given;
import static org.apache.http.HttpStatus.SC_CREATED;
import static org.apache.http.HttpStatus.SC_OK;

@Log4j2
public class TeacherAPI {

    @Getter
    private APIContext apiContext;

    public TeacherAPI(APIContext apiContext) {
        this.apiContext = apiContext;
    }


    public void signin(String email, String password, Boolean... ignorenullVerificationForApiTokens) {

        if (ignorenullVerificationForApiTokens.length > 0 && Boolean.FALSE.equals(ignorenullVerificationForApiTokens[0])) {
            if (Objects.nonNull(apiContext.getTeacherApiTokens()))
                return;
        }

        TeacherSignin teacherSignin = TeacherSignin.builder()
                .user(User.builder()
                        .login(email)
                        .password(password)
                        .build())
                .build();


        Response signinResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .contentType(ContentType.JSON)
                .body(teacherSignin)
                .post(TeacherEndPoint.SIGNIN)
                .then()
                .statusCode(SC_OK)
                .extract().response();

        Cookie sessionId = signinResponse.getDetailedCookie(SESSION_COOKIE_NAME);
        Cookie jwtToken = signinResponse.getDetailedCookie(JWT_AUTHORIZATION);

        apiContext.setTeacherApiTokens(APITokens.builder().jwtAuthorizationToken(jwtToken).sessionId(sessionId).build());

    }

    private void generateXcsrfToken() {

        if (Objects.nonNull(apiContext.getTeacherApiTokens().getXcsrfToken()))
            return;

        Response response = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .get("/")
                .then()
                .statusCode(SC_OK)
                .extract().response();

        String csrfToken = Jsoup.parse(response.getBody().asString()).select("meta[name=csrf-token]")
                .attr("content");
        apiContext.getTeacherApiTokens().setXcsrfToken(new Header(XCSRF_TOKEN_NAME, csrfToken));
        Cookie sessionIdCookie = response.getDetailedCookie(SESSION_COOKIE_NAME);
        apiContext.getTeacherApiTokens().setSessionId(sessionIdCookie);

    }

    public Response markAssignmentAsComplete(Task task, String gradeCode) {
        return markAssignmentAsComplete(StringUtils.upperCase(StringUtils.remove(task.getId(), "-")),
                StringUtils.upperCase(StringUtils.remove(task.getKlassId(), "-")), gradeCode);
    }

    public Response markAssignmentAsComplete(String id, String klassId, String gradeCode) {
        generateXcsrfToken();
        return given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("taskId", id)
                .queryParam("selected_grade_code", gradeCode)
                .queryParam("klass_id", klassId)
                .put(TeacherEndPoint.MARK_ASSIGNMENT_AS_COMPLETE)
                .then()
                .statusCode(SC_OK)
                .extract().response();

    }

    public String getGradeCode(String gradeId) {
        Response getAllGradesResponse = getAllGradesResponse();
        gradeId = StringUtils.upperCase(StringUtils.remove(gradeId, "-"));
        return getAllGradesResponse.getBody().jsonPath().param("gradeId", gradeId).get("grades.find { it.id == gradeId}.code");

    }

    public String getGradeId(char gradeCode) {
        Response getAllGradesResponse = getAllGradesResponse();
        return getAllGradesResponse.getBody().jsonPath().param("gradeCode", gradeCode).get("grades.find { it.code == gradeCode}.id");
    }

    public Response getAllGradesResponse() {

        return given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .get(TeacherEndPoint.GET_GRADES)
                .then()
                .statusCode(SC_OK)
                .extract().response();

    }

    public Response createAssignmentForWholeKlass(String learningObjectiveId, Klass klass) {
        generateXcsrfToken();

        return given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("klassName", klass.getId())
                .queryParam("learning_objective_id", learningObjectiveId)
                .queryParam("selected_grade_code", getGradeCode(klass.getGradeID()))
                .post(TeacherEndPoint.ASSIGNMENT_TO_WHOLE_KLASS)
                .then()
                .statusCode(SC_CREATED)
                .extract().response();

    }

    public Response createAssignmentForWholeKlass(String learningObjectiveId, String klassId) {
        generateXcsrfToken();

        return given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("klassId", klassId)
                .queryParam("learning_objective_id", learningObjectiveId)
                .post(TeacherEndPoint.ASSIGNMENT_TO_WHOLE_KLASS)
                .then()
                .statusCode(SC_CREATED)
                .extract().response();

    }

    public Response createAssignmentForSelectedStudents(String learningObjectiveId, List<Student> selectedStudents) {

        if (selectedStudents.isEmpty())
            throw new RuntimeException("selected student list is empty");

        generateXcsrfToken();
        List<String> studentIdList = selectedStudents.stream().map(s -> StringUtils.remove(s.getId().toUpperCase(), "-")).collect(Collectors.toList());
        String gradeCode = getGradeCode(selectedStudents.get(0).getGradeId());

        Response selectedStudentsAssignmentResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("klassId", StringUtils.remove(selectedStudents.get(0).getKlassId().toUpperCase(), "-"))
                .queryParam("learning_objective_id", learningObjectiveId)
                .queryParam("student_ids[]", studentIdList)
                .queryParam("action", "edit")
                .queryParam("whole_class", "false")
                .queryParam("remember_intimate_ptl_hook", "false")
                .queryParam("selected_grade_code", gradeCode)
                .post(TeacherEndPoint.ASSIGNMENT_TO_SELECTED_STUDENTS)
                .then()
                .statusCode(SC_CREATED)
                .extract().response();

        return selectedStudentsAssignmentResponse;
    }

    public void addMathKlass(String klassName, String teacherId, char gradeCode) {
        addKlass(klassName, teacherId, gradeCode, 0);
    }

    public void addELAKlass(String klassName, String teacherId, char gradeCode) {
        addKlass(klassName, teacherId, gradeCode, 1);
    }

    public void addMELAKlass(String klassName, String teacherId, char gradeCode) {
        addKlass(klassName, teacherId, gradeCode, 2);
    }

    public Response addKlass(String klassName, String teacherId, char gradeCode, int subjectPreference) {
        generateXcsrfToken();
        String gradeId = getGradeId(gradeCode);

        Response addKlassResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .formParam("klass[name]", klassName)
                .formParam("klass[grade_id]", gradeId)
                .formParam("klass[teacher_id]", teacherId)
                .formParam("klass[subject_preference]", subjectPreference)
                .formParam("commit", "Create new class")
                .post(TeacherEndPoint.ADD_NEW_KLASS)
                .then()
                .statusCode(SC_OK)
                .extract().response();

        log.info("Klass with name: {} created successfully", klassName);

        return addKlassResponse;

    }

    public Response deleteKlass(String klassId) {

        generateXcsrfToken();

        Response deleteKlassResponse = given(getRequestSpecificationForMicroservices())
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("klassId", klassId)
                .delete(TeacherEndPoint.DELETE_KLASS)
                .then().statusCode(SC_OK).extract().response();

        return deleteKlassResponse;

    }

    public Response addStudents(String klassSlug, List<String> studentsToAdd) {

        generateXcsrfToken();

        Response addStudentsResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("klassSlug", klassSlug)
                .formParam("student[names]", studentsToAdd.stream().collect(Collectors.joining(",")))
                .formParam("commit", "Add Students").log().all()
                .post(TeacherEndPoint.ADD_STUDENTS_USING_FORM)
                .then()
                .statusCode(SC_OK).log().all()
                .extract().response();

        log.info("Students {} are added successfully to klass with klassSlug: {}",studentsToAdd, klassSlug);
        return addStudentsResponse;

    }

    public SavedWorksheets savedWorksheetList(String teacherId){
        generateXcsrfToken();
        return given(getRequestSpecificationForMicroservices())
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("teacherId", teacherId)
                .get(TeacherEndPoint.SAVED_WORKSHEET_LIST)
                .then()
                .statusCode(SC_OK)
                .extract().response().as(SavedWorksheets.class);
    }

    public void deleteSavedWorksheet(String teacherId, int id) {
        generateXcsrfToken();
        Response deleteStudentResponse = given(getRequestSpecificationForMicroservices())
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("teacherId", teacherId)
                .pathParam("id", id)
                .delete(TeacherEndPoint.DELETE_SAVED_WORKSHEET)
                .then()
                .statusCode(SC_OK)
                .extract().response();
    }

    public StudentResponse[] getStudents(String klassId) {

        generateXcsrfToken();

        StudentResponse[] studentResponses = given(getRequestSpecificationForMicroservices())
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("klassId", klassId)
                .get(TeacherEndPoint.GET_STUDENTS)
                .then()
                .statusCode(SC_OK)
                .extract().response().as(StudentResponse[].class);

        return studentResponses;

    }

    public Response deleteStudent(String studentId) {


        generateXcsrfToken();

        Response deleteStudentResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .pathParam("studentId", studentId)
                .delete(TeacherEndPoint.DELETE_STUDENT)
                .then()
                .statusCode(SC_OK)
                .extract().response();

        return deleteStudentResponse;

    }

    public Response getTeacherProfile() {

        generateXcsrfToken();

        Response teacherProfileResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .get(TeacherEndPoint.PROFILE)
                .then()
                .statusCode(SC_OK)
                .extract().response();

        return teacherProfileResponse;

    }


    public Response signup(TeacherSignupDTO teacherSignup) {

        Map<String, String> teacherSignupMap = Maps.of(
                "user[type]", "teacher",
                "user[time_zone]", teacherSignup.getTimeZone(),
                "user[tnc_privacy]", "0",
                "user[email_preference]", "0",
                "user[first_name]", teacherSignup.getFirstName(),
                "user[last_name]", teacherSignup.getLastName(),
                "user[email]", teacherSignup.getEmail(),
                "user[password]", teacherSignup.getPassword(),
                "user[dob_year]", teacherSignup.getBirthYear(),
                "user[school_id]", "",
                "user[institution_attributes][country_code]", teacherSignup.getCountryCode(),
                "user[institution_attributes][city_name]", teacherSignup.getSchoolCity(),
                "user[institution_attributes][name]", teacherSignup.getSchoolName(),
                "user[institution_attributes][zip]", teacherSignup.getZipCode()
        );

        Response signupResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .formParams(teacherSignupMap)
                .post(TeacherEndPoint.SIGNUP)
                .then().extract().response();


        Cookie sessionId = signupResponse.getDetailedCookie(SESSION_COOKIE_NAME);
        Cookie jwtToken = signupResponse.getDetailedCookie(JWT_AUTHORIZATION);
        apiContext.setTeacherApiTokens(APITokens.builder().jwtAuthorizationToken(jwtToken).sessionId(sessionId).build());

        DatabaseHelper database = new DatabaseHelper();
        List<Map<String, Object>> teacherMap = null;
        try {
            teacherMap = database.executePreparedStatementAndGetListOfMap(SQLQuery.GET_FROM_EMAIL_INTENTS,
                    teacherSignup.getEmail());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            database.releaseConnection();
        }

        Response generateOtpResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .queryParam("id", StringUtils.remove(getUUIDFromByteArray(teacherMap.get(0).get("id")).toUpperCase(), "-"))
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .get(TeacherEndPoint.GENERATE_OTP)
                .then().extract().response();

        String csrfToken = Jsoup.parse(generateOtpResponse.getBody().asString()).select("meta[name=csrf-token]")
                .attr("content");
        Cookie sessionIdCookie = generateOtpResponse.getDetailedCookie(SESSION_COOKIE_NAME);

        apiContext.getTeacherApiTokens().setXcsrfToken(new Header(XCSRF_TOKEN_NAME, csrfToken));
        apiContext.getTeacherApiTokens().setSessionId(sessionIdCookie);

        Map<String, String> verifyOtpRequest =
                Maps.of(
                        "intent_type", "signup",
                        "id", StringUtils.remove(getUUIDFromByteArray(teacherMap.get(0).get("id")).toUpperCase(), "-"),
                        "otp", (String) teacherMap.get(0).get("code")
                );

        Response verifyOtpResponse = given(getRequestSpecificationFromEnvironment(apiContext.getBasePath()))
                .formParams(verifyOtpRequest)
                .header(apiContext.getTeacherApiTokens().getXcsrfToken())
                .cookie(apiContext.getTeacherApiTokens().getSessionId())
                .cookie(apiContext.getTeacherApiTokens().getJwtAuthorizationToken())
                .post(TeacherEndPoint.VERIFY_OTP)
                .then().extract().response();

        log.info("Teacher with email: {} created successfully on {} server", teacherSignup.getEmail(), apiContext.getBasePath());
        log.info("Teacher Details=> \n {}", teacherSignup);
        return verifyOtpResponse;
    }
    public Response generateOTP(String email){
        return given(getRequestSpecificationFromEnvironment(APIGateway.OTP_GATEWAY))
                .queryParam("email", email)
                .get(TeacherEndPoint.GET_OTP_FROM_API)
                .then()
                .statusCode(SC_OK)
                .extract().response();
    }


}
