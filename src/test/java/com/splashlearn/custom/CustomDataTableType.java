package com.splashlearn.custom;

import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.domainobjects.AssessmentDetails;
import com.splashlearn.domainobjects.LoginDetails;
import com.splashlearn.domainobjects.StudentLoginDetails;
import io.cucumber.java.DataTableType;
import java.util.HashMap;
import java.util.Map;

public class CustomDataTableType {

    private TestContext testContext ;
    private final Evaluator evaluator = new Evaluator();
    private final Map<String, String> data;

    public CustomDataTableType(TestContext testContext) {
        this.testContext = testContext;
        this.data = testContext.getData();
    }

    @DataTableType
    public LoginDetails loginDetailsEntry(Map<String, String> dataTable){
        Map<String, String> data = new HashMap<>();
        data.put("username", evaluator.evaluate(testContext.getData(), dataTable.get("userEmail")));
        data.put("password", evaluator.evaluate(testContext.getData(), dataTable.get("userPassword")));
        return new LoginDetails(data.get("username"),data.get("password"));
    }

    @DataTableType
    public StudentLoginDetails studentLoginDetailsEntry(Map<String, String> dataTable){
        Map<String, String> data = new HashMap<>();
        data.put("studentName" ,evaluator.evaluate(testContext.getData(), dataTable.get("studentName")));
        data.put("studentId" ,evaluator.evaluate(testContext.getData(), dataTable.get("studentId")));
        data.put("studentPassword" ,evaluator.evaluate(testContext.getData(), dataTable.get("studentPassword")));
        return new StudentLoginDetails(data.get("studentName"),data.get("studentId"),data.get("studentPassword"));
    }

    @DataTableType
    public AssessmentDetails assessmentDetails(Map<String, String> assessmentDataTable){
        Map<String, String> data = new HashMap<>();
        data.put("klass_id", evaluator.evaluate(testContext.getData(), assessmentDataTable.get("klassId")));
        data.put("assessment_name", evaluator.evaluate(testContext.getData(), assessmentDataTable.get("assessmentName")));
        data.put("module_id", evaluator.evaluate(testContext.getData(), assessmentDataTable.get("moduleId")));

        AssessmentDetails assessmentDetails = new AssessmentDetails(data.get("klass_id"),
                data.get("assessment_name"),
                data.get("module_id"));

        return new AssessmentDetails(assessmentDetails.getKlassId(),
                assessmentDetails.getAssessmentName(),
                assessmentDetails.getModuleId());
    }

}
