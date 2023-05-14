package com.splashlearn.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static com.splashlearn.constants.SplashLearnConstants.*;

public class TeacherDashboardPage extends BasePage {

    public TeacherDashboardPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='Enable home access']")
    private WebElement enableHomeAccess;
    @FindBy(css = ".header-button-container:nth-of-type(2) > a")
    private WebElement goToStudentExperience;
    @FindBy(linkText = "Go to Teacher Dashboard")
    private WebElement goToTeacherDashboard;
    @FindBy(className = "single-header")
    private WebElement dashboardHeader;
    @FindBy(xpath = "//img[@class='picture-class-password']")
    private WebElement classPicPassword;
    @FindBy(xpath = "//*[@class='class-password-info-icon']/strong")
    private WebElement classTextCode;
    private final By springboardModal = By.cssSelector("div.modal.welcome-springboard-modal");
    private final By closeSpringboardModal = By.xpath("//div[@class='app-carousal']//button[@class='iconcust-iconCross cross-icon']");
    private final By profileIcon = By.cssSelector("i.iconcust-iconProfile.left-nav-header-icons");
    private final By signout = By.linkText("Sign out");
    private final By classCode = By.xpath("//*[@class='class-code-container']/strong");
    private final By personaChecklistSteps = By.xpath("//ul[@class='onboarding-steps-list']/li");
    private final By completedPersonaCheckList = By.xpath("//ul[@class='onboarding-steps-list']//li[contains(@class,'onboarding-steps-list-item not-selected completed')]");
    private final By dashboardOptionLeftNav = By.id("dashboard");
    private final By closeCoachMarkModal = By.xpath("//div[@id='leftnav_coachmark']/button[@class='iconcust-iconCrossBtn cross-icon']");
    private final By selectEnableHomeAccess = By.cssSelector("div.enable-home-access__cta");
    private final By manageClass = By.id("manage_class");
    private final By studentRoster = By.xpath("//span[text()='Student roster']");
    private final By copyLink = By.cssSelector("div.copy-invite > span");
    private final By mathReview = By.xpath("//li[text()='MATH']//following-sibling::li[@id='review'][1]");
    private final By mathDailyActivity = By.xpath("//li[text()='MATH']//following-sibling::li[@id='review'][1]//span[text()='Daily activity']");
    private final By elaReview = By.xpath("//li[text()='ELA']//following-sibling::li[@id='review'][1]");
    private final By homeAccess = By.xpath("//span[text()='Go to student experience']//parent::li/preceding-sibling::li/span[contains(text(),'home access')]");
    private final By sendParentEmailBtn = By.xpath("//span[text()='Send parent emails']");
    private final By manageClassBtn = By.id("manage_class");
    private final By classSettingsBtn = By.xpath("//span[text()='Class settings']");
    private final By classNameDropdown = By.xpath("//div[@class='class-name-wrap']");
    private final By crossButtonOnPopUp = By.xpath("//div[@class='modal modal-md login-instructions']//following-sibling::button[@class='iconcust-iconCross cross-icon']");
    private final By shareLoginInstructionPopup = By.xpath("//div[@class='discovery-modal-container']//div[@id='instructions-popup']");
    private final By connectedParentText = By.xpath("//div[@class='no-parents-connected']");
    private final By tryStudentExperienceBtn = By.xpath("//span[text()='Try Student Experience']");
    private final By shareStudentLoginsOnLeftNav = By.xpath("//span[text()='Share student logins']");
    private final By copyInstructionsButtonOnSharedStudentLoginsPopup =  By.xpath("//span[text()='Copy Instructions']");
    private final By getCopiedTextOnStudentLoginPopup = By.xpath("//span[text()='Copied']");
    private final By downloadWorksheet = By.id("worksheet");
    private final By worksheetCardList = By.id("teacher-printable-worksheet-card-list");
    private final By nudge = By.xpath("//div[@id='nudges-overlay-id']/div[@class='sc-ipEyDJ hopKqu']");
    private final By review = By.xpath("//span[@id='leftNavMenuPortal']//li[@id='review']//label[text()='Review']");
    private final By dailyActivity = By.xpath("//li[@id='review']//ul[@class='nav-bar-sub-menu-container']/li/span[text()='Daily activity']");
    private final By summerLearningPopUp = By.xpath("//div[@class='sb-introduction-popup summer']");
    private final By closeSummerLearningPopUp = By.xpath("//button[@class='iconcust-iconCross cross-icon']");
    private final By summerLearningTab = By.id("SummerLearning");
    private final By discountBannerOnDashboard = By.xpath("//div[@class='discount-banner old-discount-banner'] | //div[@class='personalized-dashboard']/div[contains(@class,'discount-banner')]");
    private final By discountBannerOnHomeAccessPage = By.xpath("//div[@class='topBannerContainer']//div[@class='discount-off']|//div[@class='discount-offer']");

    public void selectDownloadWorksheet() {
        click(driver, downloadWorksheet);
        waitForElementVisible(driver, worksheetCardList);
    }

    public String getClassCode() {
        return text(driver, By.xpath("//*[@class='class-code-container']/strong"), SHORT_TIMEOUT);
    }

    public boolean isPicturePassword() {
        return exists(driver, By.xpath("//img[@class='picture-class-password']"), SHORT_TIMEOUT);
    }

    public String getStudentPicPassword() {
        return getAttribute(driver, By.xpath("//img[@class='picture-class-password']"), SHORT_TIMEOUT, "src");
    }

    public String getStudentTextPassword() {
        return text(driver, By.xpath("//*[@class='class-password-info-icon']/strong"), SHORT_TIMEOUT);
    }


    public boolean isEnableHomeAccessPresent() {
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        return wait.until(ExpectedConditions.elementToBeClickable(enableHomeAccess)).isDisplayed();
    }

    public void selectGoToStudentExperience() {
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        wait.until(ExpectedConditions.elementToBeClickable(goToStudentExperience)).click();
    }

    public boolean isOnStudentExperiencePage() {
        return wait.until(ExpectedConditions.elementToBeClickable(goToTeacherDashboard)).isDisplayed();
    }

    public boolean isOnTeacherDashboard() {
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
        return wait.until(ExpectedConditions.textToBePresentInElement(dashboardHeader, "Dashboard"));
    }

    public void clickHomeAccess() {
        wait.until(ExpectedConditions.elementToBeClickable(homeAccess)).click();
        waitForSpinner(driver);
    }

    public void handleSpringboardPopUp() {
        sleep(1000);
        waitForElementVisible(driver, classCode, LONG_TIMEOUT);
        waitForSpinner(driver);
        if (exists(driver, springboardModal, DEFAULT_TIMEOUT)) {
            click(driver, closeSpringboardModal);
        }
        waitForSpinner(driver);
    }
    public void handleSummerLearningPopUp() {
        waitForSpinner(driver);
        if (exists(driver, summerLearningPopUp, DEFAULT_TIMEOUT)) {
            click(driver, closeSummerLearningPopUp);
        }
        waitForSpinner(driver);
    }

    public void doSignOut() {
        click(driver, profileIcon);
        click(driver, signout);
        waitForSpinner(driver);
    }

    public int getPersonalChecklistStepCount() {
        return findElements(driver, personaChecklistSteps, DEFAULT_TIMEOUT).size();
    }

    public boolean verifyChecklistExist(String checklistText) {
        return exists(driver, By.xpath("//ul[@class='onboarding-steps-list']/li/div[text()='" + checklistText + "']"), DEFAULT_TIMEOUT);
    }

    public String verifyContentInExploreSplashContent(int contentOrder) {
        return text(driver, By.xpath("//div[@class='explore-splashlearn-content__tiles_container']/div[" + contentOrder + "]//child::div[@class='tile-title']"), DEFAULT_TIMEOUT);
    }

    public TeacherDashboardPage selectExploreContent(String contentName) {
        click(driver, By.xpath("//div[@class='onboarding-content-container']//div[text()='" + contentName + "']"));
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage selectDashboardOptionOnLeftnav() {
        waitForElementVisible(driver, dashboardOptionLeftNav);
        click(driver, dashboardOptionLeftNav);
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage closeModal() {
        click(driver, closeCoachMarkModal);
        waitForSpinner(driver);
        return this;
    }

    public boolean isStepCompleted(String stepName) {
        return exists(driver, By.xpath("div[text()='" + stepName + "']//parent::li[@class='onboarding-steps-list-item selected completed']"), DEFAULT_TIMEOUT);
    }

    public TeacherDashboardPage selectStep(String stepName) {
        click(driver, By.xpath("//div[text()='" + stepName + "' and @class='step-label']"));
        return this;
    }

    public TeacherDashboardPage selectEnableHomeAccess() {
        click(driver, selectEnableHomeAccess);
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage selectManageClass() {
        click(driver, manageClass);
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage selectStudentRoster() {
        click(driver, studentRoster);
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage selectCopyLink() {
        click(driver, copyLink);
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage selectMathReview() {
        click(driver, mathReview);
        waitForSpinner(driver);
        return this;
    }

    public TeacherDashboardPage selectMathDailyActivity() {
        click(driver, mathDailyActivity);
        waitForSpinner(driver);
        return this;
    }

    public boolean isNoConnectedParentTextVisible() {
        return exists(driver, connectedParentText, DEFAULT_TIMEOUT);
    }

    public String getConnectedParentText() {
        return text(driver, connectedParentText, DEFAULT_TIMEOUT);
    }

    public void loadStudentRosterPage(String klassSlug, String klassGrade) {
        loadUrl("class/" + klassSlug + "/grades/" + klassGrade + "/roster");
    }

    public TeacherDashboardPage selectTryStudentExperience() {
        click(driver, tryStudentExperienceBtn);
        waitForSpinner(driver);
        waitForElementInvisible(driver, newPageLoader);
        return this;
    }

    public void userClicksOnShareStudentLogins() {
        click(driver, shareStudentLoginsOnLeftNav, 3);
        waitForSpinner(driver);
    }

    public TeacherDashboardPage selectGoToTeacherApp(){
        click(driver, tryStudentExperienceBtn);
        waitForSpinner(driver);
        return this;
    }

    public void clickManageClassBtn() {
        click(driver, manageClassBtn);
        waitForSpinner(driver);

    }

    public void clickClassSettingsBtn() {
        click(driver, classSettingsBtn);
        waitForSpinner(driver);

    }

    public void clickClassNameDropdown() {
        click(driver, classNameDropdown);
        waitForSpinner(driver);
    }

    public void verifyShareStudentLoginPopup() {
        if (exists(driver, shareLoginInstructionPopup, DEFAULT_TIMEOUT)) {
            click(driver, crossButtonOnPopUp);
        }
    }

    public void clickCrossButtonOnShareStudentLoginPopup() {
            click(driver, crossButtonOnPopUp, DEFAULT_TIMEOUT);
        }

        public void clickOnCopyInstructionsButtonOnShareStudentLoginOnLeftNav() {
            click(driver, shareStudentLoginsOnLeftNav, 3);
            click(driver, copyInstructionsButtonOnSharedStudentLoginsPopup);
        }

        public boolean verifyCopiedTextIsAppearing(){
        return exists(driver,getCopiedTextOnStudentLoginPopup,3);
        }

    public boolean isKlassExists(String klassName){
        boolean flag = false;
        if (!exists(driver, By.xpath("//li/strong[@title='" + klassName + "']"), 3))
            flag=true;
        return  flag;
        }

    public boolean isNudgeAppearing(){
        return exists(driver, nudge, DEFAULT_TIMEOUT);
    }
    public void selectMenuFromLeftNav(String subject, String section){
        waitForElementVisible(driver, By.xpath("(//*[text()='"+subject+"']/following-sibling::*//*[text()='"+section+"'])[1]"));
        click(driver, By.xpath("(//*[text()='"+subject+"']/following-sibling::*//*[text()='"+section+"'])[1]"));
    }
    public void selectSubMenu(String subject, String section, String subSection){
        click(driver, By.xpath("(//*[text()='"+subject+"']/following-sibling::*//*[text()='"+section+"'])[1]//ancestor::li/ul[@class='nav-bar-sub-menu-container']/li/span[text()='"+subSection+"']"));
    }
    public void selectDailyActivity(){
        click(driver, review);
        click(driver, dailyActivity, DEFAULT_TIMEOUT);
    }
    public void loadDailyActivityPage(String klassSlug, String klassGrade) {
        loadUrl("class/" + klassSlug + "/grades/" + klassGrade + "/daily-activity");
        wait.until(ExpectedConditions.invisibilityOf(pageLoader));
    }

    public boolean isSummerLearningTabVisible(){
        return exists(driver, summerLearningTab, DEFAULT_TIMEOUT);
    }
    public boolean isDiscountBannerVisibleOnDashboard(){
        return exists(driver,discountBannerOnDashboard, DEFAULT_TIMEOUT);
    }
    public boolean isDiscountBannerVisibleOnHomeAccessPage(){
        return exists(driver,discountBannerOnHomeAccessPage, DEFAULT_TIMEOUT);
    }
}
