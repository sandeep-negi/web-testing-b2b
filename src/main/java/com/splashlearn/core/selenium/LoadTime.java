package com.splashlearn.core.selenium;

import com.splashlearn.core.BrowserFactory;
import com.splashlearn.core.TextFileHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

public class LoadTime {
    private double start;
    private double end;
    private double timeTaken;
    public static String data;

    private static final Logger loadLogger = LogManager.getLogger();
    private TextFileHelper txt = new TextFileHelper();

    public void startTimer(){
        start = System.nanoTime();
    }
    public void endTimer(WebDriver driver, String action, String url, String detail){

//        waitForSpinner(driver);
        end = System.nanoTime();
        double timeTaken = (end - start)/1000000000;

        timeTaken = timeTaken > 1000 ? 0 : timeTaken;
        txt.createNewFile("LoadTimeLogger");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
//        System.out.println(dtf.format(now));

        if (action.equals("TC failed"))
        {
            txt.writeToFile("LoadTimeLogger", "TC Failed!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + "-" + "!" + url + "!" + data);
        }
        else
            if(timeTaken > (10)){
                txt.writeToFile("LoadTimeLogger", "UnacceptableTime!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.fatal("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
            else if (timeTaken > (5)){
                txt.writeToFile("LoadTimeLogger", "TooMuchTime!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.warn("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
            else if (timeTaken > (1)){
                txt.writeToFile("LoadTimeLogger", "Fine!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.warn("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
            else if (timeTaken <= (1)){
                txt.writeToFile("LoadTimeLogger", "Very Fine!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.warn("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
//        else
//            loadLogger.warn(timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url);
        startTimer();
    }

    public void logTimer(WebDriver driver, String action, String url, String detail){

//        waitForSpinner(driver);
        end = System.nanoTime();
        double timeTaken = (end - start)/1000000000;

        txt.createNewFile("LoadTimeLogger");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
//        System.out.println(dtf.format(now));
        if (action.equals("TC failed"))
        {
            txt.writeToFile("LoadTimeLogger", "TC Failed!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + "-" + "!" + url + "!" + data);
        }
        else
            if(timeTaken > (10)){
                txt.writeToFile("LoadTimeLogger", "UnacceptableTime!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.fatal("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
            else if (timeTaken > (5)){
                txt.writeToFile("LoadTimeLogger", "TooMuchTime!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.warn("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
            else if (timeTaken > (1)){
                txt.writeToFile("LoadTimeLogger", "Fine!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.warn("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
            else if (timeTaken <= (1)){
                txt.writeToFile("LoadTimeLogger", "Very Fine!" + dtf.format(now) + "!" + timeTaken + "!" + action + "!" + detail + "!" + driver.getTitle() + "!" + url + "!" + data);
                loadLogger.warn("------->" + timeTaken + " seconds: for " + action + " -> " + detail + " on page -> " + driver.getTitle() + " url -> " + url + "!" + data);
            }
    }
}
