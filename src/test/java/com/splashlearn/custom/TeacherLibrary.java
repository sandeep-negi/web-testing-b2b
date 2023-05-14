package com.splashlearn.custom;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.client.FindIterable;
import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.Evaluator;
import com.splashlearn.core.PageFactory;
import com.splashlearn.custom.api.model.pojo.PricingTests;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.api.operations.TeacherAPI;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.custom.entity.operations.TeacherOperations;
import com.splashlearn.dao.UserPricingtestDAO;
import com.splashlearn.dto.UserDataDTO;
import com.splashlearn.exceptions.ElementNotFoundException;
import com.splashlearn.exceptions.InvalidLocatorException;
import com.splashlearn.selenium.RandomAppearedElements;
import com.splashlearn.steps.Hooks;
import com.splashlearn.utils.MongoHelper;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bson.Document;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.awt.*;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.Month;
import java.util.List;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.splashlearn.constants.SplashLearnConstants.*;
import static com.splashlearn.core.selenium.SeleniumActions.*;

public class TeacherLibrary {

    private static final String DELIMITER = "-";
    private static final Logger logger = LogManager.getLogger(TeacherLibrary.class);
    private final String loginPage = "login_page";
    private final String studentCentre = "student_centre_page";
    private final String studentDashboard = "student_dashboard_page";
    private final String assignmentSubPage = "assignment_sub_page";
    private final String commonPage = "common";
    private final String studentRoster = "student_roster";
    private final String teacherDashboardPage = "teacher_dashboard_page";
    private final String manageClassPage = "manage_class_page";
    private final String classProgress = "class_progress";
    private final String teacherProfile = "teacher_profile";
    private final String editPassword = "edit_password";
    private final String parentAccountDetail = "parent_account_details";
    private final String manageAllClasses = "manage_all_classes_page";
    private final String classSettingsPage = "class_settings";
    private final String addKlassStudentsPage = "add_klass_students_page";
    private final String transferKlassPage = "transfer_class_page";
    private final String parentDashboard = "parent_dashboard_page";
    private final String teacherSignup = "teacher_signup";
    private final String googleAccounts = "google_accounts";
    private final String mathFactFluency = "assign_fact_fluency_page";
    private final String downloadWorksheet = "download_worksheet_page";
    private final String parentMenuPage = "menu_page" ;
    private final String editParentEmailPage = "edit_email";
    private final int LO_NAME_MAX_SIZE = 52;
    private final int KLASS_NAME_MAX_SIZE = 14;
    private final TestContext testContext;
    private final PageFactory pageFactory;
    private final Map<String, String> data;
    private final Map<String, Object> customStorage;
    private WebDriver driver;
    private final Evaluator evaluator = new Evaluator();
    private final DomainObjectContext domainObjectContext ;


    public TeacherLibrary(TestContext testContext) {
        this.testContext = testContext;
        this.driver = testContext.getDriver();
        this.data = testContext.getData();
        this.pageFactory = new PageFactory();
        this.customStorage = testContext.getCustomStorage();
        this.domainObjectContext = testContext.getDomainObjectContext();
    }

    public void login(String user, String password) throws InvalidLocatorException, ElementNotFoundException {
        retryClicksUntilNewElementPresent(driver, pageFactory.getLocatorFor(loginPage, "parents_teacher_login"),
                pageFactory.getLocatorFor(loginPage, "login_button"));

        type(driver, pageFactory.getLocatorFor(loginPage, "user_email"), user);
        type(driver, pageFactory.getLocatorFor(loginPage, "user_password"), password);
        click(driver, pageFactory.getLocatorFor(loginPage, "login_button"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage, "enable_home_access"), LONG_TIMEOUT + DEFAULT_TIMEOUT);
        closeSpringboardPopupIfPresent();
    }

    public void googleOauthLogin(String user, String password) throws InvalidLocatorException, ElementNotFoundException {
        retryClicksUntilNewElementPresent(driver, pageFactory.getLocatorFor(loginPage, "parents_teacher_login"),
                pageFactory.getLocatorFor(loginPage, "login_button"));

        click(driver, pageFactory.getLocatorFor(loginPage, "google_signin_button"));

        type(driver, pageFactory.getLocatorFor(googleAccounts, "email"), user);
        click(driver, pageFactory.getLocatorFor(googleAccounts, "next"));

        type(driver, pageFactory.getLocatorFor(googleAccounts, "password"), password);
        click(driver, pageFactory.getLocatorFor(googleAccounts, "next"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage, "enable_home_access"), LONG_TIMEOUT + DEFAULT_TIMEOUT);
        closeSpringboardPopupIfPresent();
    }

    private void closeSpringboardPopupIfPresent() throws InvalidLocatorException, ElementNotFoundException {
        By springboardCloseButton = pageFactory.getLocatorFor(commonPage, "springboard_popup");
        if (exists(driver, springboardCloseButton, 0))
            click(driver, springboardCloseButton);

    }

    public void selectKlassFromDropDown(String klassName) {
        click(driver, By.xpath("//li/strong[@title='" + klassName + "']"));
    }


