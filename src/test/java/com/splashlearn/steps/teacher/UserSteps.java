package com.splashlearn.steps.teacher;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.splashlearn.apiHelper.TeacherData;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.domainobjects.LoginDetails;
import io.cucumber.java.en.And;
import org.openqa.selenium.WebDriver;

import java.util.Map;

public class UserSteps {
    private final TestContext context ;
    private final DomainObjectContext domainObjectContext ;
    private final Map<String, Object> customStorage;
    private final Evaluator evaluator = new Evaluator();
    private final WebDriver driver;

    public UserSteps(TestContext context){
        this.context = context;
        driver = context.getDriver();
        customStorage = context.getCustomStorage();
        this.domainObjectContext = context.getDomainObjectContext();
    }

    @And("the user logins using api with details :")
    public void the_user_logins_using_api_with_details(LoginDetails loginDetails) throws JsonProcessingException {
        domainObjectContext.setLoginDetails(loginDetails);
        TeacherData teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(domainObjectContext.getLoginDetails().getUserEmail(),
                domainObjectContext.getLoginDetails().getUserPassword());
    }

    @And("the user logins into application")
    public void theUserLoginsIntoApplication() {
        TeacherData teacherData = new TeacherData(context);
        teacherData.getTeacherKlassStudentData(evaluator.evaluate(context.getData(), context.getData().get("username")),
                evaluator.evaluate(context.getData(), context.getData().get("password")));
        context.cookies.injectCookiesToBrowser(driver);
    }
}
