package com.splashlearn.steps.teacher;

import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.EmailLibrary;
import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import com.splashlearn.custom.api.operations.HomeAccessPageApi;
import com.splashlearn.dao.UserOtpDAO;
import com.splashlearn.pageobjects.*;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.restassured.response.Response;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WindowType;
import org.testng.Assert;

import java.awt.*;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

public class HomeAccessSteps {
    private HomeAccessPage homeAccessPage;
    private final TeacherDashboardPage teacherDashboardPage;
    private final TeacherSignUpPage teacherSignUpPage;
    private final OtpPage otpPage;
    private final DomainObjectContext domainObjectContext;
    private final WebDriver driver;
    private final Map<String, String> data;
    private final TestContext context;
    private final Evaluator evaluator = new Evaluator();
    private final Map<String, Object> customStorage;
    private static final Logger logger = LogManager.getLogger(HomeAccessSteps.class);

    public HomeAccessSteps(TestContext context) {
        this.context = context;
        driver = context.getDriver();
        this.data = context.getData();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
        homeAccessPage = PageFactoryManager.getHomeAccessPage(driver);
        teacherSignUpPage = PageFactoryManager.getTeacherSignUpPage(driver);
        otpPage = PageFactoryManager.getOtpPage(driver);
    }

    @Then("the user should navigate to home access page")
    public void the_user_should_navigate_to_home_access_page() {
        Assert.assertTrue(homeAccessPage.isUserOnHomeAccessPage(), "User is not on Home Access Page");
    }

    @And("^the user clicks on back button on home page$")
    public void the_user_clicks_on_back_button_on_home_page() {
        homeAccessPage.clickBack();
    }