    public void createAssignment(String LOName) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, By.xpath("//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']/a[text()='Assign']"));
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "select_whole_class"));
        sleep(3);
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "close_pop_up"), DEFAULT_TIMEOUT);

    }

    public void verifyAssignedAssignment(String LOName, String assignedStudents, String assignmentStatus) throws InvalidLocatorException, ElementNotFoundException {
        if (assignmentStatus.equalsIgnoreCase("assigned")) {
            verifyText(driver, By.xpath("//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']//a[text()='Edit']/preceding-sibling::span"), assignedStudents);
        } else {
            if (exists(driver, By.xpath("//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']//span[contains(text(),'Assigned to')]"), DEFAULT_TIMEOUT)) {
                click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "left_nav_track_assignment_option"), DEFAULT_TIMEOUT);
                waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage, "go_to_student_experience"), DEFAULT_TIMEOUT);
                deleteAssignedAssignment(LOName);
                waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage, "left_nav_track_assignment_option"), DEFAULT_TIMEOUT);
                click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "left_nav_track_assignment_option"), DEFAULT_TIMEOUT);
                waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage, "go_to_student_experience"), DEFAULT_TIMEOUT);
            }
        }
    }

    public void createAssignment(String contentGroup, String LOName) {
        click(driver, By.xpath("//*[text()='Content Group']/following-sibling::*/li//*[text()='" + contentGroup + "']"));
        waitForElementVisible(driver, By.xpath("//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']/a[text()='Assign']"), MEDIUM_TIMEOUT);
        click(driver, By.xpath("//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']/a[text()='Assign']"));
    }

    public void editAssignment(String contentGroup, String LOName) throws InvalidLocatorException, ElementNotFoundException {

        if(!getAttribute(driver, By.xpath("//span[text()='"+contentGroup+"']//parent::li"),5,"class").equalsIgnoreCase("active")){
            click(driver, By.xpath("//*[text()='Content Group']/following-sibling::*/li//*[text()='" + contentGroup + "']"));
        }
        waitForElementVisible(driver, By.xpath("(//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']//a[text()='Edit'])[1]"), MEDIUM_TIMEOUT);
        click(driver, By.xpath("(//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']//a[text()='Edit'])[1]"));
    }

    public void verifyAssignedAssignmentOnStudentDashboard(String klassName, String LOName, String klassAssignment) throws InterruptedException, InvalidLocatorException, ElementNotFoundException {
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }
        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), DEFAULT_TIMEOUT);

        for (int i = 1; i <= listOfStudents.size(); i++) {
            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }

            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            sleep(3);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), SHORT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (klassAssignment.equalsIgnoreCase("assigned")) {
                if (LOName.equalsIgnoreCase("Fact practice")) {
                    Assert.assertTrue(verifyMFFAssignmentExists(LOName));
                } else {
                    verifyText(driver, By.xpath("//div[@class='my-to-do-container']//li//div[text()='" + LOName + "']"), LOName);
                }
            } else if (klassAssignment.equalsIgnoreCase("notAssigned")) {
                if (LOName.equalsIgnoreCase("Fact practice")) {
                    Assert.assertFalse(verifyMFFAssignmentExists(LOName));
                } else {
                    Assert.assertFalse(exists(driver, By.xpath("//div[@class='my-to-do-container']//li//div[text()='" + LOName + "']"), SHORT_TIMEOUT));
                }
            }

            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), SHORT_TIMEOUT);
            sleep(5);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);

            Thread.sleep(2000);
        }
    }

    public void verifyCurrentPracticeDayOnStudentDashboard(String klassName, String LOName, String klassAssignment) throws InterruptedException, InvalidLocatorException, ElementNotFoundException {
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }
        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), DEFAULT_TIMEOUT);

        for (int i = 1; i <= listOfStudents.size(); i++) {
            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }

            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            sleep(3);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), SHORT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (klassAssignment.equalsIgnoreCase("assigned today")) {
                Assert.assertTrue(verifyMFFAssignmentExists(LOName));
                Assert.assertTrue(exists(driver, pageFactory.getLocatorFor(studentDashboard, "assigned_practice_card_today"), 5), "Assigned MFF Practice card not visible for Today");
            } else if (klassAssignment.equalsIgnoreCase("not assigned today")) {
                Assert.assertFalse(verifyMFFAssignmentExists(LOName));
                Assert.assertFalse(exists(driver, pageFactory.getLocatorFor(studentDashboard, "assigned_practice_card_today"), 5), "Assigned MFF Practice card visible for Today");
            }

            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), SHORT_TIMEOUT);
            sleep(5);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);

            Thread.sleep(2000);
        }
    }

    public void verifyCurrentMathFactPracticeDay(String klassName, String LOName, String practiceDay) throws InterruptedException, InvalidLocatorException, ElementNotFoundException {
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }
        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), DEFAULT_TIMEOUT);

        for (int i = 1; i <= listOfStudents.size(); i++) {
            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }

            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            sleep(3);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), SHORT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (practiceDay.equalsIgnoreCase("assigned today")) {
                Assert.assertTrue(verifyMFFAssignmentExists(LOName));
                Assert.assertTrue(exists(driver, pageFactory.getLocatorFor(studentDashboard, "assigned_practice_card_today"), 5), "Assigned MFF Practice card not visible for Today");
            } else if (practiceDay.equalsIgnoreCase("notPracticeDayToday")) {
                Assert.assertFalse(exists(driver, pageFactory.getLocatorFor(studentDashboard, "assigned_practice_card_today"), 5), "Assigned MFF Practice card visible for Today");
                Assert.assertEquals(text(driver, By.xpath("//div[@class='text-container']/div[1]"), 5), "No fact practice for today!");
                Assert.assertEquals(text(driver, By.xpath("//div[@class='text-container']/div[2]"), 5), "Comeback on " + customStorage.get("practice day") + " to unlock your numeras!");
            } else {
                Assert.fail("Please provide correct practice day");
            }

            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), SHORT_TIMEOUT);
            sleep(5);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);

            Thread.sleep(2000);
        }
    }


    public void verifyAssignedAssignmentOnStudentDashboardHavingSubject(String klassName, String subject, String LOName, String klassAssignment) throws InterruptedException, InvalidLocatorException, ElementNotFoundException {
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }
        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), 10);

        int count = 0;
        for (int i = 1; i <= listOfStudents.size(); i++) {
            count++;
            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }

            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));

            waitForElement(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), 10);

            if (count == 1 && subjectToggleExists() && !driver.getCurrentUrl().contains(subject.toLowerCase()))
                toggleSubject(subject);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), 5);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (klassAssignment.equalsIgnoreCase("assigned"))
                verifyText(driver, By.xpath("//div[@class='my-to-do-container']//li//div[text()='" + LOName + "']"), LOName, LONG_TIMEOUT);
            else if (klassAssignment.equalsIgnoreCase("notAssigned"))
                Assert.assertFalse(exists(driver, By.xpath("//div[@class='my-to-do-container']//li//div[text()='" + LOName + "']"), 5));

            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), 5);
            sleep(5);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), 5);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), 10);
            Thread.sleep(2000);
        }
    }


    public boolean subjectToggleExists() throws InvalidLocatorException, ElementNotFoundException {
        return exists(driver, pageFactory.getLocatorFor(studentDashboard, "subject_toggle"), 10);
    }

    public void selectSubject(String subject) throws InvalidLocatorException, ElementNotFoundException {
        String value;
        if (subject.equalsIgnoreCase("reading") || subject.equalsIgnoreCase("ela")) {
            value = getAttribute(driver, pageFactory.getLocatorFor(studentDashboard, "reading_subject"), 10, "class").split(" ")[1];
            if (value.equalsIgnoreCase("tlTYV")) {
                click(driver, pageFactory.getLocatorFor(studentDashboard, "reading_subject"));
            }
        } else if (subject.equalsIgnoreCase("math") || subject.equalsIgnoreCase("maths")) {
            value = getAttribute(driver, pageFactory.getLocatorFor(studentDashboard, "math_subject"), 10, "class").split(" ")[1];
            if (value.equalsIgnoreCase("jfuhbA")) {
                click(driver, pageFactory.getLocatorFor(studentDashboard, "math_subject"));
            }
        } else {
            Assert.fail("Invalid " + subject + " entered");
        }
    }

    public void deleteAssignedAssignment(String LOName) throws InvalidLocatorException, ElementNotFoundException {
        // String actualLOname = LOName.length() > 25 ? LOName.substring(0, 25) + "..." : LOName;
        click(driver, By.xpath("//div[@class='assignment-section']//h3[contains(text(),'" + LOName + "')]/parent::div[@class='assignment-card']"));
        waitForElement(driver, pageFactory.getLocatorFor(assignmentSubPage, "delete_icon"), DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "delete_icon"));
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "confirm_delete_assignment"), DEFAULT_TIMEOUT);
    }


    public void verifyStudentsInKlass(String studentNames) throws InvalidLocatorException, ElementNotFoundException {

        List<String> verifyStudentsList = Arrays.asList(studentNames.split(","))
                .stream().map(String::trim).collect(Collectors.toList());
        List<String> allStudents = findElements(driver, pageFactory.getLocatorFor(studentRoster, "all_student_names"), DEFAULT_TIMEOUT).
                stream().map(WebElement::getText).collect(Collectors.toList());
        Assert.assertTrue(allStudents.containsAll(verifyStudentsList));

    }


    public void verifyNewAddedKlass(String klassName) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "view_klasses_list"), SHORT_TIMEOUT);
        verifyText(driver, By.xpath("//li/strong[@title='" + klassName + "']"), klassName);
    }

    public void deleteAddedKlass(String klassName) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "profile"), SHORT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "manage_all_class"), SHORT_TIMEOUT);
        waitForElement(driver, pageFactory.getLocatorFor(manageAllClasses, "add_new_class"), DEFAULT_TIMEOUT);
        click(driver, By.xpath("//span[@title='" + klassName + "' or @title='" + klassName.toLowerCase() + "']//parent::td//following-sibling::td[@class='actions']//a[@class='ia-user-actions delete-class-action']"));
        type(driver, pageFactory.getLocatorFor(manageAllClasses, "enter_text_delete"), "delete");
        click(driver, pageFactory.getLocatorFor(manageAllClasses, "permanent_delete_class"));
        waitForSpinner(driver);
    }

    public void verifyStudentDashboard() throws InvalidLocatorException, ElementNotFoundException {
        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), DEFAULT_TIMEOUT);

        for (int i = 1; i <= listOfStudents.size(); i++) {
            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            exists(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), DEFAULT_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);
        }
    }

    public void selectUserActionForAssignment(String LOName, String action) {
        // String actualLOname = LOName.length() > 25 ? LOName.substring(0, 25) + "..." : LOName;
        click(driver, By.xpath("//div[@class='assignment-section']//h3[text()='" + LOName + "']/parent::div[@class='assignment-card']/preceding-sibling::div"));
        click(driver, By.xpath("//div[@class='assignment-section']//h3[text()='" + LOName + "']/parent::div[@class='assignment-card']/preceding-sibling::div//li[text()='" + action + "']"));
    }

    public void confirmUserActionToDeleteAssignment(String userConfirmation) throws InterruptedException {
        click(driver, By.xpath("//div[@class='common-confirmation-popup-footer']//span[text()='" + userConfirmation + "']"));
        Thread.sleep(5000);
    }

    public void verifyUnAssignedLOText(String LOName, String assignmentStatus) {
        sleep(3);
        verifyText(driver, By.xpath("//span[text()='" + LOName + "']/ancestor::label/following-sibling::div[@class='assign-status']/a[text()='" + assignmentStatus + "']"), assignmentStatus);
    }

    public void createAssessment(String assessmentName) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        click(driver, By.xpath("//h6[text()='" + assessmentName + "']/parent::div/following-sibling::p/following-sibling::span[text()='Assess']"));
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "assessment_creation_ok"), SHORT_TIMEOUT);
        Thread.sleep(5000);
    }

    public void verifyAssignedAssessmentOnTeacherDashboard(String assessmentName, String assignmentStatus) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        if (assignmentStatus.equalsIgnoreCase("assigned")) {
            verifyText(driver, By.xpath("//h4[text()='Ongoing Assessments']/following-sibling::div//h6[text()='" + assessmentName + "']"), assessmentName);
        } else {
            if (exists(driver, By.xpath("//h4[text()='Ongoing Assessments']/following-sibling::div//h6[text()='" + assessmentName + "']"), DEFAULT_TIMEOUT)) {
                deleteAssignedAssessment(assessmentName);
            }
        }
    }

    public void verifyAssignedAssessmentOnStudentDashboard(String klassName, String assessmentName, String klassAssessment) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }

        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), DEFAULT_TIMEOUT);

        for (int i = 1; i <= listOfStudents.size(); i++) {
            if (exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName + "']"));
                waitForSpinner(driver);
            }
            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));
            waitForElement(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), DEFAULT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"), LONG_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), SHORT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (klassAssessment.equalsIgnoreCase("assigned")) {
                verifyText(driver, By.xpath("//ul[@class='to-do-wrapper']//span[text()='Assessment']//following-sibling::div[1]/p[text()='" + assessmentName + "']"), assessmentName);
            } else if (klassAssessment.equalsIgnoreCase("notAssigned")) {
                Assert.assertFalse(exists(driver, By.xpath("//ul[@class='to-do-wrapper']//span[text()='Assessment']//following-sibling::div[1]/p[text()='" + assessmentName + "']"), SHORT_TIMEOUT));
            }
            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), DEFAULT_TIMEOUT);
            fireClickEvent(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);

            Thread.sleep(2000);
        }
    }

    public void deleteAssignedAssessment(String assessmentName) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        click(driver, By.xpath("//h4[text()='Ongoing Assessments']/following-sibling::div//h6[text()='" + assessmentName + "']/following-sibling::ul/li[text()='See reports']"));
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "complete_assessment"));
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "confirmCompleteAssessmentYes"));
        Thread.sleep(2000);
    }

    public void confirmUserActionToDeleteAssessment(String assessmentName, String action) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        click(driver, By.xpath("//h4[text()='Ongoing Assessments']/following-sibling::div//h6[text()='" + assessmentName + "']/following-sibling::ul/li[text()='See reports']"));
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "complete_assessment"));
        if (action.equalsIgnoreCase("Yes")) {
            click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "confirmCompleteAssessmentYes"));
        } else if (action.equalsIgnoreCase("No")) {
            click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "confirmCompleteAssessmentNo"));
        } else {
            Assert.fail("Passed invalid action " + action);
        }
        Thread.sleep(2000);
    }


    public void selectFromLeftNav(String Subject, String menu, String subMenu) {
        String menuLocator = "(//*[text()='" + Subject + "']/following-sibling::*//*[text()='" + menu + "'])[1]";
        String subMenuLocator = menuLocator + "/ancestor::li//*[text()='" + subMenu + "']";
        waitForSpinner(driver);
        List<WebElement> menuExpanded = driver.findElements(
                By.xpath("(//*[text()='" + Subject + "']/following-sibling::*//*[text()='" + menu + "'])[1]" +
                        "/ancestor::*[contains(@class,'expanded')]"));
        if (menuExpanded.isEmpty()) {
            waitForElementClickable(driver, By.xpath(menuLocator), LONG_TIMEOUT);
            click(driver, By.xpath(menuLocator));
        }
        waitForSpinner(driver);
        waitForElementVisible(driver, By.xpath(subMenuLocator), LONG_TIMEOUT);
        click(driver, By.xpath(subMenuLocator));
        waitForSpinner(driver);
    }

    public void assignmentToSelectedStudents(String studentNames) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {

        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        students.forEach(student -> {
            String nameInCaps = WordUtils.capitalize(student, new char[]{' '});
            String nameInLowercase = student.toLowerCase();
            By studentCheckBox = By.xpath("//label[text()='" + nameInCaps + "']/preceding-sibling::input | //label[text()='" + nameInLowercase + "']/preceding-sibling::input");
            if (!findElement(driver, studentCheckBox, SHORT_TIMEOUT).isSelected()) {
                click(driver, By.xpath("//label[text()='" + nameInCaps + "'] | //label[text()='" + nameInLowercase + "']"), SHORT_TIMEOUT);
            }
        });
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "assign_button"), SHORT_TIMEOUT);
        waitForSpinner(driver);
        Thread.sleep(4000);
        waitForSpinner(driver);

    }

    public void cancelAssignmentForSelectedStudents(String studentNames) throws InvalidLocatorException, ElementNotFoundException {
        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        students.forEach(student -> {
            By studentCheckBox = By.xpath("//label[text()='" + student + "']/preceding-sibling::input");
            if (findElement(driver, studentCheckBox, SHORT_TIMEOUT).isSelected()) {
                click(driver, By.xpath("//label[text()='" + student + "']"), SHORT_TIMEOUT);
            }
        });
        try {
            click(driver, pageFactory.getLocatorFor(assignmentSubPage, "assign_button"), SHORT_TIMEOUT);
        } catch (TimeoutException te) {
            logger.debug(te);
            logger.debug("Closing the popup as Assign button is disabled");
            closePopupIfPresent();
        }

    }

    public void clickOnAssignToSelectedStudents() throws InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(assignmentSubPage, "selected_students"), SHORT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "selected_students"), MEDIUM_TIMEOUT);
    }

    public void verifyAssignmentForSelectedStudents(String studentNames) throws InvalidLocatorException, ElementNotFoundException {

        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        int totalSelectedStudentsCount = getAlreadySelectedStudents() + students.size();

        Assert.assertEquals(text(driver, pageFactory.getLocatorFor(assignmentSubPage, "selected_students_msg"), DEFAULT_TIMEOUT), "Assigned to " + totalSelectedStudentsCount + " student(s)");
        students.forEach(student -> {
            String nameInCaps = WordUtils.capitalize(student, new char[]{' '});
            By studentCheckBox = By.xpath("//label[text()='" + nameInCaps + "']/preceding-sibling::input");
            Assert.assertTrue(findElement(driver, studentCheckBox, SHORT_TIMEOUT).isSelected());
        });
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "assign_button"), SHORT_TIMEOUT);
    }

    private int getAlreadySelectedStudents() {
        int alreadySelectedStudents = (int) data.entrySet().stream()
                .filter(x -> x.getKey().startsWith("selected_student"))
                .count();
        return alreadySelectedStudents;
    }


    public void closePopupIfPresent() throws InvalidLocatorException, ElementNotFoundException {
        waitForSpinner(driver);
        waitForElementVisible(driver, pageFactory.getLocatorFor(commonPage,"close_popup"),10);
        List<WebElement> close_btn = driver.findElements(pageFactory.getLocatorFor(commonPage, "close_popup"));
        if (!close_btn.isEmpty()) {
            try {
                close_btn.get(0).click();
            } catch (ElementNotInteractableException e) {
                clickByAction(driver, pageFactory.getLocatorFor(commonPage, "close_popup"), 2);
            }
            waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage,"go_to_student_experience"),2);
        }

    }

    public void closeMathFactPopupIfPresent() throws InvalidLocatorException, ElementNotFoundException {
        waitForSpinner(driver);
        waitForElementVisible(driver, pageFactory.getLocatorFor(commonPage,"successful_pop_up_modal"),10);
        List<WebElement> close_btn = driver.findElements(pageFactory.getLocatorFor(commonPage, "close_math_fact_popup"));
        if (!close_btn.isEmpty()) {
            try {
                close_btn.get(0).click();
            } catch (ElementNotInteractableException e) {
                clickByAction(driver, pageFactory.getLocatorFor(commonPage, "close_math_fact_popup"), 2);
            }
            waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage,"go_to_student_experience"),2);
        }

    }

    public void closeStudentLoginInstructionModal() throws InvalidLocatorException, ElementNotFoundException {
        sleep(3);
        if(exists(driver, pageFactory.getLocatorFor(teacherDashboardPage,"student_Login_Instruction_Modal"),5)){
            click(driver,pageFactory.getLocatorFor(teacherDashboardPage,"close_student_Login_Instruction_Modal"));
        }
        waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage,"go_to_student_experience"),2);
    }
    public void closeSpringboardModal() throws InvalidLocatorException, ElementNotFoundException {
        waitForSpinner(driver);
        if(exists(driver, pageFactory.getLocatorFor(teacherDashboardPage,"springboardModal"),5)){
            click(driver,pageFactory.getLocatorFor(teacherDashboardPage,"closeSpringboardEnrolPoUp"));
        }
    }
    public void closeSummerLearningPopUp() throws InvalidLocatorException, ElementNotFoundException {
        waitForSpinner(driver);
        if(exists(driver, pageFactory.getLocatorFor(teacherDashboardPage,"summerLearningPopUp"),5)){
            click(driver,pageFactory.getLocatorFor(teacherDashboardPage,"closeSummerLearningPopUp"));
        }
    }
    public void closeSplashlearnCommunityModal() throws InvalidLocatorException, ElementNotFoundException {
        if(exists(driver, pageFactory.getLocatorFor(teacherDashboardPage,"splashlearnCommunityModal"),5)){
            click(driver,pageFactory.getLocatorFor(teacherDashboardPage,"closeSplashlearnCommunityModal"));
        }
    }



    public void selectFromAssignmentCardMenu(String LOName, String assignmentAction) throws InvalidLocatorException, ElementNotFoundException {

        if (LOName.length() > LO_NAME_MAX_SIZE)
            LOName = LOName.substring(0, LO_NAME_MAX_SIZE - 3) + "...";

        waitForElementVisible(driver, By.xpath("//*[contains(text(),'" + LOName + "')]/parent::*/preceding-sibling::*//i[@class='iconcust-iconMore']"), 10);
        click(driver, By.xpath("//*[contains(text(),'" + LOName + "')]/parent::*/preceding-sibling::*//i[@class='iconcust-iconMore']"));
        click(driver, By.xpath("//*[contains(text(),'" + LOName + "')]/parent::*/preceding-sibling::*//i[@class='iconcust-iconMore']//following-sibling::ul//li[text()='" + assignmentAction + "']"));
        waitForSpinner(driver);
        if (assignmentAction.equals("Mark as complete")) {
            waitForElementVisible(driver, pageFactory.getLocatorFor(commonPage, "complete_assignment_yes"), SHORT_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(commonPage, "complete_assignment_yes"));
        }
        waitForSpinner(driver);
    }

    public void createAssignmentForSelectedStudentsFromGridView(String contentGroup, String LOName, String studentNames) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {

        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        waitForSpinner(driver);
        waitForGridViewContentToLoad();
        expandContentGroupInClassProgress(contentGroup);
        List<String> studentNamesInOrder = findElements(driver, pageFactory.getLocatorFor(classProgress, "students_list"), SHORT_TIMEOUT).
                stream().map(s -> s.getText().toLowerCase()).collect(Collectors.toList());

        students.forEach(student -> {
            if (!studentNamesInOrder.contains(student))
                return;
            try {
                waitForGridViewContentToLoad();
            } catch (InvalidLocatorException | ElementNotFoundException e) {
                e.printStackTrace();
            }
            By isAssigned = By.xpath("//*[@title='" + LOName + "']/following-sibling::*//ul[contains(@class,'students-data')]/li[" + studentNamesInOrder.indexOf(student) + "]//*[@class='on-hover']");
            By assignToStudentButton = By.xpath("//*[@title='" + LOName + "']/following-sibling::*//ul[contains(@class,'students-data')]/li[" + studentNamesInOrder.indexOf(student) + "]");

            if (getAttribute(driver, isAssigned, MEDIUM_TIMEOUT, "innerText").equalsIgnoreCase("assign")) {
                try {
                    waitForSpinner(driver);
                    waitForElementVisible(driver, assignToStudentButton, DEFAULT_TIMEOUT);
                    waitForElementClickable(driver, assignToStudentButton, DEFAULT_TIMEOUT);
                    click(driver, assignToStudentButton);
                    waitForSpinner(driver);
                    ExpectedCondition<Boolean> assignmentModalIsOpened = d -> {
                        try {
                            List<WebElement> assignSection = d.findElements(pageFactory.getLocatorFor(classProgress, "assignment_section"));
                            if (assignSection.isEmpty() && !assignSection.get(0).isDisplayed()) {
                                click(d, assignToStudentButton);
                                return false;
                            }
                        } catch (InvalidLocatorException | ElementNotFoundException e) {
                            e.printStackTrace();
                            Assert.fail();
                        }
                        return true;
                    };
                    new WebDriverWait(driver, Duration.ofSeconds(15)).until(assignmentModalIsOpened);
//                    retryUntilTrue(driver, 15, assignmentModalIsOpened);
                    click(driver, assignToStudentButton);
                    waitForSpinner(driver);
                    click(driver, pageFactory.getLocatorFor(classProgress, "assignment_section_selected_student"));
                    waitForSpinner(driver, 15);
                    closePopupIfPresent();
                    sleep(4);
                } catch (InvalidLocatorException | ElementNotFoundException e) {
                    e.printStackTrace();
                    Assert.fail();
                }
            }
        });
        Thread.sleep(3000);
        waitForSpinner(driver, 15);
    }


    public void createAssignmentForGroupOfStudentsFromGridView(String contentGroup, String LOName) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        waitForSpinner(driver);
        waitForGridViewContentToLoad();
        expandContentGroupInClassProgress(contentGroup);
        By isAssigned = By.xpath("//*[@title='" + LOName + "']/following-sibling::*//ul[contains(@class,'students-data')]/li[1]//*[@class='on-hover']");
        By assignToStudentButton = By.xpath("//*[@title='" + LOName + "']/following-sibling::*//ul[contains(@class,'students-data')]/li[1]");

        if (getAttribute(driver, isAssigned, SHORT_TIMEOUT, "innerText").equalsIgnoreCase("assign")) {
            try {
                waitForSpinner(driver);
                waitForElementVisible(driver, assignToStudentButton, SHORT_TIMEOUT);
                waitForElementClickable(driver, assignToStudentButton, SHORT_TIMEOUT);
                click(driver, assignToStudentButton);
                waitForSpinner(driver);
                click(driver, pageFactory.getLocatorFor(classProgress, "assignment_section_group_of_students"));
                waitForSpinner(driver);
                waitForElementClickable(driver, pageFactory.getLocatorFor(classProgress, "select_all_checkbox_grid"), SHORT_TIMEOUT);
                click(driver, pageFactory.getLocatorFor(classProgress, "select_all_checkbox_grid"));
                click(driver, pageFactory.getLocatorFor(classProgress, "assign_button_grid"));
                waitForSpinner(driver);
            } catch (InvalidLocatorException | ElementNotFoundException e) {
                e.printStackTrace();
                Assert.fail();
            }
        }
        Thread.sleep(3000);
        waitForSpinner(driver);
        closePopupIfPresent();
    }

    public void waitForGroupViewContentToLoad() throws InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(classProgress, "group_view_left_container"));
        waitForNoElement(driver, pageFactory.getLocatorFor(classProgress, "group_view_right_container_invisiblity"), TEMP_TIMEOUT);
    }

    public void waitForGridViewContentToLoad() throws InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(classProgress, "grid_view_component"));
    }

    public void selectGroupViewFromReportOption() throws InvalidLocatorException, ElementNotFoundException {
        waitForGridViewContentToLoad();
        click(driver, pageFactory.getLocatorFor(classProgress, "report_view_dropdown"));
        click(driver, pageFactory.getLocatorFor(classProgress, "report_view_group"));
        waitForGroupViewContentToLoad();
    }

    public void createAssignmentForWholeClassFromGroupView(String contentGroup, String standardName, String LOName) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        waitForSpinner(driver);
        By contentGroupLocator = By.xpath("//*[@class='left-menu']//*[text()='" + contentGroup + "']/parent::li");
        By standardNameLocatorIsSelected = By.xpath("//*[text()='" + standardName + "']/ancestor::li/input");
        By standardNameLocator = By.xpath("//*[text()='" + standardName + "']/ancestor::li");
        By assignLOButton = By.xpath("//*[contains(text(),'" + LOName + "')]/following-sibling::button[@class='assign-btn']");
        expandContentGroupInGroupView(contentGroupLocator);
        expandStandardInGroupView(standardNameLocatorIsSelected, standardNameLocator);

        waitForElementVisible(driver, assignLOButton, MEDIUM_TIMEOUT);
        waitForSpinner(driver);
        click(driver, assignLOButton);

        waitForElementVisible(driver, pageFactory.getLocatorFor(classProgress, "assign_button_group"), DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(classProgress, "whole_class_radio_grp"));
