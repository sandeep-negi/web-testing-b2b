package com.splashlearn.steps;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.APIContext;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.EntityContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.*;
import com.splashlearn.core.database.DataSource;
import com.splashlearn.core.database.DatabaseHelper;
import com.splashlearn.core.selenium.LoadTime;
import com.splashlearn.core.selenium.SeleniumActions;
import com.splashlearn.custom.SplashLearnLibrary;
import com.splashlearn.custom.api.model.pojo.addklass.AddKlassResponseInfo;
import com.splashlearn.custom.api.model.response.userworksheet.SavedWorksheets;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.api.operations.TeacherAPI;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.custom.database.sql.SQLQuery;
import com.splashlearn.custom.dto.TeacherSignupDTO;
import com.splashlearn.custom.dto.TeachersDTO;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.model.Student;
import com.splashlearn.custom.entity.model.Task;
import com.splashlearn.custom.entity.model.Teacher;
import com.splashlearn.custom.entity.operations.TeacherOperations;
import com.splashlearn.selenium.CustomWebDriverListener;
import com.splashlearn.selenium.GifAssembler;
import com.splashlearn.utils.MongoHelper;
import com.splashlearn.utils.TestDataHelper;
import io.cucumber.core.backend.TestCaseState;
import io.cucumber.java.*;
import io.cucumber.plugin.event.Result;
import io.restassured.response.Response;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.events.EventFiringDecorator;
import org.testng.Assert;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static com.splashlearn.core.selenium.SeleniumActions.click;
import static com.splashlearn.core.selenium.SeleniumActions.exists;
import static com.splashlearn.steps.MySQLSteps.getUUIDFromByteArray;

public class Hooks {

    private static final Logger logger = LogManager.getLogger(Hooks.class);
    private final TestContext testContext;
    private final APIContext apiContext;
    private final EntityContext entityContext;
    private static String listOfFailedTests;
    private final Evaluator evaluator = new Evaluator();
    private final DomainObjectContext domainObjectContext ;
    private final Map<String, Object> customStorage;

    public Hooks(TestContext testContext) {
        this.testContext = testContext;
        this.apiContext = testContext.getApiContext();
        this.entityContext = testContext.getEntityContext();
        this.domainObjectContext = testContext.getDomainObjectContext();
        customStorage = testContext.getCustomStorage();
    }

    @BeforeAll
    public static void beforeAll() throws IOException, ClassNotFoundException {

        logger.debug("Before Suite hooks started.");
        Configurator.setLevel("io.netty", Level.OFF);
        BrowserFactory.jenkins = System.getProperty("jenkins", "false").trim()
                .equalsIgnoreCase("true");

        TestContext.runId = System.getProperty("runId", "local");

        PropertyReader p = new PropertyReader();
//        Map<String, String> propertyMap = p.getProperties("/config/env/application.properties",
//                "mongo_uri", "environment", "highlight_element", "kill_browser", "runmode", "staging_1",
//                "staging_2", "staging_3", "f2", "preprod", "preprodtest", "staging_automation", "headless", "mysql_db_uri", "mysql_db_username", "mysql_db_password", "prod");
        Map<String, String> propertyMap = p.getProperties("/config/env/application.properties",
                "mongo_uri", "environment", "highlight_element", "kill_browser", "runmode", "staging_1",
                "staging_2","staging_3", "f2", "preprod", "preprodtest", "staging_automation", "headless", "mysql_db_uri", "mysql_db_username", "mysql_db_password", "prod");
        propertyMap.entrySet()
                .stream().filter(entry -> !System.getProperties().containsKey(entry.getKey()))
                .forEach(entry -> System.setProperty(entry.getKey(), entry.getValue()));

        MongoHelper.uri = propertyMap.get("mongo_uri");
        String envUrl = System.getProperty("environment", propertyMap.get("environment"));
        TestContext.url = propertyMap.get(envUrl);

        switch (envUrl) {
            case "prod":
                MongoHelper.collection = "user_data_prod";
                break;
            case "preprod":
                MongoHelper.collection = "user_data_preprod";
                break;
            case "staging_1":
            case "staging_2":
            case "staging_3":
            case "f2":
                MongoHelper.collection = "user_data";
                break;
            default:
                Assert.fail("Invalid Mongo Collection");
        }

        Class.forName("com.splashlearn.core.database.DataSource");

        BrowserFactory.killBrowser = Boolean.parseBoolean(System.getProperty("kill_browser", propertyMap.get("kill_browser")));
        BrowserFactory.runmode = System.getProperty("runmode", propertyMap.get("runmode"));
        BrowserFactory.headless = Boolean.parseBoolean(System.getProperty("headless", propertyMap.get("headless")));
        SeleniumActions.highlightElement = Boolean.parseBoolean(System.getProperty("highlight_element", propertyMap.get("highlight_element")));

        TestDataHelper.read();

        logger.debug("Test run environment is {}.", envUrl);
        logger.debug("Test run source is {}.", BrowserFactory.jenkins ? "jenkins" : "local");
        logger.debug("Before Suite hooks finished successfully.");
    }

