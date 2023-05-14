package com.splashlearn.pageobjects;

import io.cucumber.java.en.And;
import org.apache.commons.lang.WordUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;

public class StudentCentrePage extends BasePage{

    public StudentCentrePage(WebDriver driver) {
        super(driver);
    }

    private final By studentPicPassword = By.cssSelector("div.picture-pass-list-wrap.js-pictures");
    private final By studentTextPassword = By.id("textpwd");
    private final By signIn = By.xpath("//*[text()='Sign in']");
    private final By backIcon = By.xpath("//a[@class='back-button-signout']");
    private final By textPassword = By.id("password");

    public void selectStudent(String studentName){
        click(driver, By.xpath("//*[@class='students-list-wrap']//*[text()='" + WordUtils.capitalize(studentName, new char[]{' '}) + "']/parent::li"));
        waitForAnyoneElementToBeVisible(driver, studentTextPassword, studentPicPassword, DEFAULT_TIMEOUT);
        waitForSpinner(driver);
    }
    public void selectStudentFromNewUI(String studentName){
        click(driver, By.xpath("//label[text()='"+studentName+"']//parent::div[@class='student']"));
    }

    public void signinViaTextPassword(String classTextPassword) {
        waitForElementVisible(driver, studentTextPassword, DEFAULT_TIMEOUT);
        type(driver, studentTextPassword, classTextPassword);
        click(driver, signIn);
        waitForElementInvisible(driver, newPageLoader);
    }

    public void selectSignIn(){
        click(driver, signIn);
        waitForElementInvisible(driver, newPageLoader);
    }
    public void enterPassword(String classTextPassword){
        waitForElementVisible(driver, textPassword, DEFAULT_TIMEOUT);
        clear(driver, textPassword, DEFAULT_TIMEOUT);
        type(driver, textPassword, classTextPassword);
    }
    public void waitForScreen(){
        explicitSleep(30);
    }

    public void signinViaPicturePassword(String classPicturePassword) {
        By pictureToChoose = By.xpath("//img[@src='" + classPicturePassword + "']/parent::a");
        waitForElementVisible(driver, pictureToChoose, DEFAULT_TIMEOUT);
        click(driver, pictureToChoose);
        waitForElementInvisible(driver, newPageLoader);
    }

}