//        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "whole_class"));
        click(driver, pageFactory.getLocatorFor(classProgress, "assign_button_group"), 2);
        waitForSpinner(driver);
        Thread.sleep(4000);
        waitForSpinner(driver);
        closePopupIfPresent();

    }

    private void expandStandardInGroupView(By standardNameLocatorIsSelected, By standardNameLocator) throws InvalidLocatorException, ElementNotFoundException {
        By fallbackComponents = pageFactory.getLocatorFor(
                PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "fallback_components");
        new RandomAppearedElements().waitForFallbackComponentsToLoad(driver, fallbackComponents);
        if (!findElement(driver, standardNameLocatorIsSelected, LONG_TIMEOUT).isSelected()) {
            click(driver, standardNameLocator);
            waitForSpinner(driver);
        }
    }

    private void expandContentGroupInGroupView(By contentGroupLocator) throws InvalidLocatorException, ElementNotFoundException {
        By fallbackComponents = pageFactory.getLocatorFor(
                PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "fallback_components");
        new RandomAppearedElements().waitForFallbackComponentsToLoad(driver, fallbackComponents);
        if (!getAttribute(driver, contentGroupLocator, LONG_TIMEOUT, "class").equals("active")) {
            click(driver, contentGroupLocator);
            waitForSpinner(driver);
            sleep(4);
        }
    }

    public void createAssignmentForSelectedStudentsFromGroupView(String contentGroup, String standardName, String LOName, String studentNames) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {

        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        By contentGroupLocator = By.xpath("//*[@class='left-menu']//*[text()='" + contentGroup + "']/parent::li");
        By standardNameLocatorIsSelected = By.xpath("//*[text()='" + standardName + "']/ancestor::li/input");
        By standardNameLocator = By.xpath("//*[text()='" + standardName + "']/ancestor::li");
        By assignLOButton = By.xpath("//*[contains(text(),'" + LOName + "')]/following-sibling::button[@class='assign-btn']");

        waitForSpinner(driver);
        expandContentGroupInGroupView(contentGroupLocator);
        expandStandardInGroupView(standardNameLocatorIsSelected, standardNameLocator);

        waitForElementVisible(driver, assignLOButton, LONG_TIMEOUT);
        waitForSpinner(driver);
        click(driver, assignLOButton);

        selectStudentsGroupView(students);
        click(driver, pageFactory.getLocatorFor(classProgress, "assign_button_group"));
        waitForSpinner(driver);
        Thread.sleep(4000);
        waitForSpinner(driver);
        closePopupIfPresent();
    }

    private void selectStudentsGroupView(List<String> students) {
        students.forEach(student -> {
            String studNameCaps = WordUtils.capitalize(student, new char[]{' '});
            By studentCheckbox = By.xpath("//label[normalize-space(text())='" + student + "' or normalize-space(text())='" + studNameCaps + "']/preceding-sibling::input");
            if (!findElement(driver, studentCheckbox, SHORT_TIMEOUT).isSelected())
                click(driver, By.xpath("//label[normalize-space(text())='" + student + "'or normalize-space(text())='" + studNameCaps + "']"));
        });
    }

    private void removeSelectedStudentsGroupView(List<String> students) {
        students.forEach(student -> {
            String studNameCaps = WordUtils.capitalize(student, new char[]{' '});
            By studentCheckbox = By.xpath("//label[normalize-space(text())='" + studNameCaps + "']/preceding-sibling::input");
            if (findElement(driver, studentCheckbox, SHORT_TIMEOUT).isSelected())
                click(driver, By.xpath("//label[normalize-space(text())='" + studNameCaps + "']"));
        });
    }

    public void editCreateAssignmentForSelectedStudentsGroupView(String contentGroup, String standardName, String LOName, String studentNames) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        waitForSpinner(driver);
        By contentGroupLocator = By.xpath("//*[@class='left-menu']//*[text()='" + contentGroup + "']/parent::li");
        By standardNameCheckbox = By.xpath("//*[text()='" + standardName + "']/ancestor::li/input");
        By standardNameLocator = By.xpath("//*[text()='" + standardName + "']/ancestor::li");
        By editLOButton = By.xpath("//*[contains(text(),'" + LOName + "')]/following-sibling::*//button[@class='assign-btn edit']");

        expandContentGroupInGroupView(contentGroupLocator);
        expandStandardInGroupView(standardNameCheckbox, standardNameLocator);

        waitForElementVisible(driver, editLOButton, LONG_TIMEOUT);
        waitForSpinner(driver);
        click(driver, editLOButton);
        selectStudentsGroupView(students);
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "assign_button"));
        waitForSpinner(driver);
        Thread.sleep(4000);
        waitForSpinner(driver);
        closePopupIfPresent();
