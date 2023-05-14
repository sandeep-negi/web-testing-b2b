package com.splashlearn.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.client.FindIterable;
import com.splashlearn.dto.UserDataDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bson.Document;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class TestDataHelper {

    private static final Logger logger = LogManager.getLogger(TestDataHelper.class);
    private static final List<UserDataDTO> data = new ArrayList<>();
    static List<String> schoolHourTestIds = new ArrayList<>();
    static List<String> outsideschoolHourTestIds = new ArrayList<>(List.of("B2B0065","B2B0067","B2B0066"));


    public static void read() {
        try {
            List<Document> r = ((FindIterable<Document>) MongoHelper.getInstance().query()).into(new ArrayList<>());
            ObjectMapper o = new ObjectMapper();
            r.forEach(n -> {
                try {
                    data.add(o.readValue(n.toJson(), UserDataDTO.class));
                } catch (JsonProcessingException e) {
                    logger.error("Unable to deserialize mongo document {}. Error: {}", n.toJson(), e.getLocalizedMessage());
                }
            });
            logger.info("Test Data captured successfully in memory. Total rows {}", data.size());
        } catch (Exception e) {
            logger.debug("Unable to capture data from MongoDb. Got error {}", e.getMessage());
        }
    }

    private static UserDataDTO find(String testCaseId) {
        if (testCaseId == null || testCaseId.isEmpty())
            return null;

        return data.stream().filter(n -> n.getTestId().equalsIgnoreCase(testCaseId)).findFirst()
                .orElse(null);
    }

    private static UserDataDTO findTestDataInSchoolHours(String testCaseId) {
        if (testCaseId == null || testCaseId.isEmpty())
            return null;
        return data.stream()
                .filter(n -> n.getTestId().equalsIgnoreCase(testCaseId))
                .filter(tc -> isInBetweenSchoolHours(tc.getData().get("gmt_diff").toString()))
                .findFirst()
                .orElse(null);

    }

    private static UserDataDTO findTestDataOutsideSchoolHours(String testCaseId) {
        if (testCaseId == null || testCaseId.isEmpty())
            return null;
        return data.stream()
                .filter(n -> n.getTestId().equalsIgnoreCase(testCaseId))
                .filter(tc -> !isInBetweenSchoolHours(tc.getData().get("gmt_diff").toString()))
                .findFirst()
                .orElse(null);

    }

    private static boolean isInBetweenSchoolHours(String gmt_diff) {
        String[] s1 = gmt_diff.split(":");
        final SimpleDateFormat sdf =
                new SimpleDateFormat("HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
        final Date currentTime = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(currentTime);
        c.add(Calendar.HOUR, Integer.parseInt(s1[0]));
        c.add(Calendar.MINUTE, Integer.parseInt(s1[1]));
        return checkTime("07:00:00", "15:00:00", sdf.format(c.getTime()));
    }

    private static boolean checkTime(String startTime, String endTime, String checkTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss", Locale.US);
        LocalTime startLocalTime = LocalTime.parse(startTime, formatter);
        LocalTime endLocalTime = LocalTime.parse(endTime, formatter);
        LocalTime checkLocalTime = LocalTime.parse(checkTime, formatter);

        boolean isInBetween = false;
         if (endLocalTime.isAfter(startLocalTime)) {
            if (startLocalTime.isBefore(checkLocalTime) && endLocalTime.isAfter(checkLocalTime)) {
                isInBetween = true;
            }
        } else if (checkLocalTime.isAfter(startLocalTime) || checkLocalTime.isBefore(endLocalTime)) {
            isInBetween = true;
        }

        if (isInBetween) {
            return true;
        } else {
            return false;
        }
    }

    public static void addDataToContext(Map<String, String> contextData, String testCaseId) {

        UserDataDTO userDataDTO;
        if (schoolHourTestIds.contains(testCaseId)) {
            userDataDTO = findTestDataInSchoolHours(testCaseId);
        } else if (outsideschoolHourTestIds.contains(testCaseId)) {
            userDataDTO = findTestDataOutsideSchoolHours(testCaseId);
        } else {
            userDataDTO = find(testCaseId);
        }

        if (userDataDTO == null)
            return;

        if (userDataDTO.getUsername() != null)
            contextData.put("username", userDataDTO.getUsername());
        if (userDataDTO.getPassword() != null)
            contextData.put("password", userDataDTO.getPassword());

        for (Map.Entry<String, Object> entry : userDataDTO.getData().entrySet())
            contextData.put(entry.getKey(), entry.getValue().toString());

    }

    public static void write(UserDataDTO userDataDTO) {
        data.add(userDataDTO);
        Map<String, Object> m = new ObjectMapper().convertValue(userDataDTO, new TypeReference<>() {
        });
        MongoHelper.getInstance().insert(m);
    }

}
