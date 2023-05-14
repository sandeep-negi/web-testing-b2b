package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.pageobjects.PageFactoryManager;
import com.splashlearn.pageobjects.SplashCommunityPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

public class SplashCommunitySteps {
    private final WebDriver driver;
    private final TestContext context ;
    private final SplashCommunityPage splashCommunityPage;
    private final DomainObjectContext domainObjectContext ;

    public SplashCommunitySteps(TestContext context){
        this.context =context;
        driver= context.getDriver();
        domainObjectContext = context.getDomainObjectContext();
        splashCommunityPage = PageFactoryManager.getSplashCommunityPage(driver);
    }

    @And("^splash community (should|should not) appear on leftNav$")
    public void splash_community_should_appear_on_teacher_dashboard(String action) {
        verifySplashCommunityInLeftNav(action);
    }

    @Then("^splash community modal (should|should not) appear$")
    public void splash_community_modal_should_appear(String action) {
        verifySplashCommunityModal(action);
    }

    @And("^splashCommunity banner (should|should not) appear on all sub sections$")
    public void splashcommunity_banner_should_appear_on_all_sub_sections(String action){
        verifySplashCommunityBanner(action);
    }

    @When("^user joins splashCommunity from (modal|banner)$")
    public void user_joins_splashcommunity_from_modal(String action){
        if(domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getCircleCommunity().equalsIgnoreCase("variant")){
            if(action.equalsIgnoreCase("modal")){
                Assert.assertTrue(splashCommunityPage.isSplashlearnCommunityModalVisible(),"Splash Community Modal is not appearing");
                splashCommunityPage.joinSplashCommunity();
            }else if(action.equalsIgnoreCase("banner")){
                splashCommunityPage.selectSplashHub().joinSplashCommunity();
                Assert.assertFalse(splashCommunityPage.isSplashlearnCommunityModalVisible(),"Splash Community Modal is appearing ");
            }
            else{
                Assert.fail("Invalid action = "+ action);
            }
        }

    }

    public void verifySplashCommunityModal(String action){
        if(action.equalsIgnoreCase("should")){
            Assert.assertTrue(splashCommunityPage.isSplashlearnCommunityModalVisible(),"Splash Community Modal is not appearing");
            splashCommunityPage.handleSplashlearnCommunityModal();
        }else if(action.equalsIgnoreCase("should not")){
            Assert.assertFalse(splashCommunityPage.isSplashlearnCommunityModalVisible(),"Splash Community Modal is appearing ");
        }
        else{
            Assert.fail("Invalid action = "+ action);
        }
    }

    public void verifySplashCommunityBanner(String action){
        if(action.equalsIgnoreCase("should")){
            Assert.assertTrue(splashCommunityPage.isSplashCommunityBannerVisibleOnSubSection(),"SplashCommunity Banner not visible");
        }else if(action.equalsIgnoreCase("should not")){
            Assert.assertFalse(splashCommunityPage.isSplashCommunityBannerVisibleOnSubSection(),"SplashCommunity Banner is visible");
        }else{
            Assert.fail("Invalid option = " +action);
        }
    }

    public void verifySplashCommunityInLeftNav(String action){
        if(action.equalsIgnoreCase("should")){
            Assert.assertTrue(splashCommunityPage.isSplashlearnCommunityVisibleOnNavBar(),"Splash Community is not appearing on left Nav");
        }
        else if(action.equalsIgnoreCase("should not")){
            Assert.assertFalse(splashCommunityPage.isSplashlearnCommunityVisibleOnNavBar(),"Splash Community is appearing on left Nav");
        }
        else{
            Assert.fail("Invalid option = "+ action);
        }
    }

    @Then("^splashCommunity should appear to US (variant|control) users$")
    public void splashcommunityShouldAppearToUSVariantUsers(String userType) {
        if(domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getCircleCommunity().equalsIgnoreCase("variant")){
            Assert.assertTrue(splashCommunityPage.isSplashlearnCommunityVisibleOnNavBar(),"Splash Community is not appearing on left Nav");
            Assert.assertTrue(splashCommunityPage.isSplashCommunityBannerVisibleOnSubSection(),"SplashCommunity Banner not visible");
        }
        else if(domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getCircleCommunity().equalsIgnoreCase("control")){
            Assert.assertFalse(splashCommunityPage.isSplashlearnCommunityModalVisible(),"Splash Community Modal is appearing ");
            Assert.assertFalse(splashCommunityPage.isSplashlearnCommunityVisibleOnNavBar(),"Splash Community is appearing on left Nav");
            Assert.assertFalse(splashCommunityPage.isSplashCommunityBannerVisibleOnSubSection(),"SplashCommunity Banner is visible");
        }
        else{
            Assert.fail("User type = " + userType + " not valid");
        }
    }
}