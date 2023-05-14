package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.ImageComparisonUtility;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import com.splashlearn.dao.UserOtpDAO;
import com.splashlearn.pageobjects.*;
import com.splashlearn.utils.TeacherUtility;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import ru.yandex.qatools.ashot.AShot;
import ru.yandex.qatools.ashot.Screenshot;
import ru.yandex.qatools.ashot.comparison.ImageDiff;
import ru.yandex.qatools.ashot.comparison.ImageDiffer;
import ru.yandex.qatools.ashot.shooting.ShootingStrategies;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Map;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;
import static com.splashlearn.core.selenium.SeleniumActions.sleep;

public class LoginSteps {
    private final WebDriver driver;
    private final LoginPage loginPage;
    private final TeacherDashboardPage teacherDashboardPage ;
    private final StudentDashboardPage studentDashboardPage;
    private final StudentCentrePage studentCentrePage;
    private final Evaluator evaluator = new Evaluator();
    private final TestContext context;
    private final Map<String, String> data;
    private final OtpPage otpPage ;
    private final DomainObjectContext domainObjectContext;

    public LoginSteps(TestContext context) {
        this.context = context;
        driver = context.getDriver();
        data = context.getData();
        this.domainObjectContext = context.getDomainObjectContext();
        loginPage = PageFactoryManager.getLoginPage(driver);
        otpPage = PageFactoryManager.getOtpPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
        studentDashboardPage = PageFactoryManager.getStudentDashboardPage(driver);
        studentCentrePage = PageFactoryManager.getStudentCentrePage(driver);
    }

    @Given("the user is on login page")
    public void the_user_is_on_login_page() {
        loginPage.loadUrl(TeacherEndPoint.SIGN_IN);
        driver.manage().window().maximize();
    }

    @Then("^verify otp login option is visible for (Parent|Teacher) signin$")
    public void verifyOtpLoginOptionIsVisibleForParentSignin(String userType) {

        loginPage.selectParentTeacher();
        if (userType.equalsIgnoreCase("parent")) {
            loginPage.selectLoginUser(userType);
            Assert.assertTrue(loginPage.isOTPLinkVisible(), "SignIn via OTP link not visible ");
        } else if (userType.equalsIgnoreCase("teacher")) {
            loginPage.selectLoginUser(userType);
            Assert.assertTrue(loginPage.isOTPLinkVisible(), "SignIn via OTP link not visible ");
        }
    }

    @And("verify otp form is visible on click of otp login")
    public void verifyOtpFormIsVisibleOnClickOfOtpLogin() {
        String userEmail = evaluator.evaluate(context.getData(), context.getData().get("username"));
        loginPage.selectLoginViaOtpLink();
        loginPage.enterEmail(userEmail);
        loginPage.selectLoginViaOtp();
        Assert.assertTrue(loginPage.isVerificationCodeVisible(), "OTP verification code not visible");
    }

    @Then("verify otp form when invalid user email is entered")
    public void verifyOtpFormWhenInvalidUserEmailIsEntered() {
        String userEmail = evaluator.evaluate(context.getData(), context.getData().get("username"));
        loginPage.selectLoginViaOtpLink();
        loginPage.enterEmail(userEmail);
        loginPage.selectLoginViaOtp();
        Assert.assertEquals(loginPage.getErrorMessage(), "Invalid Email", "Error message not matched");
    }

    @Then("verify error message when user enters invalid otp")
    public void verifyErrorMessageWhenUserEntersInvalidOtpMultipleTimes() {
        otpPage.loginViaOtp("123456");
        loginPage.selectLoginViaOtp();
        Assert.assertEquals(loginPage.getErrorMessage(), "Invalid code, please verify and retry", "OTP Error message not matched");
        loginPage.selectLoginViaOtp();
        Assert.assertEquals(loginPage.getErrorMessage(), "Invalid code, please verify and retry", "OTP Error message not matched");
        loginPage.selectLoginViaOtp();
        Assert.assertEquals(loginPage.getErrorMessage(), "You’ve entered incorrect OTP in multiple attempts. Please try again after 30 mins.", "OTP Error message not matched");
        loginPage.selectLoginViaOtp();
        Assert.assertEquals(loginPage.getErrorMessage(), "Verification code expired, please click on Re-send code to get new code", "OTP Error message not matched");
    }

    @Then("^verify error message when user enters (Verified|Initiated) OTP$")
    public void verifyErrorMessageWhenUserEntersAlreadyVerifiedOTP(String statusType) {
        String userEmail = evaluator.evaluate(context.getData(), context.getData().get("username"));
        String codeStatus = getOtp(userEmail, statusType);
        otpPage.loginViaOtp(codeStatus);
        loginPage.selectLoginViaOtp();
        Assert.assertEquals(loginPage.getErrorMessage(), "Invalid code, please verify and retry", "OTP Error message not matched");
    }
    private String getOtp(String userEmail, String codeStatus) {
        UserOtpDAO userOtpDAO = new UserOtpDAO();
        EmailVerificationIntent em = userOtpDAO.getOtpAsPerToStatusFromDB(userEmail, codeStatus);
        return em.getCode();
    }
    @Then("verify resend code is visible on otp screen")
    public void verifyResendCodeForOtpLogin() throws InterruptedException {
        loginPage.waitForResendCodeToEnable();
        loginPage.clickResendCode();
        Assert.assertEquals(loginPage.getSuccessInfo(), "A new verification code has been sent.", "OTP Success text info not matched");
    }

