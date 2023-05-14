package com.splashlearn.steps.teacher;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.Evaluator;
import com.splashlearn.core.selenium.SeleniumActions;
import com.splashlearn.custom.api.model.pojo.addklass.AddKlassResponseInfo;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.exceptions.ElementNotFoundException;
import com.splashlearn.exceptions.InvalidLocatorException;
import com.splashlearn.pageobjects.ClassSettingsPage;
import com.splashlearn.pageobjects.PageFactoryManager;
import com.splashlearn.pageobjects.TeacherDashboardPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.restassured.response.Response;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.Assert;

import java.util.*;

public class ClassSettingsSteps {
    private final ClassSettingsPage classSettingsPage;
    private final TeacherDashboardPage teacherDashboardPage;
    private final WebDriver driver;
    private final Map<String, Object> customStorage;
    private final TestContext context;
    private final DomainObjectContext domainObjectContext;
    private final Map<String, String> data;
    private final Evaluator evaluator = new Evaluator();


    public ClassSettingsSteps(TestContext context) {
        this.context = context;
        driver = context.getDriver();
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
        classSettingsPage = PageFactoryManager.getClassSettingsPage(driver);
        teacherDashboardPage = PageFactoryManager.getTeacherDashboardPage(driver);
        this.data = context.getData();
    }

    @And("the user lands on class settings page")
    public void theUserIsOnClassSettingsPage() {
        teacherDashboardPage.handleSummerLearningPopUp();
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        Assert.assertTrue(classSettingsPage.isUserOnClassSettingsPage());
    }

    @Then("Verify user is able to change the class name")
    public void verifyUserIsAbleToChangeTheClassName() {
        classSettingsPage.clickClassNameTextBox();
        String oldKlassName = classSettingsPage.getKlassName();
        System.out.println("klass name = " + oldKlassName);
        classSettingsPage.clearClassNameTextBox();
        classSettingsPage.sendKeysToClassNameTextBox();
        String newKlassName = classSettingsPage.getKlassName();
        System.out.println("klass name = " + newKlassName);
        classSettingsPage.getKlassName();
        classSettingsPage.clickSaveChangesBtn();
        Assert.assertNotEquals(newKlassName, oldKlassName, "Klass name not changed");
  }

    @Then("Verify user is able to delete the class")
    public void verifyUserIsAbletoDeleteTheClass() throws JsonProcessingException, InvalidLocatorException, ElementNotFoundException {
        createNewClass();
        deleteAddedKlass();
   }
    public void createNewClass() throws JsonProcessingException, InvalidLocatorException, ElementNotFoundException {
        DataGenerator dataGenerator = new DataGenerator();
        TeacherData teacherData ;
        String className = dataGenerator.firstName() + "_1st";
        TeacherDashboardApi teacherDashboardApi;
        Map<String, String> values = new HashMap<>();
        String gradeCode = "1";
        String subjectPreferenceCd = "0";
        values.put("klassName", className);
        values.put("gradeCode", gradeCode);
        values.put("subjectPreferenceCd", subjectPreferenceCd);

        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        Response responseStatus = teacherDashboardApi.addNewKlass(values, context.sessionId);

        ObjectMapper mapper = new ObjectMapper();
        AddKlassResponseInfo addKlassResponseInfo = mapper.readValue(responseStatus.body().asString(), AddKlassResponseInfo.class);

        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        teacherDashboardApi.addStudents(addKlassResponseInfo.getId(), context.sessionId);

        teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(evaluator.evaluate(context.getData(), context.getData().get("username")),
                evaluator.evaluate(context.getData(), context.getData().get("password")));

        String klassSlug = teacherData.getKlassSlug(className);
        String gradeId = teacherData.getKlassGradeId(className);
        String klassId = teacherData.getKlassId(className);

        customStorage.put("klassId", klassId);
        context.cookies.injectCookiesToBrowser(driver);
        teacherDashboardPage.loadUrl("teacher/class/" + klassSlug + "/grades/" + gradeId + "/dashboard");
        getKlassStudents();
    }

    public void getKlassStudents() throws JsonProcessingException, InvalidLocatorException, ElementNotFoundException {
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        Response studentResponse = teacherDashboardApi.getStudents(customStorage.get("klassId").toString(), context.sessionId);
        ObjectMapper studentResponseMapper = new ObjectMapper();
        StudentResponse[] studentResponses = studentResponseMapper.readValue(studentResponse.body().asString(), StudentResponse[].class);
        List<StudentResponse> st = new ArrayList<>();
        Map<String, String> studentData = new HashMap<>();

        for (StudentResponse student : studentResponses) {
            int i = 0;
          studentData.put("studentId" + i, student.getId());
               studentData.put("firstName" + (i + 1), student.getFirstName());
            studentData.put("lastName" + (i + 2), student.getLastName());
            studentData.put("gradeCode" + (i + 3), student.getGradeCode());
            studentData.put("picturePassword" + (i + 4), student.getPicturePassword());
            studentData.put("plainPassword" + (i + 5), student.getPlainTextPassword());
            st.add(student);
            domainObjectContext.setStudentResponse(st);
            i++;
        }
        storeKlassCodeAndPassword();
    }

