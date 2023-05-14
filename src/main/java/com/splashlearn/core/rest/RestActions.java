package com.splashlearn.core.rest;

import io.restassured.RestAssured;

import static org.hamcrest.Matchers.lessThan;

public class RestActions {

    public String send(RestDTO restDTO) {
        // Build Request
        return RestAssured.given()
                .headers(restDTO.getHeaders())
                .queryParams(restDTO.getQueryParams())
                .formParams(restDTO.getFormParams())
                .pathParams(restDTO.getPathParams())
                .body(restDTO.getBody())
                .contentType(restDTO.getContentType())
                .baseUri(restDTO.getUrl())
                .basePath(restDTO.getPath())
                .cookies(restDTO.getCookies())
                .request(String.valueOf(restDTO.getMethod()))
                .then().assertThat().statusCode(lessThan(400))
                .extract()
                .asString();

    }



}
