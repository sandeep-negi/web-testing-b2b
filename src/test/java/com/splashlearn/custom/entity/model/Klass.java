package com.splashlearn.custom.entity.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Klass {
    private String id;
    private String klassName;
    private String teacherID;
    private String gradeID;
    private String klassSlug;
    private char gradeCode;
    @Setter
    private List<Student> students;
    private List<Task> tasks;
}
