@b2c @regression @b2c_final @upgradePlan

Feature: Purchase math yearly plan and then upgrade to math+reading

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C0025 @regression

  Scenario: Verify if user is able to upgrade from math plan to math+reading
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} | 30      |
      | registration_page | Password       | type   | ${password}    | 30      |
      | registration_page | create_account | click  |                | 30      |
      | verify_email_page | otp            | waitForElementVisible |                | 40      |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select grade 2 :
      | page            | field     | action | value | timeout |
      | grade_selection | grade_two | click  |       | 30      |
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
      | klass         | method    | params                  |
      | ParentLibrary | purchase1 | math, yearly, one_child |
    And call custom method for handling thankyou page by using:
      | klass         | method             |
      | ParentLibrary | handleThankYouPage |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 50      |
    And the user performs below to verify if unlock button is not coming for Math:
      | page                  | field                      | action           | value | timeout |
      | parent_dashboard_page | gamification_unlock_button | waitForNoElement |       | 20      |
    And the user performs below to upgrade plan:
      | page                  | field                      | action | value | timeout |
      | parent_dashboard_page | ela_toggle_gamification    | click  |       | 20      |
      | parent_dashboard_page | gamification_unlock_button | click  |       | 20      |
      | purchase_page         | switch_plan                | click  |       | 20      |
      | purchase_page         | pay_now_one                | click  |       | 20      |
    And call custom method for handling thankyou page by using:
      | klass         | method             |
      | ParentLibrary | handleThankYouPage |