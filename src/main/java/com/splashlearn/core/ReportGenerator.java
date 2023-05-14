package com.splashlearn.core;

import com.rajatthareja.reportbuilder.ReportBuilder;
import org.apache.commons.io.IOUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.testng.ITestContext;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReportGenerator {

    private static final Logger logger = LogManager.getLogger(ReportGenerator.class);
    private static int TOTAL_COUNT;
    private static int PASSED_COUNT;
    private static int SKIPPED_COUNT;
    private static int FAILED_COUNT;
    public static String failedTests = null;
    public static String failedTestScenarioIDs = null;
    public static String failedTestFunctionalities = null;
    public static Map <String, String> mapOfFailedTestScenarios = new HashMap<>();

    public static void main(String[] args) throws IOException {

        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
            String now = simpleDateFormat.format(new Date());

            String runId = System.getProperty("runId", "local");
            ReportBuilder reportBuilder = new ReportBuilder();
            reportBuilder.setReportDirectory("target/");
            reportBuilder.setReportFileName(String.format("run_%s_splashlearn_web_results_%s", runId, now));
            reportBuilder.setReportTitle("SplashLearn Web Automation Results");
            reportBuilder.setReportColor(Arrays.asList("brown", "cyan", "indigo", "grey", "purple")
                    .get((new Random()).nextInt(5)));

            reportBuilder.setAdditionalInfo("Run ID", runId);
            reportBuilder.setAdditionalInfo("Browser", System.getProperty("browser", ""));
            reportBuilder.setAdditionalInfo("Environment", System.getProperty("environment", ""));
            ReportGenerator.failedTestScenarioIDs = getJSONObject("target/result.json", "FAILED_TESTS_INFO");
//            System.out.println("In ReportGen - failedTestScenarios: " + ReportGenerator.failedTestScenarios);
//            reportBuilder.setAdditionalInfo("Failed Scenarios", ReportGenerator.failedTestScenarios == null ? "NA" : ReportGenerator.failedTestScenarios);

            for (Map.Entry<String, String> entry: mapOfFailedTestScenarios.entrySet()) {
//                System.out.println("Failed TC: " + entry.getKey() + " - " + entry.getValue());
                reportBuilder.setAdditionalInfo("Failed TC: " + entry.getKey(), entry.getValue());
            }

            List<Object> configuration = new ArrayList<>();
            configuration.add(new File("target/cucumber-report/"));
            reportBuilder.build(configuration);

            logger.info("Report {} generated successfully.", reportBuilder.getReportFileName());

            if (System.getProperty("jenkins", "false").equalsIgnoreCase("false"))
                return;

            String link = new S3Helper().upload("target/" + reportBuilder.getReportFileName() + ".html");

            if (link == null)
                return;

            try (FileOutputStream o = new FileOutputStream("target/result.txt")) {
                o.write(link.getBytes());
            }

            logger.info("File {} uploaded successfully at path {}.", reportBuilder.getReportFileName(), link);
        } catch (Exception e) {
            logger.error("Unable to generate/upload report.");
        }

    }

    public static String getJSONObject(String jsonPath, String key){
        try {
            File f = new File(jsonPath);
            if (f.exists()) {
                InputStream is = new FileInputStream(jsonPath);
                String jsonTxt = IOUtils.toString(is, "UTF-8");
                System.out.println("JSON Text: " + jsonTxt);
                JSONObject json = new JSONObject(jsonTxt);
                String value = json.getString(key);
//                value = value.replace(",", "\n");
                boolean testPresent = true;
                while(testPresent && !(value == null) ){
                    if(value.indexOf("^") >= 0)
                        testPresent = true;
                    else
                        testPresent = false;
                    String title = value.substring(0, value.indexOf("|"));
                    System.out.println("title: " + title);
                    String detail;
                    if((value.indexOf("\n") < value.indexOf("^")) && (value.indexOf("\n") > 0))
                        value = value.substring(0, value.indexOf("\n")) + value.substring(value.indexOf("^"));
                    if (testPresent)
                        detail = value.substring(value.indexOf("|") + 2, value.indexOf("^"));
                    else
                        detail = value.substring(value.indexOf("|") + 2);
                    System.out.println("detail: " + detail);
                    if(mapOfFailedTestScenarios.containsKey(title))
                        mapOfFailedTestScenarios.put(title, mapOfFailedTestScenarios.get(title) + "\n" +detail);
                    else
                        mapOfFailedTestScenarios.put(title, detail);
                    if (testPresent)
                        value = value.substring(value.indexOf("^") + 1);
                }
                System.out.println("Value for " + key + ": " + value);
                value = value == null ? "NA" : value;
                return value;
            }
        }
        catch(Exception e) {
            System.out.println("Caught Exception: " + e);
        }
        return "NA";
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

        try (FileWriter file = new FileWriter("target/result.json")) {
            file.write(jsonObject.toString());
            file.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void printSummary(ITestContext context) {

        logger.info("************************* RESULT SUMMARY *************************");
        logger.info("PASSED SCENARIOS    =   " + PASSED_COUNT);
        logger.info("FAILED SCENARIOS    =   " + FAILED_COUNT);
        logger.info("SKIPPED SCENARIOS   =   " + SKIPPED_COUNT);
        logger.info("TOTAL SCENARIOS     =   " + TOTAL_COUNT);
        logger.info("FAILED TESTS     =   " + ReportGenerator.failedTests);
        logger.info("FAILED TESTS FUNCTIONALITIES    =   " + ReportGenerator.failedTestFunctionalities);
        logger.info("FAILED TESTS SCENARIOS    =   " + ReportGenerator.failedTestScenarioIDs);
        logger.info("******************************************************************");

        ReportGenerator.failedTests = null;
        ReportGenerator.failedTestScenarioIDs = null;
        ReportGenerator.failedTestFunctionalities = null;
        ReportGenerator.mapOfFailedTestScenarios.clear();
    }

    public static void addFailedTestScenarioIDs(String testId, String qaAssignee, String name, String failureMessage) {

    }

//    public static void setFailedTestScenarios(String failedTestScenarios) {
//        System.out.println("in set func: " + ReportGenerator.failedTestScenarios);
//        ReportGenerator.failedTestScenarios = failedTestScenarios;
//        System.out.println("in propertyReader: " + ReportGenerator.failedTestScenarios);
//    }
}