//        waitForNoElement(driver, editLOButton);

    }

    public void editRemoveAssignmentForSelectedStudentsGroupView(String contentGroup, String standardName, String LOName, String studentNames) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        List<String> students = Arrays.asList(studentNames.split(DELIMITER));
        waitForSpinner(driver);

        By contentGroupLocator = By.xpath("//*[@class='left-menu']//*[text()='" + contentGroup + "']/parent::li");
        By standardNameCheckbox = By.xpath("//*[text()='" + standardName + "']/ancestor::li/input");
        By standardNameLocator = By.xpath("//*[text()='" + standardName + "']/ancestor::li");
        By editLOButton = By.xpath("//*[contains(text(),'" + LOName + "')]/following-sibling::*//button[@class='assign-btn edit']");

        expandContentGroupInGroupView(contentGroupLocator);
        expandStandardInGroupView(standardNameCheckbox, standardNameLocator);

        waitForElementVisible(driver, editLOButton, MEDIUM_TIMEOUT);
        waitForSpinner(driver);
        click(driver, editLOButton);
        removeSelectedStudentsGroupView(students);
        click(driver, pageFactory.getLocatorFor(classProgress, "modify_button_group"));
        waitForSpinner(driver);
        Thread.sleep(4000);
        waitForSpinner(driver);
        closePopupIfPresent();

    }

    private void expandContentGroupInClassProgress(String contentGroup) throws InvalidLocatorException, ElementNotFoundException {
        By fallbackComponents = pageFactory.getLocatorFor(
                PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "fallback_components");
        new RandomAppearedElements().waitForFallbackComponentsToLoad(driver, fallbackComponents);

        elementSelectionStateToBe(driver, pageFactory.getLocatorFor(classProgress, "first_content_group_selected"), true, LONG_TIMEOUT);
        String contentGroupXpath = "//*[@class='content-grp-wrap']//*[text()='" + contentGroup + "']/ancestor::li";
        WebElement contentGroupExpand = findElement(driver, By.xpath(contentGroupXpath + "/input"), MEDIUM_TIMEOUT);
        if (!contentGroupExpand.isSelected()) {
            click(driver, pageFactory.getLocatorFor(classProgress, "first_content_group"));
            waitForSpinner(driver);
            click(driver, By.xpath(contentGroupXpath));
            waitForSpinner(driver);
        }
    }

    public void changePicPassword() throws InvalidLocatorException, ElementNotFoundException {
        String value = "src";
        click(driver, pageFactory.getLocatorFor(studentRoster, "edit_password_icon"), DEFAULT_TIMEOUT);
        String prevsrc = getAttribute(driver, pageFactory.getLocatorFor(studentRoster, "current_pic_pwd"), DEFAULT_TIMEOUT, value);
        click(driver, pageFactory.getLocatorFor(studentRoster, "choose_password"), DEFAULT_TIMEOUT);
        sleep(3);
        executeEventByJavaScript(driver, "document.getElementsByClassName('passcode-image')[1].click();");
        String newsrc = getAttribute(driver, pageFactory.getLocatorFor(studentRoster, "picture_password"), DEFAULT_TIMEOUT, value);
        click(driver, pageFactory.getLocatorFor(studentRoster, "select_button"), DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(studentRoster, "save_password_button"), DEFAULT_TIMEOUT);
        sleep(3);
        click(driver, pageFactory.getLocatorFor(studentRoster, "edit_password_icon"), DEFAULT_TIMEOUT);
        String currentsrc = getAttribute(driver, pageFactory.getLocatorFor(studentRoster, "current_pic_pwd"), DEFAULT_TIMEOUT, value);
        Assert.assertNotEquals(prevsrc, currentsrc);
    }

    public void changePicturePassword(String studentName) throws InvalidLocatorException, ElementNotFoundException {

        String studentInCaps = WordUtils.capitalize(studentName, new char[]{' '});
        By studentPicturePassword = By.xpath("//*[normalize-space(text())='" + studentName + "' or normalize-space(text())='" + studentInCaps + "']/ancestor::*[@class='table-row']//*[@class='picture-password']//img");
        String previousPicPassword = getAttribute(driver, studentPicturePassword, DEFAULT_TIMEOUT, "src");
        logger.debug("previousPicPassword = " + previousPicPassword);
        clickOnEditStudentDetails(studentName);
        click(driver, pageFactory.getLocatorFor(studentRoster, "choose_another_pic_password"));
        click(driver, pageFactory.getLocatorFor(studentRoster, "first_picture_password"));
        click(driver, pageFactory.getLocatorFor(studentRoster, "select_button_pic_password"));
        waitForNoElement(driver, pageFactory.getLocatorFor(studentRoster, "select_button_pic_password"));
        click(driver, pageFactory.getLocatorFor(studentRoster, "save_student_details"));
        waitForNoElement(driver, pageFactory.getLocatorFor(studentRoster, "save_student_details"));
        refreshPage(driver);
        waitForElementVisible(driver, studentPicturePassword, DEFAULT_TIMEOUT);
        String newPicPassword = getAttribute(driver, studentPicturePassword, DEFAULT_TIMEOUT, "src");
        logger.debug("newPicPassword = " + newPicPassword);
        Assert.assertNotEquals(previousPicPassword, newPicPassword);

    }

    public void clickOnEditStudentDetails(String studentName) throws InvalidLocatorException, ElementNotFoundException {
        String studentInCaps = WordUtils.capitalize(studentName, new char[]{' '});
        By studentEditIcon = By.xpath("//*[normalize-space(text())='" + studentName + "' or normalize-space(text())='" + studentInCaps + "']/ancestor::*[@class='table-row']//*[contains(@class,'iconPencil')]");
        click(driver, studentEditIcon);
        waitForElementVisible(driver, pageFactory.getLocatorFor(studentRoster, "student_currrent_pic_password"), DEFAULT_TIMEOUT);
    }

    public void selectActionFromManageAllClass(String klassName, String action) throws InvalidLocatorException, ElementNotFoundException {
        switch (action) {
            case "Go to Class":
                goToKlassFromManageKlassPage(klassName, action);
                break;
            case "Promote":
                promoteKlassFromManageKlassPage(klassName, action);
                break;
            case "Add":
                click(driver, pageFactory.getLocatorFor(manageAllClasses, "add_new_class"), DEFAULT_TIMEOUT);
                addNewClassFromManageKlassPage(klassName, "Adam, sachin");
                break;
            case "Delete":
                deleteKlassFromManageKlassPage(klassName);
                break;
            case "Transfer":
                transferClassFromManageKlassPage(klassName, action);
                break;
            default:
                Assert.fail("Action " + action + " for class " + klassName + " not found");
                break;
        }
    }

    private void transferClassFromManageKlassPage(String klassName, String action) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, By.xpath("//span[@title='" + klassName.toLowerCase() + "' or @title='" + klassName + "']//parent::td//following-sibling::td[@class='actions']//a[text()='" + action + "']"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(transferKlassPage, "teacher_email"), DEFAULT_TIMEOUT);
        type(driver, pageFactory.getLocatorFor(transferKlassPage, "teacher_email"), "auto_teacher+transferKlass@splashlearn.com", DEFAULT_TIMEOUT);
        type(driver, pageFactory.getLocatorFor(transferKlassPage, "message_section"), "class transfer request", DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(transferKlassPage, "submit_transfer_request"), DEFAULT_TIMEOUT);
        waitForSpinner(driver);
        verifyText(driver, pageFactory.getLocatorFor(transferKlassPage, "cancel_transfer"), "Cancel Transfer");
        Assert.assertTrue(exists(driver, pageFactory.getLocatorFor(transferKlassPage, "cancel_transfer"), DEFAULT_TIMEOUT));
        click(driver, pageFactory.getLocatorFor(transferKlassPage, "cancel_transfer"));
    }

    private void goToKlassFromManageKlassPage(String klassName, String action) {
        click(driver, By.xpath("//span[@title='" + klassName.toLowerCase() + "' or @title='" + klassName + "']//parent::td//following-sibling::td[@class='actions']//span[text()='" + action + "']"));
    }

    public void verifyClassOnTeacherDashboard(String klassName) throws InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(teacherDashboardPage, "account_dropdown"), DEFAULT_TIMEOUT);
        verifyText(driver, By.xpath("//div[@class='class-name-wrap']//h6[text()='" + klassName + "']"), klassName);
    }

    private void promoteKlassFromManageKlassPage(String klassName, String action) throws InvalidLocatorException, ElementNotFoundException {
        String value = getAttribute(driver, By.xpath("//span[@title='" + klassName.toLowerCase() + "' or @title='" + klassName + "']//parent::td//following-sibling::td[@class='actions']//a[text()='" + action + "']"), SHORT_TIMEOUT, "class");
        if (value.contains("disabled")) {
            goToKlassFromManageKlassPage(klassName, "Go to Class");
            waitForSpinner(driver);
            closeSummerLearningPopUp();
            click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "class_settings"), DEFAULT_TIMEOUT);
            selectGradeFromClassroomSettings("Kindergarten");
            sleep(5);
            click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "account_dropdown"), DEFAULT_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "manage_all_classes_link"), DEFAULT_TIMEOUT);
            waitForElementVisible(driver, pageFactory.getLocatorFor(manageAllClasses, "add_new_class"), DEFAULT_TIMEOUT);
        }
        //  String getCurrentKlassId = getKlassIdOfKlassFromManageAllKlassPage(klassName);
        String currentKlassGrade = getCurrentGradeOfClassFromManageAllKlassPage(klassName);
        click(driver, By.xpath("//span[@title='" + klassName + "']//parent::td//following-sibling::td[@class='actions']//a[text()='" + action + "']"));
        click(driver, By.xpath("//span[text()='Okay']"), DEFAULT_TIMEOUT);
        waitForSpinner(driver);
        sleep(2);
        String promotedClassGrade = getKlassIdOfKlassFromManageAllKlassPage(klassName);
        Assert.assertNotEquals(promotedClassGrade, currentKlassGrade, "Klass not Promoted");
    }

    private String getKlassIdOfKlassFromManageAllKlassPage(String klassName) {
        return getAttribute(driver, By.xpath("//span[@title='" + klassName.toLowerCase() + "' or @title='" + klassName + "']//ancestor::tr"), SHORT_TIMEOUT, "id");
    }

    private String getCurrentGradeOfClassFromManageAllKlassPage(String klassName) {
        return text(driver, By.xpath("//span[@title='" + klassName + "']//parent::td//following-sibling::td[@class='grade']"), SHORT_TIMEOUT);
    }

    private void selectGradeFromClassroomSettings(String gradeName) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(classSettingsPage, "grade_dropdown"), DEFAULT_TIMEOUT);
        click(driver, By.xpath("//div[@class='dropdown-list']//span[text()='" + gradeName + "']"), DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(classSettingsPage, "save_changes"), DEFAULT_TIMEOUT);
    }

    private void addNewClassFromManageKlassPage(String klassName, String studentNames) throws InvalidLocatorException, ElementNotFoundException {
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_name"), klassName);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_grade"), "Grade 1", DEFAULT_TIMEOUT);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_subject"), "Math", DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
        waitForSpinner(driver);
        waitForElementVisible(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"), studentNames);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"), DEFAULT_TIMEOUT);
        sleep(5);
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"), DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"));
        waitForNoElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"), LONG_TIMEOUT);
    }

    public void addNewClassFromManageKlassPage(String klassName, String gradeName, String subjectName) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(manageAllClasses, "add_new_class"), DEFAULT_TIMEOUT);
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_name"), klassName);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_grade"), gradeName, DEFAULT_TIMEOUT);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_subject"), subjectName, DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
        waitForSpinner(driver);
        waitForElementVisible(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"), "adam,alex");
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"));
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"), DEFAULT_TIMEOUT);
        sleep(5);
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"), DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"));
        waitForNoElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"), LONG_TIMEOUT);
    }

    public void deleteKlassIfExists(String klassName) throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, By.xpath("//span[@title='" + klassName.toLowerCase() + "' or @title='" + klassName + "']"), DEFAULT_TIMEOUT)) {
            deleteKlassFromManageKlassPage(klassName);
        }
    }

    private void deleteKlassFromManageKlassPage(String klassName) throws InvalidLocatorException, ElementNotFoundException {
        String getCurrentKlassId = getKlassIdOfKlassFromManageAllKlassPage(klassName);
        click(driver, By.xpath("//span[@title='" + klassName.toLowerCase() + "' or @title='" + klassName + "']//parent::td//following-sibling::td[@class='actions']//a[@class='ia-user-actions delete-class-action']"));
        type(driver, pageFactory.getLocatorFor(manageAllClasses, "enter_text_delete"), "delete");
        click(driver, pageFactory.getLocatorFor(manageAllClasses, "permanent_delete_class"));
        waitForSpinner(driver);
        sleep(5);
    }

    public void verifyKlassExists(String klassName, String klassExists) {
        if (klassExists.equalsIgnoreCase("Yes"))
            Assert.assertTrue(exists(driver, By.xpath("//span[@title='" + klassName + "']"), DEFAULT_TIMEOUT), "New Added Klass does not exists");
        else if (klassExists.equalsIgnoreCase("No"))
            Assert.assertFalse(exists(driver, By.xpath("//span[@title='" + klassName + "']"), DEFAULT_TIMEOUT), "New Added Klass exists");
        else
            Assert.fail("Invalid option " + klassExists);
    }

    public void studentLoginViaClassCode(String classCode, String studentName) throws InvalidLocatorException, ElementNotFoundException, IOException, UnsupportedFlavorException {

        if (classCode.isEmpty())
            classCode = data.get("class_code");

        type(driver, pageFactory.getLocatorFor("login_page", "class_code"), classCode);
        waitForElementVisible(driver, pageFactory.getLocatorFor(studentCentre, "header_text_on_student_centre"), DEFAULT_TIMEOUT);
        click(driver, By.xpath("//*[@class='students-list-wrap']//*[text()='" +
                WordUtils.capitalize(studentName, new char[]{' '}) + "']/parent::li"));
        waitForAnyoneElementToBeVisible(driver,
                pageFactory.getLocatorFor(studentCentre, "student_text_password"),
                pageFactory.getLocatorFor(studentCentre, "student_pic_password"),
                DEFAULT_TIMEOUT);

        if (data.containsKey("class_pic_password"))
            signinViaPicturePassword(data.get("class_pic_password"));
        else
            signinViaTextPassword(data.get("class_text_password"));
        waitForSpinner(driver);
       // waitForElementVisible(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), LONG_TIMEOUT + DEFAULT_TIMEOUT);
    }

    public void storeClassCodeAndPasswordFromClipboard(String className) throws IOException, UnsupportedFlavorException, InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "view_klasses_list"));
        selectKlassFromDropDown(className);
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "classcode_password_copy"));
        waitForAttributeToBe(driver, pageFactory.getLocatorFor(teacherDashboardPage, "classcode_password_copy"),
                "class", "iconcust-iconCheck");
        if (getPasswordFromClipboard().equalsIgnoreCase("undefined"))
            data.put("class_pic_password", getAttribute(driver, pageFactory.getLocatorFor(teacherDashboardPage, "class_pic_password"), SHORT_TIMEOUT, "src"));
        else
            data.put("class_text_password", getPasswordFromClipboard());
        data.put("class_code", getClassCodeFromClipboard());
    }

    public void storeClassCodeAndPasswordInfo(String className) throws IOException, UnsupportedFlavorException, InvalidLocatorException, ElementNotFoundException {
//        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "view_klasses_list"));
//        selectKlassFromDropDown(className);
        data.put("class_code", text(driver, pageFactory.getLocatorFor(teacherDashboardPage, "classcode"), SHORT_TIMEOUT));
        if (exists(driver, pageFactory.getLocatorFor(teacherDashboardPage, "class_pic_password"), SHORT_TIMEOUT))
            data.put("class_pic_password", getAttribute(driver, pageFactory.getLocatorFor(teacherDashboardPage, "class_pic_password"), SHORT_TIMEOUT, "src"));
        else
            data.put("class_text_password", text(driver, pageFactory.getLocatorFor(teacherDashboardPage, "class_text_password"), SHORT_TIMEOUT));
    }


    private String getPasswordFromClipboard() throws IOException, UnsupportedFlavorException {
        String classInfo = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        return StringUtils.substringAfter(classInfo, "Password: ");
    }

    private String getClassCodeFromClipboard() throws IOException, UnsupportedFlavorException {
        String classInfo = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        return StringUtils.substringBetween(classInfo, "Class Code: ", " Password");
    }

    private void signinViaTextPassword(String classTextPassword) throws InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(studentCentre, "student_text_password"), DEFAULT_TIMEOUT);
        type(driver, pageFactory.getLocatorFor(studentCentre, "student_text_password"), classTextPassword);
        click(driver, pageFactory.getLocatorFor(studentCentre, "signin_button"));

    }

    private void signinViaPicturePassword(String classPicturePassword) throws InvalidLocatorException, ElementNotFoundException {
        By pictureToChoose = By.xpath("//img[@src='" + classPicturePassword + "']/parent::a");
        waitForElementVisible(driver, pictureToChoose, DEFAULT_TIMEOUT);
        click(driver, pictureToChoose);

    }

    public void mandatoryParentSignUp(String studentName) throws Exception {
        if (exists(driver, pageFactory.getLocatorFor(studentDashboard, "parent_email"), SHORT_TIMEOUT)) {
            sleep(4);
            waitForSpinner(driver);
            String parentEmail = DataGenerator.parentEmail();
            click(driver, pageFactory.getLocatorFor(studentDashboard, "parent_email"));
            type(driver, pageFactory.getLocatorFor(studentDashboard, "parent_email"), parentEmail);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "parent_signup_button"));

            String otp = new EmailLibrary(testContext).getOtp(parentEmail);
            waitForElementVisible(driver, pageFactory.getLocatorFor(parentDashboard, "otp"), DEFAULT_TIMEOUT);
            type(driver, pageFactory.getLocatorFor(parentDashboard, "otp"), otp);

            click(driver, pageFactory.getLocatorFor(parentDashboard, "parent_password"));
            type(driver, pageFactory.getLocatorFor(parentDashboard, "parent_password"), DataGenerator.password());

            click(driver, pageFactory.getLocatorFor(parentDashboard, "email_submit_btn"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(parentDashboard, "continue_with_limited_access"), DEFAULT_TIMEOUT);
            updateParentEmailInMongoDB(parentEmail, studentName);
            deleteAllCookies(driver);
            switchToNewWindow(driver, "window");
            open(driver, TestContext.url, "student");
            studentLoginViaClassCode(data.get("class_code"), studentName);
        } else {
            logger.debug("Parent mandatory signup not present");
        }

    }

    private void updateParentEmailInMongoDB(String parentEmail, String studentName) throws JsonProcessingException {
        Map<String, Object> updateData = new HashMap<>();
        Map<String, Object> contextData = new ObjectMapper().readValue(((FindIterable<Document>) MongoHelper.getInstance()
                .query("{ \"test_id\": \"" + testContext.getTestId() + "\" }"))
                .into(new ArrayList<>()).get(0).toJson(), UserDataDTO.class).getData();
        String parentKey = contextData.entrySet()
                .stream().filter(entry -> Objects.equals(WordUtils.capitalize((String) entry.getValue()), studentName))
                .map(Map.Entry::getKey).findFirst().orElse(studentName);
        contextData.put(parentKey + "_parent", parentEmail);
        updateData.put("data", contextData);
        MongoHelper.getInstance().update("test_id", testContext.getTestId(), updateData);
    }

    //    TODO: Framework supports method calls only for String type of arguments - need to add support for more types
    public String sendParentInvite(String studentName) {
        String studentNameInCaps = WordUtils.capitalize(studentName);

        By parentEmailInvite = By.xpath("//div[normalize-space(text())='" + studentNameInCaps + "']/ancestor::*[@class='table-row']//input[contains(@class,'invite-parent-email')]");
        By parentInviteButton = By.xpath("//div[normalize-space(text())='" + studentNameInCaps + "']/ancestor::*[@class='table-row']//span[text()='Invite']");
        String generatedParentEmail = DataGenerator.parentEmail();
        type(driver, parentEmailInvite, generatedParentEmail);
        click(driver, parentInviteButton);
        return generatedParentEmail;

    }

    public <X> X getListItemFromCustomStorage(String keyName, int index) {
        if (testContext.getCustomStorage().containsKey(keyName)) {
            return ((List<X>) testContext.getCustomStorage().get(keyName)).get(index);
        } else {
            logger.debug("List " + keyName + " does not have any student present for index:" + index);
            logger.debug("Valid index range for List:" + keyName + " is 0-" +
                    ((List<X>) testContext.getCustomStorage().get("new_students")).size());
            throw new RuntimeException("Invalid index provided for List:" + keyName + " , Index = " + index);
        }
    }

    public String editParentInvite(String studentName) throws Exception {
        String studentNameInCaps = WordUtils.capitalize(studentName);
        By parentEmailInvite = By.xpath("//div[normalize-space(text())='" + studentNameInCaps + "' or normalize-space(text())='" + studentName.toLowerCase() + "']/ancestor::*[@class='table-row']//input[contains(@class,'invite-parent-email')]");
        By parentInviteButtton = By.xpath("//div[normalize-space(text())='" + studentNameInCaps + "' or normalize-space(text())='" + studentName.toLowerCase() + "']/ancestor::*[@class='table-row']//span[text()='Invite']");
        By editParentEmailButton = By.xpath("//div[normalize-space(text())='" + studentNameInCaps + "' or normalize-space(text())='" + studentName.toLowerCase() + "']/ancestor::*[@class='table-row']//*[@class='invite-parent-email']//*[@class='iconcust-iconPencil']");
        String generatedParentEmail = DataGenerator.parentEmail();

        if (exists(driver, editParentEmailButton, DEFAULT_TIMEOUT)) {
            click(driver, editParentEmailButton);
            while (!getAttribute(driver, parentEmailInvite, SHORT_TIMEOUT, "value").equals(generatedParentEmail)) {
                clear(driver, parentEmailInvite, SHORT_TIMEOUT);
                type(driver, parentEmailInvite, generatedParentEmail);
            }
            click(driver, parentInviteButtton);
            waitForSpinner(driver);
        } else {
            throw new Exception("parent invite edit button not present");
        }
        return generatedParentEmail;
    }

    public void sendReminder(String studentName) {
        String studentNameInCaps = WordUtils.capitalize(studentName);
        By sendReminder = By.xpath("//div[normalize-space(text())='" + studentNameInCaps + "']/ancestor::*[@class='table-row']//*[@class='home-access-status']//*[@class='send-reminder-cta']");
        click(driver, sendReminder);
    }

    public void verifyAssignmentOnStudentDashboardForMultipleStudents(String students, String subject) throws Exception {

        List<String> verifyStudentsList = Arrays.asList(students.split(DELIMITER))
                .stream().map(s -> WordUtils.capitalize(s.trim(), new char[]{' '})).collect(Collectors.toList());

        for (String student : verifyStudentsList) {
            startBrowser("student");
            studentLoginViaClassCode("", student);
            mandatoryParentSignUp(student);
            if (StringUtils.isNotBlank(subject))
                toggleSubject(subject);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            retryClicksUntilElementPresent(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            Assert.assertTrue(verifyAssignmentOnStudentDashboard(data.get("learning_objective")));
            driver.close();
        }
    }

    public void verifyMFFAssignmentOnStudentDashboardForMultipleStudents(String students, String subject, String expectedPracticeDaysCount) throws Exception {
        String[] studentsList = students.split(" ");
        List<String> verifyStudentsList = Arrays.stream(studentsList).map(WordUtils::capitalize).collect(Collectors.toList());


        for (String student : verifyStudentsList) {
            startBrowser("student");
            studentLoginViaClassCode("", student);
            mandatoryParentSignUp(student);
            if (StringUtils.isNotBlank(subject))
                toggleSubject(subject);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            retryClicksUntilElementPresent(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            Assert.assertTrue(verifyMFFAssignmentExists(data.get("learning_objective")));
            driver.close();
        }
    }

    public void verifyMFFAssignmentOnStudentDashboardForStudents(String students, String subject, String isVisible) throws Exception {

        String[] studentsList = students.split(" ");
        List<String> verifyStudentsList = Arrays.stream(studentsList).map(WordUtils::capitalize).collect(Collectors.toList());


        for (String student : verifyStudentsList) {
            startBrowser("student");
            studentLoginViaClassCode("", student);
            mandatoryParentSignUp(student);
            if (StringUtils.isNotBlank(subject))
                toggleSubject(subject);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            retryClicksUntilElementPresent(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            if (isVisible.equalsIgnoreCase("visible"))
                Assert.assertTrue(verifyMFFAssignmentExists(data.get("learning_objective")));
            else if (isVisible.equalsIgnoreCase("not visible"))
                Assert.assertFalse(verifyMFFAssignmentExists(data.get("learning_objective")));
            else
                Assert.fail("Invalid option" + isVisible);
            driver.close();
        }
    }

    public void openParentSignupLink(String url) throws IOException {
        new Hooks(testContext).startBrowser();
        driver = testContext.getDriver();
        open(driver, url);
    }


    private Boolean verifyAssessmentOnStudentDashboard(String assessmentName) {
        By assessment = By.xpath("//*[@class='assessment-lable' and normalize-space(text())='Assessment']/ancestor::li//*[text()='" + assessmentName + "']");
        return exists(driver, assessment, DEFAULT_TIMEOUT);
    }

    private Boolean verifyAssignmentOnStudentDashboard(String assignmentName) {
        By assignment = assignmentName.contains("Bag of Words") ?
                By.xpath("//*[@class='assessment-lable' and normalize-space(text())='Assignment']/ancestor::li//*[contains(text(),'" + assignmentName + "')]") :
                By.xpath("//*[@class='assessment-lable' and normalize-space(text())='Assignment']/ancestor::li//*[text()='" + assignmentName + "']");
        return exists(driver, assignment, DEFAULT_TIMEOUT);
    }

    private int getActualMFFPracticeDaysCount() throws InvalidLocatorException, ElementNotFoundException {
        By practiceDays = pageFactory.getLocatorFor(studentDashboard, "math_fact_practice_days");
        return findElements(driver, practiceDays, DEFAULT_TIMEOUT).size() - 1;

    }

    private Boolean verifyMFFAssignmentExists(String assignmentName) {
        By assignment = By.xpath("//*[@class='math-facts-container']//*[text()='" + assignmentName + "']");
        return exists(driver, assignment, DEFAULT_TIMEOUT);
    }

    private void toggleSubject(String subjectName) {
        By readingButton = By.xpath("//*[contains(@class,'GradeSwitch')]/div[1]");
        By mathButton = By.xpath("//*[contains(@class,'GradeSwitch')]/div[2]");

        if (exists(driver, readingButton, 5) || exists(driver, mathButton, 5)) {
            if (subjectName.equalsIgnoreCase("READING") || subjectName.equalsIgnoreCase("ELA"))
                click(driver, readingButton);
//            else
//                click(driver, mathButton);
        }
        waitForSpinner(driver);
    }

    public void addStudentsFromStudentRoster(String className, String studentNames) throws InvalidLocatorException, ElementNotFoundException {
        List<String> studentsList = Arrays.asList(studentNames.split(DELIMITER))
                .stream().map(s -> WordUtils.capitalize(s.trim(), new char[]{' '})).collect(Collectors.toList());
        testContext.getCustomStorage().put("new_students", studentsList);
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "view_klasses_list"));
        selectKlassFromDropDown(className);

        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "manage_class"));
        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "student_roster"));
        click(driver, pageFactory.getLocatorFor(studentRoster, "add_students"));

        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"),
                ((List<String>) testContext.getCustomStorage().get("new_students")).stream().collect(Collectors.joining(",")));
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"));
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"));
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"));
        waitForNoElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"));
        waitForSpinner(driver);

        click(driver, pageFactory.getLocatorFor(teacherDashboardPage, "view_klasses_list"));
        selectKlassFromDropDown(className);
    }

    public void copyAndStoreParentInvite() throws IOException, UnsupportedFlavorException, InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(studentRoster, "copy_invite"));
        waitForNoElement(driver, pageFactory.getLocatorFor(studentRoster, "copied_invite"));
        String inviteInfo = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        logger.debug("inviteInfo=" + inviteInfo);
        data.put("parent_invite_link", StringUtils.substringBetween(inviteInfo, "Go to ", "\n2. Sign up"));
        data.put("class_code", StringUtils.substringBetween(inviteInfo, "class code: ", "."));
    }

    public void assignmentAssignedStudentsData() {
        int numberOfStudents = findElements(driver, By.xpath("//ul[@class='select-std-wrapper']/li"), 10).size();
        String name;
        for (int i = 1; i <= numberOfStudents; i++) {
            if (exists(driver, By.xpath("//ul[@class='select-std-wrapper']/li[" + i + "]/input[@type='checkbox' and @checked]//following-sibling::label"), 10)) {
                // customStorage.put(getAttribute(driver, By.xpath("//ul[@class='select-std-wrapper']/li[" + i + "]/input[@type='checkbox' and @checked]"), 10, "value"), "yes");
                name = text(driver, By.xpath("//ul[@class='select-std-wrapper']/li[" + i + "]/input[@type='checkbox' and @checked]//following-sibling::label//parent::li"), 10);
                customStorage.put(name, "yes");
            } else {
                // customStorage.put(getAttribute(driver, By.xpath("//ul[@class='select-std-wrapper']/li[" + i + "]/input[@type='checkbox' and @checked]"), 10, "value"), "no");
                name = text(driver, By.xpath("//ul[@class='select-std-wrapper']/li[" + i + "]/input[@type='checkbox' and @checked]//following-sibling::label//parent::li"), 10);
                customStorage.put(name, "no");
            }

        }
    }

    public void editAssignedAssignmentForStudent(String studentCount) throws InvalidLocatorException, ElementNotFoundException {
        assignmentAssignedStudentsData();
        int count = 0;
        for (Map.Entry<String, Object> entry : customStorage.entrySet()) {
            if (entry.getValue().equals("yes")) {
                count++;
                if (Integer.parseInt(studentCount) != 0 && count <= Integer.parseInt(studentCount)) {
                    // click(driver, By.xpath("//input[@value='" + entry.getKey() + "' and @checked]//following-sibling::label"), 10);
                    click(driver, By.xpath("//label[text()='" + entry.getKey() + "']"), 10);
                    customStorage.put(entry.getKey(), "no");
                }
            }
        }
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "modify"), 10);
        sleep(4);
        click(driver, pageFactory.getLocatorFor(assignmentSubPage, "close_pop_up"), DEFAULT_TIMEOUT);
    }

    public void verifyAssignedAssignmentForSelectedStudent(String klassName, String subject, String LOName) throws InterruptedException, InvalidLocatorException, ElementNotFoundException {
        waitForSpinner(driver);
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }

        int count = 0;
        for (Map.Entry<String, Object> entry : customStorage.entrySet()) {
            count++;

            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }
            click(driver, By.xpath("//div[text()='" + entry.getKey() + "']"), 10);

            waitForElement(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), 10);
            if (count == 1 && subjectToggleExists())
                toggleSubject(subject);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), 5);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (entry.getValue().equals("yes")) {
                if (LOName.equalsIgnoreCase("Fact practice")) {
                    Assert.assertTrue(verifyMFFAssignmentExists(LOName));
                } else {
                    verifyText(driver, By.xpath("//div[@class='my-to-do-container']//li//div[text()='" + LOName + "']"), LOName);
                }
            } else if (entry.getValue().equals("no")) {
                if (LOName.equalsIgnoreCase("Fact practice")) {
                    Assert.assertFalse(verifyMFFAssignmentExists(LOName));
                } else {
                    Assert.assertFalse(exists(driver, By.xpath("//div[@class='my-to-do-container']//li//div[text()='" + LOName + "']"), 5));
                }
            } else
                Assert.fail("Unknown Assignment Status = " + entry.getValue());

            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), 5);
            waitForElement(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), 10);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), 5);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), 10);
        }
    }

    public void addSingleStudent(String studentName) throws InvalidLocatorException, ElementNotFoundException {
        type(driver, pageFactory.getLocatorFor(studentRoster, "student_name_textarea"), studentName);
        waitForElementVisible(driver, pageFactory.getLocatorFor(studentRoster, "add_student_button"), 10);
        click(driver, pageFactory.getLocatorFor(studentRoster, "add_student_button"));
        waitForSpinner(driver);
        waitForElementVisible(driver, pageFactory.getLocatorFor(studentRoster, "done_button"), 10);
        click(driver, pageFactory.getLocatorFor(studentRoster, "done_button"));

    }

    public void deleteStudent(String className, String studentName) throws InvalidLocatorException, ElementNotFoundException {
        By studentToDelete = By.xpath("//div[@class='name' and text()='" + studentName + " ']");

        //verify whether the student is present or not
        if (!exists(driver, studentToDelete, 10)) {
            //verify if there is no student and add student pop up is getting shown,if yes then click add student CTA on popup
            if (exists(driver, pageFactory.getLocatorFor(studentRoster, "add_student_modal"), 10)) {

                click(driver, pageFactory.getLocatorFor(studentRoster, "add_cta_modal"));
            }
            // else click add student CTA in Student roster page
            else {
                click(driver, pageFactory.getLocatorFor(studentRoster, "add_students_cta"));
            }

            addSingleStudent(studentName);
            // after adding student visit student roster page
            click(driver, pageFactory.getLocatorFor(studentRoster, "manage_class"));
            click(driver, pageFactory.getLocatorFor(studentRoster, "student_roster"));
        }

        // if student exists then continue with delete operation
        By deleteIcon = By.xpath("//div[@class='name' and text()='" + studentName + " ']/following::div[@class='actions-menu']/span[2]");
        fireClickEvent(driver, deleteIcon, 10);

        alertAccept(driver, 10);
        //verify if student deleted was last student then click on "add students" cta shown on popup
        if (exists(driver, pageFactory.getLocatorFor(studentRoster, "add_student_modal"), 10)) {

            click(driver, pageFactory.getLocatorFor(studentRoster, "add_cta_modal"));
        }

        //refresh page and verify that student is deleted
        else {
            waitForSpinner(driver);
            refreshPage(driver);
            // below if condition verifies that student is deleted or not
            if (driver.findElements(studentToDelete).size() != 0) {
                Assert.fail();
                logger.debug("student not deleted");
            }
            //click add student button present in student roster page to add deleted student
            else {
                click(driver, pageFactory.getLocatorFor(studentRoster, "add_students_cta"));


            }
        }

        // in the below code we would call function to  add deleted student

        addSingleStudent(studentName);

        // now verify deleted student is added

        click(driver, pageFactory.getLocatorFor(studentRoster, "manage_class"));
        click(driver, pageFactory.getLocatorFor(studentRoster, "student_roster"));
        waitForSpinner(driver);
        if (driver.findElements(studentToDelete).size() != 0) {
            Assert.assertTrue(true);
        }


    }


    public void inviteParent(String className, String studentName, String parentEmail) throws InvalidLocatorException, ElementNotFoundException {

        By inviteTextarea = By.xpath("//div[text()='" + studentName + " ']/parent::div/following-sibling::div[@class='invite-parent-email']//input");
        By editEmail = By.xpath("//div[text()='" + studentName + " ']/parent::div/following-sibling::div[@class='invite-parent-email']//i");
        By inviteButton = By.xpath("//div[text()='" + studentName + " ']/parent::div/following-sibling::div[@class='invite-parent-email']//span");
        String notificationMessage = "Invitation will be sent to " + parentEmail + " shortly";
        By connectedEmail = By.xpath("//div[text()='" + studentName + " ']/parent::div/following-sibling::div[@class='invite-parent-email']/div/span");
        By notifText = By.xpath("//div[@class=\"noty_message\"]/span");

        //check if parent is already invited for this student,if yes then delete this student and add it again
        if (exists(driver, editEmail, 10)) {
            deleteStudent(className, studentName);
        }

        //this code will be executed to invite parent

        type(driver, inviteTextarea, parentEmail);
        click(driver, inviteButton);
        waitForSpinner(driver);

        Assert.assertEquals(text(driver, notifText, 10), notificationMessage);
        refreshPage(driver);
        waitForSpinner(driver);
        Assert.assertEquals(text(driver, connectedEmail, 10), parentEmail);
    }
    public void signupAsUSTeacher() throws Exception {
        String userEmail = DataGenerator.teacherEmail();
        customStorage.put("email", userEmail);
        fillTeacherDetailsInSignup(userEmail);
        setUSSchool();
        fillOtp(userEmail);
        logger.debug("Teacher with email :{} created successfully", userEmail);
    }

    public void signupAsNonUSTeacher(String country, String state) throws Exception {

        String userEmail = DataGenerator.teacherEmail();
        fillTeacherDetailsInSignup(userEmail);
        setNonUSSchool(country, state);
        fillOtp(userEmail);
        logger.debug("Teacher with email :{} created successfully", userEmail);

    }

    private void fillTeacherDetailsInSignup(String teacherEmail) throws Exception {
        DataGenerator dataGenerator = new DataGenerator();
        waitForElementVisible(driver, pageFactory.getLocatorFor(teacherSignup, "first_name"), MEDIUM_TIMEOUT);
        type(driver, pageFactory.getLocatorFor(teacherSignup, "first_name"), dataGenerator.firstName());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "last_name"), dataGenerator.lastName());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "email"), teacherEmail);
        type(driver, pageFactory.getLocatorFor(teacherSignup, "password"), dataGenerator.password());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "birth_year"), "1996");
        click(driver, pageFactory.getLocatorFor(teacherSignup, "signup_button"));
    }

    private void setUSSchool() throws InvalidLocatorException, ElementNotFoundException {
        DataGenerator dataGenerator = new DataGenerator();
        waitForAnyoneElementToBeVisible(driver, pageFactory.getLocatorFor(teacherSignup, "us_schools_link"), pageFactory.getLocatorFor(teacherSignup, "nonus_schools_link"), MEDIUM_TIMEOUT);
        clickIfPresent(driver, pageFactory.getLocatorFor(teacherSignup, "us_schools_link"), MEDIUM_TIMEOUT);
        type(driver, pageFactory.getLocatorFor(teacherSignup, "city"), dataGenerator.city());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "school"), dataGenerator.school());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "school"), Keys.TAB);
        type(driver, pageFactory.getLocatorFor(teacherSignup, "zip_code"), dataGenerator.zipCode());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "zip_code"), Keys.TAB);
        click(driver, pageFactory.getLocatorFor(teacherSignup, "set_your_school_button"));
    }

    private void setNonUSSchool(String country, String state) throws InvalidLocatorException, ElementNotFoundException {
        DataGenerator dataGenerator = new DataGenerator();
        waitForAnyoneElementToBeVisible(driver, pageFactory.getLocatorFor(teacherSignup, "us_schools_link"), pageFactory.getLocatorFor(teacherSignup, "nonus_schools_link"), MEDIUM_TIMEOUT);
        clickIfPresent(driver, pageFactory.getLocatorFor(teacherSignup, "nonus_schools_link"), MEDIUM_TIMEOUT);
        select(driver, pageFactory.getLocatorFor(teacherSignup, "country"), country, DEFAULT_TIMEOUT);
        waitForNoElement(driver, pageFactory.getLocatorFor(teacherSignup, "bubble_wait_icon"));
        select(driver, pageFactory.getLocatorFor(teacherSignup, "state"), state, DEFAULT_TIMEOUT);
        waitForNoElement(driver, pageFactory.getLocatorFor(teacherSignup, "bubble_wait_icon"));

        type(driver, pageFactory.getLocatorFor(teacherSignup, "city"), dataGenerator.city());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "school"), dataGenerator.school());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "school"), Keys.TAB);
        type(driver, pageFactory.getLocatorFor(teacherSignup, "zip_code"), dataGenerator.zipCode());
        type(driver, pageFactory.getLocatorFor(teacherSignup, "zip_code"), Keys.TAB);
        click(driver, pageFactory.getLocatorFor(teacherSignup, "set_your_school_button"));
    }
    private void fillOtp(String teacherEmail) throws Exception {
        String otp = new EmailLibrary(testContext).getOtpFromDB(teacherEmail);
        waitForElementVisible(driver, pageFactory.getLocatorFor("otp", "otp_type"), MEDIUM_TIMEOUT);
        type(driver, pageFactory.getLocatorFor("otp", "otp_type"), otp);
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
    }

    public void addUSClass(String klassName, String grade, String subject) throws InvalidLocatorException, ElementNotFoundException {
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_name"), klassName);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_grade"), grade, DEFAULT_TIMEOUT);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_subject"), subject, DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));

    }

    public void addNonUSClass(String klassName, String grade) throws InvalidLocatorException, ElementNotFoundException {
        waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
        type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_name"), klassName);
        select(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "klass_grade"), grade, DEFAULT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "create_new_klass"));
    }

    public void addStudents(String studentNames) throws InvalidLocatorException, ElementNotFoundException {
        String studentsCommaSeparated = Arrays.asList(studentNames.split(DELIMITER))
                .stream().collect(Collectors.joining(","));
        if(exists(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"),DEFAULT_TIMEOUT)){
            waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"));
            type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names"), studentsCommaSeparated);
            click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"), DEFAULT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"), DEFAULT_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"));
            waitForNoElement(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student"), LONG_TIMEOUT);
        }else{
            waitForElementVisible(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names_VariantPage"));
            type(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "student_names_VariantPage"), studentsCommaSeparated);
            click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "add_students_VariantPage"), DEFAULT_TIMEOUT);
            waitForSpinner(driver);
            waitForElementVisible(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student_VariantPage"));
            click(driver, pageFactory.getLocatorFor(addKlassStudentsPage, "done_adding_student_VariantPage"), DEFAULT_TIMEOUT);
            waitForSpinner(driver);
        }
    }

    public void verifyGradeOptions(String grades) throws InvalidLocatorException, ElementNotFoundException {

        List<String> expectedGradeList = Arrays.asList(grades.split(DELIMITER)).stream().collect(Collectors.toList());
        click(driver, pageFactory.getLocatorFor(classSettingsPage, "grade_dropdown"));
        waitForElement(driver, pageFactory.getLocatorFor(classSettingsPage, "grade_dropdown_other_options"));
        List<String> actualGradeList = findElements(driver, pageFactory.getLocatorFor(classSettingsPage, "grade_dropdown_other_options"), MEDIUM_TIMEOUT)
                .stream()
                .map(WebElement::getText)
                .collect(Collectors.toList());

        logger.debug("actual=" + actualGradeList);
        logger.debug("expected=" + expectedGradeList);
        Assert.assertTrue(actualGradeList.containsAll(expectedGradeList));

    }


    public void ensureStudentRosterPage() throws InvalidLocatorException, ElementNotFoundException {
        By addStudentsButton = pageFactory.getLocatorFor(studentRoster, "add_students");
        By manageClassButton = pageFactory.getLocatorFor(teacherDashboardPage, "manage_class");
        By studentRosterButton = pageFactory.getLocatorFor(teacherDashboardPage, "student_roster");
        retryUntilTrue(driver, d -> {

            if (exists(d, addStudentsButton, 2)) {
                return true;
            } else {
                click(d, manageClassButton);
                click(d, studentRosterButton);
                return false;
            }
        }, LONG_TIMEOUT);
    }

    public void ensureClassSettingsPage() throws InvalidLocatorException, ElementNotFoundException {
        By saveChangesButton = pageFactory.getLocatorFor(classSettingsPage, "save_changes");
        By manageClassButton = pageFactory.getLocatorFor(teacherDashboardPage, "manage_class");
        By classSettingsButton = pageFactory.getLocatorFor(teacherDashboardPage, "class_settings");
        retryUntilTrue(driver, d -> {

            if (exists(d, saveChangesButton, 2)) {
                return true;
            } else {
                click(d, manageClassButton);
                click(d, classSettingsButton);
                return false;
            }
        }, LONG_TIMEOUT);
    }

    public void deleteStudentsApi(String studentNames) {

        List<String> studentList = Arrays.asList(studentNames.split(","))
                .stream().map(String::trim).collect(Collectors.toList());

        String klassName = testContext.getData().get("class_name");

        String klassId = new TeacherOperations(testContext.getEntityContext()).getKlassByName(klassName).get().getId();
        TeacherAPI teacherAPI = new TeacherAPI(testContext.getApiContext());
        StudentResponse[] students = teacherAPI.getStudents(klassId);

        List<StudentResponse> studentsToDelete = Arrays.stream(students).filter(allStudents -> studentList.stream()
                        .anyMatch(selectedStudent -> selectedStudent.equals(allStudents.getFirstName() + " " + allStudents.getLastName()) || selectedStudent
                                .equals(allStudents.getFirstName())))
                .collect(Collectors.toList());

        studentsToDelete.forEach(student -> teacherAPI.deleteStudent(student.getId()));

    }

    public void deleteKlassApi(String klassName) {
        TeacherData teacherData = new TeacherData(testContext);
        teacherData.getTeacherKlassStudentData(evaluator.evaluate(testContext.getData(), testContext.getData().get("username")),
                evaluator.evaluate(testContext.getData(), testContext.getData().get("password")));
        String klassId = teacherData.getKlassId(klassName);
        TeacherDashboardApi teacherDashboardApi = new TeacherDashboardApi(testContext.cookies.getCookies());
        teacherDashboardApi.deleteKlass(klassId, testContext.getSessionId());
    }

    public void selectUnselectedOptions() throws InvalidLocatorException, ElementNotFoundException {
        Map<String, String> factGroup = new HashMap<>();
        Map<String, String> practiceDays = new HashMap<>();
        Map<String, String> practiceDuration = new HashMap<>();

        List<String> factName = Arrays.asList("Addition & Subtraction", "Multiplication & Division");
        List<String> practiceDayNames = Arrays.asList("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun");
        List<String> practiceDurationNames = Arrays.asList("5 min", "10 min", "15 min");

        for (String s : factName) {
            if (!getAttribute(driver, By.xpath("//button[text()='" + s + "']"), 5, "class").contains("active")) {
                click(driver, By.xpath("//button[text()='" + s + "']"));
                factGroup.put(s, "active");
            } else {
                factGroup.put(s, "inactive");
            }
        }

        for (String s : practiceDayNames) {
            if (!getAttribute(driver, By.xpath("//button[text()='" + s + "']"), 5, "class").contains("active")) {
                click(driver, By.xpath("//button[text()='" + s + "']"));
                practiceDays.put(s, "active");
            } else {
                practiceDays.put(s, "inactive");
            }
        }

        click(driver, By.xpath("//button[text()='" + practiceDurationNames.get(1) + "']"));
        practiceDuration.put(practiceDurationNames.get(1), "active");

        click(driver, pageFactory.getLocatorFor(mathFactFluency, "assign_whole_class"));
        verifyText(driver, pageFactory.getLocatorFor(mathFactFluency, "successful_assigned_modal-title"), "Successfully assigned");
    }

    public void assignMathFactToParticularDay(String day, String factGroup, String questionsCount) throws InvalidLocatorException, ElementNotFoundException {

        By assignAdaptivePracticeBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_adaptive_practice");
        click(driver, assignAdaptivePracticeBtn);
        By factGroupBtn = By.xpath("//*[contains(@class,'toggle-operator') and text() = '" + factGroup + "']");
        By questionsCountBtn = By.xpath("//*[contains(@class,'toggle-questions') and text() = '" + questionsCount + "']");
        By assignWholeClassBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_whole_class");

        List<String> daysOfWeek = Arrays.asList("M", "T", "W", "T", "F", "S", "S");
        unselectAllPracticeDays(daysOfWeek);

        int dayNumber = getCurrentDayAsNumber();

        selectPracticeDay(day, dayNumber);
        click(driver, factGroupBtn);
        click(driver, questionsCountBtn);
        click(driver, assignWholeClassBtn);
    }

    private int getCurrentDayAsNumber() {
        LocalDate today = LocalDate.now();
        DayOfWeek dayOfWeek = today.getDayOfWeek();
        System.out.println("Day of the Week :: " + dayOfWeek);
        System.out.println("Day of the Week - in Number :: " + dayOfWeek.getValue());
        return dayOfWeek.getValue();
    }

    private void unselectAllPracticeDays(List<String> practiceDays) {
        for (int i = 1; i < practiceDays.size(); i++) {
            if (getAttribute(driver, By.xpath("//label[text()='Select practice days']/following-sibling::div/button[" + i + "]"), 5, "class").contains("active")) {
                click(driver, By.xpath("//label[text()='Select practice days']/following-sibling::div/button[" + i + "]"));
            }
        }
    }

    private void selectPracticeDay(String day, int dayNumber) {
        HashMap<String, String> mapWeekDays = new HashMap<>() {{
            put("1", "Monday");
            put("2", "Tuesday");
            put("3", "Wednesday");
            put("4", "Thursday");
            put("5", "Friday");
            put("6", "Saturday");
            put("7", "Sunday");
        }};

        if (day.equalsIgnoreCase("Today")) {
            click(driver, By.cssSelector("button.toggle-button.toggle-day:nth-of-type(" + (dayNumber) + ")"));
        } else if (day.equalsIgnoreCase("not today")) {
            String dayNum = String.valueOf(dayNumber);
            List<String> daysOfWeek = new ArrayList<>(List.of("1", "2", "3", "4", "5", "6", "7"));
            daysOfWeek.remove(dayNum);
            Random random = new Random();
            String randomNumber = daysOfWeek.get(random.nextInt(daysOfWeek.size()));
            customStorage.put("practice day", mapWeekDays.get(randomNumber));
            click(driver, By.cssSelector("button.toggle-button.toggle-day:nth-of-type(" + (randomNumber) + ")"));
        } else {
            Assert.fail("Incorrect practice day passed " + day);
        }
    }

    public void handleMathFactModal() throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(mathFactFluency, "math_fact_fluency_modal"), 10)) {
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "close_math_fact_fluency_modal"));
        }
    }

    public void modifyMathFactFluencyForWholeClass() throws InvalidLocatorException, ElementNotFoundException {
        List<WebElement> studentCount = findElements(driver, By.xpath("//div[@id='right-canvas-content']//child::table//tbody/tr"), 10);
        List<String> values = Arrays.asList("Addition & Subtraction", "Multiplication & Division");

        for (int i = 0; i < studentCount.size(); i++) {
            click(driver, By.xpath("//table//tr[" + (i + 1) + "]//div[@class='math-fact-operator-drop-down']"), 10);
            String fluencyName = text(driver, By.xpath("//div[@class='math-fact-operator-drop-down']//div[@class='dropdown common-dropdown open']//span[1]"), 10);
            for (int j = 0; j < values.size(); j++) {
                if (!values.get(j).equalsIgnoreCase(fluencyName)) {
                    click(driver, By.xpath("//table//tr[" + (i + 1) + "]//div[@class='math-fact-operator-drop-down']//ul[@class='dropdown-menu common-dropdown-menu']/li[text()='" + values.get(j) + "']"), 10);
                }
            }

        }
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "save_changes"), 10);

    }

    public void viewMathFactsProgress() throws InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"), LONG_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "modify_practice"), LONG_TIMEOUT);
    }

    public void assignMathFactsToWholeClassOnWeekDays(String factGroup, String questionsCount) throws InvalidLocatorException, ElementNotFoundException {

        By assignAdaptivePracticeBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_adaptive_practice");
        By factGroupBtn = By.xpath("//*[contains(@class,'toggle-operator') and text() = '" + factGroup + "']");
        By questionsCountBtn = By.xpath("//*[contains(@class,'toggle-questions') and text() = '" + questionsCount + "']");
        By assignWholeClassBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_whole_class");

        click(driver, assignAdaptivePracticeBtn);
        click(driver, factGroupBtn);
        click(driver, questionsCountBtn);
        click(driver, assignWholeClassBtn);

    }

    public void assignMathFactsToWholeClassFromTrackFactFluency(String factGroup, String questionsCount) throws InvalidLocatorException, ElementNotFoundException {

        By assignAdaptivePracticeBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_adaptive_practice");
        By factGroupBtn = By.xpath("//*[contains(@class,'toggle-operator') and text() = '" + factGroup + "']");
        By questionsCountBtn = By.xpath("//*[contains(@class,'toggle-questions') and text() = '" + questionsCount + "']");
        By assignWholeClassBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_whole_class");

        click(driver, assignAdaptivePracticeBtn);
        click(driver, factGroupBtn);
        click(driver, questionsCountBtn);
        click(driver, assignWholeClassBtn);

    }

    public void unassignMathFactsForWholeClass() throws InvalidLocatorException, ElementNotFoundException {
        By modifyPracticeBtn = pageFactory.getLocatorFor(mathFactFluency, "modify_practice");
        if (exists(driver, modifyPracticeBtn, SHORT_TIMEOUT)) {
            click(driver, modifyPracticeBtn);
            waitForSpinner(driver);
            click(driver, pageFactory.getLocatorFor(mathFactFluency,"unassign_math_fact"));
            List<WebElement> ele = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "assigned_selected_students"), 5);
            for (WebElement e : ele) {
                click(driver, By.xpath("//button[contains(@class,'select-student')][text()='" + e.getText() + "' or text()='" + WordUtils.capitalize(e.getText(), new char[]{' '}) + "']"));
                customStorage.put(e.getText(), "not assigned");
            }
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "assign_btn"));
            waitForSpinner(driver);
        }
    }

    public List<String> getStudentList(){
        List<String>students = new ArrayList<>();

        List<WebElement> tableRows = driver.findElements(By.xpath("//div[@class='common-table']//tbody/tr"));
        for(int i = 1 ; i<= tableRows.size(); i++){
            students.add(text(driver,By.xpath("//div[@class='common-table']//tbody/tr["+i+"]/td[1]"),5));
        }
        return students;
    }

    public void unassignMathFactsToSelectedStudents(String studentCount) throws InvalidLocatorException, ElementNotFoundException {
        By modifyPracticeBtn = pageFactory.getLocatorFor(mathFactFluency, "modify_practice");
        if (exists(driver, modifyPracticeBtn, SHORT_TIMEOUT)) {
            click(driver, modifyPracticeBtn);
            mathFactAssignedStudentsData();
            System.out.println("Students = " + customStorage);
            int count = 0;
            for (Map.Entry<String, Object> entry : customStorage.entrySet()) {
                if (entry.getValue().equals("yes")) {
                    count++;
                    if (Integer.parseInt(studentCount) != 0 && count <= Integer.parseInt(studentCount)) {
                        click(driver, By.xpath("//button[text()='" + entry.getKey()+ "' or text()='" + WordUtils.capitalize(entry.getKey(), new char[]{' '}) + "']"));
                        customStorage.put(entry.getKey(), "no");
                    }
                }
            }
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "assign_btn"));
            waitForSpinner(driver);
        }

    }
    private void mathFactAssignedStudentsData() throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(mathFactFluency,"unassign_math_fact"));
        List<WebElement> ele = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "assigned_selected_students"), 5);
        String name;
        for(int i = 1 ;i <= ele.size(); i++){
            if(exists(driver, By.xpath("//ul[@class='select-std-wrapper']/button[@class='toggle-button toggle-student active select-student  with-tick']"), SHORT_TIMEOUT)){
                name = text(driver, By.xpath("//ul[@class='select-std-wrapper']/button["+i+"]"),10);
                customStorage.put(name, "yes");
            }
            else{
                name = text(driver, By.xpath("//ul[@class='select-std-wrapper']/button'["+i+"]'"),10);
                customStorage.put(name, "no");
            }
        }
    }

    public void assignMathFactsToSelectedStudentsOnWeekDays(String factGroup, String questionsCount, String students) throws InvalidLocatorException, ElementNotFoundException {

        List<String> selectedStudents = Arrays.asList(students.split(DELIMITER));
        By assignAdaptivePracticeBtn = pageFactory.getLocatorFor(mathFactFluency, "assign_adaptive_practice");
        By factGroupBtn = By.xpath("//*[contains(@class,'toggle-operator') and text() = '" + factGroup + "']");
        By questionsCountBtn = By.xpath("//*[contains(@class,'toggle-questions') and text() = '" + questionsCount + "']");
        By assignSelectedStudents = pageFactory.getLocatorFor(mathFactFluency, "assign_selected_students");

        click(driver, assignAdaptivePracticeBtn);
        click(driver, factGroupBtn);
        click(driver, questionsCountBtn);
        click(driver, assignSelectedStudents);
        selectSpecificStudents(selectedStudents);

    }

    private void selectSpecificStudents(List<String> selectedStudents) throws InvalidLocatorException, ElementNotFoundException {
        By selectAll = pageFactory.getLocatorFor(mathFactFluency, "select_all_checkbox");
        By assign = pageFactory.getLocatorFor(mathFactFluency, "assign_btn");
        click(driver, selectAll);
        selectedStudents.forEach(student -> {
            By studentBtn = By.xpath("//button[contains(@class,'select-student')][text()='" + student + "' or text()='" + WordUtils.capitalize(student, new char[]{' '}) + "']");
            click(driver, studentBtn);
        });
        click(driver, assign);
    }

    public void verifyMathFactsForCurrentClassroom(String expected) throws InvalidLocatorException, ElementNotFoundException {
        if (expected.equalsIgnoreCase("not visible"))
            Assert.assertFalse(exists(driver, pageFactory.getLocatorFor(teacherDashboardPage, "left_nav_assign_fact_fluency"), 10), "Math Fact is " + expected);
        else if (expected.equalsIgnoreCase("visible"))
            Assert.assertTrue(exists(driver, pageFactory.getLocatorFor(teacherDashboardPage, "left_nav_assign_menu"), 10), "Math Fact is " + expected);
        else
            Assert.fail("Entered wrong text " + expected);
    }

    public void changeGradeFromManageClass(String gradeName, String klassName) throws InvalidLocatorException, ElementNotFoundException {
        clear(driver, pageFactory.getLocatorFor(classSettingsPage, "classroom_name"), 5);
        type(driver, pageFactory.getLocatorFor(classSettingsPage, "classroom_name"), klassName, 5);
        click(driver, pageFactory.getLocatorFor(classSettingsPage, "grade_dropdown"));
        waitForElement(driver, pageFactory.getLocatorFor(classSettingsPage, "grade_dropdown_other_options"));
        click(driver, By.xpath("//li/span[text()='" + gradeName + "']"));
        click(driver, pageFactory.getLocatorFor(classSettingsPage, "save_changes"));
        waitForSpinner(driver);
    }

    public void trackCustomTestPage(String action) throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(mathFactFluency, "custom_test_view_progress"), 5)) {
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "custom_test_view_progress"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "total_custom_test"), LONG_TIMEOUT);
            List<WebElement> assignedCards = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "assigned_custom_test_cards"), 5);

            int count = assignedCards.size();
            for (int i = 0; i < assignedCards.size(); i++) {

                if (!exists(driver, By.xpath("//div[@class='test-list']/div[@class='test-card-container ' or @class='test-card-container  is-worksheet-card'][" + count + "]//child::div[@class='dots-container']"), 5)) {
                    click(driver, pageFactory.getLocatorFor(mathFactFluency, "view_report"));
                    waitForSpinner(driver, 5);
                    click(driver, pageFactory.getLocatorFor(mathFactFluency, "delete_card_from_progress_page"));
                    waitForSpinner(driver, 5);
                } else {
                    fireClickEvent(driver, By.xpath("//div[@class='test-list']/div[@class='test-card-container ' or @class='test-card-container  is-worksheet-card'][" + count + "]//child::div[@class='dots-container']"), 5);
                    actionOnWorksheet(action);
                }
                count--;
            }
