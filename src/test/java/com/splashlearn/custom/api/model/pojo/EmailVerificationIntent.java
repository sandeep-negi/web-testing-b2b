package com.splashlearn.custom.api.model.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class EmailVerificationIntent {
    private String id ;
    private String email;
    private String user_id;
    private String code;
    private String valid_till;
    private String status;
    private String created_at;
    private String updated_at;
    private String deleted;
}