    @AfterAll
    public static void afterAll() throws IOException {
        if (!TeachersDTO.getTeacherList().isEmpty())
            createJsonReport();
        DataSource.closeConnections();
    }

    private static void createJsonReport() throws IOException {
        String suffix = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        ObjectMapper objectMapper = new ObjectMapper();
        Files.createDirectories(Paths.get("target/accounts"));
        logger.debug("TeachersDTO.getTeacherList() ->" + TeachersDTO.getTeacherList());
        objectMapper.writeValue(new File("target/accounts/teachers" + suffix + ".json"), TeachersDTO.getTeacherList());

    }

    @Before(order = 2)
    public void beforeTest(Scenario scenario) {
        testContext.setScenario(scenario);
        setTestId(scenario);
        setQA(scenario);
        setFunctionality(scenario);
        logger.info("Test {} started successfully.", testContext.getTestId());
        LoadTime.data = testContext.toString();


    }

    @Before(order = 3)
    public void addData() {
        TestDataHelper.addDataToContext(testContext.getData(), testContext.getTestId());
    }

    @Before(order = 4, value = "@load_entity_context")
    public void loadEntityContext() {
        DatabaseHelper database = new DatabaseHelper();
        try {
            String teacherEmail = testContext.getData().get("username");
            String teacherId = getUUIDFromByteArray(database.executePreparedStatementAndGetListOfMap(SQLQuery.TEACHER_ID, teacherEmail).get(0).get("id"));
            Set<Klass> klasses = new HashSet();
            List<Map<String, Object>> listOfKlass = database.executePreparedStatementAndGetListOfMap(SQLQuery.ALL_KLASSES_ID, StringUtils.remove(teacherId, "-"));

            for (Map klass : listOfKlass) {
                String klassId = getUUIDFromByteArray(klass.get("id"));
                String klassName = (String) klass.get("name");
                String gradeId = getUUIDFromByteArray(klass.get("grade_id"));
                List<Student> students = new ArrayList();
                List<Map<String, Object>> studentsMap = database.executePreparedStatementAndGetListOfMap(SQLQuery.ALL_STUDENTS_DETAILS, StringUtils.remove(klassId, "-"));
                for (Map student : studentsMap) {
                    students.add(
                            Student.builder()
                                    .id(getUUIDFromByteArray(student.get("id")))
                                    .parentId(getUUIDFromByteArray(student.get("parent_id")))
                                    .firstName((String) student.get("first_name"))
                                    .lastName((String) student.get("last_name"))
                                    .userName((String) student.get("username"))
                                    .plainTextPassword((String) student.get("plain_text_password"))
                                    .klassId(klassId).klassName(klassName)
                                    .gradeId(gradeId)
                                    .teacherId(teacherId)
                                    .build()
                    );
                }

                List<Task> tasks = new ArrayList();
                List<Map<String, Object>> tasksMap = database.executePreparedStatementAndGetListOfMap(SQLQuery.ALL_TASKS_FOR_KLASS, StringUtils.remove(klassId, "-"));
                for (Map task : tasksMap) {
                    tasks.add(
                            Task.builder()
                                    .id(getUUIDFromByteArray(task.get("id")))
                                    .klassId(getUUIDFromByteArray(task.get("klass_id")))
                                    .objectiveId((Integer) task.get("objective_id"))
                                    .deletedAt((LocalDateTime) task.get("deleted_at"))
                                    .finishedAt((LocalDateTime) task.get("finished_at"))
                                    .objectiveType((String) task.get("objective_type"))
                                    .build()
                    );
                }

                klasses.add(Klass.builder().teacherID(teacherId).id(klassId).klassName(klassName).gradeID(gradeId).students(students).tasks(tasks).klassSlug((String) klass.get("slug")).build());
            }
            Teacher teacherDetails = Teacher.builder()
                    .id(teacherId)
                    .email(teacherEmail)
                    .klasses(klasses)
                    .build();
            entityContext.setTeacher(teacherDetails);
            logger.debug(teacherId);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            database.releaseConnection();
        }
    }

