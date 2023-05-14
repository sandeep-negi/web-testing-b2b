package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.pageobjects.*;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.Map;

public class ReviewSteps {
    private final TestContext context ;
    private final Evaluator evaluator = new Evaluator();
    private final Map<String, Object> customStorage;
    private final DomainObjectContext domainObjectContext ;
    private final DailyActivityPage dailyActivityPage ;
    private final TeacherDashboardPage teacherDashboardPage;
    private final WebDriver driver;

    public ReviewSteps(TestContext context){
        this.context = context;
        driver= context.getDriver();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        dailyActivityPage = PageFactoryManager.getdailyActivityPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
    }

    @Then("^verify Nudge (appears|not appears) when user navigates from review section page$")
    public void verifyNudgeAppearsWhenUserNavigatesFromReviewSectionPage(String nudgeVisibility) {
        teacherDashboardPage.handleSummerLearningPopUp();
        loadDailyActivityPage();
        teacherDashboardPage.selectDownloadWorksheet();
        Assert.assertFalse(teacherDashboardPage.isNudgeAppearing(), "Nudge is appearing");
//        if(nudgeVisibility.equalsIgnoreCase("appears"))
//            Assert.assertTrue(teacherDashboardPage.isNudgeAppearing(), "Nudge is not appearing");
//        else if(nudgeVisibility.equalsIgnoreCase("not appears"))
//            Assert.assertFalse(teacherDashboardPage.isNudgeAppearing(), "Nudge is appearing");
//        else
//            Assert.fail("Invalid option " + nudgeVisibility);

    }

    public void loadDailyActivityPage(){
        dailyActivityPage.loadDailyActivityPage(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId());
    }
}
