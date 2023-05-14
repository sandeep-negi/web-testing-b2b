package com.splashlearn.custom.api.operations;

import com.splashlearn.custom.api.endpoints.APIGateway;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import io.restassured.http.Cookies;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.apache.http.HttpStatus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import static io.restassured.RestAssured.given;

public class HomeAccessPageApi {
    private Cookies cookies;
    private static final Logger logger = LogManager.getLogger(HomeAccessPageApi.class);
    public HomeAccessPageApi(){
    }

    public HomeAccessPageApi(Cookies cookies){
        this.cookies = cookies;
    }

    public Cookies getCookies(){
        return cookies;
    }

    public Response teacherReferralInviteLetter(String klassId, String sessionId) {
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        String jsonBody = "{\"student_ids\":[],\"whole_klass\":true,\"source\":\"download_letter\",\"referrer_page\":\"home_access\",\"parent_letter_downloaded_once\":true}";

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("klassId", klassId).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post(TeacherEndPoint.TEACHER_BULK_REFERRALS).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_CREATED){
            throw new RuntimeException("Failed to Download Teacher Referral invite Letter " + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }
}
