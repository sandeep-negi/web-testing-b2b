package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;

public class ProfilePage extends BasePage{

    public ProfilePage(WebDriver driver) {
        super(driver);
    }

    private final By updateBtn = By.xpath("//span[text()='Update']");
    private final By selectTimeZone = By.id("time-zone");


    public void setTimeZone(String country){
        click(driver, selectTimeZone);
        select(driver, selectTimeZone, country, DEFAULT_TIMEOUT);
        click(driver, updateBtn);
        waitForSpinner(driver);
    }
}
