package com.splashlearn.steps;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.base.CaseFormat;
import com.splashlearn.context.TestContext;
import com.splashlearn.core.BrowserFactory;
import com.splashlearn.core.Evaluator;
import com.splashlearn.core.LocatorEvaluator;
import com.splashlearn.core.PageFactory;
import com.splashlearn.core.rest.RestActions;
import com.splashlearn.core.rest.RestDTO;
import com.splashlearn.core.rest.RestMethods;
import com.splashlearn.core.selenium.LoadTime;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.operations.TeacherOperations;
import com.splashlearn.dto.Action;
import com.splashlearn.enums.ActionType;
import com.splashlearn.exceptions.ElementNotFoundException;
import com.splashlearn.exceptions.InvalidActionException;
import com.splashlearn.exceptions.InvalidLocatorException;
import com.splashlearn.utils.TestDataHelper;
import io.cucumber.datatable.DataTable;
import io.cucumber.docstring.DocString;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;
import java.util.stream.Collectors;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;
import static com.splashlearn.core.selenium.SeleniumActions.*;
import static com.splashlearn.custom.DataStore.*;
import static org.apache.commons.lang3.StringUtils.isNotBlank;

public class Engine {

    private final TestContext testContext;
    private WebDriver driver;
    private static final Logger logger = LogManager.getLogger(Engine.class);
    private final Evaluator evaluator = new Evaluator();

    public Engine(TestContext testContext) {
        this.testContext = testContext;
        this.driver = testContext.getDriver();
    }

    @DataTableType
    public Action actionEntry(Map<String, String> entry) {
        ActionType actionType = null;
        try {
            actionType = ActionType.findByValue(entry.get("action").trim());
        } catch (Exception ignore) {
        }

        return new Action(entry.getOrDefault("page", null),
                entry.getOrDefault("field", null), actionType,
                entry.getOrDefault("value", null),
                entry.getOrDefault("var", null),
                entry.getOrDefault("locator", null),
                entry.get("timeout") == null ? DEFAULT_TIMEOUT : Integer.parseInt(entry.get("timeout").trim()));
    }

