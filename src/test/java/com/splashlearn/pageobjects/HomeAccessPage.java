package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class HomeAccessPage extends BasePage{

    public HomeAccessPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='Copy invite']")
    private WebElement copyInvite ;

    @FindBy(className = "backbtn")
    private WebElement back;

    private final By studentLearning = By.xpath("//div[@id='what_students_can_do_section']//preceding-sibling::div[@id='enable_home_access']']");
    private final By inviteParentViaEmailSection = By.xpath("//div[@class='collapse-content']//following-sibling::div[@class='parents-connected-container']");
    private final By expandStudentLearning = By.xpath("//div[@id='what_students_can_do_section']//div[@class='collapse-box-common ']/i");
    @FindBy(id = "what_students_can_do_section")
    private WebElement studentLearningSection ;
    private final By studentLearningSectionAfterExpand = By.cssSelector("div#what_students_can_do_section");
    private final By variantFlowHomeAccessPageBackBtn = By.xpath("//div[@class='topBannerBackIcon']//*[local-name()='svg']");
    private final By controlFlowHomeAccessPageBackBtn = By.xpath("//div[@class='svg-with-hover-wrapper']//*[local-name()='svg']");
    private final By noConnectedParent = By.xpath("//span[@class='progress-zero-text']");
    private final By numberOfConnectedParent = By.xpath("//div[@class='progress-container-div']//span[@class='progress-text in-progress']/span");
    private final By copyInviteOnTopBanner = By.xpath("//div[@class='topBannerCTA']//span[text()='Copy invite']");
    private final By copyInviteOnPage = By.xpath("//div[@class='invite-all-parents' or @class='copy-invite upload-download-containers clearfix']//span[text()='Copy invite']");
    private final By copyInviteCopiedText = By.xpath("//span[@class=' copied-invite  ']//span[text()='Copied']");
    private final By downloadInviteBtn = By.xpath("//a[@class='primary-cta-button invite-btn download-invite js-prevent-multiple-click download  ' or @class='primary-cta-button invite-btn js-prevent-multiple-click download  ']");

    public void clickBack(){
        wait.until(ExpectedConditions.elementToBeClickable(back)).click();
    }

    public boolean isUserOnHomeAccessPage(){
        return wait.until(ExpectedConditions.elementToBeClickable(copyInvite)).isDisplayed();
    }

    public boolean isStudentLearningSectionBelowInviteParentEmailSection(){
        return exists(driver, studentLearning, 3);
    }

    public boolean isNewInviteParentViaEmailSectionPresent(){
        return exists(driver, inviteParentViaEmailSection, 3);
    }
    public HomeAccessPage expandStudentLearningSection(){
        ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", studentLearningSection);
        click(driver, expandStudentLearning);
        return this;
    }
    public boolean verifyStudentLearningSectionAfterExpansion(){
        return exists(driver,studentLearningSectionAfterExpand,3);
    }
    public void clickVariantFlowHomeAccessPageBackBtn(){
        click(driver, variantFlowHomeAccessPageBackBtn);
        waitForSpinner(driver);
    }
    public void clickControlFlowHomeAccessPageBackBtn(){
        click(driver, controlFlowHomeAccessPageBackBtn);
        waitForSpinner(driver);
    }
    public String noConnectedParentCountInfo(){
        return text(driver, noConnectedParent, 3);
    }
    public String getConnectedParentCountInfo(){
        return text(driver, numberOfConnectedParent, 3);
    }


    public HomeAccessPage selectCopyInviteOnHeroImage(){
        click(driver, copyInviteOnTopBanner,3);
        waitForSpinner(driver);
        return this ;
    }
    public HomeAccessPage selectCopyInviteOnPage(){
        click(driver, copyInviteOnPage,3);
        waitForSpinner(driver);
        return this;
    }
    public boolean isCopiedTextVisible(){
        return exists(driver, copyInviteCopiedText,3);
    }

    public HomeAccessPage selectDownloadInvite(){
        click(driver, downloadInviteBtn, 3);
        return this;
    }

    public void sendInviteToParent(String studentName, String parentEmail){
        type(driver,By.xpath("//li[text()='"+studentName+"']//following-sibling::li[@class='email']//input[@type='email']"),parentEmail, 3);
        click(driver, By.xpath("//li[text()='"+studentName+"']//following-sibling::li[@class='email']//span[text()='Invite']"));
    }

    public void refreshBrowser(){
        refreshPage(driver);
        waitForSpinner(driver);
    }

    public boolean isStudentConnected(String studentName){
        return getAttribute(driver, By.xpath("//li[text()='"+studentName+"']//following-sibling::li[@class='email']/div"),3,"class").equalsIgnoreCase("connected");
    }
}
