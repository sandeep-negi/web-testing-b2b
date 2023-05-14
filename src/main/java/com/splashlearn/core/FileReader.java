package com.splashlearn.core;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class FileReader {

    private static final Logger logger = LogManager.getLogger(FileReader.class);

    public List<String> read(String file) {
        List<String> result = new ArrayList<>();
        try(Stream<String> lines = Files.lines(Paths.get(file))) {
            result = lines.collect(Collectors.toList());
            logger.debug("File read {} successful.", file);
        } catch (IOException e) {
            logger.error("Unable to read file {}. Exception {}.", file, e.getMessage());
        }
        return result;
    }

}
