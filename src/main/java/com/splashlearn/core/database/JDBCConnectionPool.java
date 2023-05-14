package com.splashlearn.core.database;

import lombok.extern.log4j.Log4j2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Log4j2
public class JDBCConnectionPool {

    List<Connection> availableConnections = new ArrayList<>();

    public JDBCConnectionPool() {
        initializeConnectionPool();
    }

    private void initializeConnectionPool() {
        log.debug("Initializing connection Pool with count = " + DatabaseConfiguration.getInstance().MAX_CONNECTIONS);
        while (!isConnectionPoolFull()) {
            availableConnections.add(createNewConnectionForPool());
        }
    }

    private synchronized boolean isConnectionPoolFull() {
        final int MAX_POOL_SIZE = DatabaseConfiguration.getInstance().MAX_CONNECTIONS;

        if (availableConnections.size() < MAX_POOL_SIZE)
            return false;

        return true;
    }

    private Connection createNewConnectionForPool() {
        DatabaseConfiguration config = DatabaseConfiguration.getInstance();
        log.debug("Adding new connection to Pool");
        try {
            Connection connection = DriverManager.getConnection(
                    config.URL, config.USERNAME, config.PASSWORD);
            log.debug("Successfully added connection to Pool");
            return connection;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public synchronized Connection getConnectionFromPool() {
        Connection connection = null;
        if (availableConnections.size() > 0) {
            connection = availableConnections.get(0);
            availableConnections.remove(0);
            log.debug("Connection fetched from Pool");
        }
        return connection;
    }

    public synchronized void returnConnectionToPool(Connection connection) {
        availableConnections.add(connection);
        log.debug("Connection released and added to pool");
    }

    public void closeAllConnections() {

        availableConnections.forEach(connection -> {
            if (Objects.nonNull(connection)) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        });
        log.debug("All connections have been closed");

    }
}
