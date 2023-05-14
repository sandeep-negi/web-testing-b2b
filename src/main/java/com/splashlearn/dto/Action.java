package com.splashlearn.dto;

import com.splashlearn.enums.ActionType;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class Action {

    private String page;
    private String field;
    private ActionType actionType;
    private String value;
    private String var;
    private String locator;
    private int timeout;

    @Override
    public String toString() {
        return String.format("Page: %s, Field: %s, Action: %s, Value: %s, Var: %s, Locator: %s, Timeout: %s",
                getString(page), getString(field), getString(actionType), getString(value), getString(var),
                getString(locator), getString(timeout));
    }

    private String getString(Object s) {
        return (s == null || s.toString().isBlank()) ? "NA" : s.toString().trim();
    }

}
