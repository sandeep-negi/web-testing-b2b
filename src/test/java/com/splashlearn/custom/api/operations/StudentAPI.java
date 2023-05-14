package com.splashlearn.custom.api.operations;

import com.splashlearn.custom.api.endpoints.StudentEndPoint;
import com.splashlearn.custom.entity.model.Student;
import io.restassured.response.Response;

import java.util.HashMap;
import java.util.Map;

import static com.splashlearn.custom.api.RestAssuredHelper.getRequestSpecificationForAutomationService;
import static io.restassured.RestAssured.given;

public class StudentAPI {


    public static Response completePlayable(Student student, String subject, int learningObjectiveId, int playableId) {

        Map<String, Object> queryParams = new HashMap();
        queryParams.put("studentId", student.getId());
        queryParams.put("subject", subject);
        queryParams.put("learningObjectiveId", learningObjectiveId);
        queryParams.put("playableId", playableId);

        Response response = given(getRequestSpecificationForAutomationService()).queryParams(queryParams).
                post(StudentEndPoint.COMPLETE_PLAYABLE).then().statusCode(200).extract().response();
        return response;
    }

    public static Response completeLearningPath(Student student, String subject) {

        Map<String, String> queryParams = new HashMap();
        queryParams.put("studentId", student.getId());
        queryParams.put("subject", subject);

        Response response = given(getRequestSpecificationForAutomationService()).pathParams(queryParams).
                post(StudentEndPoint.COMPLETE_LEARNING_PATH).then().assertThat().statusCode(200).extract().response();
        return response;
    }

}
