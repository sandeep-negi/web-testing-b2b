package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

public class DownloadWorksheetPage extends BasePage {
    public DownloadWorksheetPage(WebDriver driver) {
        super(driver);
    }

    private final By successNotification = By.xpath("//span[@class='noty_text']");
    private final By downloadWorksheetBtn = By.xpath("//div[@id='teacher-printable-worksheet-card-list']/div[1]//child::div[@class='info-container']//div[@class='actions']/a[@class='download-button']");

    public void downloadWorksheets() {
            click(driver, downloadWorksheetBtn);

            //       driver.switchTo().window(driver.getWindowHandles().toArray()[1].toString());
            // Runs javascript code for cancelling print operation.
            // This code only executes for Chrome browsers.
            //        ((JavascriptExecutor) driver).executeScript("window.print=function(){};");
            // Switches to main window after print dialog operation.
            //        driver.switchTo().window(driver.getWindowHandles().toArray()[0].toString());
            //        waitForSpinner(driver);
        }

    public boolean isDownloadSuccessful() {
        return exists(driver, successNotification, 3);
    }
}
