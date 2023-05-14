package com.splashlearn.runner;

import com.splashlearn.core.ReportGenerator;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.ITestContext;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.DataProvider;


@CucumberOptions(features = "src/test/resources/"
        , glue = {"com.splashlearn.steps","com.splashlearn.custom"}
        , plugin = {"json:target/cucumber-report/cucumber.json", "pretty", "html:target/cucumber-report/cucumber.html",
        "rerun:target-rerun/rerun.txt"}
)
@Log4j2
public class TestRunner extends AbstractTestNGCucumberTests {



    private static final Logger logger = LogManager.getLogger(TestRunner.class);



    @DataProvider(parallel = true)
    @Override
    public Object[][] scenarios() {
            return super.scenarios();
    }

    @AfterSuite
    public void afterSuite(ITestContext context) {

        System.out.println("after Suite: " + ReportGenerator.failedTestScenarioIDs);
//        ReportGenerator.setFailedTestScenarios(ReportGenerator.failedTestScenarios);
        ReportGenerator.storeResults(context);
        ReportGenerator.printSummary(context);

    }

}
