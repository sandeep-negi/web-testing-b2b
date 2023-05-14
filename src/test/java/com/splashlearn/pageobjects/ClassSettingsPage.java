package com.splashlearn.pageobjects;

import com.splashlearn.core.selenium.SeleniumActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.UUID;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;

public class ClassSettingsPage extends BasePage {

    private final By classSettingsClassName = By.xpath("//input[@class='class-settings-options-classroom-name']");
    private final By saveChangesBtn = By.xpath("//span[text()='Save Changes']");
    private final By manageClassBtn = By.id("manage_class");
    private final By deleteKlass = By.xpath("//*[text()='Delete Class']");
    private final By deleteKlassInput = By.xpath("//div[@class='overlay']//input[@class='delete-class-input']");
    private final By permanentlyDeleteKlass = By.xpath("//span[text()='Permanently delete this class']");
    private final By classGradeName = By.xpath("//div[@class='selected-item ']/span[@class='grade-name']");
    private final By passwordModeCommon = By.xpath("//label[text()='Password Mode']//following-sibling::div[@class='class-settings-options']//label[text()='Common']//parent::div/div");
    private final By passwordModeIndividual = By.xpath("//label[text()='Password Mode']//following-sibling::div[@class='class-settings-options']//label[text()='Individual']//parent::div/div");
    private final By passwordTypeText = By.xpath("//label[text()='Password Type']//following-sibling::div[@class='class-settings-options']//label[text()='Text']//parent::div/div");
    private final By passwordTypePicture = By.xpath("//label[text()='Password Type']//following-sibling::div[@class='class-settings-options']//label[text()='Picture']//parent::div/div");
    private final By studentRosterBtn = By.xpath("//span[text()='Student roster']");
    private final By goToStudentRosterPage = By.xpath("//li[text()='Student roster']");
    private final By addStudentsBtn = By.xpath("//span[text()='Add Students']");

    public boolean isUserOnClassSettingsPage() {
        return exists(driver, manageClassBtn, 3);
    }

    public ClassSettingsPage(WebDriver driver) {
        super(driver);
    }

    public void clickSaveChangesBtn() {
        click(driver, saveChangesBtn);
        waitForSpinner(driver);

    }

    public void clickClassNameTextBox() {
        click(driver, classSettingsClassName);
        waitForSpinner(driver);
    }

    public String getKlassName() {
        return getAttribute(driver, classSettingsClassName, 3, "value");
    }

    public String getKlassGrade() {
        return text(driver, classGradeName, 3);
    }

    public void clearClassNameTextBox() {
        clear(driver, classSettingsClassName, 3);
    }

    public void sendKeysToClassNameTextBox() {
        type(driver, classSettingsClassName, UUID.randomUUID().toString().substring(0, 4));
    }

    public void deleteKlass() {
        click(driver, deleteKlass);
        waitForElementVisible(driver, deleteKlassInput, 3);
        type(driver, deleteKlassInput, "delete", 3);
        click(driver, permanentlyDeleteKlass, 3);
        waitForSpinner(driver);
    }

    public void selectGrade(String gradeName) {
        click(driver, classGradeName, 3);
        click(driver, By.xpath("//div[@class='dropdown-list']//span[text()='" + gradeName + "']"), 3);
        click(driver, saveChangesBtn, 3);
    }

    public void clickStudentRoster() {
        click(driver, studentRosterBtn);
        waitForElementVisible(driver, addStudentsBtn);

    }

    public String getStudentPasswordByText(String studentName) {
        return text(driver, By.xpath("//div[text()='" + studentName + "']//parent::div[@class='student-name']//following-sibling::div[@class='student-password']"), 3);

    }

    public String getStudentPasswordByPicture(String studentName) {
        return getAttribute(driver, By.xpath("//div[text()='" + studentName + "']//parent::div[@class='student-name']//following-sibling::div[@class='student-password']//img"), 3, "src");
    }

    public void selectOptionPasswordModeIndividualAndPasswordTypeText() {
        click(driver, passwordModeIndividual, 3);
        click(driver, passwordTypeText, 3);
    }

    public void selectOptionPasswordModeIndividualAndPasswordTypePicture() {
        click(driver, passwordModeIndividual, 3);
        click(driver, passwordTypePicture, 3);
    }

    public void selectOptionPasswordModeCommonAndPasswordTypeText() {
        click(driver, passwordModeCommon, 3);
        click(driver, passwordTypeText, 3);
    }

    public void selectOptionPasswordModeCommonAndPasswordTypePicture() {
        click(driver, passwordModeCommon, 3);
        click(driver, passwordTypePicture, 3);
    }
}


