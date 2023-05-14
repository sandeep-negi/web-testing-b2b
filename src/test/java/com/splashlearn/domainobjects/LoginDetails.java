package com.splashlearn.domainobjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class LoginDetails {
    private String userEmail ;
    private String userPassword ;
}
