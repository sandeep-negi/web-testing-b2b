package com.splashlearn.steps.teacher;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.EmailLibrary;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.onboardingstates.UserOnBoardingState;
import com.splashlearn.custom.api.model.pojo.addklass.AddKlassResponseInfo;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.api.operations.GetAssignedPersona;
import com.splashlearn.custom.api.operations.LoginApi;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.pageobjects.*;
import com.splashlearn.steps.LocalStorage;
import com.splashlearn.utils.TeacherUtility;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WindowType;
import org.testng.Assert;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;

import static com.splashlearn.core.selenium.SeleniumActions.open;

public class TeacherDashboardSteps {
    private final TeacherDashboardPage teacherDashboardPage;
    private final ProfilePage profilePage;
    private final DomainObjectContext domainObjectContext;
    private final WebDriver driver;
    private final Map<String, String> data;
    private final TestContext context;
    private final Evaluator evaluator = new Evaluator();
    private final Map<String, Object> customStorage;
    private final RosterPage rosterPage;
    private final TeacherSignUpPage teacherSignUpPage;
    private final OtpPage otpPage;
    private HomeAccessPage homeAccessPage;
    private StudentDashboardPage studentDashboardPage;

    public TeacherDashboardSteps(TestContext context) {
        this.context = context;
        driver = context.getDriver();
        this.data = context.getData();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
        profilePage = PageFactoryManager.getProfilePage(driver);
        rosterPage = PageFactoryManager.getRosterPage(driver);
        teacherSignUpPage = PageFactoryManager.getTeacherSignUpPage(driver);
        otpPage = PageFactoryManager.getOtpPage(driver);
        homeAccessPage = PageFactoryManager.getHomeAccessPage(driver);
        studentDashboardPage = PageFactoryManager.getStudentDashboardPage(driver);
    }

    @Then("user should login successfully to his dashboard")
    public void user_should_login_successfully_to_his_dashboard() {
        teacherDashboardPage.loadUrl(TeacherEndPoint.TEACHER_DASHBOARD);
        Assert.assertTrue(teacherDashboardPage.isEnableHomeAccessPresent(), "User not on teacher dashboard");
    }

    @And("the user selects on student experience option")
    public void theUserSelectsOnStudentExperienceOption() {
        teacherDashboardPage.selectGoToStudentExperience();
    }

    @Then("user should navigate to classroom page")
    public void userShouldNavigateToClassroomPage() {
        Assert.assertTrue(teacherDashboardPage.isOnStudentExperiencePage(), "User is not on Student Experience page");
    }

    @When("the user clicks on enable home access option")
    public void the_user_clicks_on_enable_home_access_option() {
        teacherDashboardPage.clickHomeAccess();
    }

    @Then("^the user should navigate to teacher dashboard$")
    public void the_user_should_navigate_to_teacher_dashboard() {
        Assert.assertTrue(teacherDashboardPage.isOnTeacherDashboard(), "User not on Teacher Dashboard");
    }

    @And("user signout from teacher dashboard")
    public void userSignoutFromTeacherDashboard() {
        teacherDashboardPage.loadUrl(TeacherEndPoint.SIGN_OUT);
        teacherDashboardPage.deleteAllCookies();
    }

    @And("the user stores klass classcode and password")
    public void theUserStoresKlassClasscodeAndPassword() {
        storeKlassCodeAndPassword();
    }

    @When("user visits his dashboard")
    public void user_visits_his_dashboard() {
        context.cookies.injectCookiesToBrowser(driver);
        teacherDashboardPage.loadUrl(TeacherEndPoint.TEACHER_DASHBOARD);
        teacherDashboardPage.handleSummerLearningPopUp();
    }


