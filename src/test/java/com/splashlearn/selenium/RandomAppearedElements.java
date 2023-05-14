package com.splashlearn.selenium;

import com.splashlearn.steps.Hooks;
import io.cucumber.plugin.event.Node;
import lombok.extern.log4j.Log4j2;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import static com.splashlearn.constants.SplashLearnConstants.LONG_TIMEOUT;
import static com.splashlearn.constants.SplashLearnConstants.SHORT_TIMEOUT;
import static com.splashlearn.core.selenium.SeleniumActions.*;
import static org.openqa.selenium.support.ui.ExpectedConditions.*;

@Log4j2
public class RandomAppearedElements {


    private boolean isRecommendationPopupClosed;
    private boolean isMathFactsPopupClosed;
    private boolean isSurveyPopUpClosed;
    private boolean isLoginInstructionPopUpClosed;
    private boolean isEnableHomeAccessNudgeClosed;


    public void sendRatingOnRecommendationPopup(WebDriver driver, By ratingLocator, By sendButtonLocator, By closeButton) {
        if (!isRecommendationPopupClosed) {
            if (exists(driver, ratingLocator, 0)) {
                clickByAction(driver, ratingLocator, 3);
                log.trace("Clicked on locator=>" + ratingLocator);
                clickByAction(driver, sendButtonLocator,3);
                log.trace("Clicked on locator=>" + sendButtonLocator);
                waitForNoElement(driver, ratingLocator);
                waitForElementInvisible(driver, sendButtonLocator, SHORT_TIMEOUT);
                waitForElementInvisible(driver, closeButton, SHORT_TIMEOUT);
                isRecommendationPopupClosed = Boolean.TRUE;
            }
        }
    }

    public void waitForPageLoad(WebDriver driver) {
        waitForSpinnerWithRefreshPage(driver, LONG_TIMEOUT);
    }

    public void waitForFallbackComponentsToLoad(WebDriver driver, By fallBackComponents) {
        retryUntilTrue(driver, d -> invisibilityOfAllElements(d.findElements(fallBackComponents)), LONG_TIMEOUT);
    }

    public void closeMathFactsDiscoveryPopup(WebDriver driver, By mathFactsClosePopup) {
        if (!isMathFactsPopupClosed) {
            if (exists(driver, mathFactsClosePopup, 0)) {
                clickByAction(driver, mathFactsClosePopup, 3);
                log.trace("Clicked on locator=>" + mathFactsClosePopup);
                waitForNoElement(driver, mathFactsClosePopup);
                isMathFactsPopupClosed = true;
            }
        }
    }

    public void closeSurveyPopUp(WebDriver driver, By surveyPopUp) {
        if (!isSurveyPopUpClosed) {
            if (exists(driver, surveyPopUp, 0)) {
                clickByAction(driver, surveyPopUp, 3);
                log.trace("Clicked on locator=>" + surveyPopUp);
                waitForNoElement(driver, surveyPopUp);
                isSurveyPopUpClosed = true;
            }
        }
    }
    public void closeEnableHomeAccessNudge(WebDriver driver, By enableHomeAccessNudge) {
        if (!isEnableHomeAccessNudgeClosed) {
            if (exists(driver, enableHomeAccessNudge, 0)) {
                clickByAction(driver, enableHomeAccessNudge, 3);
                log.trace("Clicked on locator=>" + enableHomeAccessNudge);
                waitForNoElement(driver, enableHomeAccessNudge);
                isEnableHomeAccessNudgeClosed = true;
            }
        }
    }

    public void errorMessages(WebDriver driver, By errorOnPage){
        try {
//            Hooks h = new Hooks();
//            h.before_or_after();
            Assert.fail("Got error message: " + driver.findElement(errorOnPage).getText());

        }
        catch(Exception e) {
            // ignore
        }
    }
}
