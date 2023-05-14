package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class OtpPage extends BasePage{
    public OtpPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id = "otp-submit-btn") private WebElement submitOtpBtn;
    private final By otpField = By.xpath("//*[@id='otp' or @name='otp1']");
    private final By loginViaOtp = By.xpath("//input[@type='text' and @class='otp']");

    public void enterOtp(String otp){
        waitForElementInvisible(driver, newPageLoader, 3);
        type(driver, otpField , otp, 3);
        waitForElementInvisible(driver, newPageLoader, 3);
    }

    public void loginViaOtp(String otp){
        waitForElementInvisible(driver, newPageLoader, 3);
        type(driver, loginViaOtp , otp, 3);
    }
    public void enterKlassCode(String otp){
        type(driver, By.xpath("//div[@class='klass-code-input']/input") , otp);
        waitForElementInvisible(driver, newPageLoader, 3);
    }
}
