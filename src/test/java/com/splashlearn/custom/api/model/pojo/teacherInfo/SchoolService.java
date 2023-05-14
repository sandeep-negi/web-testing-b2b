package com.splashlearn.custom.api.model.pojo.teacherInfo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class SchoolService {
    private String id;
    @JsonProperty("analytics_id")
    private String analyticsId;
    @JsonProperty("email")
    private String email;
    @JsonProperty("country_code")
    private String countryCode;
    @JsonProperty("klasses_count")
    private int klassesCount;
    @JsonProperty("profile_complete")
    private boolean profileComplete;
    private School school ;
    @JsonProperty("time_zone")
    private String timeZone;
    @JsonProperty("time_zone_identifier")
    private String timeZoneIdentifier;
    @JsonProperty("active_springboard_contest")
    private boolean activeSpringboardContest;
}