    @Then("^verify ui for users on first visit on home access page$")
    public void verifyUiForVariantUsersOnFirstVisitOnHomeAccessPage() {
        teacherDashboardPage.clickHomeAccess();
        if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("variant")) {
            Assert.assertFalse(homeAccessPage.isStudentLearningSectionBelowInviteParentEmailSection(), "Student Learning section present below Hero Image");
            Assert.assertTrue(homeAccessPage.isNewInviteParentViaEmailSectionPresent(), "Variant User Parent Invite Via Email UI not present");
            String expectedConnectedParentCount = "0/" + domainObjectContext.getTeacherKlassInfo().getStudentResponses().size() + " parents connected";
            System.out.println("Connected Parent Count = " + expectedConnectedParentCount);
            Assert.assertEquals(homeAccessPage.noConnectedParentCountInfo(), expectedConnectedParentCount, "Invited Parent Count not matched");
        } else if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("control")) {
            Assert.assertFalse(homeAccessPage.isStudentLearningSectionBelowInviteParentEmailSection(), "Student Learning section present below Hero Image");
            Assert.assertFalse(homeAccessPage.isNewInviteParentViaEmailSectionPresent(), "Variant User Parent Invite Via Email UI present");
        } else {
            Assert.fail("Invalid AB flow for Home Access = " + domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage());
        }
    }

    @Then("^verify ui for users on second visit on home access page$")
    public void verifyUiForVariantUsersOnSecondVisitOnHomeAccessPage() {
        teacherDashboardPage.clickHomeAccess();
        if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("variant")) {
            homeAccessPage.clickVariantFlowHomeAccessPageBackBtn();
            teacherDashboardPage.clickHomeAccess();
            Assert.assertTrue(homeAccessPage.isNewInviteParentViaEmailSectionPresent(), "Variant User Parent Invite Via Email UI not present");
            Assert.assertTrue(homeAccessPage.expandStudentLearningSection().verifyStudentLearningSectionAfterExpansion(), "Student Learning Section not appearing");
        } else if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("control")) {
            homeAccessPage.clickControlFlowHomeAccessPageBackBtn();
            teacherDashboardPage.clickHomeAccess();
            Assert.assertFalse(homeAccessPage.isStudentLearningSectionBelowInviteParentEmailSection(), "Student Learning section present below Hero Image");
            Assert.assertFalse(homeAccessPage.isNewInviteParentViaEmailSectionPresent(), "Variant User Parent Invite Via Email UI present");
        } else {
            Assert.fail("Invalid AB flow for Home Access = " + domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage());
        }
    }

    @Then("^verify ui for (variant|control) users on home access page$")
    public void verifyUiForVariantUsersOnHomeAccessPage(String userABType) {
        teacherDashboardPage.handleSpringboardPopUp();
        teacherDashboardPage.handleSummerLearningPopUp();

        if (userABType.equalsIgnoreCase("variant")) {
            Assert.assertTrue(domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("variant"), "Variant Segment has changed to other segment");
            teacherDashboardPage.clickHomeAccess();
            Assert.assertTrue(homeAccessPage.isNewInviteParentViaEmailSectionPresent(), "Variant User Parent Invite Via Email UI not present");
            homeAccessPage.expandStudentLearningSection();
            Assert.assertTrue(homeAccessPage.verifyStudentLearningSectionAfterExpansion(), "Student Learning Section not appearing");
        } else if (userABType.equalsIgnoreCase("control")) {
            teacherDashboardPage.clickHomeAccess();
            Assert.assertFalse(homeAccessPage.isStudentLearningSectionBelowInviteParentEmailSection(), "Student Learning section present below Hero Image");
            Assert.assertFalse(homeAccessPage.isNewInviteParentViaEmailSectionPresent(), "Variant User Parent Invite Via Email UI present");
        } else {
            Assert.fail("Invalid AB flow for Home Access Page");
        }
    }

    @Then("verify copy invite functionality on home access page")
    public void verifyCopyInviteFunctionalityOnHomeAccessPage() {
        teacherDashboardPage.clickHomeAccess();
        if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("variant")) {
            homeAccessPage.selectCopyInviteOnHeroImage();
            copyAndStoreParentInvite();
            Assert.assertTrue(homeAccessPage.selectCopyInviteOnHeroImage().isCopiedTextVisible(), "Copied Text not Visible");
            homeAccessPage.selectCopyInviteOnPage();
            copyAndStoreParentInvite();
            Assert.assertTrue(homeAccessPage.selectCopyInviteOnPage().isCopiedTextVisible(), "Copied Text not Visible");

        } else if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("control")) {
            homeAccessPage.selectCopyInviteOnPage();
            Assert.assertTrue(homeAccessPage.selectCopyInviteOnPage().isCopiedTextVisible(), "Copied Text not Visible");
        } else {
            Assert.fail("Unknown AB set for Home Access Rewamp " + domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage());
        }
    }

    @Then("verify download invite functionality on home access page")
    public void verifyDownloadInviteFunctionalityOnHomeAccessPage() {
        teacherDashboardPage.clickHomeAccess();
        homeAccessPage.selectDownloadInvite().switchToParentWindowFromChildWindow();
        HomeAccessPageApi homeAccessPageApi = new HomeAccessPageApi(context.cookies.getCookies());
        Response response = homeAccessPageApi.teacherReferralInviteLetter(customStorage.get("klassId").toString(), context.sessionId);
        Assert.assertEquals(response.getStatusCode(), 201, "Unable to download letter");


    }

    @Then("verify connected parent count on home access page")
    public void verifyConnectedParentCountOnHomeAccessPage() {
        teacherDashboardPage.clickHomeAccess();
        int klassStudentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        logger.info("Student Count = " + klassStudentCount);
        int count = 1;
        for (int i = 1; i < klassStudentCount; i++) {
            if (domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getParentEmail() == null) {
                String generatedParentEmail = DataGenerator.parentEmail();
                homeAccessPage.sendInviteToParent(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName(), generatedParentEmail);
                openNewBrowser(generatedParentEmail);
                TeacherData teacherData = new TeacherData(context);
                teacherData.getTeacherKlassStudentData( customStorage.get("email").toString(),  customStorage.get("password").toString());
                context.cookies.injectCookiesToBrowser(driver);
                teacherDashboardPage.clickHomeAccess();
                if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("variant")) {
                    Assert.assertTrue(homeAccessPage.isStudentConnected(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName()), "Student not linked to Parent");
                    String expectedConnectedParentCount = count + "/" + domainObjectContext.getTeacherKlassInfo().getStudentResponses().size() + " parents connected";
                    Assert.assertEquals(homeAccessPage.getConnectedParentCountInfo(), expectedConnectedParentCount, "Invited Parent Count not matched");
                    count++;
                } else if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getHomeAccessRevampPage().equalsIgnoreCase("control")) {
                    Assert.assertTrue(homeAccessPage.isStudentConnected(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName()), "Student not linked to Parent");
                }
            }
        }
    }

    private void copyAndStoreParentInvite() {
        String inviteInfo = null;
        try {
            inviteInfo = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        } catch (UnsupportedFlavorException | IOException e) {
            e.printStackTrace();
        }
        logger.debug("inviteInfo=" + inviteInfo);
        data.put("parent_invite_link", StringUtils.substringBetween(inviteInfo, "Go to ", "\n2. Sign up"));
        data.put("class_code", StringUtils.substringBetween(inviteInfo, "class code: ", "."));
    }

    private String getOtp(String userEmail) {
        UserOtpDAO userOtpDAO = new UserOtpDAO();
        EmailVerificationIntent em = userOtpDAO.getUserOtpInfoFromDB(userEmail);
        return em.getCode();
    }

    private void openNewBrowser(String parentEmail) {
        String originalWindow = driver.getWindowHandle();
        driver.switchTo().newWindow(WindowType.WINDOW);
        EmailLibrary emailLibrary = new EmailLibrary(context);
        try {
            driver.get(emailLibrary.getHomeAccessLink(parentEmail));
        } catch (Exception e) {
            e.printStackTrace();
        }
        teacherSignUpPage.classroomLinkSignUp();
        otpPage.enterOtp(getOtp(parentEmail));
        if(!Objects.equals(driver.getWindowHandle(), originalWindow)){
            driver.close();
        }
        driver.switchTo().window(originalWindow);
        homeAccessPage.loadUrl("/signout");
    }
}
