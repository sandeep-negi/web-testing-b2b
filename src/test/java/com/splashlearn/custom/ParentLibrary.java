package com.splashlearn.custom;

import com.splashlearn.context.TestContext;
import com.splashlearn.core.DataGenerator;
import com.splashlearn.core.PageFactory;
import com.splashlearn.exceptions.ElementNotFoundException;
import com.splashlearn.exceptions.InvalidLocatorException;
import org.openqa.selenium.By;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import org.testng.asserts.Assertion;

import java.util.Map;

import static com.splashlearn.constants.SplashLearnConstants.LONG_TIMEOUT;
import static com.splashlearn.core.selenium.SeleniumActions.*;
import static com.splashlearn.core.selenium.SeleniumActions.exists;

public class ParentLibrary {

    private static final Logger logger = LogManager.getLogger(TeacherLibrary.class);
    private final WebDriver driver;
    private final Map<String, String> data;
    private final PageFactory pageFactory;
    private final String purchasePage = "purchase_page";
    private final String weeklygoal = "weekly_goal";
    private final String roadBlock = "road_block_page";
    private final String parentDashboard = "parent_dashboard_page";
    private final String gamification_element = "gamification_element";
    private final String fork_screen = "fork_screen";
    private final String topic_selection = "topic-selection";
    private final String loginPage = "login_page";
    private final String parent_dashboard_page = "parent_dashboard_page";
    private final String cards_on_learning_path = "cards_on_learning_path";

    public ParentLibrary(TestContext testContext) {
        this.driver = testContext.getDriver();
        this.data = testContext.getData();
        pageFactory = new PageFactory();
    }

    public void login(String user, String password) throws InvalidLocatorException, ElementNotFoundException {
        retryClicksUntilNewElementPresent(driver, pageFactory.getLocatorFor(loginPage, "parents_teacher_login"),
                pageFactory.getLocatorFor(loginPage, "login_button"));
        type(driver, pageFactory.getLocatorFor(loginPage, "user_email"), user);
        type(driver, pageFactory.getLocatorFor(loginPage, "user_password"), password);
        click(driver, pageFactory.getLocatorFor(loginPage, "login_button"));
//        waitForElementVisible(driver, pageFactory.getLocatorFor(parentDashboard, "gamification_bar"), LONG_TIMEOUT);
        waitForAnyoneElementToBeVisible(driver, pageFactory.getLocatorFor(parentDashboard, "gamification_bar"),
                pageFactory.getLocatorFor(parentDashboard, "my_learning_path"), LONG_TIMEOUT);
    }

