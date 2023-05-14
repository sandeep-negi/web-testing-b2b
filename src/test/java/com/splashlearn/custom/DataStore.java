package com.splashlearn.custom;

import java.util.Map;

public class DataStore {

    public static Map<String, Character> gradeUUIDMap = Map.of(
            "EE06B4DA249C461EBE49CB0077FB4BB5", 'K',
            "6CE5275C6D174372AD75F2F7A2CC2714", '1',
            "DF707F9150224B5D9FE9CBFD55862921", '2',
            "502B90E39DBC48139AD3E481D48E1EB5", '3',
            "D774460A57A14150B672B54766997AD9", '4',
            "2C6EAA27A0EB4D16B4F6D78F6C60D065", '5'
    );
    public static Map<Character, String> gradeCodeMap = Map.of(
            'K', "kindergarten",
            '1', "first-grade",
            '2', "second-grade",
            '3', "third-grade",
            '4', "fourth-grade",
            '5', "fifth-grade"
    );

    private DataStore() {
        throw new IllegalStateException("This class can't be instantiated");
    }

}