//            selectFromLeftNav("MATH", "Assign facts", "New fact practice");
        }
    }

    private void actionOnWorksheet(String userAction) throws InvalidLocatorException, ElementNotFoundException {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(DEFAULT_TIMEOUT));
        WebElement threeDotsElement = findElement(driver, By.xpath("(//*[@class='dots-container active'])[1]"), SHORT_TIMEOUT);
        WebElement unassignButton = threeDotsElement.findElement(By.xpath("//div[contains(@class,'dots-container active')]//child::li[contains(text(),'" + userAction + "')]"));
        wait.until(ExpectedConditions.visibilityOf(unassignButton));
        unassignButton.click();

        if (!userAction.equalsIgnoreCase("Edit test")) {
            wait.until(ExpectedConditions.invisibilityOf(threeDotsElement));
        }
        waitForSpinner(driver);
        waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "track_custom_text"), LONG_TIMEOUT);
    }

    public void assignCustomMathFactToAllStudents(String operators, String numberOfQuestions, String timePerQuestion, String studentsData) throws InvalidLocatorException, ElementNotFoundException {
        selectCustomModeOptions(operators, numberOfQuestions, timePerQuestion);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "select_students_to_assign"));
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "assign_btn"));

        String[] studentData = extractData(studentsData, "-");
        for (String student : studentData) {
            customStorage.put(student, "assigned");
        }
