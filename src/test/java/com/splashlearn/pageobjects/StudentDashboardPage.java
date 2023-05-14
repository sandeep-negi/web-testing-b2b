package com.splashlearn.pageobjects;

import com.splashlearn.custom.api.endpoints.StudentEndPoint;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import java.util.List;

import static com.splashlearn.constants.SplashLearnConstants.DEFAULT_TIMEOUT;
import static com.splashlearn.constants.SplashLearnConstants.LONG_TIMEOUT;

public class StudentDashboardPage extends BasePage{

    public StudentDashboardPage(WebDriver driver){
        super(driver);
    }

    @FindBy(css="div.style__BackButton-sc-157x5f2-1.bkzaXO") private WebElement backBtn;
    @FindBy(xpath = "//div[@class='tiles-gamification-wrapper']") private WebElement gamificationWrapper ;
    @FindBy(css = "div.style__TileOverlay-sc-1ne5fs9-0.ifOliM") private WebElement myToDos;
    private final By classcode = By.id("classcode");
    private final By studentRosterPageHeader = By.xpath("//h2[text()='Select Your Classroom' or text()='Select Your Profile']");
    private final By selectAllTopics = By.cssSelector("div.style__Tile-sc-q18bv4-0.dRnnDe");
    private final By selectReadingWordsCard = By.cssSelector("div.style__Tile-sc-q18bv4-0.dfPdFF");
    private final By studentDashboardType = By.xpath("//div[@id='student-dashboard-page']/div");
    private final By freemiumDashboardCardMyToDos = By.id("card-my_todos");
    private final By freemiumDashboardCurriculumIcon = By.xpath("//div[@class='Wrapper-sc-1lqdrt9 gLfDrM']/div[3]");
    private final By freemiumDashboardMathCurriculumIcon = By.xpath("//a[text()='Math Curriculum']");
    private final By readingWords = By.xpath("//div[text()='Reading Words']//parent::div");
    private final By curriculum = By.xpath("//div[text()='Curriculum']//parent::div[@class='TabContainer-sc-gpj4zw bONCYE']");
    private final By homeCurriculumSection = By.id("cta_button_curriculum");
    private final By learningPathSection=By.id("card-learning_path");
    private final By drsMyToDos = By.xpath("//div[@id='card-my_todos']/div");
    private final By upNextCard = By.xpath("//div[text()='Up Next in Math']//parent::div[starts-with(@class,'Card')]");
    private final By ptlPopUp = By.xpath("//input[@data-testid='email']");
    private final By goToTeacherAppBtn = By.xpath("//div[text()='Go to Teacher App']");
    private final By mathCurriculum = By.xpath("//a[text()='Math Curriculum']");
    private final By englishCurriculum = By.xpath("//a[text()='English Curriculum']");
    private final By curriculumSection = By.xpath("//div[@data-testid='card-math_topics' or @data-testid='card-ela_topics']");
    private final By mathSubject= By.xpath("//div[@class='style__GradeSwitch-sc-1nn8yhk-0 hVqKEi']/div[2]");
    private final By englishSubject= By.xpath("//div[@class='style__GradeSwitch-sc-1nn8yhk-0 hVqKEi']/div[1]");



    public boolean isPost3PMPopUpVisible(){
        waitForElementInvisible(driver, newPageLoader,10);
        return exists(driver, ptlPopUp,3);
    }
    public void enterClassCode(String classCode){
        type(driver, classcode, classCode);
        waitForElementVisible(driver, studentRosterPageHeader, DEFAULT_TIMEOUT);
    }
    public StudentDashboardPage loadStudentMyToDoPage(){
        loadUrl(StudentEndPoint.STUDENT_TODO_LIST);
        waitForElementInvisible(driver, newPageLoader);
        return this;
    }

    public StudentDashboardPage loadStudentDashboard(){
        loadUrl("/");
        waitForElementInvisible(driver, newPageLoader);
        return this;
    }

    public boolean assessmentVisible(String assessmentName){
        waitForElementInvisible(driver, newPageLoader);
        try {
            wait.until(ExpectedConditions.textToBe(By.xpath("//ul[@class='to-do-wrapper']//span[text()='Assessment']//following-sibling::div[1]/p[text()='" + assessmentName + "']"),assessmentName));
            return true;
        }catch(NoSuchElementException e){
            return false ;
        }
    }
    public boolean assessmentNotVisible(String assessmentName){
        waitForElementInvisible(driver, newPageLoader);
        try {
            return driver.findElement(By.xpath("//ul[@class='to-do-wrapper']//span[text()='Assessment']//following-sibling::div[1]/p[text()='" + assessmentName + "']")).isDisplayed();
        }catch(NoSuchElementException e){
            return false ;
        }
    }

    public void selectMyToDos(){
        waitForElementInvisible(driver, newPageLoader);
        wait.until(ExpectedConditions.visibilityOf(myToDos)).click();
    }

    public StudentDashboardPage selectMathSubject(){
        waitForElementInvisible(driver, newPageLoader);
        if(!driver.getCurrentUrl().contains("/math")){
            click(driver, mathSubject);
            waitForElementInvisible(driver, newPageLoader);
        }
        return this;
    }
    public StudentDashboardPage selectEnglishSubject(){
        waitForElementInvisible(driver, newPageLoader);
        waitForElementInvisible(driver, newPageLoader);
        if(!driver.getCurrentUrl().contains("/reading")){
            click(driver, englishSubject);
            waitForElementInvisible(driver, newPageLoader);
        }
        return this;
    }

