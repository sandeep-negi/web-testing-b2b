package com.splashlearn.core;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class PropertyReader {

    public String getProperty(String file, String value) throws IOException {
        Properties p = new Properties();
        try (FileReader f = new FileReader(System.getProperty("user.dir") + "/" + file)) {
            p.load(f);
        }
        return p.getProperty(value.toLowerCase().replace("-", "_"));
    }

    public Map<String, String> getProperties(String file, String ...keys) throws IOException {
        Properties p = new Properties();
        try (FileReader f = new FileReader(System.getProperty("user.dir") + "/" + file)) {
            p.load(f);
        }
        Map<String, String> m = new HashMap<>();
        try {
            for(String k : keys)
                m.put(k, p.getProperty(k));
        } catch(Exception ignore) {}
        return m;
    }

}
