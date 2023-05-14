package com.splashlearn.core;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.safari.SafariDriver;
import org.openqa.selenium.safari.SafariOptions;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import static com.splashlearn.constants.SplashLearnConstants.*;

public class BrowserFactory {

    private static final String HUB = "http://localhost:7002/wd/hub";
    private static final Logger logger = LogManager.getLogger(BrowserFactory.class);
    public static boolean jenkins;
    public static boolean killBrowser;
    public static String runmode;
    public static boolean headless;
    private final WebDriver driver;


    public BrowserFactory(WebDriver driver) {
        this.driver = driver;
    }

    public static WebDriver startChrome() throws IOException {

        HashMap<String, Object> prefs = new HashMap<>();
        prefs.put("profile.default_content_settings.popups", 0);
        prefs.put("download.prompt_for_download", "false");
        prefs.put("download.directory_upgrade", "true");
        prefs.put("credentials_enable_service", false);
        prefs.put("profile.password_manager_enabled", false);

        if (Boolean.TRUE.equals(jenkins))
            prefs.put("download.default_directory", DOCKER_DOWNLOAD_DIRECTORY);
        else
            prefs.put("download.default_directory", LOCAL_DOWNLOAD_DIRECTORY);

        ChromeOptions chromeOptions = new ChromeOptions()
                .addArguments("--no-sandbox")
                .addArguments("disable-extensions")
                .setExperimentalOption("prefs", prefs)
                .setExperimentalOption("excludeSwitches", new String[]{"enable-automation"})
                .addArguments("--disable-notifications")
                .addArguments("start-maximized")
                .addArguments("--disable-dev-shm-usage")
                .addArguments("--remote-allow-origins=*")
                .addArguments("--disable-gpu");



        logger.debug("isHeadless=" + headless);

        if (headless) {
            chromeOptions.setHeadless(headless);
            chromeOptions.addArguments("--window-size=1280,800");
        }

        WebDriver driver;
        if (runmode.equalsIgnoreCase("grid")){
            chromeOptions.setCapability("platform", "LINUX");
            driver = new RemoteWebDriver(new URL(HUB), chromeOptions);
        }else {
            WebDriverManager.chromedriver().setup();
            driver = new ChromeDriver(chromeOptions);
            driver.manage().deleteAllCookies();

        }
        logger.debug("Chrome browser launched successfully.");
        logger.debug("Chrome options:" + chromeOptions.toJson());
        return driver;
    }

    public static WebDriver startFirefox() throws MalformedURLException {
        System.setProperty(FirefoxDriver.SystemProperty.BROWSER_LOGFILE, "/dev/null");

        FirefoxOptions firefoxOptions = new FirefoxOptions();
        firefoxOptions.setCapability("marionette", true);

        firefoxOptions.addPreference("browser.download.folderList", 2);
        firefoxOptions.addPreference("browser.helperApps.neverAsk.saveToDisk", "application/xls");

        WebDriver driver;

        if (Boolean.TRUE.equals(jenkins)) {
            firefoxOptions.addPreference("browser.download.dir", DOCKER_DOWNLOAD_DIRECTORY);
            firefoxOptions.setHeadless(true)
                    .addArguments("disable-gpu")
                    .addArguments("window-size=1400,900");

            firefoxOptions.setCapability("platform", "LINUX");

            driver = new RemoteWebDriver(new URL(HUB), firefoxOptions);
        } else {
            firefoxOptions.addPreference("browser.download.dir", LOCAL_DOWNLOAD_DIRECTORY);
            WebDriverManager.firefoxdriver().setup();
            driver = new FirefoxDriver(firefoxOptions);
        }
        logger.debug("Firefox browser launched successfully.");
        return driver;
    }

    public static WebDriver startSafari() {
        SafariOptions safariOptions = new SafariOptions();
        WebDriver driver = new SafariDriver(safariOptions);
        logger.debug("Firefox browser launched successfully.");
        return driver;
    }

    public void close() {
        if (driver == null)
            return;
        driver.quit();
    }

    public void url(String url) {
        driver.get(url);
    }

    public String getCurrentUrl() {
        return driver.getCurrentUrl();
    }

    public void maximize() {
        driver.manage().window().maximize();
    }

    public Document getHTML(String url) throws IOException {
        return Jsoup.connect(url).cookie(SESSION_COOKIE_NAME, getSessionId()).timeout(60000).get();
    }

    public String getSessionId() {
        return getCookie(SESSION_COOKIE_NAME);
    }

    public String getCookie(String v) {
        return driver.manage().getCookieNamed(v).getValue();
    }

}
