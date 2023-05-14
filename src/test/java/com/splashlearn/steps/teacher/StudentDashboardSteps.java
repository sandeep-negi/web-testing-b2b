package com.splashlearn.steps.teacher;

import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.custom.api.endpoints.StudentEndPoint;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.pojo.Users;
import com.splashlearn.custom.api.operations.LoginApi;
import com.splashlearn.dao.UserDAO;
import com.splashlearn.domainobjects.StudentLoginDetails;
import com.splashlearn.pageobjects.*;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;
import static com.splashlearn.core.selenium.SeleniumActions.sleep;

public class StudentDashboardSteps {
    private WebDriver driver;
    private final StudentDashboardPage studentDashboardPage;
    private final StudentCentrePage studentCentrePage;
    private final TeacherDashboardPage teacherDashboardPage;
    private final LoginPage loginPage;
    private final TestContext context;
    private final DomainObjectContext domainObjectContext;
    private final Map<String, String> data;
    private final Evaluator evaluator = new Evaluator();

    public StudentDashboardSteps(TestContext context) {
        this.context = context;
        this.domainObjectContext = context.getDomainObjectContext();
        this.data = context.getData();
        driver = context.getDriver();
        studentDashboardPage = PageFactoryManager.getStudentDashboardPage(driver);
        studentCentrePage = PageFactoryManager.getStudentCentrePage(driver);
        loginPage = PageFactoryManager.getLoginPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
    }

    @Then("^the assessment should (not|be) visible on student dashboard$")
    public void theAssessmentShouldNotVisibleOnStudentDashboard(String action) {
        if ((domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme() == null)
                || (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme().equalsIgnoreCase("Topics_Out_Off"))) {
            studentDashboardPage.selectMyToDos();
        } else if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme().equalsIgnoreCase("Topics_Out_On_DRS")) {
            studentDashboardPage.loadMyToDosPage();
        } else {
            Assert.fail("Unknown StudentDashboard Visible " + domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme());
        }