    public StudentDashboardPage selectCurriculum(){
        waitForElementInvisible(driver, newPageLoader, 3);
        waitForElementVisible(driver, homeCurriculumSection);
        click(driver, curriculum);
        return this;
    }

    public StudentDashboardPage selectMathCurriculum(){
        waitForElementInvisible(driver, newPageLoader, 3);
        waitForElementVisible(driver, mathCurriculum, 3);
        waitForElementVisible(driver, learningPathSection);
        click(driver, mathCurriculum);
        return this;
    }
    public StudentDashboardPage selectEnglishCurriculum(){
        waitForElementInvisible(driver, newPageLoader, 3);
        waitForElementVisible(driver, englishCurriculum, 3);
        waitForElementVisible(driver, learningPathSection);
        click(driver, englishCurriculum);
        return this;
    }
    public StudentDashboardPage selectTopic(String topicName){
        waitForElementVisible(driver, curriculumSection);
        moveToElementUsingAction(driver, By.xpath("//div[@class='CardRail-sc-19fq3jg jRAOGg card-rail']//div[text()='"+topicName+"']"), DEFAULT_TIMEOUT);
        sleep(3);
        click(driver, By.xpath("//div[@class='CardRail-sc-19fq3jg jRAOGg card-rail']//div[text()='"+topicName+"']"));
        waitForElementInvisible(driver, newPageLoader, 3);
        return this;
    }
    public void loadMyToDosPage(){
        loadUrl("student-dashboard#/todo_list");
        waitForElementInvisible(driver, newPageLoader);
    }
    public void selectDrsMyToDos(){
        click(driver, drsMyToDos);
    }


    public boolean isUserOnStudentDashboard(){
        return driver.getCurrentUrl().contains("student-dashboard");
    }

    public StudentDashboardPage selectMathTopic(String topicName){
        click(driver, By.xpath("//h3[text()='"+topicName+"']"));
        return this;
    }

    public void verifyPlayableCompletion(String loId){
        List<WebElement> loPlayables = findElements(driver, By.xpath("//div[@id='lo-playable-"+loId+"']/div[contains(@class,'playable-card')]"), DEFAULT_TIMEOUT);
        for(int i=0 ; i< loPlayables.size() ; i++){
            Assert.assertEquals(getAttribute(driver,
                            By.xpath("//div[@id='lo-playable-"+loId+"']/div[contains(@class,'playable-card')][1]//span[1]"), DEFAULT_TIMEOUT, "class"),
                    "green-tick");
            Assert.assertEquals(getAttribute(driver,
                    By.xpath("//div[@id='lo-playable-"+loId+"']/div[contains(@class,'playable-card')][1]//span[2]"), DEFAULT_TIMEOUT, "class"),
                    "playable-star-count star-3");
        }
    }

    public StudentDashboardPage selectAllTopicsCard(){
        click(driver, selectAllTopics);
        waitForElementInvisible(driver, newPageLoader);
        return this;
    }
    public StudentDashboardPage selectTopicFromOldStudentTheme(String topicName){
        click(driver, By.xpath("//h3[text()='"+topicName+"']//parent::div[@class='cg-info']"));
        return this;
    }
    public StudentDashboardPage selectReadingTopicCard(){
        click(driver, selectReadingWordsCard);
        waitForElementInvisible(driver, newPageLoader);
        return this;
    }
    public StudentDashboardPage selectELATopic(String topic){
        click(driver, By.xpath("//div[text()='"+topic+"']//parent::div"));
        waitForElementInvisible(driver, newPageLoader);
        return this;
    }

    public String getStudentDashboardType(){
        waitForElementInvisible(driver, newPageLoader);
        sleep(LONG_TIMEOUT);
        String dashboardType = getAttribute(driver, studentDashboardType, DEFAULT_TIMEOUT, "class");
        if(dashboardType.equalsIgnoreCase("dashboard school-mode splash-verse")){
            dashboardType = "tile";
        }else if(dashboardType.equalsIgnoreCase("dashboard school-mode splash-verse is-freemium")){
            dashboardType = "freemium";
        }
        else {
            Assert.fail("Student Dashboard Type not known" + dashboardType);
        }
        return dashboardType ;
    }

    public StudentDashboardPage selectFreemiumDashboardCurriculumIcon(){
        waitForElementInvisible(driver, newPageLoader);
        waitForElementVisible(driver, freemiumDashboardCardMyToDos,LONG_TIMEOUT);
        click(driver, freemiumDashboardCurriculumIcon);
        return this;
    }

    public StudentDashboardPage selectFreemiumDashboardMathCurriculumIcon(){
        waitForElementVisible(driver, freemiumDashboardMathCurriculumIcon, LONG_TIMEOUT);
        click(driver, freemiumDashboardMathCurriculumIcon);
        return this;
    }

    public StudentDashboardPage selectFreemiumTopic(String topicName){
        click(driver, By.xpath("//div[@id='card-math_topics']//div[text()='"+topicName+"']"));
        return this;
    }
    public StudentDashboardPage selectGoToTeacherApp(){
        waitForElementVisible(driver, goToTeacherAppBtn);
        click(driver, goToTeacherAppBtn);
        waitForSpinner(driver);
        return this;
    }

}
