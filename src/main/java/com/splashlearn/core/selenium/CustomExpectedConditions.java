package com.splashlearn.core.selenium;

import lombok.extern.log4j.Log4j2;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;

import java.util.List;

import static com.splashlearn.core.selenium.SeleniumActions.click;

@Log4j2
public class CustomExpectedConditions {

    private CustomExpectedConditions() {
    }

    public static ExpectedCondition<Boolean> retryClicksUntilNewElementExists(final By locatorToClick, final By locatorToWaitFor) {
        return driver -> {
            if (driver.findElements(locatorToWaitFor).isEmpty()) {
                click(driver, locatorToClick);
                return false;
            } else return true;
        };
    }

    public static ExpectedCondition<Boolean> retryClicksUntilElementExists(final By locatorToClick) {
        return driver -> {
            List <WebElement> we = driver.findElements(locatorToClick);
            if (!(we.size() == 0) || !(we.isEmpty())) {
                click(driver, locatorToClick);
                return false;
            } else return true;
        };
    }

}