    @When("^the user performs(?:|.*)$")
    public void theUserPerforms(List<Action> actions) throws InvalidLocatorException, ElementNotFoundException, InvalidActionException {
        driver = testContext.getDriver();
        PageFactory pageFactory = new PageFactory();
        for (Action action : actions) {
            By locator = null;
            if (isNotBlank(action.getLocator())) {
                action.setLocator(evaluator.evaluate(testContext.getData(), action.getLocator()));
                locator = new LocatorEvaluator().getByLocator(action.getLocator());
            } else if (isNotBlank(action.getField()) && isNotBlank(action.getPage()))
                locator = pageFactory.getLocatorFor(action.getPage(), action.getField());

            // Evaluate value field for dynamic cases
            action.setValue(evaluator.evaluate(testContext.getData(), action.getValue()));

            logger.debug(testContext.toString() + ", " + action.toString());
            LoadTime.data = testContext.toString();
            switch (action.getActionType()) {
                case OPEN:
                    open(driver, action.getValue());
                    break;
                case CLICK:
                    click(driver, locator, action.getTimeout());
                    break;
                case TYPE:
                    testContext.addData(action.getField(), action.getValue());
                    type(driver, locator, action.getValue(), action.getTimeout());
                    break;
                case TEXT:
                    testContext.addData(action.getVar(), text(driver, locator, action.getTimeout()));
                    break;
                case WAIT_FOR_ELEMENT:
                    waitForElement(driver, locator, action.getTimeout());
                    break;
                case EXISTS:
                    Assert.assertTrue(exists(driver, locator, action.getTimeout()), "Element was not found");
                    break;
                case NOT_EXISTS:
                    Assert.assertFalse(exists(driver, locator, action.getTimeout()), "Element was not found");
                    break;
                case CLEAR:
                    clear(driver, locator, action.getTimeout());
                    break;
                case FIRE_CLICK_EVENT:
                    fireClickEvent(driver, locator, action.getTimeout());
                    break;
                case WAIT_FOR_TEXT:
                    waitForText(driver, locator, action.getValue(), action.getTimeout());
                    break;
                case SCREENSHOT:
                    screenshot(testContext.getScenario(), driver);
                    break;
                case SWITCH_IFRAME:
                    switchIFrame(driver, locator, action.getTimeout());
                    break;
                case SWITCH_TO_DEFAULT_CONTENT:
                    switchToDefaultContent(driver);
                    break;
                case WAIT_FOR_URL_TO_CONTAIN:
                    waitForUrlToContain(driver, action.getValue(), action.getTimeout());
                    break;
                case WAIT_FOR_TEXT_TO_CONTAIN:
                    waitForTextToContain(driver, locator, action.getValue(), action.getTimeout());
                    break;
                case VERIFY_TEXT:
                    verifyText(driver, locator, action.getValue());
                    break;
                case CLICK_BY_ACTION:
                    clickByAction(driver, locator, action.getTimeout());
                    break;
                case CLICK_IF_PRESENT:
                    clickIfPresent(driver, locator, action.getTimeout());
                    break;
                case SLEEP:
                    sleep(Integer.parseInt(action.getValue()));
                    break;
                case SELECT:
                    testContext.addData(action.getField(), action.getValue());
                    select(driver, locator, action.getValue(), action.getTimeout());
                    break;
                case WAIT_FOR_NO_ELEMENT:
                    waitForNoElement(driver, locator, action.getTimeout());
                    break;
                case WAIT_FOR_ELEMENT_VISIBLE:
                    waitForElementVisible(driver, locator, action.getTimeout());
                    break;
                case WAIT_FOR_ELEMENT_CLICKABLE:
                    waitForElementClickable(driver, locator, action.getTimeout());
                    break;
                case GET_ATTRIBUTE:
                    testContext.addData(action.getVar(), getAttribute(driver, locator, action.getTimeout(), action.getValue()));
                    break;
                case ALERT_TEXT:
                    testContext.addData(action.getVar(), alertText(driver, action.getTimeout()));
                    break;
                case ALERT_ACCEPT:
                    alertAccept(driver, action.getTimeout());
                    break;
                case REFRESH_PAGE:
                    refreshPage(driver);
                    break;
                case WAIT_FOR_SPINNER:
                    waitForSpinner(driver, action.getTimeout());
                    break;
                case ELEMENT_SELECTION_STATE_TO_BE:
                    elementSelectionStateToBe(driver, locator, Boolean.parseBoolean(action.getValue()), action.getTimeout());
                    break;
                case BACK:
                     back(driver);
                     break;
                case SWITCH_TO_NEW_WINDOW:
                    testContext.addData(action.getVar(), switchToNewWindow(driver, action.getValue()));
                    break;
                case SWITCH_TO_WINDOW:
                    testContext.addData(action.getVar(), switchToWindow(driver, action.getValue()));
                    break;
                case DELETE_ALL_COOKIES:
                    deleteAllCookies(driver);
                    break;
                case GET_ALL_COOKIES:
                    testContext.addToCustomStorage(action.getVar(), getAllCookies(driver));
                    break;
                case RETRY_CLICKS_UNTIL_ELEMENT_PRESENT:
                    retryClicksUntilElementPresent(driver, locator);
                    break;
                case ADD_COOKIES:
                    if (testContext.getCustomStorage().containsKey(action.getVar()))
                        addCookies(driver, (Set<Cookie>) testContext.getCustomStorage().get(action.getVar()));
                    else
                        throw new RuntimeException("Cookies not present with var = " + action.getVar());
                    break;
                default:
                    throw new InvalidActionException(String.format("Invalid action %s for field %s",
                            action.getActionType(), action.getField()));
            }
        }
    }

    @Given("^the user opens \"(.+)\" page$")
    public void theUserOpensPage(String url) {
        open(driver, TestContext.url, url);
    }

