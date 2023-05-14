package com.splashlearn.custom;

import com.splashlearn.context.TestContext;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import ru.yandex.qatools.ashot.AShot;
import ru.yandex.qatools.ashot.Screenshot;
import ru.yandex.qatools.ashot.comparison.ImageDiff;
import ru.yandex.qatools.ashot.comparison.ImageDiffer;
import ru.yandex.qatools.ashot.shooting.ShootingStrategies;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class ImageComparisonUtility {
    private final WebDriver driver;
    private final TestContext context;

    public ImageComparisonUtility(TestContext context) {
        this.context = context;
        driver = context.getDriver();
    }

    public boolean compareImages(String actualImagePath, String expectedImagePath){
        BufferedImage expectedImage = null;
        try {
            expectedImage = ImageIO.read(new File(System.getProperty("user.dir") + expectedImagePath));
        } catch (IOException e) {
            e.printStackTrace();
        }

        Screenshot screenshot = new AShot()
                .shootingStrategy(ShootingStrategies.simple())
                .takeScreenshot(driver);
        try {
            ImageIO.write(screenshot.getImage(),"PNG",new File(System.getProperty("user.dir") +actualImagePath));
        } catch (IOException e) {
            e.printStackTrace();
        }

        BufferedImage actualImage = screenshot.getImage();

        ImageDiffer imgDiff = new ImageDiffer();
        ImageDiff diff = imgDiff.makeDiff(expectedImage,actualImage);
        return diff.hasDiff();
    }
}
