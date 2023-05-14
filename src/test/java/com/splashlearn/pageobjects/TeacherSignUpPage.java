package com.splashlearn.pageobjects;

import com.splashlearn.core.DataGenerator;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;
import static com.splashlearn.constants.SplashLearnConstants.MEDIUM_TIMEOUT;

public class TeacherSignUpPage extends BasePage{

    public TeacherSignUpPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id = "user_first_name") private WebElement firstname;
    @FindBy(id = "user_last_name") private WebElement lastname;
    @FindBy(id = "user_email") private WebElement teacherEmail;
    @FindBy(id = "user_password") private WebElement userPassword;
    @FindBy(id = "user_dob_year") private WebElement userDob;
    @FindBy(id = "submit_1") private WebElement signUpBtn;
    @FindBy(id="cities-name-with-suggestions") private WebElement cityName ;
    @FindBy(id="user_institution_attributes_name_usa") private WebElement schoolName ;
    @FindBy(id="school-information-added") private WebElement setYourSchoolBtn;
    @FindBy(id="user_institution_attributes_zip_usa") private WebElement zipCode;

    private final By usSchoolLink = By.xpath("//a[text()='Find US schools here']");
    private final By nonUsSchoolLink = By.xpath("//a[text()='Find non-US schools here']");
    private final By nonUsCountry = By.id("user_institution_attributes_country_code");
    private final By nonUsState = By.id("user_institution_attributes_state_code");
    private final By bubbleWaitIcon = By.xpath("//*[@id='spinner' and contains(@style,'display')]//*[@class='bubblingG']");
    private final By city = By.xpath("//*[@id='school-name-with-suggestions' or @id='cities-name-with-suggestions']");
    private final By school = By.xpath("//*[contains(@id, 'user_institution_attributes_name')]");
    private final By uSZipCode = By.xpath("//*[contains(@id,'user_institution_attributes_zip')]");
    private final By nonUSZipCode = By.xpath("//*[contains(@id,'user_institution_attributes_zip')]");
    private final By setSchool = By.id("school-information-added");
    private final By password = By.id("user_password");
    private final By classroomLinkSignUpBtn = By.id("classroom-linked-signup-button");

    public TeacherSignUpPage fillSignUpForm(String userEmail, String password) {
        DataGenerator dataGenerator = new DataGenerator();
        wait.until(ExpectedConditions.visibilityOf(firstname)).sendKeys(dataGenerator.firstName());
        lastname.sendKeys(dataGenerator.lastName());
        teacherEmail.sendKeys(userEmail);
        userPassword.sendKeys(password);
        userDob.sendKeys("1990");
        signUpBtn.click();
        waitForSpinner(driver);
        return this;
    }

    public TeacherSignUpPage setUSSchool(){
        DataGenerator dataGenerator = new DataGenerator();
        waitForAnyoneElementToBeVisible(driver, usSchoolLink, nonUsSchoolLink, MEDIUM_TIMEOUT);
        clickIfPresent(driver, usSchoolLink, MEDIUM_TIMEOUT);
        waitForSpinner(driver);
        type(driver, city, dataGenerator.city());
        type(driver, school, dataGenerator.school());
        type(driver, school, Keys.TAB);
        type(driver, uSZipCode, dataGenerator.zipCode());
        type(driver, uSZipCode, Keys.TAB);
        click(driver,setSchool);
        waitForSpinner(driver);
        return this;
    }

    public TeacherSignUpPage setNonUSSchool(String country, String state){
        DataGenerator dataGenerator = new DataGenerator();
        waitForAnyoneElementToBeVisible(driver, usSchoolLink, nonUsSchoolLink, MEDIUM_TIMEOUT);
        clickIfPresent(driver, nonUsSchoolLink, MEDIUM_TIMEOUT);
        select(driver, nonUsCountry, country, DEFAULT_TIMEOUT);
        waitForNoElement(driver, bubbleWaitIcon);
        select(driver, nonUsState, state, DEFAULT_TIMEOUT);
        waitForNoElement(driver, bubbleWaitIcon);
        type(driver, city, dataGenerator.city());
        type(driver, school, dataGenerator.school());
        type(driver, school, Keys.TAB);
        type(driver, nonUSZipCode, dataGenerator.zipCode());
        type(driver, nonUSZipCode, Keys.TAB);
        click(driver, setSchool);
        waitForSpinner(driver);
        return this;
    }
    public void classroomLinkSignUp(){
        type(driver, password, "123456");
        click(driver, classroomLinkSignUpBtn);
        waitForSpinner(driver);
        waitForElementInvisible(driver, newPageLoader);
    }

}
