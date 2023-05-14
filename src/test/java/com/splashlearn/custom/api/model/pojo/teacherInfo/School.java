package com.splashlearn.custom.api.model.pojo.teacherInfo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.cucumber.messages.internal.com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class School {
    private boolean admin_verified;
    private String city_name;
    private String country_name;
    private String id;
    private String name;
    private String state_name;
    private String zip_code;
}