    @And("^user adds new class using api$")
    public void user_adds_new_class_using_api() throws JsonProcessingException {
        TeacherDashboardApi teacherDashboardApi;
        TeacherData teacherData ;
        DataGenerator dataGenerator = new DataGenerator();
        String className = dataGenerator.firstName() + "_1st_Klass";
        Map<String, String> values = new HashMap<>();

        String gradeCode = "1";
        String subjectPreferenceCd = "0";
        values.put("klassName", className);
        values.put("gradeCode", gradeCode);
        values.put("subjectPreferenceCd", subjectPreferenceCd);

        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        Response responseStatus = teacherDashboardApi.addNewKlass(values, context.sessionId);

        ObjectMapper mapper = new ObjectMapper();
        AddKlassResponseInfo addKlassResponseInfo = mapper.readValue(responseStatus.body().asString(), AddKlassResponseInfo.class);

        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        teacherDashboardApi.addStudents(addKlassResponseInfo.getId(), context.sessionId);

        teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(evaluator.evaluate(context.getData(), context.getData().get("username")),
                evaluator.evaluate(context.getData(), context.getData().get("password")));

        String klassSlug = teacherData.getKlassSlug(className);
        String gradeId = teacherData.getKlassGradeId(className);
        String klassId = teacherData.getKlassId(className);

        customStorage.put("klassId", klassId);
        context.cookies.injectCookiesToBrowser(driver);
        teacherDashboardPage.loadUrl("teacher/class/" + klassSlug + "/dashboard");
        getKlassStudents();
    }

    @And("^user deletes the new added klass using api$")
    public void user_deletes_the_new_added_klass_using_api() {
        deleteKlassUsingApi();
    }

    @And("user resolves his timezone")
    public void user_resolves_his_timezone() {
        TeacherUtility teacherUtility = new TeacherUtility();
        int currentTime = teacherUtility.getCurrentTimeInIST();
        String schoolId = domainObjectContext.getTeacherKlassInfo().getSchoolService().getSchool().getId();
        System.out.println("Current time = " + currentTime);
        if ((currentTime >= 7) && (currentTime < 15)) {
            changeTimeZone("Chennai", schoolId);
        } else if ((currentTime >= 15) && (currentTime < 22)) {
            changeTimeZone("Newfoundland", schoolId);
        } else if ((currentTime >= 22) && (currentTime <= 24)) {
            changeTimeZone("Alaska", schoolId);
        } else if ((currentTime >= 1) && (currentTime < 5)) {
            changeTimeZone("Alaska", schoolId);
        } else if ((currentTime >= 5) && (currentTime < 7)) {
            changeTimeZone("Melbourne", schoolId);
        } else {
            Assert.fail("Invalid timeZone ");
        }
    }

    private void changeTimeZone(String countryName, String schoolId) {
        TeacherDashboardApi teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        teacherDashboardApi.setTimeZone(countryName, schoolId, context.sessionId);
    }

    @And("user deletes the assignment class for cleanup")
    public void user_deletes_the_assignment_class_for_cleanup() {
        loginUsingApi();
        deleteKlassUsingApi();
    }

    public void loginUsingApi() {
        LoginApi loginApi = new LoginApi(context.cookies.getCookies());
        Response resp = loginApi.
                doLogin(evaluator.evaluate(context.getData(), context.getData().get("username")),
                        evaluator.evaluate(context.getData(), context.getData().get("password")));
        context.sessionId = resp.getCookies().get("_session_id");
        context.jwtToken = resp.getCookies().get("jwt_authorization");
        context.cookies.setCookies(loginApi.getCookies());
    }

    public void deleteKlassUsingApi() {
        customStorage.get("klassId");
        TeacherDashboardApi teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        teacherDashboardApi.deleteKlass((String) customStorage.get("klassId"), context.sessionId);
        context.cookies.injectCookiesToBrowser(driver);
        teacherDashboardPage.loadUrl("teacher/dashboard");
    }

    public void storeKlassCodeAndPassword() {
        data.put("class_code", teacherDashboardPage.getClassCode());
        if (teacherDashboardPage.isPicturePassword()) {
            data.put("pic_password", teacherDashboardPage.getStudentPicPassword());
        } else {
            data.put("text_password", teacherDashboardPage.getStudentTextPassword());
        }
    }