    @Then("verify new classcode ui for klass student login")
    public void verifyNewClasscodeUiOnStudentLogin() throws IOException {
        teacherDashboardPage.loadUrl(TeacherEndPoint.SIGN_OUT);
        verifyKlassCodeLoginPage();
    }

    private void verifyKlassCodeLoginPage(){
        sleep(DEFAULT_TIMEOUT);
        loginPage.loadUrl("student");
        ImageComparisonUtility imageComparisonUtility = new ImageComparisonUtility(context);
        Assert.assertFalse(imageComparisonUtility.
                        compareImages("/images/actualImage/KlassCodeScreen.png",
                                "/images/expectedImage/KlassCodeScreen.png"),
                "Klass Code UI Image are different");
    }

    @And("verify error message for invalid classcode")
    public void verifyClasscodeErrorMessageForInvalidOtp() {
        studentLoginViaClassCode("QQQQQQ");
        ImageComparisonUtility imageComparisonUtility = new ImageComparisonUtility(context);
        Assert.assertFalse(imageComparisonUtility.
                        compareImages("/images/actualImage/InvalidKlassCode.png",
                                "/images/expectedImage/InvalidKlassCode.png"),
                "Klass Code Error QQQQQQ Images are different");
    }

    @Then("verify ui for valid classcode login")
    public void verifyUiForValidClasscodeLogin() {
        studentLoginViaClassCode(data.get("class_code"));
        ImageComparisonUtility imageComparisonUtility = new ImageComparisonUtility(context);
        Assert.assertFalse(imageComparisonUtility.
                        compareImages("/images/actualImage/StudentsProfile.png",
                                "/images/expectedImage/StudentsProfile.png"),
                "Students Profile Images not matched");
        System.out.println("Entered ClassCode");
    }

    @And("verify password page ui for invalid cases")
    public void verifyPasswordPageUiForInvalidCases() {
        studentInvalidPasswordLogin(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(0).getFirstName());
    }

    private void studentInvalidPasswordLogin(String studentName) {
        studentCentrePage.selectStudentFromNewUI(studentName);
        ImageComparisonUtility imageComparisonUtility = new ImageComparisonUtility(context);

        if (data.containsKey("class_pic_password")){
            studentCentrePage.signinViaPicturePassword(data.get("pic_password"));
        }

        else{
            Assert.assertFalse(imageComparisonUtility.
                            compareImages("/images/actualImage/DefaultTextPassword.png",
                                    "/images/expectedImage/DefaultTextPassword.png"),
                    "Students Default Password Image not matched");

            studentCentrePage.selectSignIn();
            Assert.assertFalse(imageComparisonUtility.
                            compareImages("/images/actualImage/SubmitBlankPassword.png",
                                    "/images/expectedImage/SubmitBlankPassword.png"),
                    "Students Blank Password Image not matched");

            studentCentrePage.enterPassword("123456");
            studentCentrePage.selectSignIn();
            Assert.assertFalse(imageComparisonUtility.
                            compareImages("/images/actualImage/InvalidPassword.png",
                                    "/images/expectedImage/InvalidPassword.png"),
                    "Students Invalid Password Image not matched");

        }

    }

    @And("verify ui for valid student password login")
    public void verifyUiWithValidPasswordLogin() {
        studentLoginViaClassCode(data.get("class_code"));
        studentCentrePage.selectStudentFromNewUI(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(0).getFirstName());
        ImageComparisonUtility imageComparisonUtility = new ImageComparisonUtility(context);
        if (data.containsKey("class_pic_password")){
            studentCentrePage.signinViaPicturePassword(data.get("pic_password"));
        }else{
            studentCentrePage.enterPassword(data.get("text_password"));
            studentCentrePage.selectSignIn();
            studentCentrePage.waitForScreen();
            String currentHour = getSchoolOrHomeHour();
            if(currentHour.equalsIgnoreCase("schoolHours")){
                Assert.assertFalse(imageComparisonUtility.
                                compareImages("/images/actualImage/InSchoolHours.png",
                                        "/images/expectedImage/InSchoolHours.png"),
                        "In School Hours Image not matched");
            }else if(currentHour.equalsIgnoreCase("homeHours")){
                Assert.assertFalse(imageComparisonUtility.
                                compareImages("/images/actualImage/HomeHours.png",
                                        "/images/expectedImage/HomeHours.png"),
                        "Post School Hours Image not matched");
            }

        }
    }

    private void studentLoginViaClassCode(String klassCode){
        teacherDashboardPage.loadUrl(TeacherEndPoint.SIGN_OUT);
        sleep(DEFAULT_TIMEOUT);
        loginPage.loadUrl("student");
        otpPage.enterKlassCode(klassCode);
    }

    private String getSchoolOrHomeHour(){
        String duration = null;
        TeacherUtility teacherUtility = new TeacherUtility();
        int currentTime = teacherUtility.getCurrentTimeInIST();
        System.out.println("Current time = " + currentTime);
        if ((currentTime >= 7) && (currentTime < 15)) {
            duration =  "schoolHours" ;
        } else if ((currentTime >= 15) && (currentTime < 22)) {
            duration =  "homeHours";

        }else{
            Assert.fail("Invalid Time");
        }
        return duration ;
    }
}
