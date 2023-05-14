package com.splashlearn.custom.entity.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Student {
    private String id;
    private String klassId;
    private String parentId;
    private String teacherId;
    private String gradeId;
    private String firstName;
    private String lastName;
    private String userName;
    private String plainTextPassword;
    private String picturePassword;
    private String klassName;
}
