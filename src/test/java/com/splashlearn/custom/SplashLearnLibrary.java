package com.splashlearn.custom;

import com.splashlearn.context.TestContext;
import com.splashlearn.core.selenium.SeleniumActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.Assert;

import java.util.List;
import java.util.Map;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;

public class SplashLearnLibrary {

    private WebDriver driver;
    private final Map<String, String> data;

    public SplashLearnLibrary(TestContext testContext) {
        this.driver = testContext.getDriver();
        this.data = testContext.getData();
    }

    public void verifyAge() {
        char[] input = "1990".toCharArray();
        List<WebElement> elements = SeleniumActions.findElements(driver, By.className("year-input"), DEFAULT_TIMEOUT);
        for(int i=0; i<input.length; i++)
            elements.get(i).sendKeys(String.valueOf(input[i]));

    }

    public void assertText(String actual, String expected){
        Assert.assertEquals(actual.trim(), expected.trim());
    }

    public String getNewPassword(String p) {
        return p.length() == 6 ? "1234567" : "123456";
    }

    public void closeBrowser() {
        driver.close();
    }


}
