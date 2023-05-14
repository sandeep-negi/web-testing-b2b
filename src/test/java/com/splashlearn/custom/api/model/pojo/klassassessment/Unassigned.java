package com.splashlearn.custom.api.model.pojo.klassassessment;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Unassigned {
    private String module_id;
    private String ordering ;
    private String title ;
    private String estimated_time ;
}
