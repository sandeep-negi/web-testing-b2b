package com.splashlearn.core;

import com.github.javafaker.Faker;

public class DataGenerator {

    private static final String DOMAIN = "splashlearn.com";

    public static String parentEmail() {
        return "auto_parent+" + createRandomString(20) + "@" + DOMAIN;
    }

    public static String teacherEmail() {
        return "auto_teacher+" + createRandomString(20) + "@" + DOMAIN;
    }

    public static String teacherEmailWithPrefix(String prefix) {
        return prefix + createRandomString(20) + "@" + DOMAIN;
    }

    public static String studentTextPassword() {
        return createRandomString(6);
    }

    public static String password() {
        return "123456";
    }

    private static String createRandomString(int length) {
        String alphaNumericString = "0123456789abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++)
            sb.append(alphaNumericString.charAt(
                    (int) (alphaNumericString.length() * Math.random())
            ));
        return sb.toString();
    }

    public String firstName() {
        return Faker.instance().name().firstName();
    }

    public String lastName() {
        return Faker.instance().name().lastName();
    }

    public String city() {
        return Faker.instance().address().cityName();
    }

    public String zipCode() {
        return Faker.instance().address().zipCode();
    }

    public String school() {
        return Faker.instance().name().name().concat(" school");
    }

}
