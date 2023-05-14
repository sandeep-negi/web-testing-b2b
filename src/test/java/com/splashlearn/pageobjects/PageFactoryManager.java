package com.splashlearn.pageobjects;

import org.openqa.selenium.WebDriver;

public class PageFactoryManager {
    private static HomeAccessPage homeAccessPage;
    private static LoginPage loginPage;
    private static TeacherDashboardPage teacherDashboardPage;
    private static AssessmentPage assessmentPage;
    private static StudentDashboardPage studentDashboardPage ;
    private static StudentCentrePage studentCentrePage ;
    private static TeacherSignUpPage teacherSignUpPage ;
    private static OtpPage otpPage ;
    private static AddKlassStudentPage addKlassStudentPage ;
    private static SurveyQuestionPage surveyQuestionPage ;
    private static SplashCommunityPage splashCommunityPage ;
    private static AssignmentPage assignmentPage ;
    private static ClassSettingsPage classSettingsPage;
    private static ProfilePage profilePage ;
    private static RosterPage rosterPage ;
    private static DownloadWorksheetPage downloadWorksheetPage;
    private static DailyActivityPage dailyActivityPage ;


    public static DailyActivityPage getdailyActivityPage(WebDriver driver){
        return dailyActivityPage == null ? new DailyActivityPage(driver) : dailyActivityPage;
    }
    public static DownloadWorksheetPage getDownloadWorksheetPage(WebDriver driver){
        return downloadWorksheetPage == null ? new DownloadWorksheetPage(driver) : downloadWorksheetPage;
    }
    public static RosterPage getRosterPage(WebDriver driver){
        return rosterPage == null ? new RosterPage(driver) : rosterPage;
    }
    public static ProfilePage getProfilePage(WebDriver driver){
        return profilePage == null ? new ProfilePage(driver) : profilePage;
    }

    public static HomeAccessPage getHomeAccessPage(WebDriver driver){
        return homeAccessPage == null ? new HomeAccessPage(driver) : homeAccessPage;
    }

    public static LoginPage getLoginPage(WebDriver driver){
        return loginPage == null ? new LoginPage(driver) : loginPage;
    }

    public static TeacherDashboardPage getTeacherDashboardPage(WebDriver driver){
        return teacherDashboardPage == null ? new TeacherDashboardPage(driver) : teacherDashboardPage;
    }
    public static AssessmentPage getAssessmentPage(WebDriver driver){
        return assessmentPage == null ? new AssessmentPage(driver) : assessmentPage ;
    }

    public static StudentDashboardPage getStudentDashboardPage(WebDriver driver){
        return studentDashboardPage == null ? new StudentDashboardPage(driver) : studentDashboardPage ;
    }

    public static StudentCentrePage getStudentCentrePage(WebDriver driver){
        return studentCentrePage == null ? new StudentCentrePage(driver) : studentCentrePage ;
    }

    public static TeacherSignUpPage getTeacherSignUpPage(WebDriver driver){
        return teacherSignUpPage == null ? new TeacherSignUpPage(driver) : teacherSignUpPage ;
    }

    public static OtpPage getOtpPage(WebDriver driver){
        return otpPage == null ? new OtpPage(driver) : otpPage ;
    }

    public static AddKlassStudentPage getAddKlassStudentPage(WebDriver driver){
        return addKlassStudentPage == null ? new AddKlassStudentPage(driver) : addKlassStudentPage ;
    }
    public static SurveyQuestionPage getSurveyQuestionPage(WebDriver driver){
        return surveyQuestionPage == null ? new SurveyQuestionPage(driver) : surveyQuestionPage ;
    }
    public static SplashCommunityPage getSplashCommunityPage(WebDriver driver){
        return splashCommunityPage == null ? new SplashCommunityPage(driver) : splashCommunityPage ;
    }
    public static AssignmentPage getAssignmentPage(WebDriver driver){
        return assignmentPage == null ? new AssignmentPage(driver) : assignmentPage ;
    }
    public static ClassSettingsPage getClassSettingsPage(WebDriver driver){
        return classSettingsPage == null ? new ClassSettingsPage(driver) : classSettingsPage;
    }

}
