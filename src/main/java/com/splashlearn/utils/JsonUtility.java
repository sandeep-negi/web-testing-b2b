package com.splashlearn.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class JsonUtility<T> {
    private static final Logger logger = LogManager.getLogger(JsonUtility.class);

    public T readDataFromJson(String json, Class<T> t) throws JsonProcessingException {
        ObjectMapper obm = new ObjectMapper();
        return obm.readValue(json,t);
    }
}
