package com.splashlearn.core;

import org.apache.commons.lang3.StringUtils;

import java.util.Map;

public class Evaluator {

    private final String dataPattern = "${data.";
    private final String nonDataPattern = "${";

    public String evaluate(Map<String, String> data, String s1) {
        if(s1 == null || !s1.contains("${")) {
            return s1;
        }

        try {
            while(s1.contains(nonDataPattern)){
                if(s1.contains(dataPattern)) {
                    String key = StringUtils.substringBetween(s1, dataPattern, "}");
                    s1 = s1.replace(dataPattern + key + "}", data.getOrDefault(key, ""));
                } else {
                    String methodName = StringUtils.substringBetween(s1, nonDataPattern, "}");
                    String value = DataGenerator.class.getMethod(methodName).invoke(new DataGenerator()).toString();
                    s1 = StringUtils.replaceOnce(s1, nonDataPattern + methodName + "}", value);
                }
            }
            return s1;
        } catch (IllegalAccessException | java.lang.reflect.InvocationTargetException | NoSuchMethodException e) {
            e.printStackTrace();
            return "";
        }
    }

    public void evaluate(Map<String, String> data, Map<String, String> raw) {
        for(Map.Entry<String, String> entry : raw.entrySet())
            entry.setValue(evaluate(data, entry.getValue()));
    }

}
