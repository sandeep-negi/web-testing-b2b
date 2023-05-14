package com.splashlearn.custom.api.model.onboardingstates;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class OnboardingStates {
    private String name;
    private String slug;
    private int order;
    private String cta;
    @JsonProperty("completed")
    private boolean isCompleted;
    private List<Content> content;
    @JsonProperty("min_student_login_count")
    private int minStudentLoginCount;
}
