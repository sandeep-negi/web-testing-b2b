package com.splashlearn.context;

import com.splashlearn.custom.api.model.assignedabtest.AssignedABTests;
import com.splashlearn.custom.api.model.onboardingstates.UserOnBoardingState;
import com.splashlearn.custom.api.model.pojo.teacherInfo.TeacherKlassInfo;
import com.splashlearn.custom.api.model.pojo.teacherprofile.TeacherProfile;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.domainobjects.AssessmentDetails;
import com.splashlearn.domainobjects.LoginDetails;
import com.splashlearn.domainobjects.StudentLoginDetails;
import lombok.Data;

import java.util.List;

@Data
public class DomainObjectContext {
    private LoginDetails loginDetails ;
    private AssessmentDetails assessmentDetails ;
    private StudentLoginDetails studentLoginDetails;
    private List<StudentResponse> studentResponse;
    private UserOnBoardingState userOnBoardingState ;
    private TeacherKlassInfo teacherKlassInfo ;
}
