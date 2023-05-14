package com.splashlearn.custom.api.operations;

import com.splashlearn.context.TestContext;
import com.splashlearn.domainobjects.AssessmentDetails;
import io.restassured.http.Cookies;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;

import static io.restassured.RestAssured.given;

public class AssessmentApi {
    private Cookies cookies;
    public AssessmentApi(){
    }

    public AssessmentApi(Cookies cookies){
        this.cookies = cookies;
    }

    public Cookies getCookies(){
        return cookies;
    }

    public Response getAssessmentStatus(AssessmentDetails assessmentDetails, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                queryParam("selected_grade_code", "1").
                headers(headers).
                cookies(cookies).
                log().all().
                when().
                get("/web_api/teachers/v1/klass/"+assessmentDetails.getKlassId()+"/assessments/current_status").
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to show Assessment Details" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;

    }
    public Response createAssessment(AssessmentDetails assessmentDetails, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        String jsonBody = "{\"klass_id\":\""+assessmentDetails.getKlassId()+"\",\"module_ids\":[\""+assessmentDetails.getModuleId()+"\"]}";

        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                queryParam("selected_grade_code", "1").
                headers(headers).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post("/web_api/teachers/v1/klass/"+assessmentDetails.getKlassId()+"/assessments").
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 201){
            throw new RuntimeException("Failed to Create Assessment" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response deleteAssessment(AssessmentDetails assessmentDetails, String assessmentId, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        String jsonBody = "{}";
        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                queryParam("selected_grade_code", "1").
                headers(headers).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post("/web_api/teachers/v1/klass/"+assessmentDetails.getKlassId()+"/assessments/" + assessmentId + "/finish").
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to Delete Assessment" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

}
