package com.splashlearn.dao;

import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import com.splashlearn.custom.api.model.pojo.Users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
    private ResultSet resultSet;
    private Statement statement;
    private Connection connection;

    public UserDAO() {
        connection = DBConnector.getInstanceOfDBConnector().getConnection();
    }

    public Users getStudentInfoFromDB(String studentId) {
        Users users = null;
        try {
            statement = connection.createStatement();
            String query = "select hex(id), country, type, coins, hex(parent_id), hex(teacher_id), " +
                    "hex(klass_id), klasses_count, time_zone, username, email, plain_text_password," +
                    "sign_in_count, parent_email, avatar, deleted, first_name, hex(grade_id), source, " +
                    "hex(analytics_id),active, students_count, hex(school_id), teacher_email from users where hex(id) = '" + studentId + "' and deleted = '0'";
            System.out.println("Query = " + query);
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                users = new Users(resultSet.getString("hex(id)"), resultSet.getString("country"),
                        resultSet.getString("type"), resultSet.getString("coins"),
                        resultSet.getString("hex(parent_id)"), resultSet.getString("hex(teacher_id)"),
                        resultSet.getString("hex(klass_id)"), resultSet.getString("klasses_count"),
                        resultSet.getString("time_zone"), resultSet.getString("username"),
                        resultSet.getString("email"), resultSet.getString("plain_text_password"),
                        resultSet.getString("sign_in_count"), resultSet.getString("parent_email"),
                        resultSet.getString("avatar"), resultSet.getString("deleted"),
                        resultSet.getString("first_name"), resultSet.getString("hex(grade_id)"),
                        resultSet.getString("source"), resultSet.getString("hex(analytics_id)"),
                        resultSet.getString("active"), resultSet.getString("students_count"),
                        resultSet.getString("hex(school_id)"), resultSet.getString("teacher_email"));
            }
//            while (resultSet.next()) {
//                users = new Users(resultSet.getString("id"), resultSet.getString("country"),
//                        resultSet.getString("type"), resultSet.getString("coins"),
//                        resultSet.getString("parent_id"), resultSet.getString("teacher_id"),
//                        resultSet.getString("klass_id"), resultSet.getString("klasses_count"),
//                        resultSet.getString("time_zone"), resultSet.getString("username"),
//                        resultSet.getString("email"), resultSet.getString("plain_text_password"),
//                        resultSet.getString("sign_in_count"), resultSet.getString("parent_email"),
//                        resultSet.getString("avatar"), resultSet.getString("deleted"),
//                        resultSet.getString("first_name"), resultSet.getString("grade_id"),
//                        resultSet.getString("source"), resultSet.getString("analytics_id"),
//                        resultSet.getString("active"), resultSet.getString("students_count"),
//                        resultSet.getString("school_id"), resultSet.getString("teacher_email"));
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
