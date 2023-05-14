package com.splashlearn.selenium;

import com.rajatthareja.reportbuilder.Report;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.PageFactory;
import com.splashlearn.exceptions.ElementNotFoundException;
import com.splashlearn.exceptions.InvalidLocatorException;
import com.splashlearn.steps.Hooks;
import lombok.extern.log4j.Log4j2;
import net.masterthought.cucumber.Reportable;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.events.WebDriverListener;
import org.testng.Assert;
import org.testng.ITestListener;
import org.testng.ITestResult;
import org.testng.Reporter;

import java.lang.reflect.Method;

import static com.splashlearn.constants.SplashLearnConstants.PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE;
import static com.splashlearn.core.selenium.SeleniumActions.click;
import static com.splashlearn.core.selenium.SeleniumActions.exists;


@Log4j2
public class CustomWebDriverListener implements WebDriverListener, ITestListener {

    PageFactory pageFactory = new PageFactory();
    RandomAppearedElements randomAppearedElements = new RandomAppearedElements();
//    public static GifAssembler gifAssembler = new GifAssembler();

    @Override
    public void beforeAnyWebDriverCall(WebDriver driver, Method method, Object[] args) {
        try {

//            byte[] screenshot = ((TakesScreenshot) driver)
//                    .getScreenshotAs(OutputType.BYTES);
//            gifAssembler.addFrame("step", screenshot);

            By errorOnPage = pageFactory.getLocatorFor(PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "errorOnPage");

            By fallbackComponents = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "fallback_components");
            By recommendationPopupRating = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "recommendation_popup_rating");
            By recommendationPopupSend = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "recommendation_popup_send");
            By recommendationPopupClose = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "recommendation_popup_close");
            By mathFactsClosePopup = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "math_facts_discovery_popup_close");
            By surveyPopUp = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "closeSurveyPopUp");
            By enableHomeAccessNudge = pageFactory.getLocatorFor(
                    PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE, "enableHomeAccessNudge");

            randomAppearedElements.waitForPageLoad(driver);
            randomAppearedElements.errorMessages(driver, errorOnPage);
            randomAppearedElements.waitForFallbackComponentsToLoad(driver, fallbackComponents);
            randomAppearedElements.closeMathFactsDiscoveryPopup(driver, mathFactsClosePopup);
            randomAppearedElements.sendRatingOnRecommendationPopup(driver, recommendationPopupRating, recommendationPopupSend, recommendationPopupClose);
            randomAppearedElements.closeSurveyPopUp(driver, surveyPopUp);
            randomAppearedElements.closeEnableHomeAccessNudge(driver, enableHomeAccessNudge);

        } catch (InvalidLocatorException | ElementNotFoundException e) {
            log.debug("Issue with the locator ->" + e);
        }
    }

    @Override
    public void onTestSkipped(ITestResult result){
        Throwable cause = result.getThrowable();
        System.out.println("onTestSkip: " + cause.getCause().toString());
    }

    @Override
    public void onTestFailure(ITestResult result){
        Throwable cause = result.getThrowable();
        System.out.println("onTestFailure: " + cause.getCause().toString());
    }
}
