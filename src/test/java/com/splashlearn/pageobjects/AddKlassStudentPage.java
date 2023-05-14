package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;

public class AddKlassStudentPage extends BasePage{
    public AddKlassStudentPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id="klass_name") private WebElement klassName ;
    @FindBy(css = "input.primary-cta-button.fw.submit-but") private WebElement createNewKlassBtn ;
    @FindBy(css = "input.primary-cta-button.fw.submit-but") private WebElement createNewClassBtn;
    @FindBy(xpath = "//button[text()='Add Students']") private WebElement addStudents;
    @FindBy(xpath = "//textarea[@placeholder='Copy paste all names here in one go']") private WebElement studentNames ;
    @FindBy(xpath = "//button[text()='Continue']") private WebElement continueBtn ;
    @FindBy(id = "students-added") private WebElement addStudentsOnControlPage;
    @FindBy(name = "student_names") private WebElement studentNamesOnControlPage ;
    @FindBy(linkText = "Done Adding Students") private WebElement doneAddingStudentsOnControlpage ;


    private final By klassGrade = By.name("klass[grade_id]");
    private final By klassSubject = By.id("klass_subject_preference");


    public AddKlassStudentPage addUsKlass(String klass, String grade, String subject){
        waitForSpinner(driver);
        wait.until(ExpectedConditions.visibilityOf(klassName)).sendKeys(klass);
        select(driver, klassGrade, grade, DEFAULT_TIMEOUT);
        select(driver, klassSubject, subject, DEFAULT_TIMEOUT);
        createNewKlassBtn.click();
        waitForSpinner(driver);
        return this;
    }

    public AddKlassStudentPage addNonUsKlass(String klass, String grade){
        waitForSpinner(driver);
        wait.until(ExpectedConditions.visibilityOf(klassName)).sendKeys(klass);
        select(driver,klassGrade, grade, DEFAULT_TIMEOUT);
        createNewKlassBtn.click();
        waitForSpinner(driver);
        return this;
    }

    public void addStudentsVariantPage(){
        wait.until(ExpectedConditions.visibilityOf(studentNames)).sendKeys("alpha,beta");
        addStudents.click();
        waitForSpinner(driver);
        wait.until(ExpectedConditions.elementToBeClickable(continueBtn)).click();
        wait.until(ExpectedConditions.invisibilityOf(continueBtn));
        waitForSpinner(driver);
    }
    public void addStudentsControlPage(){
        wait.until(ExpectedConditions.visibilityOf(studentNamesOnControlPage)).sendKeys("alpha,beta");
        addStudentsOnControlPage.click();
        waitForSpinner(driver);
        wait.until(ExpectedConditions.elementToBeClickable(doneAddingStudentsOnControlpage)).click();
        wait.until(ExpectedConditions.invisibilityOf(doneAddingStudentsOnControlpage));
        waitForSpinner(driver);
    }

}
