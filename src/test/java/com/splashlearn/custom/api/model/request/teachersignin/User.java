package com.splashlearn.custom.api.model.request.teachersignin;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class User{
    public String login;
    public String password;
}