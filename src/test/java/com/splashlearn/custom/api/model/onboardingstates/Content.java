package com.splashlearn.custom.api.model.onboardingstates;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Content {
    private String name;
    @JsonProperty("focused")
    private boolean isFocused;
    private String slug;
    private int order;
    @JsonProperty("recommended")
    private boolean isRecommended;
}
