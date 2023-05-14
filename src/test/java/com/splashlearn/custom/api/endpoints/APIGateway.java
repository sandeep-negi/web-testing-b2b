package com.splashlearn.custom.api.endpoints;

import com.splashlearn.context.TestContext;

public class APIGateway {

    public static final String STAGING = "https://staging-apig.splashlearn.com";
    public static final String PREPROD = "https://preprod-apig.splashlearn.com";
    public static final String PROD = "https://apig.splashlearn.com";
    public static final String OTP_GATEWAY ="http://staging-apig.splashlearn.com";

    public static String getUrl() {

        if (TestContext.url.contains("preprod"))
            return PREPROD;
        else if (TestContext.url.contains("www"))
            return PROD;
        else
            return STAGING;
    }
}
