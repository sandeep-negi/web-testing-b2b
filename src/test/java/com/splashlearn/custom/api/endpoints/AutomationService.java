package com.splashlearn.custom.api.endpoints;

import com.splashlearn.context.TestContext;

public class AutomationService {

    public static final String STAGING = "http://staging-api.splashlearn.com";
    public static final String PREPROD = "http://preprod-api.splashlearn.com";
    public static final String DEV = "http://dev.slearn.me";

    public static String getUrl() {

        if (TestContext.url.contains("staging") || TestContext.url.contains("f2"))
            return DEV;
        else
            return PREPROD;
    }
}
