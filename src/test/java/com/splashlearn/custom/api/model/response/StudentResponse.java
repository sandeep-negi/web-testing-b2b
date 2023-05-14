package com.splashlearn.custom.api.model.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
@Data
public class StudentResponse {

    private String id;
    private String firstName;
    private String lastName;
    private String plainTextPassword;
    private String gradeCode;
    private String picturePassword;
    @JsonProperty("parent_email")
    private String parentEmail ;
    @JsonProperty("preferred_language")
    private String preferredLanguage;
    @JsonProperty("avatar_url")
    private String avatarUrl;
    @JsonProperty("created_at")
    private String createdAt;
    @JsonProperty("updated_at")
    private String updatedAt;
}
