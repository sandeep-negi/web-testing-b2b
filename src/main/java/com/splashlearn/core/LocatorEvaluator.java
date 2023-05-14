package com.splashlearn.core;

import com.splashlearn.exceptions.InvalidLocatorException;
import org.openqa.selenium.By;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

public class LocatorEvaluator {

    public By getByLocator(String locator) throws InvalidLocatorException {
        String strategy = locator.split("=>")[0];
        String value = locator.split("=>")[1];

        switch (strategy.trim().toLowerCase()) {
            case "id":
                return By.id(value);
            case "className":
                return By.className(value);
            case "xpath":
                return By.xpath(value);
            case "css":
                return By.cssSelector(value);
            case "name":
                return By.name(value);
            case "tagname":
                return By.tagName(value);
            case "linktext":
                return By.linkText(value);
            case "partiallinktext":
                return By.partialLinkText(value);
            case "text":
                return By.xpath(String.format("//*[text()='%s']", value));
            case "partialtext":
                return By.xpath(String.format("//*[contains(text(),'%s')]", value));
            default:
                if(isNotBlank(strategy) && isNotBlank(value))
                    return By.cssSelector(String.format("*[%s='%s']", strategy, value));
                else
                    throw new InvalidLocatorException("Invalid locator " + locator);
        }

    }

}
