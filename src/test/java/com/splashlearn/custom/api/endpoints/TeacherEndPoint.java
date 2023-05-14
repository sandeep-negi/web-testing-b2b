package com.splashlearn.custom.api.endpoints;

public class TeacherEndPoint {

    public static final String SIGNIN = "users/sign_in.json";
    public static final String PROFILE = "web_api/teachers/v1/profile";
    public static final String SCHOOL_SERVICE_PROFILE = "school-service/api/v1/teachers/profile";
    public static final String MARK_ASSIGNMENT_AS_COMPLETE = "web_api/teachers/v1/tasks/{taskId}/finish";
    public static final String ASSIGNMENT_TO_WHOLE_KLASS = "web_api/teachers/v1/klass/{klassId}/tasks?action=create&whole_class=true&remember_intimate_ptl_hook=true";
    public static final String GET_GRADES = "web_api/v1/seed_data/grades";
    public static final String ASSIGNMENT_TO_SELECTED_STUDENTS = "web_api/teachers/v1/klass/{klassId}/tasks";
    public static final String ADD_NEW_KLASS = "school-service/api/v1/klasses";
    public static final String DELETE_KLASS = "school-service/api/v1/klasses/{klassId}";
    public static final String ADD_STUDENTS = "school-service/api/v1/klasses/{klassId}/students";
    public static final String ADD_STUDENTS_USING_FORM = "classes/{klassSlug}/students";
    public static final String DELETE_STUDENT = "/web_api/teachers/v1/students/{studentId}";
    public static final String GET_STUDENTS = "school-service/api/v1/klasses/{klassId}/students";
    public static final String SIGNUP = "teachers/register";
    public static final String VERIFY_OTP = "email_verification_intent/verify_otp";
    public static final String GENERATE_OTP = "email_verification_intent/generate_email_otp";
    public static final String SAVED_WORKSHEET_LIST = "school-service/api/v1/users/{teacherId}/user-collection-entities";
    public static final String DELETE_SAVED_WORKSHEET = "school-service/api/v1/users/{teacherId}/user-collection-entities/{id}";
    public static final String GET_OTP_FROM_API="/sla/getOTP";
    public static final String TEACHER_DASHBOARD = "teacher/dashboard";
    public static final String TRACK_ASSESSMENT = "class/{klass_slug}/grades/{klass_grade}/track_assessment";
    public static final String KLASS_ASSESSMENT = "class/{klass_slug}/grades/klass_grade/class_assessment";
    public static final String SIGN_OUT = "signout";
    public static final String SIGN_IN = "signin";
    public static final String KLASS_CODE_LOGIN = "klass_code_login";
    public static final String TIME_ZONE = "users";
    public static final String AB_TEST = "abtest-service/api/v1/users/{userId}/assign-all-ab-tests" ;
    public static final String GET_ALL_AB_TEST = "abtest-service/api/v1/users/{userId}/get-all-assigned-ab-tests" ;
    public static final String GET_ASSIGNED_PERSONA ="school-service/api/v1/users/{userId}/persona";
    public static final String GET_ONBOARDING_STATES ="school-service/api/v1/klasses/{klassId}/onboarding-states";
    public static final String GET_ALL_KLASSES="school-service/api/v1/teachers/{userId}/klasses?all_school_year=1";
    public static final String TEACHER_BULK_REFERRALS="school-service/api/v1/klasses/{klassId}/teacher_referrals/bulk";
    public static final String DOWNLOAD_WORKSHEET="school-service/api/v1/users/{teacherId}/user-downloads" ;

    private TeacherEndPoint() {
        throw new IllegalStateException("This class can't be instantiated");
    }

}
