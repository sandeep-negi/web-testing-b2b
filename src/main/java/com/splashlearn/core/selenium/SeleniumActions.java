package com.splashlearn.core.selenium;

import com.splashlearn.core.BrowserFactory;
import io.cucumber.java.Scenario;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.URL;
import java.time.Duration;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import static com.splashlearn.constants.SplashLearnConstants.*;

@Log4j2
public class SeleniumActions {

    private static final String ELEMENT_HIGHLIGHT_COLOR = "red";
    public static boolean highlightElement;
    static LoadTime loadTime = new LoadTime();
    private static final Logger loadLogger = LogManager.getLogger(BrowserFactory.class);

    protected SeleniumActions() {
    }

    public static void open(WebDriver driver, String url) {

        loadTime.startTimer();
        driver.get(url);
        loadTime.endTimer(driver,"Pageload", url, "");
    }

    public static void open(WebDriver driver, String baseUrl, String url) {
        loadTime.startTimer();
        if (!isURL(url))
            url = baseUrl + url;
        driver.get(url);
        loadTime.endTimer(driver,"Pageload", url, "");
    }

    public static void refreshPage(WebDriver driver) {
        driver.navigate().refresh();
        loadTime.endTimer(driver,"Reload", driver.getCurrentUrl(), "");
    }

    public static void click(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        int retries = 0;
        int maxRetries = 2 ;
        while (retries < maxRetries)
            try {
                waitForSpinner(driver);
                findElement(driver, locator, timeout).click();
                break;
            } catch (Exception e) {
                ++retries;
                if(retries >= maxRetries){
                    throw e ;
                }
//                else if(e.getClass().equals(TimeoutException.class) || e.getClass().equals(JavascriptException.class))
//                {
//                    driver.navigate().refresh();
//                    loadTime.endTimer(driver,"refreshed and again looking for element", driver.getCurrentUrl(), locator.toString());
//                }
            }
//        loadTime.endTimer(driver,"Button load and Click", driver.getCurrentUrl(), locator.toString());
    }


    public static void click(WebDriver driver, By locator) {
        click(driver, locator, DEFAULT_TIMEOUT);
    }

    public static void type(WebDriver driver, By locator, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        findElement(driver, locator, timeout).sendKeys(value);
//        loadTime.endTimer(driver,"Field load and send keys", driver.getCurrentUrl(), locator.toString());
    }

    public static void type(WebDriver driver, By locator, CharSequence value) {
        if (value == null)
            return;
        waitForSpinner(driver);
        findElement(driver, locator, DEFAULT_TIMEOUT).sendKeys(value);
//        loadTime.endTimer(driver,"Field load and send keys", driver.getCurrentUrl(), locator.toString());
    }

    public static void clear(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        findElement(driver, locator, timeout).clear();
//        loadTime.endTimer(driver,"load and clear field", driver.getCurrentUrl(), locator.toString());
    }

    public static String text(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        return findElement(driver, locator, timeout).getText();
    }

