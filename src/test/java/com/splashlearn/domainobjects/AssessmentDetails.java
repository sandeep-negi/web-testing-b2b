package com.splashlearn.domainobjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AssessmentDetails {
    private String klassId ;
    private String assessmentName;
    private String moduleId ;
}
