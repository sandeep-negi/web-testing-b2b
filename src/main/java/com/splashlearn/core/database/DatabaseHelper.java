package com.splashlearn.core.database;

import org.apache.commons.lang3.ArrayUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DatabaseHelper {

    private Connection connection;

    public DatabaseHelper() {
        this.connection = DataSource.getConnection();
    }

    public <T> ResultSet preparedStatement(String query, T... queryArguments) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        if (ArrayUtils.isNotEmpty(queryArguments)) {
            int counter = 0;
            for (T argument : queryArguments) {
                if (argument instanceof String)
                    preparedStatement.setString(++counter, (String) argument);
                else if (argument instanceof Integer)
                    preparedStatement.setInt(++counter, (int) argument);
                else
                    throw new IllegalArgumentException("Allowed types are: String and Integer");
            }
        }
        return preparedStatement.executeQuery();
    }

    public <T> List<Map<String, Object>> executePreparedStatementAndGetListOfMap(String query, T... queryArguments) throws SQLException {
        ResultSet resultSet = preparedStatement(query, queryArguments);
        return convertToListOfMap(resultSet);
    }

    public List<Map<String, Object>> convertToListOfMap(ResultSet resultSet) throws SQLException {
        List<Map<String, Object>> maps = new ArrayList<>();
        if (resultSet != null) {
            while (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                int totalRows = metaData.getColumnCount();
                Map<String, Object> map = new HashMap<>();
                for (int i = 0; i < totalRows; i++) {
                    String rKey = metaData.getColumnLabel(i + 1).toLowerCase();
                    Object rVal = resultSet.getObject(i + 1);
                    map.put(rKey, rVal);
                }
                maps.add(map);
            }
        }
        return maps;
    }

    public void releaseConnection() {
        DataSource.returnConnection(connection);
    }

}
