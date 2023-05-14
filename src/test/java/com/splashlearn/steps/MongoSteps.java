package com.splashlearn.steps;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.client.FindIterable;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.utils.MongoHelper;
import com.splashlearn.utils.TestDataHelper;
import com.splashlearn.dto.UserDataDTO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.bson.Document;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class MongoSteps {

    private TestContext testContext;

    public MongoSteps(TestContext testContext) {
        this.testContext = testContext;
    }

    @Then("save user data in mongodb")
    public void saveUserDataInMongodb() {
        UserDataDTO userDataDTO = new UserDataDTO();
        Map<String, String> data = testContext.getData();
        userDataDTO.setTestId(testContext.getTestId());
        if(data.isEmpty())
            return;

        List<Map.Entry<String, String>> collect = data.entrySet().stream().filter(n -> (n.getKey().toLowerCase().contains("email")
                || n.getKey().toLowerCase().contains("username")) && n.getValue().startsWith("auto_"))
                .collect(Collectors.toList());

        if(!collect.isEmpty())
            userDataDTO.setUsername(collect.get(0).getValue());

        if(data.containsKey("Password"))
            userDataDTO.setPassword(data.get("Password"));

        TestDataHelper.write(userDataDTO);

    }

    @Then("^update user data in mongodb as:$")
    public void updateUserDataInMongodb(DataTable table) throws JsonProcessingException {
        Evaluator e = new Evaluator();
        List<Map<String, String>> rows = table.asMaps(String.class, String.class);
        Map<String, Object> data = new HashMap<>();


        // Getting data variable from mongo as the on in memory contains all the execution data.

        Map<String, Object> contextData = new ObjectMapper().readValue(((FindIterable<Document>) MongoHelper.getInstance()
                .query("{ \"test_id\": \"" + testContext.getTestId() +"\" }"))
                .into(new ArrayList<>()).get(0).toJson(), UserDataDTO.class).getData();

        rows.forEach(n -> {
            String value = e.evaluate(testContext.getData(), n.get("value"));
            if(n.get("field").equalsIgnoreCase("username"))
                data.put("username", value);
            else if(n.get("field").equalsIgnoreCase("password"))
                data.put("password", value);
            else {
                contextData.put(n.get("field"), value);
            }
        });
        data.put("data", contextData);
        MongoHelper.getInstance().update("test_id", testContext.getTestId(), data);
    }

}
