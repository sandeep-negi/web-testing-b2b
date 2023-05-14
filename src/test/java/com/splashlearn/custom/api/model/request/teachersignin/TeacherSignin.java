package com.splashlearn.custom.api.model.request.teachersignin;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TeacherSignin{
    public User user;
}