//        customStorage.put("assigned_on", getCustomTestAssignDate());
    }

    private String getCustomTestAssignDate() {
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        LocalDate currentdate = LocalDate.now();
        int currentDay = currentdate.getDayOfMonth();
        Month currentMonth = currentdate.getMonth();
        int currentYear = currentdate.getYear();
        Date currentTime = localCalendar.getTime();

        return (currentTime.toString().split(" ")[1] + " " + currentDay + ", " + currentYear);

    }

    private String[] extractData(String data, String splitOperator) {
        return data.split(splitOperator);
    }

    public void verifyCustomMFFAssignmentOnStudentDashboardForStudents(String students, String subject) throws Exception {
        String[] studentsList = students.split(" ");
        List<String> verifyStudentsList = Arrays.stream(studentsList).map(WordUtils::capitalize).collect(Collectors.toList());


        for (String student : verifyStudentsList) {
            startBrowser("student");
            studentLoginViaClassCode("", student);
            mandatoryParentSignUp(student);
            if (StringUtils.isNotBlank(subject))
                toggleSubject(subject);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            retryClicksUntilElementPresent(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"));
            Assert.assertTrue(verifyIfCustomMFFAssignmentExists(data.get("learning_objective")));
            driver.close();
        }
    }

    private Boolean verifyIfCustomMFFAssignmentExists(String assignmentName) {
        By assignment = By.xpath("//*[@class='math-facts-container custom-test-list-container']//*[text()='" + assignmentName + "']");
        return exists(driver, assignment, DEFAULT_TIMEOUT);
    }

    public void verifyAssignedCustomMathFactOnStudentDashboard(String klassName, String LOName, String klassAssignment) throws InterruptedException, InvalidLocatorException, ElementNotFoundException {
        if (klassName.length() > KLASS_NAME_MAX_SIZE)
            klassName = klassName.substring(0, KLASS_NAME_MAX_SIZE).toLowerCase();

        if(exists(driver, By.xpath("//div[text()='" + klassName + "']"), 10)){
            click(driver, By.xpath("//div[text()='" + klassName + "']"));
            Thread.sleep(2000);
        }

        List<WebElement> listOfStudents = findElements(driver, pageFactory.getLocatorFor(studentCentre, "studentsList"), DEFAULT_TIMEOUT);

        for (int i = 1; i <= listOfStudents.size(); i++) {
            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }

            click(driver, By.xpath("//div[@class='student-item'][" + i + "]"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            sleep(3);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), SHORT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (klassAssignment.equalsIgnoreCase("assigned")) {
                Assert.assertTrue(verifyIfCustomMFFAssignmentExists(LOName));
            } else if (klassAssignment.equalsIgnoreCase("not assigned")) {
                Assert.assertFalse(verifyIfCustomMFFAssignmentExists(LOName));
            } else {
                Assert.fail("Invalid value passed for custom math fact");
            }
            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), SHORT_TIMEOUT);
            sleep(5);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);

            Thread.sleep(2000);
        }
    }

    public void assignCustomMathFactToSelectedStudents(String operators, String numberOfQuestions, String timePerQuestion, String studentsData) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "create_custom_test"));
        String[] data;
        data = extractData(operators, ",");
        for (String eachData : data) {
            if (!exists(driver, By.xpath("//div[@class='fact-detail']/label[text()='" + eachData + "']//preceding-sibling::input[@type='checkbox' and @checked]"), 10)) {
                click(driver, By.xpath("//div[@class='fact-detail']/label[text()='" + eachData + "']//preceding-sibling::input"));
            }
        }
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "select_question_drop_down"), 5);
        click(driver, By.xpath("//span[normalize-space()='" + numberOfQuestions + " Questions']"), 5);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "time_per_question_drop_down"), 5);
        click(driver, By.xpath("//span[normalize-space()='" + timePerQuestion + " sec']"), 5);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "select_students_to_assign"));

        // '.' firstly unselecting all the selected students in the pop up so marking it as not assigned
        List<WebElement> ele = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "assigned_selected_students"), 5);
        for (WebElement e : ele) {
            customStorage.put(e.getText(), "not assigned");
        }

        // to handle single and multiple students
        List<String> st = new ArrayList<>();
        if (studentsData.contains("-")) {
            String[] students = extractData(studentsData, "-");
            st.addAll(Arrays.asList(students));
        } else {
            st.add(studentsData);
        }
        selectSpecificStudents(st);

        // '.' this student is going to be selected on the assign student pop up screen
        for (String x : st) {
            customStorage.put(x, "assigned");
        }
    }

    public void verifyAssignedCustomMathFactForSelectedStudents(String klassName, String LOName) throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        for (Map.Entry<String, Object> entry : customStorage.entrySet()) {

            if (exists(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"), 10)) {
                click(driver, By.xpath("//div[text()='" + klassName.toLowerCase() + "']"));
                waitForSpinner(driver);
            }
            click(driver, By.xpath("//div[text()='" + entry.getKey() + "']"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            sleep(3);

            click(driver, pageFactory.getLocatorFor(studentDashboard, "my_to_dos"), SHORT_TIMEOUT);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));

            if (entry.getValue().equals("assigned")) {
                Assert.assertTrue(verifyIfCustomMFFAssignmentExists(LOName));
            } else if (entry.getValue().equals("not assigned")) {
                Assert.assertFalse(verifyIfCustomMFFAssignmentExists(LOName));
            } else {
                Assert.fail("Invalid value in Custom Storage");
            }
            click(driver, pageFactory.getLocatorFor(studentDashboard, "back"), SHORT_TIMEOUT);
            sleep(5);
            click(driver, pageFactory.getLocatorFor(studentDashboard, "student_logout"), SHORT_TIMEOUT);
            waitForElement(driver, pageFactory.getLocatorFor(studentCentre, "go_to_teacher_dashboard"), DEFAULT_TIMEOUT);

            Thread.sleep(2000);

        }

    }

    public void addOrRemoveStudent() throws InvalidLocatorException, ElementNotFoundException {
        List<WebElement> ele = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "assigned_selected_students"), 5);
        List<String> student = new ArrayList<>();

        for (WebElement e : ele) {
            student.add(e.getText());
            customStorage.put(e.getText(), "assigned");
        }
        By studentBtn = By.xpath("//button[contains(@class,'select-student')][text()='" + student.get(0) + "' or text()='" + WordUtils.capitalize(student.get(0), new char[]{' '}) + "']");
        customStorage.put(student.get(0), "not assigned");
        click(driver, studentBtn);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "assign_btn"));
    }

    public void verifyFilterOnTrackCustomTestPage(String all, String completed, String ongoing, String markedCompleted) throws InvalidLocatorException, ElementNotFoundException {
        List<String> expectedData = Stream.of(all, completed, ongoing, markedCompleted).collect(Collectors.toList());

        if (exists(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"), 5)) {
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "total_custom_test"), LONG_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "show_dropdown"));
            List<WebElement> testProgressData = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "drop_down_data"), 5);
            int count = 0;
            for (WebElement e : testProgressData) {
                Assert.assertEquals(e.getText().trim(), expectedData.get(count).trim());
                count++;
            }

        } else {
            Assert.fail("View Progress Button not visible on Screen");
        }
    }

    public void verifyProgressOFStudentsOnTrackCustomTestPage(String students) throws InvalidLocatorException, ElementNotFoundException {
        String[] data = extractData(students, "-");
        List<String> studentNames = new ArrayList<>(Arrays.asList(data));

        if (exists(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"), 5)) {
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "total_custom_test"), LONG_TIMEOUT);
            click(driver, pageFactory.getLocatorFor(mathFactFluency, "view_report"));
            waitForSpinner(driver, 5);

            List<WebElement> studentProgressData = findElements(driver, pageFactory.getLocatorFor(mathFactFluency, "student_progress_table"), 5);
            int count = 1;

            String[] formatData;
            for (WebElement eachStudent : studentProgressData) {

                WebElement accuracy = eachStudent.findElement(By.xpath("//div[@class='track-table-content'][" + count + "]/div[@class='table-cell-accuracy']"));
                WebElement timeTaken = eachStudent.findElement(By.xpath("//div[@class='track-table-content'][" + count + "]/div[@class='table-cell-time']"));
                WebElement completeOn = eachStudent.findElement(By.xpath("//div[@class='track-table-content'][" + count + "]/div[@class='table-cell-completed']"));
                formatData = studentNames.get(count - 1).split("\\|");
                Assert.assertEquals(accuracy.getText().trim(), formatData[0].trim());
                Assert.assertEquals(timeTaken.getText().trim(), formatData[1].trim());
                Assert.assertEquals(completeOn.getText().trim(), formatData[2].trim());
                count++;
            }
        } else {
            Assert.fail("View Progress Button not visible on Screen");
        }
    }

    public void printWorksheet(String operators, String numberOfQuestions, String timePerQuestion) throws InvalidLocatorException, ElementNotFoundException {
        selectCustomModeOptions(operators, numberOfQuestions, timePerQuestion);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "print_worksheet"));
        if(exists(driver, pageFactory.getLocatorFor(mathFactFluency, "review_settings"),10)){
            click(driver,pageFactory.getLocatorFor(mathFactFluency, "continue"));
            waitForSpinner(driver);
        }
        driver.switchTo().window(driver.getWindowHandles().toArray()[1].toString());
        // Runs javascript code for cancelling print operation.
        // This code only executes for Chrome browsers.
        ((JavascriptExecutor) driver).executeScript("window.print=function(){};");
        // Switches to main window after print dialog operation.
        driver.switchTo().window(driver.getWindowHandles().toArray()[0].toString());
        waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"), SHORT_TIMEOUT);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "view_progress"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(mathFactFluency, "total_custom_test"), LONG_TIMEOUT);
        Assert.assertTrue(exists(driver, pageFactory.getLocatorFor(mathFactFluency, "worksheet_card"), 5), "Worksheet not Assigned");
    }

    private void selectCustomModeOptions(String operators, String numberOfQuestions, String timePerQuestion) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "create_custom_test"));
        String[] data;
        data = extractData(operators, ",");
        for (String eachData : data) {
            if (!exists(driver, By.xpath("//div[@class='fact-detail']/label[text()='" + eachData + "']//preceding-sibling::input[@type='checkbox' and @checked]"), 10)) {
                click(driver, By.xpath("//div[@class='fact-detail']/label[text()='" + eachData + "']//preceding-sibling::input"));
            }
        }
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "select_question_drop_down"), 5);
        click(driver, By.xpath("//span[normalize-space()='" + numberOfQuestions + " Questions']"), 5);
        click(driver, pageFactory.getLocatorFor(mathFactFluency, "time_per_question_drop_down"), 5);
        click(driver, By.xpath("//div[@class='dropdown_box']//following-sibling::div//span[text()='" + timePerQuestion + " sec']"));
    }

    public void verifyTopicFilterInDownloadWorksheet(String topicName) throws InvalidLocatorException, ElementNotFoundException {
        By node = By.xpath("//div[@class='tree-view']//div[1][@class='tree-item level-1  ']/div[@class='item-info']/label[@title='" + topicName + "']");
        String parentWorksheetCount = getParentWorksheetCount(getParentNodeInfo(topicName, node));
        click(driver, node);
        verifyFilterOnDownloadWorksheet(getWorksheetCount(), Integer.parseInt(parentWorksheetCount));
        boolean flag = verifyIfChildNodePresent(topicName);
        int childNodeCount;
        if (flag) {
            childNodeCount = getChildNodeCount(topicName);
            verifyWorksheetCountForChildNodes(childNodeCount, topicName);
        }
    }

    private String getParentNodeInfo(String topicName, By nodeName) {
        return text(driver, nodeName, 5);
    }

    private String getParentWorksheetCount(String topicInfo) {
        return topicInfo.split("\\(")[1].split("\\)")[0];
    }

    private int getWorksheetCount() throws InvalidLocatorException, ElementNotFoundException {
        String worksheetInfo = text(driver, pageFactory.getLocatorFor(downloadWorksheet, "worksheet_count"), 5);
        return Integer.parseInt(worksheetInfo.split(" ")[1]);
    }

    private boolean verifyIfChildNodePresent(String topicName) {
        return exists(driver, By.xpath("//label[@title='" + topicName + "']//parent::div//following-sibling::div[@class='children']"), 5);
    }

    private int getChildNodeCount(String topicName) {
        List<WebElement> childNode = driver.findElements(By.xpath("//label[@title='" + topicName + "']//parent::div//following-sibling::div[@class='children']/div"));
        return childNode.size();
    }

    private void verifyFilterOnDownloadWorksheet(int worksheetCount, int parentWorksheetCount) {
        Assert.assertEquals(worksheetCount, parentWorksheetCount);
    }

    private void verifyWorksheetCountForChildNodes(int count, String topicName) throws InvalidLocatorException, ElementNotFoundException {
        for (int i = 1; i <= count; i++) {
            By node = By.xpath("//label[@title='" + topicName + "']//parent::div//following-sibling::div[@class='children']/div[" + i + "]/div[@class='item-info']/label/span[1]");
            String parentWorksheetCount = getParentWorksheetCount(getParentNodeInfo(topicName, node));
            click(driver, node);
            verifyFilterOnDownloadWorksheet(getWorksheetCount(), Integer.parseInt(parentWorksheetCount));
        }
    }

    public void saveWorkSheet(String numberOfWorksheetToSave) {
        int count = Integer.parseInt(numberOfWorksheetToSave);
        String workSheetName;
        for (int x = 1; x <= count; x++) {
            workSheetName = text(driver, By.xpath("//div[@id='teacher-printable-worksheet-card-list']/div[" + x + "]//child::div[@class='info-container']//div[@class='title']"), 5);
            customStorage.put(workSheetName, "saved");
            click(driver, By.xpath("//div[@id='teacher-printable-worksheet-card-list']/div[" + x + "]//child::div[@class='info-container']//div[@class='actions']/a[@class='bookmark-button ']"));
            waitForSpinner(driver);
        }
    }

    public void verifySavedWorksheet() throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(downloadWorksheet, "saved_worksheet_page"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(downloadWorksheet, "saved_worksheet_list"), 5);
        List<WebElement> savedWorksheetList = findElements(driver, pageFactory.getLocatorFor(downloadWorksheet, "saved_worksheet_list"), DEFAULT_TIMEOUT);
        for (WebElement e : savedWorksheetList) {
            Assert.assertTrue(customStorage.containsKey(e.getText()));
        }
    }

    public void verifyNoSavedAndDownloadedWorksheet() throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        click(driver, pageFactory.getLocatorFor(downloadWorksheet, "saved_worksheet_page"));
        Assert.assertEquals(text(driver, pageFactory.getLocatorFor(downloadWorksheet, "no_saved_worksheet"), 5), "No saved worksheets to show");
        click(driver, pageFactory.getLocatorFor(downloadWorksheet, "worksheet_back_button"));
        waitForElementVisible(driver, pageFactory.getLocatorFor(downloadWorksheet, "saved_worksheet_page"), 5);
        click(driver, pageFactory.getLocatorFor(downloadWorksheet, "download_history_page"));
        Assert.assertEquals(text(driver, pageFactory.getLocatorFor(downloadWorksheet, "no_saved_worksheet"), 5), "There’s no worksheet downloaded yet");
    }

    public void verifyDownloadWorksheet(String numberOfWorksheetToDownload) throws InvalidLocatorException, ElementNotFoundException {
        int count = Integer.parseInt(numberOfWorksheetToDownload);
        String workSheetName;
        for (int x = 1; x <= count; x++) {
            workSheetName = text(driver, By.xpath("//div[@id='teacher-printable-worksheet-card-list']/div[" + x + "]//child::div[@class='info-container']//div[@class='title']"), 5);
            customStorage.put(workSheetName, "download");
            click(driver, By.xpath("//div[@id='teacher-printable-worksheet-card-list']/div[" + x + "]//child::div[@class='info-container']//div[@class='actions']/a[@class='download-button']"));

            driver.switchTo().window(driver.getWindowHandles().toArray()[1].toString());
            // Runs javascript code for cancelling print operation.
            // This code only executes for Chrome browsers.
            ((JavascriptExecutor) driver).executeScript("window.print=function(){};");
            // Switches to main window after print dialog operation.
            driver.switchTo().window(driver.getWindowHandles().toArray()[0].toString());
            waitForSpinner(driver);
            Assert.assertEquals(text(driver, pageFactory.getLocatorFor(downloadWorksheet, "success_notification"), 5), "Worksheet downloaded successfully");
        }

    }

    public void unSaveWorksheet() {
        String key;
        for (Map.Entry<String, Object> entry : customStorage.entrySet()) {
            if (entry.getValue().equals("saved")) {
                key = entry.getKey();
                System.out.println("Get Key = " + key);
                click(driver, By.xpath("//div[text()='" + key + "']//parent::div//following-sibling::div[@class='actions']/a[@class='bookmark-button active']"));
                waitForSpinner(driver);
                customStorage.put(key, "unsave");
            }
        }
    }

    public void verifyUnSavedWorksheet() {
        String key;
        for (Map.Entry<String, Object> entry : customStorage.entrySet()) {
            if (entry.getValue().equals("unsaved")) {
                key = entry.getKey();
                System.out.println("Get Key = " + key);
                System.out.println("Text = " + text(driver, By.xpath("//div[text()='" + key + "']//parent::div//following-sibling::div[@class='actions']/a[@class='bookmark-button ']//label"), 5));
                Assert.assertEquals(text(driver, By.xpath("//div[text()='" + key + "']//parent::div//following-sibling::div[@class='actions']/a[@class='bookmark-button ']//label"), 5), "Save");
            }
        }
    }

    public void verifyEmptyState(String locator, String expectedText) throws InvalidLocatorException, ElementNotFoundException {
        Assert.assertEquals(text(driver,pageFactory.getLocatorFor(assignmentSubPage,locator),5),expectedText, "Invalid Empty State");
    }

    public void verifyEmptyStateFromDropDown(String selectState, String expectedText) throws InvalidLocatorException, ElementNotFoundException {
        click(driver, pageFactory.getLocatorFor(assignmentSubPage,"assignment_drop_down"));
        click(driver, By.xpath(" //div[@class='dropdown common-dropdown open']//li[text()='"+selectState+"']"));
        Assert.assertEquals(text(driver,pageFactory.getLocatorFor(assignmentSubPage,"empty_state_text"),5),expectedText, "Invalid Empty State from drop down");
    }
    public void userIsOnProfilePage(String userType) throws InvalidLocatorException, ElementNotFoundException {
        if(userType.equalsIgnoreCase("teacher")){
            waitForElementVisible(driver,pageFactory.getLocatorFor(teacherProfile,"update_profile"),10);
            Assert.assertTrue(exists(driver,pageFactory.getLocatorFor(teacherProfile,"update_profile"),2),"Teacher not on Profile Page");
        }
        else if(userType.equalsIgnoreCase("parent")){
            waitForElementVisible(driver,pageFactory.getLocatorFor(parentAccountDetail,"update"),10);
            Assert.assertTrue(exists(driver,pageFactory.getLocatorFor(parentAccountDetail,"update"),2),"Parent not on Profile Page");
        }
        else{
            Assert.fail("Invalid User = " + userType);
        }

    }

    public void handleSurveyQuestionPage() throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        waitForSpinner(driver);
        if(!exists(driver,pageFactory.getLocatorFor(addKlassStudentsPage, "add_students"),3) && (driver.getCurrentUrl().contains("/signup/survey"))){
            List<WebElement> surveyQuestionCount = findElements(driver, pageFactory.getLocatorFor(teacherSignup, "survey_question_list"), 5);
            int i = 1 ;
            while(i < surveyQuestionCount.size()){
                click(driver, pageFactory.getLocatorFor(teacherSignup, "survey_question_select_opt"));
                if(exists(driver,pageFactory.getLocatorFor(teacherSignup,"survey_question_cta_enabled_button"), 2)){
                    click(driver, pageFactory.getLocatorFor(teacherSignup, "survey_question_select_opt"));
                    click(driver,pageFactory.getLocatorFor(teacherSignup,"survey_question_cta_enabled_button"),2);
                }
                i++ ;
            }
        }

    }

    public void changeClassCode() throws IOException, UnsupportedFlavorException, InvalidLocatorException, ElementNotFoundException {
        waitForElementVisible(driver, pageFactory.getLocatorFor(studentRoster, "roster_page_class_code"),5);
        String oldClassCode = text(driver, pageFactory.getLocatorFor(studentRoster, "roster_page_class_code"),5);
        data.put("old_class_code", oldClassCode);
        System.out.println("Old Class Code = " + data.get("old_class_code"));
        click(driver,pageFactory.getLocatorFor(studentRoster, "regenerate_class_code"));
        click(driver,pageFactory.getLocatorFor(studentRoster,"confirm_regenerate_class_code"));
        waitForSpinner(driver);
        closeStudentLoginInstructionModal();
        String newClassCode = text(driver, pageFactory.getLocatorFor(studentRoster, "roster_page_class_code"),5);
        data.put("new_class_code", newClassCode);
        Assert.assertNotEquals(newClassCode, oldClassCode);
        Assert.assertEquals(newClassCode, text(driver,pageFactory.getLocatorFor(teacherDashboardPage, "classcode"),5));
    }
    public void verifyLoginUsingClassCode() throws IOException, InvalidLocatorException, ElementNotFoundException {
        startBrowser("student");
        type(driver, pageFactory.getLocatorFor(loginPage, "class_code"), data.get("old_class_code"));
        Assert.assertEquals(text(driver, pageFactory.getLocatorFor(loginPage, "class_code_error"),5),"This Class Code is incorrect or expired. Please try again.");
        type(driver, pageFactory.getLocatorFor(loginPage, "class_code"), data.get("new_class_code"));
        Assert.assertEquals(text(driver,pageFactory.getLocatorFor(studentCentre, "student_profile"),5), "Select Your Profile");
    }

    private void startBrowser(String resourceUrl) throws IOException {
        new Hooks(testContext).startBrowser();
        driver = testContext.getDriver();
        open(driver, TestContext.url, resourceUrl);
    }

    public void changeTeacherPassword(String oldPassword, String newPassword) {
        try {
            click(driver, pageFactory.getLocatorFor(teacherProfile, "change_password"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(editPassword, "current_password"));
            type(driver,pageFactory.getLocatorFor(editPassword, "current_password"), oldPassword);
            type(driver,pageFactory.getLocatorFor(editPassword, "new_password_field"), newPassword);
            type(driver,pageFactory.getLocatorFor(editPassword, "confirm_new_password"), newPassword);
            click(driver, pageFactory.getLocatorFor(editPassword, "change_button"));
            waitForSpinner(driver);
            customStorage.put("new_password", newPassword);
        } catch (InvalidLocatorException | ElementNotFoundException e) {
            logger.info("Unable to change UserPassword" + e.getLocalizedMessage());
        }
    }

    public void visitAccountSettings(String dob, String parentPassword){
        try {
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            refreshPage(driver);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            if(exists(driver, pageFactory.getLocatorFor(studentDashboard, "live_classes_popup"),DEFAULT_TIMEOUT))
                click(driver, pageFactory.getLocatorFor(studentDashboard, "live_classes_popup"));
            waitForElement(driver, pageFactory.getLocatorFor(parentDashboard, "parents_menu"));
            click(driver, pageFactory.getLocatorFor(parentDashboard, "parents_menu"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(parentDashboard, "settings"));
            click(driver, pageFactory.getLocatorFor(parentDashboard, "settings"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(parentDashboard, "parent_dob_password"));
            type(driver,pageFactory.getLocatorFor(parentDashboard, "parent_dob_password"), dob);
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(parentMenuPage, "account_details"));
            click(driver, pageFactory.getLocatorFor(parentMenuPage, "account_details"));
            waitForNoElement(driver, pageFactory.getLocatorFor(studentDashboard, "new_page_loader"));
            click(driver, pageFactory.getLocatorFor(parentAccountDetail, "edit_parent_profile_btn"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(parentAccountDetail, "change_email_link"));
            click(driver, pageFactory.getLocatorFor(parentAccountDetail, "change_email_link"));
            waitForElementVisible(driver, pageFactory.getLocatorFor(editParentEmailPage, "password"));
            type(driver,pageFactory.getLocatorFor(editParentEmailPage, "password"), parentPassword);
            
        } catch (InvalidLocatorException | ElementNotFoundException e) {
            logger.info("Unable to change UserEmail " + e.getLocalizedMessage());
        }
    }

    public void verifyPricingTest(String email){
        UserPricingtestDAO userPricingtestDAO = new UserPricingtestDAO();
        PricingTests pt = userPricingtestDAO.getUserPricingtestFromDB(email);
        Assert.assertTrue(pt.getCode().equalsIgnoreCase("EXP_AR_MELA_ONLY_PACKS"), "Pricing Text Not Matched");
    }
}