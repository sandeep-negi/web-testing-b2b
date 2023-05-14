package com.splashlearn.context;

import io.restassured.http.Cookie;
import io.restassured.http.Header;
import lombok.Builder;
import lombok.Data;

@Data @Builder
public class APITokens {
    private Header xcsrfToken;
    private Cookie sessionId;
    private Cookie jwtAuthorizationToken;
}