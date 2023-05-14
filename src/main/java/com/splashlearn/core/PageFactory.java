package com.splashlearn.core;

import com.splashlearn.exceptions.ElementNotFoundException;
import com.splashlearn.exceptions.InvalidLocatorException;
import org.openqa.selenium.By;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.apache.commons.lang3.StringUtils.isBlank;

public class PageFactory {

    private static final String PAGE_FACTORY_PATH = System.getProperty("user.dir") + "/pages/";
    private static final Map<String, List<String>> factory = new HashMap<>();
    LocatorEvaluator locatorEvaluator = new LocatorEvaluator();

    public By getLocatorFor(String fileName, String field) throws InvalidLocatorException, ElementNotFoundException {
        if (isBlank(fileName) || isBlank(field))
            return null;

        fileName = fileName.trim().toLowerCase();

        if (!factory.containsKey(fileName))
            factory.put(fileName, new FileReader().read(PAGE_FACTORY_PATH + fileName));

        String locator = factory.get(fileName).stream().filter(n -> n.split("=")[0].equalsIgnoreCase(field))
                .findFirst().orElse(null);

        if (locator == null)
            throw new ElementNotFoundException(String.format("Element %s not found in page factory %s", field, fileName));

        return locatorEvaluator.getByLocator(locator.split("=", 2)[1]);

    }

    public List<By> getAllLocators(String fileName) {
        if (isBlank(fileName))
            return null;

        fileName = fileName.trim().toLowerCase();

        if (!factory.containsKey(fileName))
            factory.put(fileName, new FileReader().read(PAGE_FACTORY_PATH + fileName));

        List<String> locators = factory.get(fileName).stream().collect(Collectors.toList());

        if (locators.isEmpty())
            return null;

        return locators.stream().map(locator -> {
            try {
                return locatorEvaluator.getByLocator(locator.split("=", 2)[1]);
            } catch (InvalidLocatorException e) {
                e.printStackTrace();
                return null;
            }
        }).collect(Collectors.toList());
    }
}
