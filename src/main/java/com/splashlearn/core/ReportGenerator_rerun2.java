package com.splashlearn.core;

import com.rajatthareja.reportbuilder.ReportBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.testng.ITestContext;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReportGenerator_rerun2 {

    private static final Logger logger = LogManager.getLogger(ReportGenerator_rerun2.class);
    private static int TOTAL_COUNT;
    private static int PASSED_COUNT;
    private static int SKIPPED_COUNT;
    private static int FAILED_COUNT;

    public static void main(String[] args) throws IOException {

        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
            String now = simpleDateFormat.format(new Date());

            String runId = System.getProperty("runId", "local");
            ReportBuilder reportBuilder = new ReportBuilder();
            reportBuilder.setReportDirectory("target-rerun2/");
            reportBuilder.setReportFileName(String.format("run_%s_rerun_splashlearn_web_results_%s", runId, now));
            reportBuilder.setReportTitle("SplashLearn Web Automation Results - Rerun Again");
            reportBuilder.setReportColor(Arrays.asList("brown", "cyan", "indigo", "grey", "purple")
                    .get((new Random()).nextInt(5)));

            reportBuilder.setAdditionalInfo("Run ID", runId);
            reportBuilder.setAdditionalInfo("Browser", System.getProperty("browser", ""));
            reportBuilder.setAdditionalInfo("Environment", System.getProperty("environment", ""));
            ReportGenerator.failedTestScenarioIDs = ReportGenerator.getJSONObject("target-rerun2/result.json", "FAILED_TESTS_INFO");
            for (Map.Entry<String, String> entry: ReportGenerator.mapOfFailedTestScenarios.entrySet()) {
//                System.out.println("Failed TC: " + entry.getKey() + " - " + entry.getValue());
                reportBuilder.setAdditionalInfo("Failed TC: " + entry.getKey(), entry.getValue());
            }

            List<Object> configuration = new ArrayList<>();
            configuration.add(new File("target-rerun2/cucumber-report/"));
            reportBuilder.build(configuration);

            logger.info("Report {} generated successfully.", reportBuilder.getReportFileName());

            if (System.getProperty("jenkins", "false").equalsIgnoreCase("false"))
                return;

            String link = new S3Helper().upload("target-rerun2/" + reportBuilder.getReportFileName() + ".html");

            if (link == null)
                return;

            try (FileOutputStream o = new FileOutputStream("target-rerun2/result.txt")) {
                o.write(link.getBytes());
            }

            logger.info("File {} uploaded successfully at path {}.", reportBuilder.getReportFileName(), link);
        } catch (Exception e) {
            logger.error("Unable to generate/upload report.");
        }

    }

    public static void storeResults(ITestContext context) {
        PASSED_COUNT = context.getPassedTests().size();
        SKIPPED_COUNT = context.getSkippedTests().size();
        FAILED_COUNT = context.getFailedTests().size();
        TOTAL_COUNT = PASSED_COUNT + SKIPPED_COUNT + FAILED_COUNT;

        if (Boolean.TRUE.equals(BrowserFactory.jenkins))
            storeInWorkspace();
    }

    private static void storeInWorkspace() {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("PASSED_COUNT", PASSED_COUNT);
        jsonObject.put("FAILED_COUNT", FAILED_COUNT);
        jsonObject.put("SKIPPED_COUNT", SKIPPED_COUNT);
        jsonObject.put("TOTAL_COUNT", TOTAL_COUNT);
        jsonObject.put("FAILED_TESTS", ReportGenerator.failedTests == null ? "NA" : ReportGenerator.failedTests);
        jsonObject.put("FAILED_FUNCTIONALITIES", ReportGenerator.failedTestFunctionalities == null ? "NA" : ReportGenerator.failedTestFunctionalities);
        jsonObject.put("FAILED_TESTS_INFO", ReportGenerator.failedTestScenarioIDs == null ? "NA" : ReportGenerator.failedTestScenarioIDs);

        try (FileWriter file = new FileWriter("target-rerun2/result.json")) {
            file.write(jsonObject.toString());
            file.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void printSummary(ITestContext context) {

        logger.info("************************* RESULT SUMMARY *************************");
        logger.info("ReRun PASSED SCENARIOS    =   " + PASSED_COUNT);
        logger.info("ReRun FAILED SCENARIOS    =   " + FAILED_COUNT);
        logger.info("ReRun SKIPPED SCENARIOS   =   " + SKIPPED_COUNT);
        logger.info("ReRun TOTAL SCENARIOS     =   " + TOTAL_COUNT);
        logger.info("FAILED TESTS     =   " + ReportGenerator.failedTests);
        logger.info("FAILED TESTS SCENARIOS    =   " + ReportGenerator.failedTestScenarioIDs);
        logger.info("******************************************************************");

    }


}