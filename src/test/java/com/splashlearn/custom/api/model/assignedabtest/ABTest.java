package com.splashlearn.custom.api.model.assignedabtest;

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
public class ABTest {
    @JsonProperty("Teacher::GridReports")
    private String gridReports;
    @JsonProperty("Teacher::CommonPassword")
    private String commonPassword;
    @JsonProperty("Teacher::TeacherGettingStarted")
    private String teacherGettingStarted;
    @JsonProperty("Teacher::HomeAccessButtonName")
    private String homeAccessButtonName;
    @JsonProperty("Teacher::PasswordLessLogin")
    private String passwordLessLogin;
    @JsonProperty("Teacher::DailyActivityReporting")
    private String dailyActivityReporting;
    @JsonProperty("Teacher::Survey")
    private String survey;
    @JsonProperty("Teacher::DashboardBytesize2")
    private String dashboardBytesize2;
    @JsonProperty("Teacher::IaDashboard")
    private String iaDashboard;
    @JsonProperty("Teacher::Dashboard")
    private String dashboard;
    @JsonProperty("Teacher::EmailVerification")
    private String emailVerification;
    @JsonProperty("Teacher::AssignmentThroughGridReport")
    private String assignmentThroughGridReport;
    @JsonProperty("Teacher::PtlHookOnAssignment")
    private String ptlHookOnAssignment;
    @JsonProperty("Teacher::Post3PmPtlSignup")
    private String post3PmPtlSignup;
    @JsonProperty("Teacher::NewMathFacts")
    private String newMathFacts;
    @JsonProperty("Teacher::StudentCenter")
    private String studentCenter;
    @JsonProperty("Teacher::GamificationC4Teacher")
    private String gamificationC4Teacher;
    @JsonProperty("Teacher::TiledDashboard")
    private String tiledDashboard;
    @JsonProperty("Teacher::DashboardRevamp")
    private String dashboardRevamp;
    @JsonProperty("Teacher::HomeWidgetAndAccessPage")
    private String homeWidgetAndAccessPage;
    @JsonProperty("Teacher::AssignmentMandatorySetting")
    private String assignmentMandatorySetting;
    @JsonProperty("Teacher::Freemium_Topics_Out")
    private String studentDashboardTheme;
    @JsonProperty("Teacher::HomeAccessRevampPage")
    private String homeAccessRevampPage;
    @JsonProperty("Teacher::AssesmentPitchPage")
    private String assesmentPitchPage;
    @JsonProperty("Teacher::CircleCommunity")
    private String circleCommunity;
    @JsonProperty("Teacher::AddParentEmailScreen")
    private String addParentEmailScreen;
    @JsonProperty("Teacher::ClassHealthMeter")
    private String classHealthMeter;
    @JsonProperty("Teacher::MathFactAdaptiveDefaultQuestion")
    private String mathFactAdaptiveDefaultQuestion;
    @JsonProperty("Teacher::FreemiumNoBlocker")
    private String freemiumNoBlocker;
    @JsonProperty("Teacher::PtlHomePopupExp")
    private String ptlHomePopupExp;
    @JsonProperty("Teacher::GamificationC4OneVsOneTeacher")
    private String gamificationC4OneVsOneTeacher;
    @JsonProperty("Teacher::New::Playzone")
    private String newPlayzone;
    @JsonProperty("Teacher::PtlInvitation")
    private String ptlInvitation;
    @JsonProperty("Teacher::SummerLearningWithoutDiscount")
    private String summerLearningSegment;
}
