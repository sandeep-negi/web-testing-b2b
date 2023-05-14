package com.splashlearn.custom.api.operations;

import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.endpoints.AutomationService;
import com.splashlearn.custom.api.endpoints.StudentEndPoint;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import io.restassured.http.Cookies;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.jsoup.Jsoup;

import static io.restassured.RestAssured.given;

public class AssignmentApi {
    private Cookies cookies;

    public AssignmentApi(Cookies cookies) {
        this.cookies = cookies;
    }

    public Cookies getCookies(){
        return cookies;
    }

    public Response createAssignment(String klassId, String loId, TestContext context){
        String csrfToken = getCsrfToken(context);
        Header header = new Header("content-type", "application/json");
        Header xCsrfToken = new Header("x-csrf-token", csrfToken);
        Headers headers = new Headers(header, xCsrfToken);
        String jsonBody = "{}";

        Response response = given().
                cookie("_session_id", context.getSessionId()).
                cookie("jwt_authorization",context.getJwtToken()).
                baseUri(TestContext.url).
                pathParam("klassId", klassId).
                queryParam("learning_objective_id", loId).
                headers(headers).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post(TeacherEndPoint.ASSIGNMENT_TO_WHOLE_KLASS).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 201){
            throw new RuntimeException("Failed to create Assignment " + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response completeLearningObjective(String studentId, String subject){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().
                baseUri(AutomationService.getUrl()).
                queryParam("studentId", studentId).
                queryParam("subject", subject).
                headers(headers).
                log().all().
                when().
                post(StudentEndPoint.COMPLETE_LEARNING_PATH).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to complete LO" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }
    public Response completePlayable(String studentId, String playableId, String loId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().
                baseUri(AutomationService.getUrl()).
                queryParam("studentId", studentId).
                queryParam("playableId", playableId).
                queryParam("learningObjectiveId", loId).
                queryParam("timeSpent", "1200").
                headers(headers).
                log().all().
                when().
                post(StudentEndPoint.COMPLETE_PLAYABLE).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to create Assignment " + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public String getCsrfToken(TestContext context){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response resp = given().cookie("_session_id", context.getSessionId()).
                cookie("jwt_authorization", "jwt_authorization").
                baseUri(TestContext.url).
                headers(headers).
                cookies(cookies).
                log().all().
                when().
                get("/").
                then().
                log().all().
                extract().
                response();
        if(resp.getStatusCode() != 200){
            throw new RuntimeException("Failed to show Assessment Details" + ", HTTP Status Code: " + resp.getStatusCode());
        }
        this.cookies = resp.getDetailedCookies();
        context.sessionId = resp.getCookies().get("_session_id");
        context.jwtToken = resp.getCookies().get("jwt_authorization");

        return Jsoup.parse(resp.getBody().asString()).select("meta[name=csrf-token]")
                .attr("content");
    }
}
