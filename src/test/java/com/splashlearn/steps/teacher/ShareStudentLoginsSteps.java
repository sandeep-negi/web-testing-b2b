package com.splashlearn.steps.teacher;

import com.splashlearn.context.TestContext;
import com.splashlearn.pageobjects.ClassSettingsPage;
import com.splashlearn.pageobjects.PageFactoryManager;
import com.splashlearn.pageobjects.TeacherDashboardPage;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

public class ShareStudentLoginsSteps {
    private final ClassSettingsPage classSettingsPage;
    private final TeacherDashboardPage teacherDashboardPage;
    private final WebDriver driver;

    public ShareStudentLoginsSteps(TestContext context) {
        driver = context.getDriver();
        classSettingsPage = PageFactoryManager.getClassSettingsPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
    }

    @Then("Verify student login instructions are copied successfully")
    public void verifyStudentLoginInstructionsAreCopiedSuccessfully() {
        teacherDashboardPage.handleSummerLearningPopUp();
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        classSettingsPage.selectOptionPasswordModeCommonAndPasswordTypeText();
        classSettingsPage.clickSaveChangesBtn();
        teacherDashboardPage.clickOnCopyInstructionsButtonOnShareStudentLoginOnLeftNav();
        Assert.assertTrue(teacherDashboardPage.verifyCopiedTextIsAppearing());
        teacherDashboardPage.clickCrossButtonOnShareStudentLoginPopup();
    }
}