package com.splashlearn.custom.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class TeacherSignupDTO {

    private String timeZone;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String birthYear;
    private String schoolName;
    private String schoolId;
    private String schoolCity;
    private String countryCode;
    private String zipCode;

}
