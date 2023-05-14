package com.splashlearn.custom.api.endpoints;

public class StudentEndPoint {

    public static final String STAGING_API_SPLASHMATH = "http://api-preprod.splashlearn.com";
    public static final String BASE_PATH = "/sla";

    public static final String COMPLETE_PLAYABLE = "/sla/content/complete_playable";
    public static final String COMPLETE_LEARNING_PATH = "/sla/content/complete_learning_path";
    public static final String STUDENT_MATH_DASHBOARD = "/student-dashboard#/math";
    public static final String STUDENT_READING_DASHBOARD = "/student-dashboard#/reading";
    public static final String STUDENT_TODO_LIST = "/student-dashboard#/todo_list";
    public static final String SIGN_OUT = "/signout";


    private StudentEndPoint() {
        throw new IllegalStateException("This class can't be instantiated");
    }

}
