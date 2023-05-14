package com.splashlearn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Singleton Class
public class DBConnector {
    private static DBConnector db;
    private static Connection connection ;
    public static final String PREPROD_DATABASE = "preprod_db1";
    public static final String STAGING_DATABASE = "studypad_temp";
    public static final String PROD_DATABASE = "splashmath";
    public static String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String USERNAME = System.getProperty("mysql_db_username");;
    public static final String PASSWORD = System.getProperty("mysql_db_password");
    public static final String URL = System.getProperty("mysql_db_uri") + getMySqlDatabaseName() + "?enabledTLSProtocols=TLSv1.2";

    public DBConnector() {
        try {
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static String getMySqlDatabaseName() {

        switch (System.getProperty("environment")) {
            case "prod":
                return PROD_DATABASE;
            case "preprod":
                return PREPROD_DATABASE;
            default:
                return STAGING_DATABASE;
        }
    }
    public static DBConnector getInstanceOfDBConnector(){
        if(db==null){
            db = new DBConnector();
        }
        return db ;
    }
    public Connection getConnection() {
        return connection;
    }
}
