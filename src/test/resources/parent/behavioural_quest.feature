@b2c  @smoke @b2c_final @b2c_prod @BQ_Signup  @gamification_parent
Feature: Behavioural Quest User  Signup

  Background:
    Given the user opens "/parents/register?ab_test[Parent-BQ]=bq_on" page

  Scenario: Verify Sign up for prek grade and BQ should not assign for Prek user
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
    And the user performs below to select grade PreK :
      | page            | field      | action | value | timeout |
      | grade_selection | grade_preK | fireClickEvent  |       | 20      |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/reading | 50      |
    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       |         |
      | parent_dashboard_page | i'll_take_it_later | click          |       |         |
    And the user performs below to verify BQ widget is not for  PreK user:
      | page                 | field     | action           | value | timeout |
      | gamification_element | bq_widget | waitForNoElement |       |         |

  Scenario: Verify BQ should assign for grade 5 user
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
    And the user performs below to select grade 5 :
      | page            | field      | action | value | timeout |
      | grade_selection | grade_five | click  |       | 20      |
    And the user performs below to select subject :
      | page              | field        | action         | value | timeout |
      | subject_selection | math_subject | fireClickEvent |       | 40      |
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
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       |         |
      | parent_dashboard_page | i'll_take_it_later | click          |       |         |
    And the user performs below to verify BQ widget is not for  PreK user:
      | page                 | field     | action         | value | timeout |
      | gamification_element | bq_widget | waitForElement |       |         |
