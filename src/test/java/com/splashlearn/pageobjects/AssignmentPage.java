package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;

public class AssignmentPage extends BasePage{

    public AssignmentPage(WebDriver driver) {
        super(driver);
    }
    private final By assignmentNudge = By.xpath("//div[@id='nudges-overlay-id']/div[@class='sc-ipEyDJ hopKqu']");
    private final By assignToWholeKlass = By.xpath("//span[text()='Assign to the Whole Class']");
    private final By closePopUp = By.xpath("//button[@class='iconcust-iconCross cross-icon']");

    public String getStatus(String loName){
        waitForElementVisible(driver,By.xpath("//h3[text()='"+loName+"']//parent::div//p[@class='status']"),DEFAULT_TIMEOUT);
        return text(driver, By.xpath("//h3[text()='"+loName+"']//parent::div//p[@class='status']"), DEFAULT_TIMEOUT);
    }


    public AssignmentPage selectAssignCurriculum(String subject){
        moveToElementUsingJavaScript(driver, By.xpath("//li[text()='"+subject+"']//following-sibling::*[position()=1][@id='assign']"), DEFAULT_TIMEOUT);
        click(driver, By.xpath("//li[text()='"+subject+"']//following-sibling::*[position()=1][@id='assign']"));
        return this;
    }

    public AssignmentPage selectTrackAssignment(String subject){
        moveToElementUsingJavaScript(driver, By.xpath("//li[text()='"+subject+"']//following-sibling::*[position()=1][@id='assign']//ul/li/span[text()='Track assignment']"), DEFAULT_TIMEOUT);
        click(driver, By.xpath("//li[text()='"+subject+"']//following-sibling::*[position()=1][@id='assign']//ul/li/span[text()='Track assignment']"));
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        return this;
    }
    public AssignmentPage selectNewAssignment(String subject){
        click(driver, By.xpath("//li[text()='"+subject+"']//following-sibling::*[position()=1][@id='assign']//ul/li/span[text()='New assignment']"));
        return this;
    }

    public AssignmentPage loadNewAssignmentPage(String klassSlug, String klassGrade) {
        loadUrl("class/" + klassSlug + "/grades/" + klassGrade + "/curriculum");
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        return this;
    }

    public void assignAssignment(String LOName){
        waitForElementVisible(driver, By.xpath("//span[text()='"+LOName+"']//ancestor::label//following-sibling::div[@class='assign-status']/a[text()='Assign']"));
        click(driver,By.xpath("//span[text()='"+LOName+"']//ancestor::label//following-sibling::div[@class='assign-status']/a[text()='Assign']"));
        waitForSpinner(driver);
        click(driver, assignToWholeKlass);
        waitForSpinner(driver);
        click(driver, closePopUp);
        if(exists(driver, By.xpath("//span[text()='"+LOName+"']/ancestor::label/following-sibling::div[@class='assign-status']//h4[text()='Got it']"), DEFAULT_TIMEOUT)){
            click(driver, By.xpath("//span[text()='"+LOName+"']/ancestor::label/following-sibling::div[@class='assign-status']//h4[text()='Got it']"));
        }
    }
    public void selectContentGroup(String contentGroup){
        waitForElementVisible(driver, By.xpath("//span[text()='"+contentGroup+"']"));
        click(driver, By.xpath("//span[text()='"+contentGroup+"']"));
    }
    public boolean isNudgeAppearing(){
        return exists(driver, assignmentNudge, DEFAULT_TIMEOUT);
    }
}
