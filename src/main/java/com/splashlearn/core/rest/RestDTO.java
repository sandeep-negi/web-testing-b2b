package com.splashlearn.core.rest;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data @NoArgsConstructor
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class RestDTO {

    private String url;
    private String path;
    private RestMethods method;
    private Map<String, String> queryParams = new HashMap<>();
    private Map<String, String> pathParams = new HashMap<>();
    private Map<String, String> formParams = new HashMap<>();
    private Map<String, String> headers = new HashMap<>();
    private Map<String, String> cookies = new HashMap<>();
    private String body = "";
    private String contentType = "application/json";
    private boolean sessionId = true;
    private boolean jwtAuthorization = false;
    private boolean csrfToken = false;

    private boolean microService;
    public void addCookie(String k, String v) {
        cookies.put(k, v);
    }
}
