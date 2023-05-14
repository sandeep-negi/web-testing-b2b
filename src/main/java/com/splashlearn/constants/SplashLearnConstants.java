package com.splashlearn.constants;

public class SplashLearnConstants {

    public static int SHORT_TIMEOUT = 3;
    public static int DEFAULT_TIMEOUT = 4;
    public static int MEDIUM_TIMEOUT = 6;
    public static int LONG_TIMEOUT = 10;
    public static int TEMP_TIMEOUT = 30 ;

    public static final String DOCKER_DOWNLOAD_DIRECTORY = "/home/seluser/Downloads";
    public static final String LOCAL_DOWNLOAD_DIRECTORY = System.getProperty("user.dir");
    public static final String SESSION_COOKIE_NAME = "_session_id";
    public static final String XCSRF_TOKEN_NAME = "x-csrf-token";
    public static final String JWT_AUTHORIZATION = "jwt_authorization";


    public static final String PAGE_KLASS_LOCATORS_WITH_RANDOM_APPEARANCE = "random_appearance_locators";

    private SplashLearnConstants() {
        throw new IllegalStateException("This class can't be instantiated");
    }
}