    public static String getAttribute(WebDriver driver, By locator, int timeout, String value) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        return findElement(driver, locator, timeout).getAttribute(value);
    }

    public static boolean exists(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        try {
            return findElement(driver, locator, timeout).isDisplayed();
        } catch (Exception ignore) {
            return false;
        }
    }

    public static void waitForElement(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.presenceOfElementLocated(loc));
        loadTime.endTimer(driver,"waitForElement", driver.getCurrentUrl(), loc.toString());
    }

    public static void waitForElementVisible(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.visibilityOfElementLocated(loc));
        loadTime.endTimer(driver,"waitForElementVisible", driver.getCurrentUrl(), loc.toString());
    }
    public static void waitForElementVisible(WebDriver driver, By loc) {
        new WebDriverWait(driver, Duration.ofSeconds(TEMP_TIMEOUT))
                .until(ExpectedConditions.visibilityOfElementLocated(loc));
        loadTime.endTimer(driver,"waitForElementVisible", driver.getCurrentUrl(), loc.toString());
    }

    public static void waitForElementInvisible(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.invisibilityOfElementLocated(loc));
        loadTime.endTimer(driver,"waitForElementInvisible", driver.getCurrentUrl(), loc.toString());
    }
    public static void waitForElementInvisible(WebDriver driver, By loc) {
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(TEMP_TIMEOUT))
                .until(ExpectedConditions.invisibilityOfElementLocated(loc));
        loadTime.endTimer(driver,"waitForElementInvisible", driver.getCurrentUrl(), loc.toString());
    }

    public static void waitForElementClickable(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.elementToBeClickable(loc));
        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), loc.toString());
    }

    public static void waitForElement(WebDriver driver, By loc) {
        waitForElement(driver, loc, DEFAULT_TIMEOUT);
    }

    public static void waitForNoElement(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.invisibilityOfElementLocated(loc));
        loadTime.endTimer(driver,"waitForElementNotVisible", driver.getCurrentUrl(), loc.toString());
    }

    public static void waitForNoElement(WebDriver driver, By loc) {
        waitForNoElement(driver, loc, LONG_TIMEOUT);
    }

    public static void fireClickEvent(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        WebElement e = findElement(driver, loc, timeout);
        ((JavascriptExecutor) driver).executeScript("arguments[0].click();", e);
    }

    public static void moveToElementUsingJavaScript(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        WebElement e = findElement(driver, loc, timeout);
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", e);
    }
    public static void executeEventByJavaScript(WebDriver driver, String eventName) {
        ((JavascriptExecutor) driver).executeScript(eventName);
    }

    public static void clickByAction(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        WebElement e = findElement(driver, loc, timeout);
        Actions action = new Actions(driver);
        action.moveToElement(e).click().perform();
    }
    public static void moveToElementUsingAction(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        WebElement e = findElement(driver, loc, timeout);
        Actions action = new Actions(driver);
        action.moveToElement(e).perform();
    }

    public static void waitForText(WebDriver driver, By loc, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        if (loc == null)
            new WebDriverWait(driver, Duration.ofSeconds(timeout))
                    .until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[contains(text(), '" + value + "')]")));
        else
            new WebDriverWait(driver, Duration.ofSeconds(timeout))
                    .until(ExpectedConditions.textToBe(loc, value));

        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), loc.toString());
    }

    public static void clickIfPresent(WebDriver driver, By loc, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        try {
            click(driver, loc, timeout);
        } catch (Exception ignore) {
            System.out.println();
        }
    }

    public static void waitForTextToContain(WebDriver driver, By loc, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        Pattern pattern = Pattern.compile(value, Pattern.CASE_INSENSITIVE);
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.textMatches(loc, pattern));

        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), loc.toString());
    }

    public static void waitForText(WebDriver driver, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForText(driver, null, value, timeout);
    }

    public static void verifyText(WebDriver driver, By loc, String value) {
        waitForText(driver, loc, value, DEFAULT_TIMEOUT);
    }

    public static void verifyText(WebDriver driver, By loc, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForText(driver, loc, value, timeout);
    }

    public static void waitForUrlToContain(WebDriver driver, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.urlContains(value));
        loadTime.endTimer(driver,"waitForUrlToContain", driver.getCurrentUrl(), "");
    }

    public static void screenshot(Scenario scenario, WebDriver driver) {
        byte[] img = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
        scenario.attach(img, "image/png", "failure");
    }

    public static void switchIFrame(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.frameToBeAvailableAndSwitchToIt(locator));
    }

    public static void switchIFrame(WebDriver driver, By locator) {
        switchIFrame(driver, locator, DEFAULT_TIMEOUT);
    }

    public static void switchToDefaultContent(WebDriver driver) {
        driver.switchTo().defaultContent();
    }

    public static WebElement findElement(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForElement(driver, locator, timeout);
        WebElement we = driver.findElement(locator);
        loadTime.endTimer(driver,"Load and find element", driver.getCurrentUrl(), locator.toString());
        return we;
    }

    public static List<WebElement> findElements(WebDriver driver, By locator, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        waitForElement(driver, locator, timeout);
        return driver.findElements(locator);
    }

    public static void sleep(int s) {
        s = s > SHORT_TIMEOUT ? SHORT_TIMEOUT : s;
        try {
            Thread.sleep(s * 1000);
        } catch (InterruptedException ignore) {
        }
    }
    public static void explicitSleep(int s) {
        try {
            Thread.sleep(s * 1000);
        } catch (InterruptedException ignore) {
        }
    }

    public static void select(WebDriver driver, By locator, String value, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new Select(findElement(driver, locator, timeout)).selectByVisibleText(value);
        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), locator.toString());

    }

    public static String alertText(WebDriver driver, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout)).until(ExpectedConditions.alertIsPresent());
        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), "");
        return driver.switchTo().alert().getText();
    }

    public static void alertAccept(WebDriver driver, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout))
                .until(ExpectedConditions.alertIsPresent());
        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), "");
        driver.switchTo().alert().accept();
    }

    public static void elementSelectionStateToBe(WebDriver driver, By locator, boolean isSelected, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout)).
                until(ExpectedConditions.elementSelectionStateToBe(locator, isSelected));
        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), locator.toString());
    }

    public static <T> void retryUntilTrue(WebDriver driver, ExpectedCondition<T> condition, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        new WebDriverWait(driver, Duration.ofSeconds(timeout)).until(condition);
        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), "");
    }

    public static void retryClicksUntilNewElementPresent(final WebDriver driver, final By locatorToClick, final By locatorToWaitFor) {
        retryUntilTrue(driver, CustomExpectedConditions.retryClicksUntilNewElementExists(locatorToClick, locatorToWaitFor), DEFAULT_TIMEOUT);
//        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), locatorToClick.toString());
    }

    public static void retryClicksUntilElementPresent(final WebDriver driver, final By locatorToClick) {
        retryUntilTrue(driver, CustomExpectedConditions.retryClicksUntilElementExists(locatorToClick), DEFAULT_TIMEOUT);
//        loadTime.endTimer(driver,"waitForElementClickable", driver.getCurrentUrl(), locatorToClick.toString());
    }

    public static void highlightElement(WebDriver driver, By by) {
        if (!highlightElement) return;
        waitForElement(driver, by, DEFAULT_TIMEOUT);
        JavascriptExecutor jse = (JavascriptExecutor) driver;
        jse.executeScript("arguments[0].setAttribute('style', arguments[1]);", findElement(driver, by, 5), "border: 3px solid " + ELEMENT_HIGHLIGHT_COLOR + ";");
    }

    public static void unhighlightElement(WebDriver driver, By by) {
        if (!highlightElement) return;
        JavascriptExecutor jse = (JavascriptExecutor) driver;
        jse.executeScript("arguments[0].setAttribute('style', arguments[1]);", findElement(driver, by, 5), "");
    }

    public static void waitForSpinner(WebDriver driver) {
        waitForSpinner(driver, DEFAULT_TIMEOUT);
    }

    public static void waitForSpinner(WebDriver driver, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        try {
            new WebDriverWait(driver, Duration.ofSeconds(timeout)).until(ExpectedConditions.invisibilityOfElementLocated(By.className("ajax_spinner")));
        } catch (Exception ignore) {
            loadTime.logTimer(driver,"Timed out - Spinner active", driver.getCurrentUrl(), "Spinner=> timeout was "+ timeout);
        }
//        loadTime.endTimer(driver,"waitforSpinner", driver.getCurrentUrl(), "Spinner=> timeout was "+ timeout);
    }

    public static void waitForSpinnerWithRefreshPage(WebDriver driver, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        int retries = 0;
        while (retries < 2)
            try {
                new WebDriverWait(driver, Duration.ofSeconds(timeout)).
                        until(ExpectedConditions.invisibilityOfElementLocated(By.className("ajax_spinner")));
                break;
            } catch (Exception e) {
                loadTime.logTimer(driver,"Timed out - Spinner active", driver.getCurrentUrl(), "Spinner=> timeout was "+ timeout);
                refreshPage(driver);
                loadTime.logTimer(driver,"Spinner active - post page refresh", driver.getCurrentUrl(), "Spinner=> timeout was "+ timeout);
                ++retries;
            }
//        loadTime.endTimer(driver,"waitforSpinner with Refresh page", driver.getCurrentUrl(), "Spinner=> timeout was "+ timeout*2);
    }

    public static void waitForAnyoneElementToBeVisible(WebDriver driver, By loc1, By loc2, int timeout) {
        timeout = timeout > LONG_TIMEOUT ? LONG_TIMEOUT : timeout;
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(timeout)).
                until(ExpectedConditions.or(ExpectedConditions.visibilityOfElementLocated(loc1),
                        ExpectedConditions.visibilityOfElementLocated(loc2)));
        loadTime.endTimer(driver,"waitForAnyoneElementToBeVisible", driver.getCurrentUrl(), loc1.toString() + " or " + loc2.toString());
    }

    public static void waitForAttributeToBe(WebDriver driver, By loc, String attribute, String value) {
        waitForSpinner(driver);
        new WebDriverWait(driver, Duration.ofSeconds(DEFAULT_TIMEOUT)).until(ExpectedConditions.attributeToBe(loc, attribute, value));
        loadTime.endTimer(driver,"waitForAttributeToBe", driver.getCurrentUrl(), loc.toString());
    }

    public static String switchToNewWindow(WebDriver driver, String windowType) {
        String currentWindowHandle = driver.getWindowHandle();
        driver.switchTo().newWindow(WindowType.fromString(windowType));
        return currentWindowHandle;
    }

    public static void back(WebDriver driver) {
        driver.navigate().back();
        loadTime.endTimer(driver,"navigate back", driver.getCurrentUrl(), "");
    }

    public static String switchToWindow(WebDriver driver, String windowHandle) {
        String currentWindowHandle = driver.getWindowHandle();
        driver.switchTo().window(windowHandle);
        return currentWindowHandle;
    }

    public static void deleteAllCookies(WebDriver driver) {
        ExpectedCondition<Boolean> noCookiesPresent = d -> {
            if (!d.manage().getCookies().isEmpty()) {
                d.manage().deleteAllCookies();
                return false;
            }
            return true;
        };
        retryUntilTrue(driver, noCookiesPresent, 10);
    }

    public static Set<Cookie> getAllCookies(WebDriver driver) {
        return driver.manage().getCookies();
    }

    public static List<String> getAllOptionsAsString(WebDriver driver, By loc) {
        Select dropdown = new Select(findElement(driver, loc, 10));
        return dropdown.getOptions().stream().map(WebElement::getText).collect(Collectors.toList());
    }

    public static void addCookies(WebDriver driver, Set<Cookie> cookies) {
        cookies.forEach(cookie -> driver.manage().addCookie(cookie));
    }

    public static void injectSessionCookie(WebDriver driver, io.restassured.http.Cookie sessionId) {
        Cookie sessionCookie = new Cookie(sessionId.getName(), sessionId.getValue());
        driver.manage().addCookie(sessionCookie);
    }
    /*
        Private methods
     */

    private static boolean isURL(String url) {
        try {
            new URL(url);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void waitForPageLoad(WebDriver driver){
        try{
            // Javascript Executor for ready state
            JavascriptExecutor j = (JavascriptExecutor)driver;
            if (j.executeScript("return document.readyState").toString().equals("complete")){
                loadLogger.info("Page in ready state");
            }
        } catch(Exception exe) {
            loadLogger.info("Page not in ready state");
        }
    }

    public static void selectButton(WebElement radioElement) {
        boolean select = radioElement.isSelected();
        if (!select) {
            radioElement.click();
        }
    }
}