    @Then("verify persona {int} is set on teacher dashboard")
    public void verifyPersonaIsSetOnTeacherDashboard(int personaId) throws JsonProcessingException {
        Response response;
        ObjectMapper mapper;
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        response = teacherDashboardApi.getUserAssignedPersona(domainObjectContext.getTeacherKlassInfo().getWebService().getTeacher().getId(), context.getSessionId());
        mapper = new ObjectMapper();
        GetAssignedPersona getAssignedPersona = mapper.readValue(response.body().asString(), GetAssignedPersona.class);
        System.out.println("Persona Id = " + getAssignedPersona.getId());
        if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getDashboardRevamp().equalsIgnoreCase("variant")) {
            Assert.assertEquals(getAssignedPersona.getId(), personaId, "Required Persona not set");
        }
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        response = teacherDashboardApi.getUserOnboardingStates(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getId(),
                context.getSessionId());
        mapper = new ObjectMapper();
        UserOnBoardingState userOnboardingStates = mapper.readValue(response.body().prettyPrint(), UserOnBoardingState.class);
        domainObjectContext.setUserOnBoardingState(userOnboardingStates);
        verifyPersonaOnTeacherDashboard();
    }


    private void verifyPersonaOnTeacherDashboard() {
        if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getDashboardRevamp().equalsIgnoreCase("variant")) {
            teacherDashboardPage.handleSummerLearningPopUp();
            teacherDashboardPage.handleSpringboardPopUp();
            verifyPersonaCheckListSection();
            verifyPersonaChecklistNames();
        } else {
            System.out.println("Dashboard Rewamp type = " + domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getDashboardRevamp());
        }

    }

    private void verifyPersonaCheckListSection() {
        Assert.assertEquals(domainObjectContext.getUserOnBoardingState().getOnboardingStates().size(),
                teacherDashboardPage.getPersonalChecklistStepCount(),
                "Checklist Section at FE is not Matching with API List");
    }

    private void verifyPersonaChecklistNames() {
        int count = domainObjectContext.getUserOnBoardingState().getOnboardingStates().size();
        for (int i = 0; i < count; i++) {
            String name = domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(i).getName();
            Assert.assertTrue(teacherDashboardPage.verifyChecklistExist(name), "Checklist Name not matched");
        }
    }

    private void verifyOrderOfContentInExploreSplashlearnContent() {
        int contentCount = domainObjectContext.getUserOnBoardingState().getOnboardingStates().size();
        for (int j = 0; j < contentCount; j++) {
            if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("Explore SplashLearn content")) {
                int contentSize = domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getContent().size();
                int contentOrder = 1;
                for (int k = 0; k < contentSize; k++) {
                    String expectedContentName = domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getContent().get(k).getName();
                    String actualContentName = teacherDashboardPage.verifyContentInExploreSplashContent(contentOrder);
                    Assert.assertEquals(actualContentName, expectedContentName, "Content order not matched in Explore Splash Content");
                    contentOrder++;
                }
            }
        }
    }

    @And("user is able to complete persona step checklist")
    public void userIsAbleToCompletePersonaStepChecklist() {
        completeOnboardingSteps();
    }

    private void getKlassStudents() throws JsonProcessingException {
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        Response studentResponse = teacherDashboardApi.getStudents(customStorage.get("klassId").toString(), context.sessionId);
        ObjectMapper studentResponseMapper = new ObjectMapper();
        StudentResponse[] studentResponses = studentResponseMapper.readValue(studentResponse.body().asString(), StudentResponse[].class);
        List<StudentResponse> st = new ArrayList<>();
        Map<String, String> studentData = new HashMap<>();

        for (StudentResponse student : studentResponses) {
            int i = 0;
            studentData.put("studentId" + i, student.getId());
            studentData.put("firstName" + (i + 1), student.getFirstName());
            studentData.put("lastName" + (i + 2), student.getLastName());
            studentData.put("gradeCode" + (i + 3), student.getGradeCode());
            studentData.put("picturePassword" + (i + 4), student.getPicturePassword());
            studentData.put("plainPassword" + (i + 5), student.getPlainTextPassword());
            st.add(student);
            domainObjectContext.setStudentResponse(st);
            i++;
        }
        storeKlassCodeAndPassword();
    }

    @And("user gets klass student info")
    public void userGetsKlassStudentInfo() throws JsonProcessingException {
        getKlassStudents();
    }

    @And("user sets post school hour time")
    public void userSetsPostSchoolHoursTime() {
        TeacherUtility teacherUtility = new TeacherUtility();
        int currentTime = teacherUtility.getCurrentTimeInIST();
        System.out.println("Current time = " + currentTime);
        teacherDashboardPage.handleSummerLearningPopUp();
        open(driver, TestContext.url, "profile");
        if ((currentTime >= 1) && (currentTime < 7)) {
            profilePage.setTimeZone("(GMT+02:00) Athens");
        } else if ((currentTime >= 7) && (currentTime < 15)) {
            profilePage.setTimeZone("(GMT-10:00) Hawaii");
        }
    }

    @Then("verify parent connected count when no student is linked")
    public void verifyParentConnectedCountWhenNoStudentIsLinked() {
        Assert.assertTrue(teacherDashboardPage.isNoConnectedParentTextVisible(), "No Connected Parent Text not appearing");
        Assert.assertEquals(teacherDashboardPage.getConnectedParentText(), "No parents connected", "Text not matched");
    }

    @Then("verify parent connected count when student is linked")
    public void verifyParentConnectedCountWhenStudentIsLinked() {
        TeacherData teacherData = new TeacherData(context);
        teacherDashboardPage.loadStudentRosterPage(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                teacherData.getKlassGradeName(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId()));
        String generatedParentEmail = DataGenerator.parentEmail();
        customStorage.put("studentName", domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(0).getFirstName());
        rosterPage.sendInviteToParentForStudent(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(0).getFirstName(),
                generatedParentEmail);
        signUpViaShareParentLinkInNewBrowser(generatedParentEmail);
        verifyConnectedParentCount();
    }

    private void signUpViaShareParentLinkInNewBrowser(String parentEmail) {
        String originalWindow = driver.getWindowHandle();
        driver.switchTo().newWindow(WindowType.WINDOW);
        EmailLibrary emailLibrary = new EmailLibrary(context);
        try {
            driver.get(emailLibrary.getHomeAccessLink(parentEmail));
        } catch (Exception e) {
            e.printStackTrace();
        }
        teacherSignUpPage.classroomLinkSignUp();
        otpPage.enterOtp(new TeacherData(context).getOtp(parentEmail));
        if (!Objects.equals(driver.getWindowHandle(), originalWindow)) {
            driver.close();
        }
        driver.switchTo().window(originalWindow);
        teacherDashboardPage.loadUrl("/signout");
    }

    private void verifyConnectedParentCount() {
        int count = 0;
        TeacherData teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(customStorage.get("email").toString(), customStorage.get("password").toString());
        context.cookies.injectCookiesToBrowser(driver);
        teacherDashboardPage.loadStudentRosterPage(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                teacherData.getKlassGradeName(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId()));

        Assert.assertTrue(rosterPage.isStudentLinkedToParent(customStorage.get("studentName").toString()));
        int totalStudentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        for(int i =0 ; i< totalStudentCount ; i++){
            if(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getParentEmail()!=null){
                count ++ ;
            }
        }
        String expectedConnectedParentCount = count + "/" + totalStudentCount + " parents connected";
        Assert.assertFalse(teacherDashboardPage.isNoConnectedParentTextVisible(), "No Connected Parent Text appearing");
        Assert.assertEquals(rosterPage.getConnectedParentText(), expectedConnectedParentCount, "Connected Parent Count not matched");
    }

    private void completeOnboardingSteps(){
        if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getDashboardRevamp().equalsIgnoreCase("variant")) {
            int checkListSize = domainObjectContext.getUserOnBoardingState().getOnboardingStates().size();
            for (int j = 0; j < checkListSize; j++) {
                if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("Explore SplashLearn content")) {
                    String exploreContentName = domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getContent().get(0).getName();
                    teacherDashboardPage.
                            selectExploreContent(exploreContentName).
                            selectDashboardOptionOnLeftnav().
                            closeModal().
                            isStepCompleted(domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName());
                } else if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("Add students")) {
                    teacherDashboardPage.
                            isStepCompleted(domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName());
                } else if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("Enable home access")) {
                    teacherDashboardPage.selectStep("Enable home access").
                            selectManageClass().selectStudentRoster().selectCopyLink().
                            selectDashboardOptionOnLeftnav().
                            isStepCompleted(domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName());
                } else if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("Get your students to login and play")) {
                    teacherDashboardPage.selectStep("Get your students to login and play");
                    System.out.println("To do ");

                } else if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("View progress")) {
                    teacherDashboardPage.selectStep("View progress").
                            selectMathReview().
                            selectMathDailyActivity().
                            selectDashboardOptionOnLeftnav().
                            isStepCompleted(domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName());
                } else if (domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName().equalsIgnoreCase("Tour the Student Experience")) {
                    teacherDashboardPage.selectStep("Tour the Student Experience").selectTryStudentExperience();
                    studentDashboardPage.selectGoToTeacherApp();
                    teacherDashboardPage.
                            selectDashboardOptionOnLeftnav().
                            isStepCompleted(domainObjectContext.getUserOnBoardingState().getOnboardingStates().get(j).getName());;
                }
                else {
                    Assert.fail("Persona Checklist Completion failed ");
                }
            }
        }
    }

    @Then("verify Nudge for incomplete onboarding state")
    public void verifyNudgeForIncompleteOnboardingState() {
        completeOnboardingSteps();
    }

    @Then("verify Nudge for existing user")
    public void verifyNudgeForExistingUserAtThDay() {
        teacherDashboardPage.handleSummerLearningPopUp();
        LocalStorage localStorage = new LocalStorage(context);
        String klassId = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getId();
        String reviewNudge = "reviewNudge" + klassId;
        String assignmentsNudge = "assignmentsNudge" + klassId;
        List<Integer> days = new ArrayList<>();
        for(int i = 0 ;i < localStorage.getLocalStorageLength() ; i++){
            if (localStorage.getKeyFromLocalStorage(i).equalsIgnoreCase(reviewNudge) ||
                    localStorage.getKeyFromLocalStorage(i).equalsIgnoreCase(assignmentsNudge)) {
                System.out.println("Key = " + localStorage.getKeyFromLocalStorage(i));
                System.out.println("Value = " + localStorage.getItemFromLocalStorage(localStorage.getKeyFromLocalStorage(i)));
                Long visibleDays = getNudgeVisibilityDay(localStorage.getItemFromLocalStorage(localStorage.getKeyFromLocalStorage(i)));
                days.add(visibleDays.intValue());
            }
        }

        String cName = domainObjectContext.getTeacherKlassInfo().getSchoolService().getSchool().getCountry_name();
        System.out.println("Country Name = " + cName);
        if(domainObjectContext.getTeacherKlassInfo().getSchoolService().getSchool().getCountry_name().equalsIgnoreCase("United States")){
            teacherDashboardPage.selectMenuFromLeftNav("MATH", "Review");
            teacherDashboardPage.selectSubMenu("MATH", "Review", "Daily activity");
        }else if(domainObjectContext.getTeacherKlassInfo().getSchoolService().getSchool().getCountry_name().equalsIgnoreCase("Australia")||
                domainObjectContext.getTeacherKlassInfo().getSchoolService().getSchool().getCountry_name().equalsIgnoreCase("United Kingdom")){
            teacherDashboardPage.selectDailyActivity();
        }

        teacherDashboardPage.selectDownloadWorksheet();
        Assert.assertFalse(teacherDashboardPage.isNudgeAppearing(), "Nudge is appearing");
//        if(days.size()!=0){
//            for (Integer day : days) {
//                if (day >=6) {
//                    Assert.assertTrue(teacherDashboardPage.isNudgeAppearing(), "Nudge is not appearing");
//                }
//                else{
//                    Assert.assertFalse(teacherDashboardPage.isNudgeAppearing(), "Nudge is appearing");
//                }
//            }
//        }else{
//            Assert.assertTrue(teacherDashboardPage.isNudgeAppearing(), "Nudge is not appearing");
//        }

    }

    private Long getNudgeVisibilityDay(String nudgeVisibilityDay){
        Instant timestamp = Instant.now();
        Instant getCurrentDayTime = Instant.parse(Instant.ofEpochMilli(timestamp.toEpochMilli()).toString());
        Instant nudgeLastVisibilityDay = Instant.parse(nudgeVisibilityDay);
        return getCurrentDayTime.until(nudgeLastVisibilityDay, ChronoUnit.DAYS);
    }
}
