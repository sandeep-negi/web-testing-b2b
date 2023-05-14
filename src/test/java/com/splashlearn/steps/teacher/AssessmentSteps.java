package com.splashlearn.steps.teacher;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.pojo.klassassessment.AssessmentInfo;
import com.splashlearn.custom.api.operations.AssessmentApi;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.domainobjects.AssessmentDetails;
import com.splashlearn.pageobjects.AssessmentPage;
import com.splashlearn.pageobjects.PageFactoryManager;
import com.splashlearn.pageobjects.TeacherDashboardPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.Map;

import static com.splashlearn.constants.SplashLearnConstants.SHORT_TIMEOUT;
import static com.splashlearn.core.selenium.SeleniumActions.*;
import static com.splashlearn.core.selenium.SeleniumActions.text;

public class AssessmentSteps {
    private final WebDriver driver;
    private AssessmentPage assessmentPage;
    private TeacherDashboardPage teacherDashboardPage;
    private TestContext context;
    private final DomainObjectContext domainObjectContext;

    public AssessmentSteps(TestContext context) {
        this.context = context;
        this.domainObjectContext = context.getDomainObjectContext();
        driver = context.getDriver();
        assessmentPage = PageFactoryManager.getAssessmentPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(context.getDriver());
    }

    @And("^user (creates|deletes) the assessment$")
    public void user_selects_the_assessment_having_details(String action) {
        context.cookies.injectCookiesToBrowser(driver);
        teacherDashboardPage.handleSpringboardPopUp();
        teacherDashboardPage.handleSummerLearningPopUp();
        if (action.equalsIgnoreCase("creates")) {
            assessmentPage.loadNewAssessment(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                            domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId());
            assessmentPage.createAssessmentFromUI(domainObjectContext.getAssessmentDetails().getAssessmentName()).clickOkBtn();
            assessmentPage.loadTrackAssessment(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                    domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId());
        } else if (action.equalsIgnoreCase("deletes")) {
            assessmentPage.loadTrackAssessment(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                    domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId());
            assessmentPage.clickSeeReports(domainObjectContext.getAssessmentDetails().getAssessmentName());
            assessmentPage.clickCompleteAssessmentBtn();
            assessmentPage.clickOkBtn();
        } else {
            Assert.fail("Invalid action" + action);
        }
    }

    @And("^user (creates|deletes) the assessment using api having details :$")
    public void userCreatesTheAssessmentUsingApiHavingDetails(String action, AssessmentDetails assessmentDetails) throws JsonProcessingException {
        domainObjectContext.setAssessmentDetails(assessmentDetails);
        TeacherDashboardApi teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        String token = teacherDashboardApi.getCsrfToken(teacherDashboardApi.visitTeacherDashboard(context.sessionId));

        AssessmentApi assessmentApi = new AssessmentApi(context.cookies.getCookies());
        if (action.equalsIgnoreCase("creates")) {
            deleteOngoingAssessment(assessmentApi, context, token);
            assessmentApi.createAssessment(domainObjectContext.getAssessmentDetails(), context.sessionId);
        } else if (action.equalsIgnoreCase("deletes")) {
            deleteOngoingAssessment(assessmentApi, context, token);
        } else {
            Assert.fail("Invalid action " + action);
        }
    }

    @Then("^the assessment should (not|be) visible on user track assessment page$")
    public void theAssessmentShouldNotVisibleOnTrackAssessmentPage(String action) {
        if (action.equalsIgnoreCase("not")) {
            Assert.assertFalse(assessmentPage.isAssessmentVisible(domainObjectContext.getAssessmentDetails().getAssessmentName()), "Assessment Visible on Track Assignment Page");
        } else if (action.equalsIgnoreCase("be")) {
            Assert.assertTrue(assessmentPage.isAssessmentVisible(domainObjectContext.getAssessmentDetails().getAssessmentName()), "Assessment not Visible on Track Assignment Page");
        }

    }

    private void deleteOngoingAssessment(AssessmentApi assessmentApi, TestContext context, String token) throws JsonProcessingException {
        Response assessmentStatus = assessmentApi.getAssessmentStatus(domainObjectContext.getAssessmentDetails(), context.sessionId);
        ObjectMapper mapper = new ObjectMapper();
        AssessmentInfo assessmentInfo = mapper.readValue(assessmentStatus.body().asString(), AssessmentInfo.class);

        if (assessmentInfo.getOngoing().size() != 0) {
            for (int i = 0; i < assessmentInfo.getOngoing().size(); i++) {
                if (assessmentInfo.getOngoing().get(i).getTitle().equalsIgnoreCase(domainObjectContext.getAssessmentDetails().getAssessmentName())) {
                    assessmentApi.deleteAssessment(domainObjectContext.getAssessmentDetails(),
                            assessmentInfo.getOngoing().get(i).getId(),
                            context.sessionId);
                    break;
                }
            }
        }
    }

    @And("^the user clicks on (no|yes) option on complete assessment pop up$")
    public void theUserClicksOnNoOptionOnCompleteAssessmentPopUp(String action) {
        if (action.equalsIgnoreCase("yes")) {
            assessmentPage.clickSeeReports(domainObjectContext.getAssessmentDetails().getAssessmentName());
            assessmentPage.clickCompleteAssessmentBtn();
            assessmentPage.clickOkBtn();
        } else if (action.equalsIgnoreCase("no")) {
            assessmentPage.clickSeeReports(domainObjectContext.getAssessmentDetails().getAssessmentName());
            assessmentPage. clickCompleteAssessmentBtn();
            assessmentPage.clickNoBtn();
            assessmentPage.visitBackToAssessment();
        } else
            Assert.fail("Invalid action passed " + action);
    }
}
