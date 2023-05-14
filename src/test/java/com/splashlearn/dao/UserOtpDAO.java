package com.splashlearn.dao;

import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import org.testng.Assert;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserOtpDAO {
    private ResultSet resultSet ;
    private Statement statement ;
    private Connection connection ;

    public UserOtpDAO(){
        connection = DBConnector.getInstanceOfDBConnector().getConnection();
    }

    public EmailVerificationIntent getUserOtpInfoFromDB(String email){
        EmailVerificationIntent emailVerificationIntent = null;
        try {
            statement = connection.createStatement();
            String query = "select * from email_verification_intents where email='" + email + "' ";
            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                String data = resultSet.getString("id") + " " + resultSet.getString("email") + " " + resultSet.getString("status") + " " + resultSet.getString("user_id") + " " + resultSet.getString("code");
                System.out.println("User Data Result Set = " + data);
                emailVerificationIntent = new EmailVerificationIntent(resultSet.getString("id"),resultSet.getString("email"),
                        resultSet.getString("user_id"),resultSet.getString("code"),
                        resultSet.getString("valid_till"),resultSet.getString("status"),
                        resultSet.getString("created_at"),resultSet.getString("updated_at"),
                        resultSet.getString("deleted"));
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return emailVerificationIntent ;
    }
    public EmailVerificationIntent getOtpAsPerToStatusFromDB(String email, String currentStatus){
        EmailVerificationIntent emailVerificationIntent = null;
        try {
            statement = connection.createStatement();
            String query = null ;
            if(currentStatus.equalsIgnoreCase("Initiated")){
                query = "select * from email_verification_intents where email = '"+email+"' and status = '"+currentStatus+"' and deleted = '1' order by created_at desc limit 1" ;
            }else if(currentStatus.equalsIgnoreCase("Verified")){
                query = "select * from email_verification_intents where email = '"+email +"' and status = '"+currentStatus+"' order by created_at desc limit 1";
            }else{
                Assert.fail("Invalid column option = " + currentStatus);
            }

            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                String data = resultSet.getString("id") + " " + resultSet.getString("email") + " " + resultSet.getString("status") + " " + resultSet.getString("user_id") + " " + resultSet.getString("code");
                System.out.println("User Data Result Set = " + data);
                emailVerificationIntent = new EmailVerificationIntent(resultSet.getString("id"),resultSet.getString("email"),
                        resultSet.getString("user_id"),resultSet.getString("code"),
                        resultSet.getString("valid_till"),resultSet.getString("status"),
                        resultSet.getString("created_at"),resultSet.getString("updated_at"),
                        resultSet.getString("deleted"));
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return emailVerificationIntent ;
    }
}
