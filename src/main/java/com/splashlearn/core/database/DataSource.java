package com.splashlearn.core.database;

import java.sql.Connection;

public class DataSource {

    static JDBCConnectionPool pool = new JDBCConnectionPool();

    public static Connection getConnection() {
        Connection connection = pool.getConnectionFromPool();
        return connection;
    }

    public static void returnConnection(Connection connection) {
        pool.returnConnectionToPool(connection);
    }

    public static void closeConnections() {
        pool.closeAllConnections();
    }
}
