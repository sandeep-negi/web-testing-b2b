package com.splashlearn.core.database;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class DatabaseConfiguration {

    public static final String PREPROD_DATABASE = "preprod_db1";
    public static final String STAGING_DATABASE = "studypad_temp";
    public static final String PROD_DATABASE = "splashmath";

    private static DatabaseConfiguration databaseConfiguration = new DatabaseConfiguration();
    public String USERNAME;
    public String PASSWORD;
    public String URL;
    public int MAX_CONNECTIONS;

    public DatabaseConfiguration() {
        init();
    }

    public static DatabaseConfiguration getInstance() {
        return databaseConfiguration;
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

    private void init() {
        USERNAME = System.getProperty("mysql_db_username");
        PASSWORD = System.getProperty("mysql_db_password");
        URL = System.getProperty("mysql_db_uri") + getMySqlDatabaseName() + "?enabledTLSProtocols=TLSv1.2";
        MAX_CONNECTIONS = Integer.valueOf(System.getProperty("dataproviderthreadcount", "1"));
        log.debug("DB_URL: " + URL);
        log.debug("DB_MAX_CONNECTIONS: " + MAX_CONNECTIONS);
    }

}