    @When("^call custom method for?.* using:$")
    public void callCustomMethod(DataTable dataTable) throws Throwable {
        List<Map<String, String>> table = dataTable.asMaps(String.class, String.class);

        String klass = table.get(0).getOrDefault("klass", "SplashLearnLibrary");
        String methodName = table.get(0).getOrDefault("method", null);
        String p = table.get(0).getOrDefault("params", "");
        String[] params = p.isEmpty() ? new String[0] : p.split(",");
        params = Arrays.stream(params).map(String::trim).toArray(String[]::new);
        String var = table.get(0).getOrDefault("var", null);

        Class<?>[] objects = Arrays.stream(params).map(Object::getClass).collect(Collectors.toList())
                .toArray(Class<?>[]::new);

        // evaluate params
        for (int i = 0; i < params.length; i++)
            params[i] = evaluator.evaluate(testContext.getData(), params[i]);

        Class<?> c = Class.forName(String.format("com.splashlearn.custom.%s", klass));
        Method method = c.getDeclaredMethod(methodName, objects);
        Object t;
        try {
            Object classObject = c.getConstructor(TestContext.class).newInstance(testContext);
            t = method.invoke(classObject, params.length == 0 ? null : params);
        } catch (InvocationTargetException e) {
            logger.error("Custom method \"{}\" failed. Got error: {}", methodName, e.getCause());
            throw e.getCause();
        }

        if (var != null)
            testContext.getData().put(var, t.toString());

    }

    @When("^send request for (.*) using:$")
    public void sendRequest(String key, DocString docString) throws JsonProcessingException {
        RestDTO restDTO = new ObjectMapper().readValue(docString.getContent(), RestDTO.class);

        // Transform rest dto dynamic values
        if (restDTO.getUrl() == null || restDTO.getUrl().isEmpty())
            restDTO.setUrl(TestContext.url);

        if(restDTO.isMicroService())
            restDTO.setUrl(TestContext.apiUrl);

        if (!restDTO.getQueryParams().isEmpty())
            evaluator.evaluate(testContext.getData(), restDTO.getQueryParams());

        if (!restDTO.getPathParams().isEmpty())
            evaluator.evaluate(testContext.getData(), restDTO.getPathParams());

        if (!restDTO.getFormParams().isEmpty())
            evaluator.evaluate(testContext.getData(), restDTO.getFormParams());

        if (restDTO.getMethod().equals(RestMethods.POST) && restDTO.getBody() != null)
            restDTO.setBody(evaluator.evaluate(testContext.getData(), restDTO.getBody()));

        BrowserFactory b = new BrowserFactory(driver);
        if (restDTO.isSessionId())
            restDTO.addCookie("_session_id", b.getSessionId());

        if (restDTO.isJwtAuthorization())
            restDTO.addCookie("jwt_authorization", b.getCookie("jwt_Authorization"));

        // TODO: csrf token

        String response = new RestActions().send(restDTO);
        testContext.addData(CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,
                key.toLowerCase().replace(" ", "_")), response);
    }

    @And("sleep for {int} seconds")
    public void sleepForSeconds(long sec) {
        try {
            Thread.sleep(sec * 1000);
        } catch (InterruptedException ignore) {
        }
    }

    @Given("^read test data for (.*)$")
    public void readTestDataForTC_ID(String id) {
        testContext.setTestId(id);
        TestDataHelper.addDataToContext(testContext.getData(), id);
    }

    @Given("the teacher switches to {string} class")
    public void theTeacherSwitchesToClass(String klassName) {

        Objects.requireNonNull(testContext.getEntityContext().getTeacher(), "Entity context must be loaded using @load_entity_context tag in order to use this method");
        klassName= evaluator.evaluate(testContext.getData(), klassName);
        TeacherOperations teacherOperations = new TeacherOperations(testContext.getEntityContext());
        Klass klass = teacherOperations.getKlassByName(klassName).get();
        String klassUrl = "teacher/class/"+klass.getKlassSlug()+"/grades/"+
                gradeCodeMap.get(gradeUUIDMap.get(StringUtils.remove(klass.getGradeID().toUpperCase(), '-'))) +"/dashboard";

        open(driver, TestContext.url, klassUrl);
    }
}