    @Before(order = 5, value = "@api_teacher_signin")
    public void signinViaApi() {
        String userName = testContext.getData().get("username");
        String password = testContext.getData().get("password");
        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        teacherAPI.signin(userName, password);
    }

    @Before(order = 5, value = "@api_mark_all_assignments_complete")
    public void markAllAssignmentsAsComplete() {

        String klassName = testContext.getData().get("class_name");
        String userName = testContext.getData().get("username");
        String password = testContext.getData().get("password");

        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        teacherAPI.signin(userName, password);
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

    @Before(order = 5, value = "@api_create_assignment_selected_students")
    public void createAssignmentForSelectedStudents() {

//        1.Get required values from testContext
        String klassName = testContext.getData().get("class_name");
        String userName = testContext.getData().get("username");
        String password = testContext.getData().get("password");
        String learningObjectiveId = testContext.getData().get("learning_objective_id");
        List<String> studentNamesToAssign = testContext.getData().entrySet().stream().
                filter(x -> x.getKey().startsWith("selected_student")).
                map(x -> x.getValue()).
                collect(Collectors.toList());

//        2.Get required data from entityContext
        List<Student> studentsToAssign = new TeacherOperations(entityContext)
                .getSpecificStudentsForKlassByFirstName(klassName, studentNamesToAssign);

//        3. Make Api Call
        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        teacherAPI.signin(userName, password);
        teacherAPI.createAssignmentForSelectedStudents(learningObjectiveId, studentsToAssign);

    }

    @Before(value = "@api_addClass", order = 5)
    public void addNewKlass() {

        DataGenerator dataGenerator = new DataGenerator();
        Response responseStatus ;
        TeacherDashboardApi teacherDashboardApi ;
        String klassName = dataGenerator.firstName() + " " + dataGenerator.lastName() + " class";
        String userName = testContext.getData().get("username");
        String password = testContext.getData().get("password");
        TeacherData teacherData = new TeacherData(testContext);
        Map<String, String> values = new HashMap<>();
        values.put("klassName", klassName);
        values.put("gradeCode", "1");
        values.put("subjectPreferenceCd", "2");

        teacherData.getTeacherKlassStudentData(userName, password);
        teacherDashboardApi = new TeacherDashboardApi(testContext.cookies.getCookies());
        responseStatus = teacherDashboardApi.addNewKlass(values, testContext.sessionId);

        ObjectMapper mapper = new ObjectMapper();
        AddKlassResponseInfo addKlassResponseInfo = null;
        try {
            addKlassResponseInfo = mapper.readValue(responseStatus.body().asString(), AddKlassResponseInfo.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        teacherDashboardApi = new TeacherDashboardApi(testContext.cookies.getCookies());
        teacherDashboardApi.addStudents(addKlassResponseInfo.getId(), testContext.sessionId);

        customStorage.put("klassId", domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0));
        testContext.getData().put("class_to_delete", klassName);




    }

    @Before(order = 5, value = "@api_add_students_existing_class")
    public void addStudentsToExistingKlass() {

//        1.Get required data from testContext
        String klassName = testContext.getData().get("class_name");
        String userName = testContext.getData().get("username");
        String password = testContext.getData().get("password");
        int studentsAddCount = Integer.parseInt(testContext.getData().get("api_generate_student_count"));

        DataGenerator dataGenerator = new DataGenerator();
        List<String> studentsList = new ArrayList<>();

        IntStream.range(0, studentsAddCount).forEach(x -> studentsList.add(dataGenerator.firstName()));

//        2.Get required data from entityContext

        String klassSlug = new TeacherOperations(entityContext).getKlassByName(klassName).get().getKlassSlug();

//        3. Make Api Call

        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        teacherAPI.signin(userName, password);
        teacherAPI.addStudents(klassSlug, studentsList);

//        4. Store in testContext

        IntStream.range(0, studentsAddCount).
                forEach(x -> testContext.getData().put("api_student_" + (x + 1), studentsList.get(x)));

    }

    @Before(order = 5, value = "@api_delete_saved_worksheets")
    public void deleteSavedWorksheets() throws JsonProcessingException {
        String userName = testContext.getData().get("username");
        String password = testContext.getData().get("password");
        String teacherId = entityContext.getTeacher().getId();
        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        teacherAPI.signin(userName, password);
        // Call Get Saved Worksheet List API
        SavedWorksheets getSavedWorksheetsResponse = teacherAPI.savedWorksheetList(teacherId);
        // Delete Saved Worksheet
        getSavedWorksheetsResponse.getUser_collection_entities().forEach(x -> {
            teacherAPI.deleteSavedWorksheet(teacherId, x.getId());
        });
    }

    @Before(order = 5, value = "@api_teacher_signup")
    public void teacherSignup() {

        int teacherAddCount = 1;
        if (Objects.nonNull(testContext.getData().get("api_generate_teacher_count")))
            teacherAddCount = Integer.parseInt(testContext.getData().get("api_generate_teacher_count"));

        List<String> teacherEmailList = new ArrayList<>();

        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        DataGenerator dataGenerator = new DataGenerator();
        IntStream.range(0, teacherAddCount).forEach(x -> {

            TeacherSignupDTO teacherSignup = new TeacherSignupDTO();
            teacherSignup.setEmail(DataGenerator.teacherEmail());
            teacherSignup.setSchoolId("");
            teacherSignup.setFirstName(dataGenerator.firstName());
            teacherSignup.setLastName(dataGenerator.lastName());
            teacherSignup.setSchoolCity(dataGenerator.city());
            teacherSignup.setBirthYear("1996");
            teacherSignup.setSchoolName(dataGenerator.school());
            teacherSignup.setCountryCode("US");
            teacherSignup.setPassword(DataGenerator.password());
            teacherSignup.setTimeZone("Asia/Kolkata");
            teacherSignup.setZipCode(dataGenerator.zipCode());

            teacherAPI.signup(teacherSignup);
            teacherEmailList.add(teacherSignup.getEmail());
        });

        IntStream.range(0, teacherAddCount).
                forEach(x -> testContext.getData().put("api_teacher_" + (x + 1), teacherEmailList.get(x)));

    }

    @Before(order = 6, value = "@api_retry_teacher_signin")
    public void retrySigninWithChangedPassword() {
        if (Objects.nonNull(apiContext.getTeacherApiTokens().getJwtAuthorizationToken()))
            return;
        String correctedPassword = new SplashLearnLibrary(testContext).getNewPassword(testContext.getData().get("password"));
        testContext.getData().put("password", correctedPassword);
        TeacherAPI teacherAPI = new TeacherAPI(testContext.getApiContext());
        teacherAPI.signin(testContext.getData().get("username"), testContext.getData().get("password"), Boolean.TRUE);
    }

    @Before(order = 7, value = "not @api")
    public void startBrowser() throws IOException {
        final String browser = System.getProperty("browser", "chrome").trim().toLowerCase();
        WebDriver driver;
        CustomWebDriverListener customWebDriverListener = new CustomWebDriverListener();
        switch (browser) {
            case "firefox":
                driver = BrowserFactory.startFirefox();
                break;
            case "safari":
                driver = BrowserFactory.startSafari();
                break;
            default: // chrome
                driver = BrowserFactory.startChrome();
                break;
        }
        driver = new EventFiringDecorator(customWebDriverListener).decorate(driver);
        driver.manage().window().maximize();
        testContext.setBrowser(browser);
        testContext.setDriver(driver);

    }

    @Before(order = 8, value = "not @api")
    public void injectCookiesToBrowser() {
        if (Objects.nonNull(apiContext.getTeacherApiTokens())) {
            SeleniumActions.open(testContext.getDriver(), TestContext.url);
            SeleniumActions.injectSessionCookie(testContext.getDriver(), apiContext.getTeacherApiTokens().getSessionId());
            logger.debug("Teacher session cookie injected inn browser");
        }
    }

    public GifAssembler gifAssembler = new GifAssembler();

    @AfterStep(value = "not @api")
    public void before_or_after(Scenario scenario){
        try {

            byte[] screenshot = ((TakesScreenshot) testContext.getDriver())
                    .getScreenshotAs(OutputType.BYTES);
//            for (GifAssembler.Frame f: CustomWebDriverListener.gifAssembler.frames) {
//                gifAssembler.frames.add(f);
//            }
//            gifAssembler.frames = CustomWebDriverListener.gifAssembler.frames;
            gifAssembler.addFrame(scenario.getName(), screenshot);
//            CustomWebDriverListener.gifAssembler.clearFrames();
        }
        catch(Exception e){
            //ignore
        }
    }

    @After(value = "not @api")
    public void afterTest(Scenario scenario) {
        LoadTime lt = new LoadTime();
        try {
            if (scenario.isFailed() && testContext.getDriver() != null) {
//                final PageFactory pageFactory = new PageFactory();
//                final String teacherDashboardPage = "teacher_dashboard_page";
//                if(exists(testContext.getDriver(), pageFactory.getLocatorFor(teacherDashboardPage,"student_Login_Instruction_Modal"),1)){
//                    click(testContext.getDriver(),pageFactory.getLocatorFor(teacherDashboardPage,"close_student_Login_Instruction_Modal"));
//                }
                byte[] screenshot = ((TakesScreenshot) testContext.getDriver()).getScreenshotAs(OutputType.BYTES);
                gifAssembler.addFrame(scenario.getName(), screenshot);
                byte[] animation = gifAssembler.generate();
                scenario.attach(animation, "image/gif","failure");

                lt.endTimer(testContext.getDriver(), "TC failed", testContext.getDriver().getCurrentUrl(), "");
                SeleniumActions.screenshot(scenario, testContext.getDriver());

                System.out.println("reportFailedScenarios Before: " + ReportGenerator.failedTestScenarioIDs);

                if (!(ReportGenerator.failedTests == null)) {
                    ReportGenerator.failedTests = ReportGenerator.failedTests + "\n" + testContext.getTestId() + " | " + testContext.getQaAssignee();
                    if (ReportGenerator.failedTestFunctionalities.indexOf(testContext.getFunctionality()) < 0)
                        ReportGenerator.failedTestFunctionalities = ReportGenerator.failedTestFunctionalities + "\n" + testContext.getFunctionality();
                    if(!(ReportGenerator.failedTestScenarioIDs == null)) {
//                        ReportGenerator.failedTestScenarios = ReportGenerator.failedTestScenarios + "," + testContext.getTestId() + " | " + testContext.getQaAssignee() + " | " + scenario.getName();
                        ReportGenerator.failedTestScenarioIDs = ReportGenerator.failedTestScenarioIDs + "^" + getFailureMessage(scenario) + " | " + testContext.getTestId() + " | " + testContext.getQaAssignee() + " | " + scenario.getName();
                    }
                    else {
//                        ReportGenerator.failedTestScenarios = testContext.getTestId() + " | " + testContext.getQaAssignee() + " | " + scenario.getName();
                        ReportGenerator.failedTestScenarioIDs = getFailureMessage(scenario) + " | " + testContext.getTestId() + " | " + testContext.getQaAssignee() + " | " + scenario.getName();
                    }
                    System.out.println("failedTestScenarios-!null: " + ReportGenerator.failedTestScenarioIDs);

                }
                else {
                    ReportGenerator.failedTests = testContext.getTestId() + " | " + testContext.getQaAssignee();
                    ReportGenerator.failedTestFunctionalities = testContext.getFunctionality();
//                    ReportGenerator.failedTestScenarios = testContext.getTestId() + " | " + testContext.getQaAssignee() + " | "  + scenario.getName();
                    ReportGenerator.failedTestScenarioIDs = getFailureMessage(scenario) + " | " + testContext.getTestId() + " | " + testContext.getQaAssignee() + " | " + scenario.getName();
                    System.out.println("failedTestScenarios: " + ReportGenerator.failedTestScenarioIDs);

                }
                ReportGenerator.failedTestScenarioIDs.replace("\n", " ");
            }
            else {
                byte[] screenshot = ((TakesScreenshot) testContext.getDriver()).getScreenshotAs(OutputType.BYTES);
                gifAssembler.addFrame(scenario.getName(), screenshot);
                byte[] animation = gifAssembler.generate();
//                scenario.attach(animation, "image/gif","pass");
            }


            if (BrowserFactory.killBrowser)
                new BrowserFactory(testContext.getDriver()).close();
            logger.log(scenario.getStatus().equals(Status.PASSED) ? Level.INFO : Level.ERROR,
                    "Test {} finished with status {}.", testContext.getTestId(), scenario.getStatus());
        }
        catch(Exception e){
            //ignore
            e.printStackTrace();
        }
    }

    @After(order = 2, value = "@api_mark_all_assignments_complete_after")
    public void markAllAssignmentsAsCompleteAfter() {
        markAllAssignmentsAsComplete();
    }

    @After(order = 2, value = "@api_delete_students_after")
    public void deleteStudentsViaApi() {

        List<String> studentList = testContext.getData().entrySet()
                .stream().filter(entry -> entry.getKey().contains("api_student_"))
                .map(entry -> entry.getValue())
                .collect(Collectors.toList());
        String klassName = testContext.getData().get("class_name");

        String klassId = new TeacherOperations(entityContext).getKlassByName(klassName).get().getId();
        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        StudentResponse[] students = teacherAPI.getStudents(klassId);

        List<StudentResponse> studentsToDelete = Arrays.stream(students).filter(allStudents -> studentList.stream()
                        .anyMatch(selectedStudent -> selectedStudent.equals(allStudents.getFirstName())))
                .collect(Collectors.toList());

        studentsToDelete.forEach(student -> teacherAPI.deleteStudent(student.getId()));

    }

//    @AfterAll
//    public void afterAll(Scenario scenario){
//        Hooks.listOfFailedTests = ReportGenerator.failedTestScenarios;
//    }

    private void setTestId(Scenario scenario) {
        testContext.setTestId(scenario.getSourceTagNames().stream()
                .filter(n -> n.startsWith("@TC") || n.startsWith("@B2B") || n.startsWith("@B2C") || n.startsWith("@CMS"))
                .findFirst().orElse("TC000").replace("@", ""));
        System.out.println("Test ID: " + testContext.getTestId());
    }

    private void setQA(Scenario scenario) {
        testContext.setQaAssignee(scenario.getSourceTagNames().stream()
                .filter(n -> n.startsWith("@QA_"))
                .findFirst().orElse("NA").replace("@QA_", ""));
        System.out.println("QA: " + testContext.getQaAssignee());
    }

    private void setFunctionality(Scenario scenario) {
        testContext.setFunctionality(scenario.getSourceTagNames().stream()
                .filter(n -> n.startsWith("@Functionality_"))
                .findFirst().orElse("Mention Functionality").replace("@Functionality_", ""));
        System.out.println("Functionality: " + testContext.getFunctionality());
    }

    public String getFailureMessage(Scenario scenario) {
        Result failResult = null;

        try {
            // Get the delegate from the scenario
            Field delegate = scenario.getClass().getDeclaredField("delegate");
            delegate.setAccessible(true);
            TestCaseState testCaseState = (TestCaseState) delegate.get(scenario);

            // Get the test case results from the delegate
            Field stepResults = testCaseState.getClass().getDeclaredField("stepResults");
            stepResults.setAccessible(true);
            List<Result> results = (List<Result>) stepResults.get(testCaseState);

            for(Result result : results) {
                if(result.getStatus().name().equalsIgnoreCase("FAILED") || result.getStatus().name().equalsIgnoreCase("SKIPPED")) {
                    failResult = result;
                    break;
                }
            }
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
        }
        System.out.println(failResult.toString());
        System.out.println(failResult.getError().toString());
        System.out.println(failResult.getError().getMessage().toString());

        String extractedInfo = failResult.getError().getMessage();
        extractedInfo = extractedInfo.indexOf("\n") >= 0 ? extractedInfo.substring(0,extractedInfo.indexOf("\n")) : extractedInfo;

        return (failResult != null) ? extractedInfo : "";
    }

}
