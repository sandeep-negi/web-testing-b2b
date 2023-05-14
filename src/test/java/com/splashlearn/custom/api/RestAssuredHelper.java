package com.splashlearn.custom.api;

import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.endpoints.APIGateway;
import com.splashlearn.custom.api.endpoints.AutomationService;
import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.config.LogConfig;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;

import java.io.FileNotFoundException;
import java.io.PrintStream;

import static com.splashlearn.custom.api.endpoints.StudentEndPoint.BASE_PATH;
import static com.splashlearn.custom.api.endpoints.StudentEndPoint.STAGING_API_SPLASHMATH;
import static io.restassured.RestAssured.config;

public class RestAssuredHelper {


    static {
        PrintStream fileOutPutStream = null;
        try {
            fileOutPutStream = new PrintStream("logs/api.log");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        RestAssured.config = RestAssured.config().logConfig(new LogConfig().defaultStream(fileOutPutStream).enablePrettyPrinting(true));
    }

    public static RequestSpecification getRequestSpecificationForAutomationService() {
        return new RequestSpecBuilder().
                setBaseUri(AutomationService.getUrl()).
                setBasePath(BASE_PATH).build();
    }

    public static RequestSpecification getRequestSpecificationFromEnvironment(String url) {
        return new RequestSpecBuilder().
                setBaseUri(url).
                build();
    }

    public static RequestSpecification getRequestSpecificationForMicroservices() {
        return new RequestSpecBuilder().
                setBaseUri(APIGateway.getUrl()).
                build();
    }

    public ResponseSpecification getResponseSpecification() {
        return new ResponseSpecBuilder().build();
    }

}
