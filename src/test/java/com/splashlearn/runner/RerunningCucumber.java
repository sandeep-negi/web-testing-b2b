package com.splashlearn.runner;


import com.splashlearn.constants.SplashLearnConstants;
import com.splashlearn.core.ReportGenerator_rerun;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.ITestContext;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.DataProvider;

@CucumberOptions(
        features = {"@target-rerun/rerun.txt",
        },
        glue={"com.splashlearn.steps","com.splashlearn.custom"},
        plugin={"json:target-rerun/cucumber-report/cucumber.json", "pretty", "html:target-rerun/cucumber-report/cucumber.html",
                "rerun:target-rerun2/rerun.txt"}
)
@Log4j2
public class RerunningCucumber extends AbstractTestNGCucumberTests
{
        private static final Logger logger = LogManager.getLogger(TestRunner.class);

        @DataProvider(parallel = true)
        @Override
        public Object[][] scenarios() {
                return super.scenarios();
        }

        @BeforeSuite
        public void beforeSuite(){
                SplashLearnConstants.SHORT_TIMEOUT = 10;
                SplashLearnConstants.DEFAULT_TIMEOUT = 20;
                SplashLearnConstants.MEDIUM_TIMEOUT = 30;
                SplashLearnConstants.LONG_TIMEOUT = 40;
        }

        @AfterSuite
        public void afterSuite(ITestContext context) {

                ReportGenerator_rerun.storeResults(context);
                ReportGenerator_rerun.printSummary(context);

        }
}