package com.splashlearn.apiHelper;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.splashlearn.context.DomainObjectContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import com.splashlearn.custom.api.model.pojo.addklass.AddKlassResponseInfo;
import com.splashlearn.custom.api.model.pojo.teacherInfo.SchoolService;
import com.splashlearn.custom.api.model.pojo.teacherInfo.TeacherKlassInfo;
import com.splashlearn.custom.api.model.pojo.teacherInfo.WebService;
import com.splashlearn.custom.api.model.response.StudentResponse;
import com.splashlearn.custom.api.operations.LoginApi;
import com.splashlearn.custom.api.operations.TeacherDashboardApi;
import com.splashlearn.dao.UserOtpDAO;
import io.restassured.response.Response;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TeacherData {
    private TestContext context ;
    private final Map<String, Object> customStorage;
    private final DomainObjectContext domainObjectContext;

    public TeacherData(TestContext context) {
        this.context = context ;
        customStorage = context.getCustomStorage();
        domainObjectContext = context.getDomainObjectContext();
    }

    public void getTeacherKlassStudentData(String userEmail, String password) {
        doLoginUsingApi(userEmail, password);
        TeacherKlassInfo teacherKlassInfo = new TeacherKlassInfo();
        setTeacherDataFromWebService(teacherKlassInfo);
        setTeacherDataFromSchoolService(teacherKlassInfo);
        setTeacherKlassData(teacherKlassInfo);
        setTeacherStudentData(teacherKlassInfo);

        System.out.println("Teacher Klass Student Data Added = " +teacherKlassInfo);
        domainObjectContext.setTeacherKlassInfo(teacherKlassInfo);
    }

    public void doLoginUsingApi(String userEmail, String userPassword) {
        LoginApi loginApi = new LoginApi(context.cookies.getCookies());
        Response resp = loginApi.doLogin(userEmail, userPassword);
        context.sessionId = resp.getCookies().get("_session_id");
        context.cookies.setCookies(loginApi.getCookies());
    }

    private void setTeacherDataFromWebService(TeacherKlassInfo teacherDataInfo){
        Response response;
        ObjectMapper mapper;
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        response = teacherDashboardApi.getTeacherWebServiceProfile(context.getSessionId());
        mapper = new ObjectMapper();
        WebService teacherWebServiceProfileResponse = null;
        try {
            teacherWebServiceProfileResponse = mapper.readValue(response.body().asString(), WebService.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println("Web Profile data = " + teacherDataInfo.getWebService());
        teacherDataInfo.setWebService(teacherWebServiceProfileResponse);

    }
    private void setTeacherDataFromSchoolService(TeacherKlassInfo teacherDataInfo){
        Response response;
        ObjectMapper mapper;
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        response = teacherDashboardApi.getTeacherSchoolServiceProfile(context.getSessionId());
        mapper = new ObjectMapper();
        SchoolService teacherSchoolServiceProfileResponse = null;
        try {
            teacherSchoolServiceProfileResponse = mapper.readValue(response.body().asString(), SchoolService.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println("School Service Profile data = " + teacherSchoolServiceProfileResponse);

        teacherDataInfo.setSchoolService(teacherSchoolServiceProfileResponse);


    }
    public void setTeacherKlassData(TeacherKlassInfo teacherDataInfo){
        Response response;
        ObjectMapper mapper;
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        response = teacherDashboardApi.getAllKlasses(teacherDataInfo.getWebService().getTeacher().getId(), context.getSessionId());
        mapper = new ObjectMapper();
        List<AddKlassResponseInfo> addedKlassesResponse = null;
        try {
            addedKlassesResponse = mapper.readValue(response.body().asString(), new TypeReference<ArrayList<AddKlassResponseInfo>>() {});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println("Added Klass Data = " + addedKlassesResponse);
        teacherDataInfo.setAddedKlassResponseInfos(addedKlassesResponse);

    }
    public void setTeacherStudentData(TeacherKlassInfo teacherDataInfo){
        Response response;
        ObjectMapper mapper;
        TeacherDashboardApi teacherDashboardApi;
        teacherDashboardApi = new TeacherDashboardApi(context.cookies.getCookies());
        response = teacherDashboardApi.getStudents(teacherDataInfo.getAddedKlassResponseInfos().get(0).getId(),context.getSessionId());
        mapper = new ObjectMapper();
        List<StudentResponse> studentReponse = null;
        try {
            studentReponse = mapper.readValue(response.body().asString(), new TypeReference<ArrayList<StudentResponse>>() {});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println("Added Student Data = " + studentReponse);
        teacherDataInfo.setStudentResponses(studentReponse);
    }

    public String getKlassId(String klassName){
        int klassCount = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().size();
        String klassId = null ;
        for(int i = 0 ; i< klassCount ; i++){
            if(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getName().equalsIgnoreCase(klassName)){
                klassId = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getId();
                System.out.println("Klass Name = " + klassId);
                break ;
            }
        }
        return klassId ;
    }

    public String getKlassGradeId(String klassName){
        int klassCount = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().size();
        String klassId = null ;
        for(int i = 0 ; i< klassCount ; i++){
            if(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getGradeId().equalsIgnoreCase(klassName)){
                klassId = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getId();
                System.out.println("Klass Name = " + klassId);
                break ;
            }
        }
        return klassId ;
    }

    public String getKlassSlug(String klassName){
        int klassCount = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().size();
        String klassSlug = null ;
        for(int i = 0 ; i< klassCount ; i++){
            if(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getName().equalsIgnoreCase(klassName)){
                klassSlug = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getSlug();
                System.out.println("Klass Slug = " + klassSlug);
                break ;
            }
        }
        return klassSlug ;
    }

    public void addStudentsToKlass(String klassName){
        int klassCount = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().size();
        String klassSlug = null ;
        for(int i = 0 ; i< klassCount ; i++){
            if(domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getName().equalsIgnoreCase(klassName)){
                klassSlug = domainObjectContext.getTeacherKlassInfo().getAddedKlassResponseInfos().get(i).getSlug();
                System.out.println("Klass Slug = " + klassSlug);
                break ;
            }
        }
    }

    public String getKlassGradeName(String gradeId){
        Map<String, String> gradeName = new HashMap<>();
        gradeName.put("EE06B4DA249C461EBE49CB0077FB4BB5","kindergarten");
        gradeName.put("6CE5275C6D174372AD75F2F7A2CC2714","first-grade");
        gradeName.put("DF707F9150224B5D9FE9CBFD55862921","second-grade");
        gradeName.put("502B90E39DBC48139AD3E481D48E1EB5","third-grade");
        gradeName.put("D774460A57A14150B672B54766997AD9","fourth-grade");
        gradeName.put("2C6EAA27A0EB4D16B4F6D78F6C60D065","fifth-grade");
        return gradeName.get(gradeId);
    }

    public String getOtp(String userEmail) {
        UserOtpDAO userOtpDAO = new UserOtpDAO();
        EmailVerificationIntent em = userOtpDAO.getUserOtpInfoFromDB(userEmail);
        return em.getCode();
    }
}
