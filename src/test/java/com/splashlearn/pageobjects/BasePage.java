package com.splashlearn.pageobjects;

import com.splashlearn.context.TestContext;
import com.splashlearn.core.selenium.SeleniumActions;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.WebDriverWait;


import java.time.Duration;

public class BasePage extends SeleniumActions {
    protected WebDriver driver ;
    protected WebDriverWait wait;
    protected String originalWindow ;

    public BasePage(WebDriver driver) {
        super();
        this.driver = driver;
        wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        PageFactory.initElements(driver, this);
    }

    public void loadUrl(String endPoint){
        driver.get(TestContext.url + endPoint);
        waitForPageLoad(driver);
    }

    public void deleteAllCookies(){
        driver.manage().deleteAllCookies();
    }

    public BasePage switchToNewWindow(){
        originalWindow = driver.getWindowHandle();
        driver.switchTo().newWindow(WindowType.WINDOW);
        return this;
    }

    public BasePage switchToParentWindow(){
        driver.close();
        driver.switchTo().window(originalWindow);
        return this;
    }
    public BasePage switchToParentWindowFromChildWindow(){
        driver.switchTo().window(driver.getWindowHandles().toArray()[1].toString());
        // Runs javascript code for cancelling print operation.
        // This code only executes for Chrome browsers.
        ((JavascriptExecutor) driver).executeScript("window.print=function(){};");
        // Switches to main window after print dialog operation.
        driver.switchTo().window(driver.getWindowHandles().toArray()[0].toString());
        return this;
    }

    @FindBy(id="js-ajax-spinner") protected WebElement pageLoader;
    @FindBy(id="widget-spinner") protected WebElement widgetSpinner;
    By newPageLoader = By.xpath("(//*[name()='svg']//*[local-name()='clipPath'])[1]");

}