    public void weekly_goal_Set(String min, String day) throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(weeklygoal, "set_weekly_goal"), 10)) {
            click(driver, pageFactory.getLocatorFor(weeklygoal, "set_weekly_goal"));
        } else if (exists(driver, pageFactory.getLocatorFor(roadBlock, "play_button"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(roadBlock, "play_button"));
        } else if (exists(driver, pageFactory.getLocatorFor(parentDashboard, "spotlight"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(parentDashboard, "spotlight"));
        } else waitForElement(driver, pageFactory.getLocatorFor(parent_dashboard_page, "i'll_take_it_later"));
    }

    public void purchase(String subject, String plan, String noOfChild) throws InvalidLocatorException, ElementNotFoundException {

        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_header"), 10)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_yearly_plan"));
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "header"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "header"));

        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "new_plan_page"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "new_plan_page"));

        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "header_2"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "header_2"));
        } else
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "Subscribe_To_Unlock_Unlimited_Fun"));

        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"), 10)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        } else if (subject.equalsIgnoreCase("math_plus_reading")) {
            if (noOfChild.equalsIgnoreCase("up_to_3"))

                click(driver, pageFactory.getLocatorFor(purchasePage, "up_to_three_child_new"));
        } else {
            click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"));
            // choose subject
            if (subject.equalsIgnoreCase("math"))
                click(driver, pageFactory.getLocatorFor(purchasePage, "math"));
            else if (subject.equalsIgnoreCase("maths")) {
                try {
                    if (exists(driver, pageFactory.getLocatorFor(purchasePage, "maths"), 10)) {
                        click(driver, pageFactory.getLocatorFor(purchasePage, "maths"));
                        click(driver, pageFactory.getLocatorFor(purchasePage, "start_my_subscription1"));
                    }
                } catch (Exception ignored) {
                    click(driver, pageFactory.getLocatorFor(purchasePage, "start_my_subscription1"));
                }

            } else
                click(driver, pageFactory.getLocatorFor(purchasePage, "reading"));
        }

        // choose plan
        if (plan.equalsIgnoreCase("monthly") || plan.equalsIgnoreCase("quarterly"))
            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
        else if (plan.equalsIgnoreCase("yearly") && noOfChild.equalsIgnoreCase("up to 3 children"))
            click(driver, pageFactory.getLocatorFor(purchasePage, "up_to_three_child"));

        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
        }
        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"), 10)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        }
        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "start_my_subscription"), 10)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "start_my_subscription"));
        }


        enterCardDetails();

        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "email"), 5)) {
            data.put("email", DataGenerator.parentEmail());
            type(driver, pageFactory.getLocatorFor(purchasePage, "email"), data.get("email"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "start_your_free_trial"));
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "start_your_free_trial"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "start_your_free_trial"), 20);
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_start_membership"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_start_membership"), 20);
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "Subscribe_To_Unlock_Unlimited_Fun"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "pay_now"), 20);
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);

        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "new_plan_page"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "pay_now"), 20);
            waitForSpinner(driver, 200);
            exists(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 30);
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);

        }
    }


    public void purchase1(String subject, String plan, String noOfChild) throws InvalidLocatorException, ElementNotFoundException {

        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_header"), 10)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_yearly_plan"));
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "header"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "header"));

        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "new_plan_page"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "new_plan_page"));

        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "header_2"), 10)) {
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "header_2"));
        } else
            waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "Subscribe_To_Unlock_Unlimited_Fun"));

        if (plan.equalsIgnoreCase("yearly") && subject.equalsIgnoreCase("math_plus_reading") && (noOfChild.equalsIgnoreCase("one_child")))
        {
            click(driver, pageFactory.getLocatorFor(purchasePage, "one_child"));
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
        } else if (plan.equalsIgnoreCase("yearly") && subject.equalsIgnoreCase("math_plus_reading") && (noOfChild.equalsIgnoreCase("up_to_3"))) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "up_to_three_child_new"));
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
        }
        if (plan.equalsIgnoreCase("yearly") && subject.equalsIgnoreCase("math") && (noOfChild.equalsIgnoreCase("one_child")))
        {
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30))
            click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "math"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "math"));
                click(driver, pageFactory.getLocatorFor(purchasePage, "one_child"), 20);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists (driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"),10))
            click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        } else if (plan.equalsIgnoreCase("yearly") && subject.equalsIgnoreCase("math") && (noOfChild.equalsIgnoreCase("up_to_3"))) {

            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "math"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "math"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "up_to_three_child_new"), 20);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists (driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"),10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        }
        if (plan.equalsIgnoreCase("yearly") && subject.equalsIgnoreCase("reading") && (noOfChild.equalsIgnoreCase("one_child")))
        {

            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "reading"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "reading"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "one_child"), 20);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists (driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"),10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        } else if (plan.equalsIgnoreCase("yearly") && subject.equalsIgnoreCase("reading") && (noOfChild.equalsIgnoreCase("up_to_3"))) {

            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "reading"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "reading"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "up_to_three_child_new"), 20);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists (driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"),10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        }
        if ( (plan.equalsIgnoreCase("monthly") || plan.equalsIgnoreCase("quarterly"))  && subject.equalsIgnoreCase("math_plus_reading")) {
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
            else click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly_plan_popup"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly_plan_popup"));
        }
        if ( (plan.equalsIgnoreCase("monthly") || plan.equalsIgnoreCase("quarterly"))  && subject.equalsIgnoreCase("math")) {
//            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"), 10))
//                click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
//            else click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "math"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
//            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly_plan_popup"), 10))
//                click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly_plan_popup"));

            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "math"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "math"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"), 20);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists (driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"),10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));


        }
        if ( (plan.equalsIgnoreCase("monthly") || plan.equalsIgnoreCase("quarterly"))  && subject.equalsIgnoreCase("reading")) {
//            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"), 10))
//                click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
//            else click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "reading"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"));
//            click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
//            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly_plan_popup"), 10))
//                click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly_plan_popup"));

            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "more_plans"), 30);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "reading"), 30))
                click(driver, pageFactory.getLocatorFor(purchasePage, "reading"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "monthly_quarterly"), 20);
            if (exists(driver, pageFactory.getLocatorFor(purchasePage, "continue"), 10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue"));
            if (exists (driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"),10))
                click(driver, pageFactory.getLocatorFor(purchasePage, "continue_with_plan"));
        }
        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "visa_image"), 10))
            click(driver, pageFactory.getLocatorFor(purchasePage, "Card_detail"));
        else
        enterCardDetails();

        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "email"), 5)) {
            data.put("email", DataGenerator.parentEmail());
            type(driver, pageFactory.getLocatorFor(purchasePage, "email"), data.get("email"));
            click(driver, pageFactory.getLocatorFor(purchasePage, "start_your_free_trial"));
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "start_your_free_trial"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "start_your_free_trial"), 20);
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_start_membership"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "old_product_page_start_membership"), 20);
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);
        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "Subscribe_To_Unlock_Unlimited_Fun"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "pay_now"), 20);
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);

        } else if (exists(driver, pageFactory.getLocatorFor(purchasePage, "new_plan_page"), 5)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "pay_now"), 20);
            waitForSpinner(driver, 200);
            exists(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 30);
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);

        }
    }

    public void purchase(String subject, String plan) throws InvalidLocatorException, ElementNotFoundException {
        purchase(subject, plan, "one_child");
    }

    public void enterCardDetails() throws InvalidLocatorException, ElementNotFoundException {
        switchIFrame(driver, pageFactory.getLocatorFor(purchasePage, "card_number_iframe"));
        type(driver, pageFactory.getLocatorFor(purchasePage, "card_number"), "4242424242424242");
        switchToDefaultContent(driver);
        switchIFrame(driver, pageFactory.getLocatorFor(purchasePage, "expiry_date_iframe"));
        type(driver, pageFactory.getLocatorFor(purchasePage, "expiry_date"), "12/30");
        switchToDefaultContent(driver);
        switchIFrame(driver, pageFactory.getLocatorFor(purchasePage, "cvc_iframe"));
        type(driver, pageFactory.getLocatorFor(purchasePage, "cvc"), "123");
        switchToDefaultContent(driver);
    }

    public void selectSubjectName(String subjectName) throws InvalidLocatorException, ElementNotFoundException {
        driver.navigate().refresh();
        String gamification_element = "gamification_element";
        click(driver, pageFactory.getLocatorFor(gamification_element, "subject_selection_dropDown"));
        click(driver, By.xpath("//li[contains(@class,'style__SelectGradeBtn')]/following-sibling::li[contains(text(),'" + subjectName + "')]"));
        Assert.assertEquals(text(driver, By.xpath("//li[contains(@class,'style__SelectGradeBtn')]/span"), 10), subjectName + " Cards");

    }

    public void handleParentCoachMark() throws InvalidLocatorException, ElementNotFoundException, InterruptedException {
        while (exists(driver, pageFactory.getLocatorFor(parentDashboard, "spotlight"), 10)) {
            clickByAction(driver, pageFactory.getLocatorFor(parentDashboard, "spotlight"), 10);
            sleep(4);
        }
        waitForUrlToContain(driver, "parent-dashboard#/parents", 20);
        click(driver, pageFactory.getLocatorFor(parentDashboard, "back"));
    }

    public void handle_fork_screen() throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(fork_screen, "No_select_on_forkScreen"), 10)) {
            click(driver, pageFactory.getLocatorFor(fork_screen, "No_select_on_forkScreen"));
            waitForUrlToContain(driver, "/select-topic", 20);
            click(driver, pageFactory.getLocatorFor(topic_selection, "choose_for_me"));

        }
        else if (exists(driver, pageFactory.getLocatorFor(fork_screen, "No_select_on_forkScreen"), 10)) {
            click(driver, pageFactory.getLocatorFor(fork_screen, "No_select_on_forkScreen"));
            waitForUrlToContain(driver, "/weekly-goal", 20);
        }
        else if (exists(driver, pageFactory.getLocatorFor(topic_selection, "choose_for_me"), 10))
            click(driver, pageFactory.getLocatorFor(topic_selection, "choose_for_me"));

    }

    public void verify_cards() throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(gamification_element, "no_of_cards"), 10)) {
            String Cards_number = text(driver, pageFactory.getLocatorFor(gamification_element, "no_of_cards"), 10);
//            System.out.println(Cards_number);
//            System.out.println(Cards_number.charAt(0));
            if (Cards_number.charAt(0) > 1) {
                Assert.assertTrue(true);

            } else
                Assert.assertTrue(false);
        }
    }

    public void handleThankYouPage() throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20)) {
            click(driver, pageFactory.getLocatorFor(purchasePage, "Dashboard_navigation"), 20);
        } else waitForElement(driver, pageFactory.getLocatorFor(purchasePage, "continue1"), 20);
        click(driver, pageFactory.getLocatorFor(purchasePage, "continue1"), 20);

    }

    public void verify_cards_screen() throws InvalidLocatorException, ElementNotFoundException {
        if (exists(driver, pageFactory.getLocatorFor(gamification_element, "cards_button"), 10)) {
            click(driver, pageFactory.getLocatorFor(gamification_element, "cards_button"));
        } else {
            click(driver, pageFactory.getLocatorFor(gamification_element, "child_profile_button"));
            click(driver, pageFactory.getLocatorFor(gamification_element, "cards_button"));
        }

    }

}