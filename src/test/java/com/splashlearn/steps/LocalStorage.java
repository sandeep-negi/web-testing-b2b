package com.splashlearn.steps;

import com.splashlearn.context.TestContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

public class LocalStorage {
    private final TestContext context;
    private final WebDriver driver;
    private JavascriptExecutor js;
    private static final Logger logger = LogManager.getLogger(LocalStorage.class);

    public LocalStorage(TestContext context) {
        this.context = context;
        this.driver = context.getDriver();
        this.js = (JavascriptExecutor) driver;
    }

    public void removeItemFromLocalStorage(String item) {
        js.executeScript(String.format(
                "window.localStorage.removeItem('%s');", item));
    }

    public boolean isItemPresentInLocalStorage(String item) {
        return !(js.executeScript(String.format(
                "return window.localStorage.getItem('%s');", item)) == null);
    }

    public String getItemFromLocalStorage(String key) {
        return (String) js.executeScript(String.format(
                "return window.localStorage.getItem('%s');", key));
    }

    public String getKeyFromLocalStorage(int key) {
        return (String) js.executeScript(String.format(
                "return window.localStorage.key('%s');", key));
    }

    public Long getLocalStorageLength() {
        return (Long) js.executeScript("return window.localStorage.length;");
    }

    public void setItemInLocalStorage(String item, String value) {
        js.executeScript(String.format(
                "window.localStorage.setItem('%s','%s');", item, value));
    }

    public void clearLocalStorage() {
        js.executeScript(String.format("window.localStorage.clear();"));
    }

}
