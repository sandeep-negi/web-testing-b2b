package com.splashlearn.custom.database.sql;

public class SQLQuery {

    public static final String TEACHER_ID = "SELECT id FROM users WHERE type = 'teacher' and email = ?;";
    public static final String ALL_KLASSES_ID = "SELECT id, name, grade_id, slug FROM klasses WHERE HEX(teacher_id) = ? AND deleted=0;";
    public static final String ALL_STUDENTS_DETAILS = "SELECT * FROM users WHERE type = 'student' and HEX(klass_id) = ?;";
    public static final String ALL_TASKS_FOR_KLASS = "SELECT * FROM tasks WHERE HEX(klass_id) = ?;";
    public static final String GET_FROM_EMAIL_INTENTS = "SELECT id, code, user_id FROM email_verification_intents WHERE email = ?;";
    public static final String GET_OTP = "SELECT code FROM email_verification_intents WHERE email = ?;";


    private SQLQuery() {
        throw new IllegalStateException("This class can't be instantiated");
    }
}

