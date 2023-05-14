package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.pageobjects.PageFactoryManager;
import com.splashlearn.pageobjects.SplashCommunityPage;
import com.splashlearn.pageobjects.TeacherDashboardPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

public class SummerLearningSteps {
    private final WebDriver driver;
    private final TestContext context ;
    private final SplashCommunityPage splashCommunityPage;
    private final DomainObjectContext domainObjectContext ;
    private final TeacherDashboardPage teacherDashboardPage;

    public SummerLearningSteps(TestContext context){
        this.context =context;
        driver= context.getDriver();
        domainObjectContext = context.getDomainObjectContext();
        splashCommunityPage = PageFactoryManager.getSplashCommunityPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
    }

    @Then("^verify summerLearning is (visible|not visible) on dashboard$")
    public void verifySummerLearningIsVisibleOnDashboard(String expectedResult){
        teacherDashboardPage.handleSpringboardPopUp();
        teacherDashboardPage.handleSummerLearningPopUp();
        if(expectedResult.equalsIgnoreCase("visible")){
            Assert.assertEquals(domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getSummerLearningSegment(), "Variant", "Segment not matched");
            Assert.assertTrue(teacherDashboardPage.isSummerLearningTabVisible(), "Summer Learning tab not visible on left Nav");
        }else if(expectedResult.equalsIgnoreCase("not visible")){
            Assert.assertEquals(domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getSummerLearningSegment(), "Control", "Segment not matched");
            Assert.assertFalse(teacherDashboardPage.isSummerLearningTabVisible(), "Summer Learning tab is visible on left Nav");
        }else {
            Assert.fail("in valid option = " + expectedResult);
        }
    }
    @And("^verify discount should (visible|not visible) on dashboard$")
    public void verifyDiscountShouldNotVisibleOnDashboard(String expectedResult){
        teacherDashboardPage.selectDashboardOptionOnLeftnav();
        if(expectedResult.equalsIgnoreCase("visible")){
            Assert.assertTrue(teacherDashboardPage.isDiscountBannerVisibleOnDashboard());
        }else if(expectedResult.equalsIgnoreCase("not visible")){
            Assert.assertFalse(teacherDashboardPage.isDiscountBannerVisibleOnDashboard());
        }else{
            Assert.fail("Invalid option = " + expectedResult);
        }
    }
    @And("^verify discount should (visible|not visible) on home access page$")
    public void verifyDiscountShouldNotVisibleOnHomeAccessPage(String expectedResult){
        teacherDashboardPage.clickHomeAccess();
        if(expectedResult.equalsIgnoreCase("visible")){
            Assert.assertTrue(teacherDashboardPage.isDiscountBannerVisibleOnHomeAccessPage(), "Discount Banner visible on Home Access Page");
        }else if(expectedResult.equalsIgnoreCase("not visible")){
            Assert.assertFalse(teacherDashboardPage.isDiscountBannerVisibleOnHomeAccessPage(), "Discount Banner visible on Home Access Page");
        }
    }
    @Then("^verify summerLearning is not visible for non US user$")
    public void verifyDiscountShouldNotVisibleforNonUSUser(){
        Assert.assertFalse(teacherDashboardPage.isSummerLearningTabVisible(), "Summer Learning tab visible on Left nav");
    }
}
