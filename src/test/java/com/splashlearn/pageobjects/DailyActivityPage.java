package com.splashlearn.pageobjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class DailyActivityPage extends BasePage{
    public DailyActivityPage(WebDriver driver) {
        super(driver);
    }

    public void loadDailyActivityPage(String klassSlug, String klassGrade){
        loadUrl("class/" + klassSlug + "/grades/" + klassGrade + "/daily-activity");
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
    }

}
