package com.splashlearn.pageobjects;

import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class AssessmentPage extends BasePage{

    public AssessmentPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(css="li.nav-link.active") private WebElement assessmentActiveTab;
    @FindBy(css="div.progress-bar") private WebElement assessmentProgressBar;
    @FindBy(css = "span.assessment-action-btn.secondary-cta-button") private WebElement completeAssessmentBtn;
    @FindBy(xpath = "//span[text()='Okay'or text()='Yes']") private WebElement okBtn;
    @FindBy(xpath = "//span[text()='Cancel'or text()='No']") private WebElement noBtn;
    @FindBy(xpath = "//div[@class='assessment-container']") private WebElement allAssessmentContainer;
    @FindBy(xpath = "//div[@class='assignment-landing-page' or @class='assessment-wrap']") private WebElement trackAssessmentContainer;
    @FindBy(css="p.back-link > span > i") private WebElement backToAssessment ;

    public AssessmentPage loadNewAssessment(String klassSlug, String klassGrade){
        loadUrl("class/"+klassSlug+"/grades/"+klassGrade+"/class_assessment");
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        return this;
    }
    public AssessmentPage loadTrackAssessment(String klassSlug, String klassGrade){
       loadUrl("class/"+klassSlug+"/grades/"+klassGrade+"/track_assessment");
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        return this;
    }

    public String activeTabOnAssessmentPage(){
        wait.until(ExpectedConditions.visibilityOf(assessmentActiveTab)).isDisplayed();
        return assessmentActiveTab.getText();
    }

    public AssessmentPage clickSeeReports(String assessmentName){
        wait.until(ExpectedConditions.visibilityOf(assessmentProgressBar)).isDisplayed();
        driver.findElement(By.xpath("//h6[text()='"+assessmentName+"']//parent::li//following-sibling::ul/li[text()='See reports']")).click();
        return this;
    }

    public AssessmentPage clickCompleteAssessmentBtn(){
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        completeAssessmentBtn.click();
        return this;
    }
    public AssessmentPage clickOkBtn(){
        okBtn.click();
        return this;
    }
    public AssessmentPage clickNoBtn(){
        noBtn.click();
        return this;
    }
    public AssessmentPage visitBackToAssessment(){
        backToAssessment.click();
        return this;
    }

    public boolean isAssessmentVisible(String assessmentName){
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        wait.until(ExpectedConditions.visibilityOf(trackAssessmentContainer)).isDisplayed();
        try {
              wait.until(ExpectedConditions.elementToBeClickable(driver.findElement(By.xpath("//div[@class='assessment-wrap']//li/h6[text()='"+assessmentName+"']"))));
              return driver.findElement(By.xpath("//div[@class='assessment-wrap']//li/h6[text()='"+assessmentName+"']")).isDisplayed();
        }catch(NoSuchElementException e){
            return false ;
        }
    }

    public AssessmentPage createAssessmentFromUI(String assessmentName){
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        wait.until(ExpectedConditions.visibilityOf(allAssessmentContainer)).isDisplayed();
        wait.until(ExpectedConditions.elementToBeClickable(driver.findElement(By.xpath("//h6[text()='"+assessmentName+"']/parent::div/following-sibling::p/following-sibling::span[text()='Assess']")))).click();
        return this;
    }
}
