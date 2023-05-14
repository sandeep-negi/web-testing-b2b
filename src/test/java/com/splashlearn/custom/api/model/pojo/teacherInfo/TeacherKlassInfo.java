package com.splashlearn.custom.api.model.pojo.teacherInfo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.splashlearn.custom.api.model.pojo.addklass.AddKlassResponseInfo;
import com.splashlearn.custom.api.model.response.StudentResponse;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class TeacherKlassInfo {
    private WebService webService ;
    private SchoolService schoolService ;
    private List<StudentResponse> studentResponses ;
    private List<AddKlassResponseInfo> addedKlassResponseInfos ;
}
