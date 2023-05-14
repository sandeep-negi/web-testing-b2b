package com.splashlearn.custom.api.model.pojo.klassassessment;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
public class AssessmentInfo {
    private List<Ongoing> ongoing ;
    private List<Finish> finish ;
    private List<Unassigned> unassigned ;
}
