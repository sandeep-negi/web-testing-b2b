package com.splashlearn.enums;

public enum ActionType {

    OPEN("open"), TYPE("type"), CLICK("click"), TEXT("text"), EXISTS("exists"),
    WAIT_FOR_ELEMENT("waitForElement"), WAIT_FOR_TEXT("waitForText"),
    WAIT_FOR_NO_ELEMENT("waitForNoElement"), CLEAR("clear"), FIRE_CLICK_EVENT("fireClickEvent"),
    WAIT_WHILE_PRESENT("waitWhilePresent"), SCREENSHOT("screenshot"), SWITCH_IFRAME("switchIFrame"),
    SWITCH_TO_DEFAULT_CONTENT("switchToDefaultContent"), WAIT_FOR_URL_TO_CONTAIN("waitForUrlToContain"),
    VERIFY_TEXT("verifyText"), WAIT_FOR_TEXT_TO_CONTAIN("waitForTextToContain"),
    CLICK_BY_ACTION("clickByAction"), CLICK_IF_PRESENT("clickIfPresent"), SLEEP("sleep"),
    SELECT("select"), WAIT_FOR_ELEMENT_VISIBLE("waitForElementVisible"),
    WAIT_FOR_ELEMENT_CLICKABLE("waitForElementClickable"),
    GET_ATTRIBUTE("getAttribute"), ALERT_TEXT("alertText"), ALERT_ACCEPT("alertAccept"),
    WAIT_FOR_SPINNER("waitForSpinner"), ELEMENT_SELECTION_STATE_TO_BE("elementSelectionStateToBe"),
    BACK("back"), REFRESH_PAGE("refreshPage"), SWITCH_TO_NEW_WINDOW("switchToNewWindow"),
    DELETE_ALL_COOKIES("deleteAllCookies"), SWITCH_TO_WINDOW("switchToWindow"), GET_ALL_COOKIES("getAllCookies"), ADD_COOKIES("addCookies"),
    WAIT_FOR_ATTRIBUTE_TO_BE("waitForAttributeToBe"),RETRY_CLICKS_UNTIL_ELEMENT_PRESENT("retryClicksUntilElementPresent"),NOT_EXISTS("notExists");

    private final String value;

    ActionType(String value) {
        this.value = value;
    }

    public static ActionType findByValue(String value) {
        for (ActionType a : values())
            if (a.getValue().equalsIgnoreCase(value))
                return a;
        return null;
    }

    public String getValue() {
        return this.value;
    }

}
