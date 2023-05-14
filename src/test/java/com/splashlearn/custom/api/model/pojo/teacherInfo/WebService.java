package com.splashlearn.custom.api.model.pojo.teacherInfo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.splashlearn.custom.api.model.assignedabtest.ABTest;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
public class WebService {
    private Teacher teacher;
    @JsonProperty("ab_tests")
    private ABTest abTests;
    @JsonProperty("is_active_springboard_contest")
    private boolean isActiveSpringboardContest;
    @JsonProperty("is_contest_live")
    private boolean isContestLive;
    @JsonProperty("is_enrollment_live")
    private boolean isEnrollmentLive;
    @JsonProperty("contest_start_date")
    private String contestStartDate;
    @JsonProperty("contest_end_date")
    private String contestEndDate;
    @JsonProperty("active_contest_interval")
    private int activeContestInterval;
}
