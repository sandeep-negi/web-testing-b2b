package com.splashlearn.custom.api.model.pojo.addklass;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AddKlass {
    private String name ;
    private String grade_code;
    private String subject_preference_cd ;
}
