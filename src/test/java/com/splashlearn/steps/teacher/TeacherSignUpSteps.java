package com.splashlearn.steps.teacher;

import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import com.splashlearn.custom.api.model.pojo.teacherInfo.TeacherKlassInfo;
import com.splashlearn.dao.UserOtpDAO;
import com.splashlearn.pageobjects.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.Map;

public class TeacherSignUpSteps {
    private final WebDriver driver;
    private final Map<String, String> data;
    private final Map<String, Object> customStorage;
    private final TeacherSignUpPage teacherSignUpPage;
    private final OtpPage otpPage;
    private final TestContext context;
    private final AddKlassStudentPage addKlassStudentPage;
    private final SurveyQuestionPage surveyQuestionPage;
    private final TeacherDashboardPage teacherDashboardPage;
    private final SplashCommunityPage splashCommunityPage;
    private final DomainObjectContext domainObjectContext;
    private final Evaluator evaluator = new Evaluator();
    private static final Logger logger = LogManager.getLogger(HomeAccessSteps.class);

    public TeacherSignUpSteps(TestContext context) {
        this.context = context;
        driver = context.getDriver();
        data = context.getData();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        teacherSignUpPage = PageFactoryManager.getTeacherSignUpPage(driver);
        otpPage = PageFactoryManager.getOtpPage(driver);
        addKlassStudentPage = PageFactoryManager.getAddKlassStudentPage(driver);
        surveyQuestionPage = PageFactoryManager.getSurveyQuestionPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
        splashCommunityPage = PageFactoryManager.getSplashCommunityPage(driver);
    }

    @Given("the user is on teacher registration page")
    public void the_user_is_on_teacher_registration_page() {
        teacherSignUpPage.loadUrl(TeacherEndPoint.SIGNUP);
        driver.manage().window().maximize();
    }

    @When("^the user sign up as a (US|UK|AUS) teacher$")
    public void the_user_sign_up_as_us_teacher(String userType) {

        String userEmail = DataGenerator.teacherEmail();
        logger.info("user email = " + userEmail);

        customStorage.put("email", userEmail);
        customStorage.put("password", "123456");
        teacherSignUp(userType, userEmail);
    }

    private void signUpasUSTeacher(String userEmail, String password) {
        teacherSignUpPage.fillSignUpForm(userEmail, password).setUSSchool();
        otpPage.enterOtp(getOtp(userEmail));
        addKlassStudentPage.addUsKlass("Newton klass first", "Grade 1", "Math + Reading");
        completeUserOnboarding(userEmail, password);
    }

    private void signUpasUKTeacher(String userEmail, String password) {
        teacherSignUpPage.fillSignUpForm(userEmail, password).setNonUSSchool("United Kingdom", "Hampshire");
        otpPage.enterOtp(getOtp(userEmail));
        addKlassStudentPage.addNonUsKlass("Jason klass first", "Year 2");
        completeUserOnboarding(userEmail, password);
    }
    private void signUpasAUSTeacher(String userEmail, String password) {
        teacherSignUpPage.fillSignUpForm(userEmail, password).setNonUSSchool("Australia", "Queensland");
        otpPage.enterOtp(getOtp(userEmail));
        addKlassStudentPage.addNonUsKlass("Gilly klass first", "Year 1");
        completeUserOnboarding(userEmail, password);
    }

    private String getOtp(String userEmail) {
        UserOtpDAO userOtpDAO = new UserOtpDAO();
        EmailVerificationIntent em = userOtpDAO.getUserOtpInfoFromDB(userEmail);
        return em.getCode();
    }

    private void selectPersona() {
        if (evaluator.evaluate(context.getData(), context.getData().get("survey_answers")) == null) {
            surveyQuestionPage.handleSurveyPage();
        } else {
            String[] optionAnswers = evaluator.evaluate(context.getData(), context.getData().get("survey_answers")).split(",");
            surveyQuestionPage.answerSurveyQuestion(optionAnswers);
        }
    }
    private void completeUserOnboarding(String userEmail, String password){
        TeacherData teacherData;
        selectPersona();
        teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(userEmail, password);

        String addStudentPage = domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getAddParentEmailScreen();
        if(!StringUtils.isBlank(addStudentPage) && addStudentPage.equalsIgnoreCase("variant")){
            System.out.println("variant student page");
            addKlassStudentPage.addStudentsVariantPage();
        }
        else if(StringUtils.isBlank(addStudentPage) || addStudentPage.equalsIgnoreCase("control")){
            System.out.println("control student page");
            addKlassStudentPage.addStudentsControlPage();
        }else{
            Assert.fail("Invalid Segment for Add Student Page = " + addStudentPage);
        }

        teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(userEmail, password);
        teacherDashboardPage.handleSpringboardPopUp();
        customStorage.put("klassId", domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getId());
    }

    @When("the user sign up as a teacher")
    public void theUserSignUpAsATeacher() {
        String userEmail = DataGenerator.teacherEmail();
        logger.info("user email = " + userEmail);
        customStorage.put("email", userEmail);
        customStorage.put("password", "123456");
        String userType = evaluator.evaluate(context.getData(), context.getData().get("usertype"));
        teacherSignUp(userType, userEmail);
    }

    private void teacherSignUp(String userType, String userEmail){
        switch (userType.toUpperCase()){
            case "US":
                signUpasUSTeacher(userEmail, "123456");
                break;
            case "UK":
                signUpasUKTeacher(userEmail, "123456");
                break;
            case "AUS":
                signUpasAUSTeacher(userEmail, "123456");
                break;
            default:
                Assert.fail("In valid User Type for SignUp" + userType);
        }
    }
}
