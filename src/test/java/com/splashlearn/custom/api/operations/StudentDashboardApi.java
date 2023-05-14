package com.splashlearn.custom.api.operations;

import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.endpoints.StudentEndPoint;
import io.restassured.http.Cookies;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import static io.restassured.RestAssured.given;

public class StudentDashboardApi {
    private Cookies cookies;
    public StudentDashboardApi(){
    }

    public StudentDashboardApi(Cookies cookies){
        this.cookies = cookies;
    }

    public Cookies getCookies(){
        return cookies;
    }

    public Response visitStudentDashboard(String sessionId){
        Header header = new Header("content-type", "application/x-www-form-urlencoded");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                headers(headers).
                cookies(cookies).
                log().all().
                when().
                get(StudentEndPoint.STUDENT_MATH_DASHBOARD).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to show Student Dashboard" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public String getCsrfToken(Response response){
        Document doc = Jsoup.parse(response.body().prettyPrint());
        Element element = doc.selectFirst("[name='csrf-token']");
        return element.attr("content");
    }
}
