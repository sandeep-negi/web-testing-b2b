package com.splashlearn.context;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;


@Data
public class APIContext {
    private RequestSpecification requestSpec;
    private ResponseSpecification responseSpec;
    private Map<String, Response> responseMap = new HashMap<>();
    private String basePath = TestContext.url;
    private APITokens teacherApiTokens;
}
