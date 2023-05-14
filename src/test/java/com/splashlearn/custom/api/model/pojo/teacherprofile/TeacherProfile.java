package com.splashlearn.custom.api.model.pojo.teacherprofile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.splashlearn.custom.api.model.pojo.teacherInfo.Klasses;
import com.splashlearn.custom.api.model.pojo.teacherInfo.Teacher;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
public class TeacherProfile {
    private Teacher teacher ;
    private List<Klasses> klasses;
}
