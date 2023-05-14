package com.splashlearn.context;

import com.splashlearn.core.selenium.LoadTime;
import com.splashlearn.domainobjects.Cookies;
import io.cucumber.java.Scenario;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

@Data
public class TestContext {

    @Getter(value = AccessLevel.NONE)
    @Setter(value = AccessLevel.NONE)
    public static String runId;

    @Getter(value = AccessLevel.NONE)
    @Setter(value = AccessLevel.NONE)
    public static String url;

    @Getter(value = AccessLevel.NONE)
    @Setter(value = AccessLevel.NONE)
    public static String apiUrl;

    private WebDriver driver;
    private Scenario scenario;
    private String browser;
    private Map<String, String> data = new HashMap<>();
    private String testId;
    private Map<String, Object> customStorage = new HashMap<>();
    private EntityContext entityContext = new EntityContext();
    private APIContext apiContext = new APIContext();
    private DomainObjectContext domainObjectContext = new DomainObjectContext();
    private String qaAssignee;
    private String functionality;
    public Cookies cookies;
    public String sessionId;
    public String jwtToken ;

    public TestContext(){
        cookies = new Cookies();
        // For setting cookie as empty cookie first time
        cookies.setCookies(new io.restassured.http.Cookies());
    }

    public void addData(String k, String v) {
        data.put(k, v);
        LoadTime.data = toString();
    }

    public void addToCustomStorage(String k, Object v) {
        customStorage.put(k, v);
    }

    @Override
    public String toString() {
        return String.format("RunId: %s, Browser: %s, Test: %s, Data: %s", runId, browser, testId, data.toString());
    }
}
