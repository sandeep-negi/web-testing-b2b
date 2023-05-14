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
public class Ongoing {
    private int total_score ;
    private String id ;
    private int assigned_students_count;
    private int completed_students_count;
    private String rank;
    private boolean assign_practice ;
    private String assigned_on ;
    private String module_id;
    private String title ;
    private int score ;
    private String can_reassess ;
}
