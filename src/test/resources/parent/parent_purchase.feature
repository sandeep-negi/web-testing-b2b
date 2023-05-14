@b2c  @regression  @b2c_final  @parent @gamification_parent
Feature: Purchase family plan

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C009 @regression

  Scenario: Verify user is able to purchase the family plan by clicking on unlock button on dashboard and verify paid user is not able to delete the account
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
      | verify_email_page | otp            | waitForElementVisible |                | 40      |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select grade 2 :
      | page            | field     | action | value | timeout |
      | grade_selection | grade_two | click  |       |         |
    And the user performs below to select subject :`
      | page              | field        | action | value | timeout |
      | subject_selection | math_subject | click  |       | 20      |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 50      |
    And the user performs below to take a tour:
      | page                  | field              | action |
      | parent_dashboard_page | i'll_take_it_later | click  |
    And the user performs below to navigate on product page:
      | page                  | field                      | action         | timeout |
      | parent_dashboard_page | gamification_unlock_button | waitForElement | 10      |
      | parent_dashboard_page | gamification_unlock_button | click          |         |
      |                       |                            | refreshPage    |         |
    And call custom method for purchasing math plus reading family using:
      | klass         | method   |   params                             |
      | ParentLibrary | purchase1 | math_plus_reading, yearly, up_to_3 |
    And call custom method for handling thankyou page by using:
      | klass         | method             |
      | ParentLibrary | handleThankYouPage |
    And the user performs below to validate product has been purchased
      | page                  | field    | action | value | timeout |
      |                       |          | sleep  | 10    |         |
      | parent_dashboard_page | menu     | click  |       | 20      |
      | parent_dashboard_page | settings | click  |       | 20      |
      |                       |          | sleep  | 3     |         |
    And call custom method for retrieving otp using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to verify subscription details:
      | page          | field            | action              | value                          |timeout|
      | menu_page     | account_details  | click               |                                |       |
      |               |                  | waitForUrlToContain | subscription-details#/settings |30     |
      | settings_page | current_plan     | verifyText          | Yearly                         |       |
      | settings_page | student_accounts | verifyText          | 1 (2 unused)                   |       |
    And the user performs below to navigate on menu page:
      | page                  | field            | action | value | timeout |
      | purchase_page         | splashlearn_logo | click  |       |         |
      | parent_dashboard_page | menu             | click  |       | 20      |
      | parent_dashboard_page | settings         | click  |       | 20      |
      |                       |                  | sleep  | 3     |         |
    And call custom method for entering age gate using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to navigate on delete account page:
      | page      | field                  | action              | value                                     | timeout |
      | menu_page | delete_account         | waitForElement      |                                           | 10      |
      | menu_page | delete_account         | click               |                                           |         |
      | menu_page | delete_button          | waitForNoElement    |                                           | 10      |
      | menu_page | delete_account_request | waitForElement      |                                           | 10      |
      | menu_page | delete_account_request | click               |                                           |         |
      |           |                        | waitForUrlToContain | support.splashlearn.com/hc/en-us/requests | 20      |
