package com.splashlearn.custom.api.model.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Users {
    @JsonProperty("id")
    private String studentId;
    private String country;
    @JsonProperty("user_type")
    private String userType;
    private String coins ;
    @JsonProperty("parent_id")
    private String parentId;
    @JsonProperty("teacher_id")
    private String teacherId;
    @JsonProperty("klass_id")
    private String klassId;
    @JsonProperty("klasses_count")
    private String klassCount;
    @JsonProperty("time_zone")
    private String timeZone;
    @JsonProperty("username")
    private String userName;
    private String email;
    @JsonProperty("plain_text_password")
    private String plainTextPassword;
    @JsonProperty("sign_in_count")
    private String signInCount;
    @JsonProperty("parent_email")
    private String parentEmail;
    private String avatar;
    private String deleted;
    @JsonProperty("first_name")
    private String firstName;
    @JsonProperty("grade_id")
    private String gradeId;
    private String source ;
    @JsonProperty("analytics_id")
    private String analyticsId;
    private String active ;
    @JsonProperty("students_count")
    private String studentsCount ;
    @JsonProperty("school_id")
    private String schoolId;
    @JsonProperty("teacher_email")
    private String teacherEmail;
}
