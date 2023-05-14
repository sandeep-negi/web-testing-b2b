package com.splashlearn.dao;


import com.splashlearn.custom.api.model.pojo.PricingTests;
import org.testng.Assert;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserPricingtestDAO {
    private ResultSet resultSet ;
    private Statement statement ;
    private Connection connection ;

    public UserPricingtestDAO(){
        connection = DBConnector.getInstanceOfDBConnector().getConnection();
    }

    public PricingTests getUserPricingtestFromDB(String userEmail){
        PricingTests pricingtests = null;
        try {
            statement = connection.createStatement();
            String query = "select code from pricing_tests\n" +
                    "\twhere hex(id) in (select hex(pricing_test_id) from client_settings\n" +
                    "where hex(client_id) in (SELECT hex(id) from clients\n" +
                    "where hex(user_id) in (select hex(id) from users\n" +
                    "where email = '" + userEmail + "')))";
            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                String data = resultSet.getString("code") ;
                System.out.println("Pricing code = " + data);
                pricingtests = new PricingTests(resultSet.getString("code"));
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pricingtests ;
    }
}
