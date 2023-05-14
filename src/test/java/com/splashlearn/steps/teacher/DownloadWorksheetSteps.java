package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.pageobjects.*;
import io.cucumber.java.en.Then;
import io.restassured.response.Response;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.Map;

import static com.splashlearn.core.selenium.SeleniumActions.click;
import static com.splashlearn.core.selenium.SeleniumActions.text;

public class DownloadWorksheetSteps {

    private HomeAccessPage homeAccessPage;
    private final TeacherDashboardPage teacherDashboardPage;
    private final TeacherSignUpPage teacherSignUpPage;
    private final DomainObjectContext domainObjectContext;
    private final WebDriver driver;
    private final Map<String, String> data;
    private final TestContext context;
    private final Evaluator evaluator = new Evaluator();
    private final Map<String, Object> customStorage;
    private final DownloadWorksheetPage downloadWorksheetPage;
    private static final Logger logger = LogManager.getLogger(HomeAccessSteps.class);

    public DownloadWorksheetSteps(TestContext context) {
        this.context = context;
        driver = context.getDriver();
        this.data = context.getData();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
        homeAccessPage = PageFactoryManager.getHomeAccessPage(driver);
        teacherSignUpPage = PageFactoryManager.getTeacherSignUpPage(driver);
        downloadWorksheetPage = PageFactoryManager.getDownloadWorksheetPage(driver);
    }

    @Then("verify user is able to download worksheet")
    public void verifyUserIsAbleToDownloadWorksheet() {
        teacherDashboardPage.handleSummerLearningPopUp();
        teacherDashboardPage.handleSpringboardPopUp();
        teacherDashboardPage.selectDownloadWorksheet();
        downloadWorksheetPage.downloadWorksheets();
        Assert.assertTrue(downloadWorksheetPage.isDownloadSuccessful(), "Worksheet downloaded successfully");
        TeacherDashboardApi teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        Response resp = teacherDashboardApi.downloadWorksheet(domainObjectContext.getTeacherKlassInfo().getWebService().getTeacher().getId(),context.getSessionId(), 5900);
        Assert.assertEquals(resp.statusCode(), 201, "Worksheet not downloaded");
        teacherDashboardPage.doSignOut();
    }
}
