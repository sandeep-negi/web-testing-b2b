package com.splashlearn.domainobjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class StudentLoginDetails {
    private String studentName;
    private String studentId ;
    private String studentPassword ;
}
