package com.splashlearn.custom.api.model.onboardingstates;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserOnBoardingState {
    @JsonProperty("onboarding_states")
    private List<OnboardingStates> onboardingStates ;
    @JsonProperty("onboarding_state_completed")
    private boolean isOnboardingStateCompleted ;
}
