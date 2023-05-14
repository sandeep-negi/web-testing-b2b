package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.api.operations.AssignmentApi;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.pageobjects.AssignmentPage;
import com.splashlearn.pageobjects.PageFactoryManager;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.Map;

public class AssignmentSteps {
    private final TestContext context ;
    private final Evaluator evaluator = new Evaluator();
    private final Map<String, Object> customStorage;
    private final DomainObjectContext domainObjectContext ;
    private final AssignmentPage assignmentPage ;
    private final WebDriver driver;

    public AssignmentSteps(TestContext context){
        this.context = context;
        driver= context.getDriver();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        assignmentPage = PageFactoryManager.getAssignmentPage(driver);
    }
    @When("^user (creates|delete) assignment for class using api$")
    public void user_assign_assignment_to_class(String action)  {
        String loId = evaluator.evaluate(context.getData(), context.getData().get("lo_id"));
        String klassId = customStorage.get("klassId").toString() ;

        switch(action){
            case "creates" :
                createAssignment(klassId, loId, context);
                break;
            case "deletes" :
                deleteAssignment();
                break;
            default:
                Assert.fail("Invalid action = " + action);
        }
    }
    private void createAssignment(String klassId, String loId, TestContext context){
        AssignmentApi assignmentApi  = new AssignmentApi(context.cookies.getCookies());
        assignmentApi.createAssignment(klassId, loId, context);
    }
    private void deleteAssignment(){
        // To Do's
    }
    @Then("^user completes (math|reading) assignment using api$")
    public void user_should_able_to_complete_assignment(String subject)  {
        completeLoPlayables(subject);
    }

    @And("assignment should be marked as completed on track Assignment page")
    public void assignment_should_marked_completed_on_teacher_dashboard(){
        String subjectName = evaluator.evaluate(context.getData(), context.getData().get("subject")).toUpperCase();
        assignmentPage.selectAssignCurriculum(subjectName).selectTrackAssignment(subjectName);
        Assert.assertEquals(assignmentPage.getStatus(evaluator.evaluate(context.getData(), context.getData().get("lo_name"))), "Completed", "Assignment not marked Completed");
    }

    private void completeLoPlayables(String klassSubject){
        AssignmentApi assignmentApi  = new AssignmentApi(context.cookies.getCookies());
        int studentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        String subject = evaluator.evaluate(context.getData(), context.getData().get("subject"));
        if(klassSubject.equalsIgnoreCase("math")){
            for(int i = 0 ; i < studentCount; i++){
                assignmentApi.completeLearningObjective(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getId(), subject);

            }
        }else if(klassSubject.equalsIgnoreCase("reading")){
            // loop needed as Reading have more playables
            for(int  i = 0 ; i < studentCount ; i ++){
                for (int j = 0; j < 4; j++) {
                    assignmentApi.completeLearningObjective(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getId(), subject);
                }
            }
        }
        else
            Assert.fail("Invalid Subject = " + subject);
    }

    @Then("^verify Nudge (appears|not appears) when user assigns 3 LOs from same group$")
    public void verifyNudgeAppearsWhenUserAssignsLOsFromSameGroup(String nudgeVisibility) {
        loadNewAssignmentPage();
        assignmentPage.selectContentGroup(evaluator.evaluate(context.getData(), context.getData().get("contentGroup")));
        String[] LONames = evaluator.evaluate(context.getData(), context.getData().get("LOs")).split(",");
        for (String loName : LONames) {
            assignmentPage.assignAssignment(evaluator.evaluate(context.getData(), context.getData().get(loName)));
        }

        Assert.assertFalse(assignmentPage.isNudgeAppearing(), "Nudge is appearing");
//        if(nudgeVisibility.equalsIgnoreCase("appears"))
//            Assert.assertTrue(assignmentPage.isNudgeAppearing(), "Nudge not appearing");
//        else if(nudgeVisibility.equalsIgnoreCase("not appears"))
//            Assert.assertFalse(assignmentPage.isNudgeAppearing(), "Nudge is appearing");
//        else
//            Assert.fail("invalid option " + nudgeVisibility);

    }

    private void loadNewAssignmentPage(){
        assignmentPage.loadNewAssignmentPage(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getSlug(),
                domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(0).getGradeId());
    }
}
