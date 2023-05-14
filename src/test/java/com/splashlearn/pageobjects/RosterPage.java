package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class RosterPage extends BasePage{

    public RosterPage(WebDriver driver) {
        super(driver);
    }
    private final By connectedParentText = By.xpath("//span[@class='progress-text in-progress']");
    private final By addStudentBtn = By.xpath("//span[text()='Add Students']");

    public void sendInviteToParentForStudent(String studentName, String parentEmail){
        type(driver, By.xpath("//div[text()='"+studentName+"']//parent::div[@class='student-name']//following-sibling::div[@class='invite-parent-email']//input[@type='text']"), parentEmail);
        click(driver, By.xpath("//div[text()='"+studentName+"']//parent::div[@class='student-name']//following-sibling::div[@class='invite-parent-email']//span[text()='Invite']"));
    }

    public boolean isStudentLinkedToParent(String studentName){
        waitForElementVisible(driver, addStudentBtn, 3);
        return exists(driver, By.xpath("//div[text()='"+studentName+"']//parent::div[@class='student-name']//following-sibling::div[@class='home-access-status']//span[text()='Enabled']"),3);
    }

    public String getConnectedParentText(){
        return text(driver, connectedParentText, 3);
    }
}
