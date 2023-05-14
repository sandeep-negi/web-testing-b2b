package com.splashlearn.custom.api.operations;

import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.endpoints.APIGateway;
import com.splashlearn.custom.api.endpoints.TeacherEndPoint;
import com.splashlearn.custom.api.model.pojo.teacherInfo.Klasses;
import com.splashlearn.custom.api.model.pojo.teacherprofile.TeacherProfile;
import com.splashlearn.utils.TeacherUtility;
import io.restassured.http.Cookies;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.apache.http.HttpStatus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jsoup.Jsoup;

import java.util.*;

import static io.restassured.RestAssured.given;

public class TeacherDashboardApi {
    private Cookies cookies;
    private static final Logger logger = LogManager.getLogger(TeacherDashboardApi.class);
    public TeacherDashboardApi(){
    }

    public TeacherDashboardApi(Cookies cookies){
        this.cookies = cookies;
    }

    public Cookies getCookies(){
        return cookies;
    }

    public Response visitTeacherDashboard(String sessionId){
        Header header = new Header("content-type", "application/x-www-form-urlencoded");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                headers(headers).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.TEACHER_DASHBOARD).
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

    public String getCsrfToken(Response response){
        return Jsoup.parse(response.getBody().asString()).select("meta[name=csrf-token]")
                .attr("content");
    }

    public static List<Klasses> getAllKlassData(TeacherProfile teacherProfile) {

        List<Klasses>klassData = new ArrayList<>(teacherProfile.getKlasses());
//        for (Klasses klass : klassData) {
//            klass.setId(klass.getId());
//            klass.setName(klass.getName());
//            klass.setTeacher_id(klass.getTeacher_id());
//            klass.setGrade_id(getGradeId(klass.getGrade_id()));
//            klass.setStudents_count(klass.getStudents_count());
//            klass.setSchool_year(klass.getSchool_year());
//            klass.setSlug(klass.getSlug());
//            klass.setPicture_password_enabled(klass.isPicture_password_enabled());
//            klass.setGrade_code(klass.getGrade_code());
//        }
        return klassData;
    }

//    public static Teacher getTeacherData(TeacherProfile teacherProfile){
//
//        Teacher teacher = new Teacher();
//        teacher.setId(teacherProfile.getTeacher().getId());
//        teacher.setEmail(teacherProfile.getTeacher().getEmail());
//        teacher.setAnalytics_id(teacherProfile.getTeacher().getAnalytics_id());
//
//        return teacher ;
//    }

    public static String getGradeId(String grade){

        String gradeCode = null ;
        switch (grade) {
            case "K" : gradeCode = "kindergarten"; break;
            case "1" : gradeCode = "first-grade"; break;
            case "2" : gradeCode = "second-grade"; break;
            case "3" : gradeCode = "third-grade"; break;
            case "4" : gradeCode = "fourth-grade"; break;
            case "5" : gradeCode = "fifth-grade"; break;
            default : logger.error("Invalid Grade = " + grade);
        }
        return gradeCode;
    }

    public Response addNewKlass(Map<String, String> data, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        String jsonBody = "{\n" +
                "    \"name\": \""+ data.get("klassName")+"\",\n" +
                "    \"grade_code\": \""+data.get("gradeCode")+"\",\n" +
                "    \"subject_preference_cd\": \""+data.get("subjectPreferenceCd")+"\"\n" +
                "}";

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post(TeacherEndPoint.ADD_NEW_KLASS).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 201){
            throw new RuntimeException("Failed to Add Klass" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response deleteKlass(String klassId, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                cookies(cookies).
                pathParam("klassId", klassId).
                log().all().
                when().
                delete(TeacherEndPoint.DELETE_KLASS).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to Delete Klass" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response addStudents(String klassId, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        String jsonBody = "{\"students\":[{\"student_name\":\"mike\",\"parent_email\":null}]}";

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("klassId", klassId).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post(TeacherEndPoint.ADD_STUDENTS).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 201){
            throw new RuntimeException("Failed to Add Students in Klass" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response getStudents(String klassId, String sessionId){
        Header header = new Header("content-type", "application/x-www-form-urlencoded");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("klassId", klassId).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.GET_STUDENTS).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_OK){
            throw new RuntimeException("Failed to show Assessment Details" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }
    public Response setTimeZone(String countryName, String schoolId, String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        String jsonBody = "{\"user\":{\"first_name\":\"Brendon\",\"last_name\":\"Keeling\",\"time_zone\":\""+countryName+"\",\"school_id\":\""+schoolId+"\"},\"prevent_redirect\":true}";

        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                headers(headers).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                patch(TeacherEndPoint.TIME_ZONE).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_OK){
            throw new RuntimeException("Failed to Change user Time Zone" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response getAllAssignedABTest(String userId, String sessionId) {
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        TeacherUtility teacherUtility = new TeacherUtility();
        String data = teacherUtility.stringToUuId(userId);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("userId", data).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.GET_ALL_AB_TEST).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_OK){
            throw new RuntimeException("Failed to get AB Test" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response getTeacherSchoolServiceProfile(String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.SCHOOL_SERVICE_PROFILE).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_OK){
            throw new RuntimeException("Failed to get Teacher School Service Profile" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }
    public Response getTeacherWebServiceProfile(String sessionId){
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(TestContext.url).
                headers(headers).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.PROFILE).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != 200){
            throw new RuntimeException("Failed to get Teacher Web Service Profile Details" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;

    }

    public Response getUserAssignedPersona(String userId, String sessionId) {
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("userId", userId).
                cookies(cookies).
                log().all().
                when().
                post(TeacherEndPoint.GET_ASSIGNED_PERSONA).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_CREATED){
            throw new RuntimeException("Failed to get AB Test" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response getUserOnboardingStates(String klassId, String sessionId) {
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("klassId", klassId).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.GET_ONBOARDING_STATES).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_OK){
            throw new RuntimeException("Failed to get AB Test" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }
    public Response getAllKlasses(String teacherId, String sessionId) {
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("userId", teacherId).
                cookies(cookies).
                log().all().
                when().
                get(TeacherEndPoint.GET_ALL_KLASSES).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_OK){
            throw new RuntimeException("Failed to get AB Test" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

    public Response downloadWorksheet(String teacherId, String sessionId, int entityId) {
        Header header = new Header("content-type", "application/json");
        Headers headers = new Headers(header);
        String jsonBody = "{\"entity_id\":"+entityId+",\"entity_type\":\"SearchContent\"}";

        Response response = given().cookie("_session_id", sessionId).
                baseUri(APIGateway.getUrl()).
                headers(headers).
                pathParam("teacherId", teacherId).
                cookies(cookies).
                body(jsonBody).
                log().all().
                when().
                post(TeacherEndPoint.DOWNLOAD_WORKSHEET).
                then().
                log().all().
                extract().
                response();
        if(response.getStatusCode() != HttpStatus.SC_CREATED){
            throw new RuntimeException("Failed to download Worksheet" + ", HTTP Status Code: " + response.getStatusCode());
        }
        this.cookies = response.getDetailedCookies();
        return response;
    }

}