    public void storeKlassCodeAndPassword() throws InvalidLocatorException, ElementNotFoundException {
        data.put("class_code", teacherDashboardPage.getClassCode());
        if (teacherDashboardPage.isPicturePassword()) {
            data.put("pic_password", teacherDashboardPage.getStudentPicPassword());
        } else {
            data.put("text_password", teacherDashboardPage.getStudentTextPassword());
      }
        teacherDashboardPage.verifyShareStudentLoginPopup();
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
    }
    public void deleteAddedKlass(){
        String klassName = classSettingsPage.getKlassName();
        classSettingsPage.deleteKlass();
        teacherDashboardPage.clickClassNameDropdown();
        Assert.assertTrue(teacherDashboardPage.isKlassExists(klassName), "klass not deleted");
    }

    @Then("Verify user is able to change the class grade")
    public void verifyUserIsAbleToChangeTheClassGrade(){
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        String oldKlassGrade = classSettingsPage.getKlassGrade();
        HashSet<String> grades = new HashSet<>();
        grades.add("Kindergarten");
        grades.add("Grade 1");
        grades.add("Grade 2");
        grades.add("Grade 3");
        grades.add("Grade 4");
        grades.add("Grade 5");
        grades.remove(oldKlassGrade);
        String gradeName = grades.iterator().next();
        classSettingsPage.selectGrade(gradeName);
        String newKlassGrade = classSettingsPage.getKlassGrade();
        classSettingsPage.getKlassName();
        classSettingsPage.clickSaveChangesBtn();
        Assert.assertNotEquals(oldKlassGrade,newKlassGrade, "Grade name not changed");

    }


    @Then("Verify user is able to change the password mode as Individual and password type as Text")
    public void verifyUserIsAbleToChangeThePasswordModeAsIndividualAndPasswordTypeAsText() {

        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        classSettingsPage.selectOptionPasswordModeIndividualAndPasswordTypeText();
        classSettingsPage.clickSaveChangesBtn();
        classSettingsPage.clickStudentRoster();
        HashSet<String> studentData = new HashSet<>();
        int studentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        for (int i = 0; i < studentCount; i++) {
            String studentName = domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName();
            String userPassword = classSettingsPage.getStudentPasswordByText(studentName);

            studentData.add(userPassword);
        }
            Assert.assertEquals(studentCount, studentData.size(), "Student password is not unique");
    }

    @Then("Verify user is able to change the password mode as Individual and password type as Picture")
    public void verifyUserIsAbleToChangeThePasswordModeAsIndividualAndPasswordTypeAsPicture() {
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        classSettingsPage.selectOptionPasswordModeIndividualAndPasswordTypePicture();
        classSettingsPage.clickSaveChangesBtn();
        classSettingsPage.clickStudentRoster();
        HashSet<String> studentData = new HashSet<>();
        int studentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        for (int i = 0; i < studentCount; i++) {
            String studentName = domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName();
            String newStr = studentName.substring(0, 1).toUpperCase() + studentName.substring(1);
            String userPassword = classSettingsPage.getStudentPasswordByPicture(newStr);
            System.out.println("user password = " + userPassword);
            studentData.add(userPassword);
        }
         Assert.assertEquals(studentCount, studentData.size(), "Student password is not unique");
    }

    @Then("Verify user is able to change the password mode as Common and password type as Text")
    public void verifyUserIsAbleToChangeThePasswordModeAsCommonAndPasswordTypeAsText() {
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        classSettingsPage.selectOptionPasswordModeCommonAndPasswordTypeText();
        classSettingsPage.clickSaveChangesBtn();
        classSettingsPage.clickStudentRoster();
        HashSet<String> studentData = new HashSet<>();
        int studentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        for (int i = 0; i < studentCount; i++) {
            String studentName = domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName();
            String userPassword = classSettingsPage.getStudentPasswordByText(studentName);
            studentData.add(userPassword);
        }
        Assert.assertEquals(1, studentData.size(), "Student password is unique");

    }

    @Then("Verify user is able to change the password mode as Common and password type as Picture")
    public void verifyUserIsAbleToChangeThePasswordModeAsCommonAndPasswordTypeAsPicture() {
        teacherDashboardPage.clickManageClassBtn();
        teacherDashboardPage.clickClassSettingsBtn();
        classSettingsPage.selectOptionPasswordModeCommonAndPasswordTypePicture();
        classSettingsPage.clickSaveChangesBtn();
        classSettingsPage.clickStudentRoster();
        HashSet<String> studentData = new HashSet<>();
        int studentCount = domainObjectContext.getTeacherKlassInfo().getStudentResponses().size();
        for (int i = 0; i < studentCount; i++) {
            String studentName = domainObjectContext.getTeacherKlassInfo().getStudentResponses().get(i).getFirstName();
            String newStr = studentName.substring(0, 1).toUpperCase() + studentName.substring(1);
            String userPassword = classSettingsPage.getStudentPasswordByPicture(newStr);
            studentData.add(userPassword);
        }
        Assert.assertEquals(1, studentData.size(), "Student password is unique");
    }
}











