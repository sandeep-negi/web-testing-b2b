package com.splashlearn.steps;

import com.splashlearn.context.TestContext;
import io.cucumber.java.en.Then;
import org.testng.Assert;

import java.io.IOException;
import java.sql.*;


public class MysqlStep {


    private static Connection connection = null;
    private static Statement statement = null;
    public static String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    public static String mysqlUri = "jdbc:mysql://splashmath-staging-db-1-cluster.cluster-crwieotvxvj7.us-west-2.rds.amazonaws.com:3306/";
    public static String username = "Staging_web";
    public static String password = "Staging@20201";
    public static String databaseName = "studypad_temp";

    private TestContext testContext;

    public MysqlStep(TestContext testContext) throws IOException {
        this.testContext = testContext;

    }


    @Then("extract the studentid from mysql")
    public void getStudentId() throws IOException, ClassNotFoundException, SQLException {

//        String url = mysqlUri + databaseName ;
        String url = mysqlUri + databaseName + "?useSSL=false";
        Class.forName(JDBC_DRIVER);
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String User = testContext.getData().get("parent_email");
        String sql = "select hex(b.id) as student_id from users a JOIN users b on a.id=b.parent_id where a.username ='" + User + "'";
        ResultSet executeQuery = statement.executeQuery(sql);
        String student_id = null;
        while (executeQuery.next()) {
            student_id = executeQuery.getString("student_id");
            System.out.println(student_id);
        }
        testContext.getData().put("student_id", student_id);
        statement.close();
        connection.close();
    }


    @Then("extract the OTP from mysql")
    public void getOTP() throws ClassNotFoundException, SQLException {
        String url = mysqlUri + databaseName + "?useSSL=false";
        Class.forName(JDBC_DRIVER);
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String User = testContext.getData().get("parent_email");
        String sql = "select code from email_verification_intents where email='" + User + "' order by created_at desc limit 1" ;
        ResultSet executeQuery = statement.executeQuery(sql);
        String OTP = null;
        while (executeQuery.next()) {
            OTP = executeQuery.getString("code");
            System.out.println(OTP);
        }
        testContext.getData().put("OTP", OTP);
        statement.close();
        connection.close();
    }
    @Then("extract the OTP for account deletion")
    public void getOTP_for_account_deletion() throws ClassNotFoundException, SQLException {
        String url = mysqlUri + databaseName + "?useSSL=false";
        Class.forName(JDBC_DRIVER);
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String User = testContext.getData().get("parent_email");
        String sql = "select code from email_verification_intents where email='" + User + "' and intent_type='delete_profile' order by created_at desc limit 1" ;
        ResultSet executeQuery = statement.executeQuery(sql);
        String OTP1 = null;
        while (executeQuery.next()) {
            OTP1 = executeQuery.getString("code");
            System.out.println(OTP1);
        }
        testContext.getData().put("OTP1", OTP1);
        statement.close();
        connection.close();
    }

}