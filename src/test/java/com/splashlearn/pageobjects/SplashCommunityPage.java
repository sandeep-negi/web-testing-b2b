package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;
import static com.splashlearn.constants.SplashLearnConstants.SHORT_TIMEOUT;

public class SplashCommunityPage extends BasePage{
    public SplashCommunityPage(WebDriver driver) {
        super(driver);
    }

    private final By splashlearnCommunity = By.id("sc-menu-div");
    private final By gettingStarted= By.id("gs");
    private final By welcome = By.xpath("//li[@id='gs']//child::span[text()='Welcome']");
    private final By sayHello = By.xpath("//li[@id='gs']//child::span[text()='Say Hello']");

    private final By splashHub= By.id("sh");
    private final By announcements = By.xpath("//li[@id='sh']//child::span[text()='Announcements']");
    private final By askTheCommnity = By.xpath("//li[@id='sh']//child::span[text()='AskTheCommunity']");
    private final By feed = By.xpath("//li[@id='sh']//child::span[text()='Feed']");

    private final By splashProduct= By.id("sp");
    private final By splashlearnTutorials = By.xpath("//li[@id='sp']//child::span[text()='SplashLearn Tutorials']");
    private final By howIUseSplashlearn = By.xpath("//li[@id='sp']//child::span[text()='How I Use SplashLearn']");
    private final By bannerSplashCommunity = By.id("splash-community-discovery-modal");
    private final By bubbleLoader = By.cssSelector("div.bubble-loader-container']");
    private final By announcementPostBodyContent = By.xpath("//div[@class='post__inside trix-v2  expanded']");

    private final By splashlearnCommunityModal = By.id("splash-community-discovery-modal");
    private final By closeSplashlearnCommunityModal = By.xpath("//div[@id='splash-community-discovery-modal']//following-sibling::button");
    private final By communityModalCheckBox = By.xpath("//div[@id='splash-community-discovery-modal']//child::input[@type='checkbox']");
    private final By joinSplashCommunity = By.xpath("//span[text()='Join SplashCommunity']");


    public boolean isSplashlearnCommunityVisibleOnNavBar(){
        boolean flag = false;
        if(exists(driver,splashlearnCommunity,DEFAULT_TIMEOUT)){
            moveToElementUsingAction(driver,splashlearnCommunity, DEFAULT_TIMEOUT);
            flag = true;
        }
        return flag;
    }

    public boolean isSplashCommunityBannerVisibleOnSubSection(){
        return (isBannerVisibleOnGettingStartedSubSections()
                && isBannerVisibleOnSplashHubSubSections()
                && isBannerVisibleOnSplashlearnProductSubSections()
        ) ;
    }

    public boolean isBannerVisibleOnGettingStartedSubSections(){
        boolean wl =  false ;
        boolean sh =  false ;
        if(exists(driver, gettingStarted, DEFAULT_TIMEOUT)){
            click(driver, gettingStarted);
            click(driver, welcome);
            wl = isSplashCommunityBannerVisible();
            click(driver, sayHello);
            sh = isSplashCommunityBannerVisible();
        }
        return (wl && sh) ;
    }
    public boolean isBannerVisibleOnSplashHubSubSections(){
        boolean anc =  false ;
        boolean fd =  false ;
        boolean ask = false ;
        if(exists(driver, splashHub, DEFAULT_TIMEOUT)){
            click(driver,splashHub);
            click(driver, announcements);
            anc = isSplashCommunityBannerVisible();
            click(driver, feed);
            fd = isSplashCommunityBannerVisible();
            click(driver, askTheCommnity);
            ask = isSplashCommunityBannerVisible();
        }
        return (anc && fd && ask) ;
    }
    public boolean isBannerVisibleOnSplashlearnProductSubSections(){
        boolean sp = false ;
        boolean hw = false ;
        if(exists(driver, splashProduct, DEFAULT_TIMEOUT)){
            click(driver, splashProduct);
            click(driver, splashlearnTutorials);
            sp = isSplashCommunityBannerVisible();
            click(driver, howIUseSplashlearn);
            hw = isSplashCommunityBannerVisible();
        }
        return (sp && hw) ;
    }
    public boolean isSplashCommunityBannerVisible(){
        return exists(driver, bannerSplashCommunity,DEFAULT_TIMEOUT);
    }

    public SplashCommunityPage selectSplashHub() {
        if (exists(driver, splashHub, DEFAULT_TIMEOUT)) {
            click(driver, splashHub);
            click(driver, announcements);
            waitForElementInvisible(driver, bubbleLoader);
        }
        return this;
    }

    public SplashCommunityPage handleSplashlearnCommunityModal(){
        waitForSpinner(driver);
        if(exists(driver, splashlearnCommunityModal,DEFAULT_TIMEOUT)){
            click(driver,closeSplashlearnCommunityModal);
        }
        waitForSpinner(driver);
        return this ;
    }

    public boolean isSplashlearnCommunityModalVisible(){
        return exists(driver, splashlearnCommunityModal, SHORT_TIMEOUT);
    }
        public SplashCommunityPage joinSplashCommunity(){
            waitForSpinner(driver);
            click(driver,communityModalCheckBox);
            click(driver, joinSplashCommunity);
            return this;
        }

}