        if (action.equalsIgnoreCase("not")) {
            Assert.assertFalse(studentDashboardPage.assessmentNotVisible(domainObjectContext.getAssessmentDetails().getAssessmentName()), "Assessment is visible on student dashboard");
        } else if (action.equalsIgnoreCase("be")) {
            Assert.assertTrue(studentDashboardPage.assessmentVisible(domainObjectContext.getAssessmentDetails().getAssessmentName()), "Assessment not visible on student dashboard");
        }
        studentDashboardPage.loadUrl(StudentEndPoint.SIGN_OUT);
    }

    @When("the students login on their dashboard using klasscode :")
    public void theStudentsLoginOnTheirDashboard(List<StudentLoginDetails> studentLoginDetails) {
        for (StudentLoginDetails studentLoginDetail : studentLoginDetails) {
            loginPage.loadUrl("student");
            studentLoginViaClassCode(studentLoginDetail.getStudentName());
            studentDashboardPage.loadUrl(StudentEndPoint.SIGN_OUT);
        }
    }

    @When("the students login on their dashboard using api :")
    public void theStudentsLoginOnTheirDashboardUsingApi(List<StudentLoginDetails> studentLoginDetails) {
        for (StudentLoginDetails student : studentLoginDetails) {
            doLogin(student.getStudentId(), student.getStudentPassword());
        }
    }

    @And("^(math|reading) assignment should be marked as completed on student dashboard section$")
    public void assignment_should_be_marked_as_completed_on_student_dashboard_section(String subject) {
        verifyAssignmentCompletionOnStudentDashboard(subject);
    }

    public void verifyAssignmentCompletionOnStudentDashboard(String subject) {
        if (!studentDashboardPage.isUserOnStudentDashboard()) {
            teacherDashboardPage.loadUrl(TeacherEndPoint.SIGN_OUT);
            int numberOfStudents = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
            for (int i = 0; i < (numberOfStudents-1); i++) {
                loginAsStudentUsingKlassCode(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName());
                sleep(DEFAULT_TIMEOUT);
                selectSubject(subject, i);
                studentDashboardPage.verifyPlayableCompletion(evaluator.evaluate(context.getData(), context.getData().get("lo_id")));
                studentDashboardPage.loadUrl("signout");
            }
        }
    }

    private void selectSubject(String subject, int loginCount) {
        if ((domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme() == null)
                || (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme().equalsIgnoreCase("Topics_Out_Off"))) {
            System.out.println("Old Student Dashboard");
            if (subject.equalsIgnoreCase("math")){
                studentDashboardPage.
                        selectMathSubject().
                        selectAllTopicsCard().selectTopicFromOldStudentTheme(evaluator.evaluate(context.getData(), context.getData().get("topic")));
            }else if(subject.equalsIgnoreCase("reading")){
                studentDashboardPage.selectEnglishSubject().selectReadingTopicCard();
            }
        } else if (domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme().equalsIgnoreCase("Topics_Out_On_DRS")) {
            System.out.println("New Student Dashboard");
            if (subject.equalsIgnoreCase("math")) {
                if(loginCount==0){
                    studentDashboardPage.selectCurriculum();
                }
                studentDashboardPage.selectMathCurriculum();
                studentDashboardPage.selectTopic(evaluator.evaluate(context.getData(), context.getData().get("topic")));

            } else if (subject.equalsIgnoreCase("reading")) {
                if(loginCount==0){
                    studentDashboardPage.selectCurriculum();
                }
                studentDashboardPage.selectEnglishCurriculum();
                studentDashboardPage.selectTopic(evaluator.evaluate(context.getData(), context.getData().get("topic")));
            } else {
                Assert.fail("Invalid subject = " + subject);
            }
        } else {
            Assert.fail("Unknown StudentDashboard Visible " + domainObjectContext.getTeacherKlassInfo().getWebService().getAbTests().getStudentDashboardTheme());
        }
    }

    private void studentLoginViaClassCode(String studentName) {
        studentDashboardPage.enterClassCode(data.get("class_code"));
        studentCentrePage.selectStudent(studentName);
        if (data.containsKey("class_pic_password"))
            studentCentrePage.signinViaPicturePassword(data.get("pic_password"));
        else
            studentCentrePage.signinViaTextPassword(data.get("text_password"));
    }

    public void loginAsStudentUsingKlassCode(String studentName) {
        sleep(DEFAULT_TIMEOUT);
        loginPage.loadUrl("student");
        studentLoginViaClassCode(studentName);
    }


    @And("student login on his student dashboard using api")
    public void studentLoginOnHisStudentDashboardUsingApi() {
        Users user = getStudentInfo(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(0).getId());
        doLogin(user.getUserName(), user.getPlainTextPassword());
 //       loginAsStudentUsingKlassCode(domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(0).getFirstName());
    }

    private void doLogin(String studentId, String studentPassword){
        LoginApi loginApi = new LoginApi(context.cookies.getCookies());
        Response resp = loginApi.doLogin(studentId, studentPassword);
        context.sessionId = resp.getCookies().get("_session_id");
        context.cookies.setCookies(loginApi.getCookies());
        context.cookies.injectCookiesToBrowser(driver);
    }

    @Then("^verify parent pop up for (unlinked|linked) student$")
    public void verifyParentPopUpForStudentOnStudentDashboard(String userType) {
        if(userType.equalsIgnoreCase("unlinked") &&
                domainObjectContext.getTeacherKlassInfo().getSchoolService().getCountryCode().equalsIgnoreCase("US")){
                Assert.assertTrue(studentDashboardPage.isPost3PMPopUpVisible());
        }
        else if(userType.equalsIgnoreCase("unlinked") &&
                (domainObjectContext.getTeacherKlassInfo().getSchoolService().getCountryCode().equalsIgnoreCase("GB")||
                        domainObjectContext.getTeacherKlassInfo().getSchoolService().getCountryCode().equalsIgnoreCase("AU"))){
            Assert.assertFalse(studentDashboardPage.isPost3PMPopUpVisible());
        }
        else if(userType.equalsIgnoreCase("linked")) {
            Assert.assertFalse(studentDashboardPage.isPost3PMPopUpVisible());
        }else{
            Assert.fail("Invalid Student Type " + userType);
        }
    }

    private Users getStudentInfo(String studentId){
        UserDAO userDAO = new UserDAO();
        return userDAO.getStudentInfoFromDB(studentId);
    }

}
