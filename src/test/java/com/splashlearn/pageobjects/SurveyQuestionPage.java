package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class SurveyQuestionPage extends BasePage {

    public SurveyQuestionPage(WebDriver driver) {
        super(driver);
    }

    private final By selectSurveyAnswer = By.xpath("//div[@class='individual-options'][2]");
    private final By surveyQuestionPage = By.xpath("//div[@class='teacher-signup-survey']//div[@class='individual-header']");
    private final By surveyQuestionCtaDisabledBtn = By.cssSelector("span.primary-cta-button.disabled");
    private final By surveyQuestionCtaEnabledBtn = By.xpath("//div[@class='show-survey-content']//span[text()='Next' or text()='Continue' or text()='Submit & Continue']");
    private final By navigateQuestionIcon = By.xpath("//div[@class='question']");
    private final By addStudents = By.id("students-added");

    public void handleSurveyPage() {
        waitForSpinner(driver);
        if (!exists(driver, addStudents, 3) && (driver.getCurrentUrl().contains("/signup/survey"))) {
            List<WebElement> surveyQuestionCount = findElements(driver, surveyQuestionPage, 5);
            int i = 1;
            while (i < surveyQuestionCount.size()) {
                click(driver, selectSurveyAnswer, 3);
                waitForElementVisible(driver, navigateQuestionIcon, 3);
                if (exists(driver, surveyQuestionCtaEnabledBtn, 3)) {
                    click(driver, selectSurveyAnswer, 3);
                    click(driver, surveyQuestionCtaEnabledBtn, 3);
                }
                i++;
            }
        }
    }

    public void answerSurveyQuestion(String[] option) {
        waitForSpinner(driver);
        for (String answer : option) {
            click(driver, By.xpath("//div[text()='"+answer+"']"), 2);
            waitForElementVisible(driver, navigateQuestionIcon, 3);
            if (exists(driver, surveyQuestionCtaEnabledBtn, 3)) {
                click(driver, By.xpath("//div[@class='individual-options'][1]"), 3);
                click(driver, surveyQuestionCtaEnabledBtn, 3);
            }
        }
    }


}
