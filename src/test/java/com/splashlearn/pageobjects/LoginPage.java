package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class LoginPage extends BasePage{

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    private final By login = By.xpath("//li[text()='Log in']");
    private final By studentIcon = By.xpath("//*[text()='Student']/parent::a");
    private final By parentOrTeacher = By.xpath("//*[text()='Teacher/Parent']/parent::div[@class='login-tile']");
    private final By loginBtn = By.xpath("//button[text()='Login']");
    private final By otpLink= By.xpath("//a[text()='Verification Code']");
    private final By userEmail = By.xpath("//input[@type='email']");
    private final By loginViaOtpBtn = By.xpath("//button[@tabindex='3']");
    private final By verificationCodeForm = By.xpath("//input[@type='text' and @class='otp']");
    private final By otpErrorMessage = By.xpath("//p[@class='info error']");
    private final By resendCode = By.xpath("//a[text()='Resend code']");
    private final By codeSentSuccessFullyInfo = By.xpath("//p[@class='info success']");

    public void selectParentTeacher(){
        retryClicksUntilNewElementPresent(driver, parentOrTeacher, loginBtn);
    }
    public void loginAsStudent() {
        click(driver, login);
        click(driver, studentIcon);
    }
    public void selectLoginUser(String user){
        click(driver,By.xpath("//div[text()='"+user+"']"));
    }
    public boolean isOTPLinkVisible(){
        return exists(driver, otpLink, 3);
    }
    public void selectLoginViaOtpLink(){
        click(driver, otpLink);
    }
    public void selectLoginViaOtp(){
        click(driver, loginViaOtpBtn);
        waitForElementInvisible(driver, newPageLoader);
    }
    public void enterEmail(String email){
        type(driver, userEmail, email);
    }
    public boolean isVerificationCodeVisible(){
        return exists(driver, verificationCodeForm, 3);
    }
    public String getErrorMessage(){
        return text(driver, otpErrorMessage ,3);
    }
    public void waitForResendCodeToEnable() throws InterruptedException {
        // Need to wait for 60 sec
        explicitSleep(60);
        waitForElementClickable(driver, resendCode,1);
    }
    public void clickResendCode(){
        click(driver, resendCode);
        waitForElementInvisible(driver, newPageLoader);
    }

    public String getSuccessInfo(){
        return text(driver, codeSentSuccessFullyInfo,3);
    }
}

