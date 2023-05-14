@b2c   @b2c_final @smoke @b2c_prod @PlayZone_Signup  @gamification_parent
Feature: Playzone User Signup

  Background:
    Given the user opens "/parents/register?ab_test[Parent::Playzone]=Playzone_On_New" page

  Scenario: Verify Playzone should not assign for grade 1 user
    When the user performs below to sign up using:
      | page              | field          | action                | value          | timeout |
      | registration_page | parent_email   | type                  | ${parentEmail} |         |
      | registration_page | Password       | type                  | ${password}    |         |
      | registration_page | create_account | click                 |                |         |
      | verify_email_page | otp            | waitForElementVisible |                | 40      |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select grade 1 :
      | page            | field     | action         | value | timeout |
      | grade_selection | grade_one | fireClickEvent |       | 20      |
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
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 20      |
    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       |         |
      | parent_dashboard_page | i'll_take_it_later | click          |       |         |
    And the user performs below to verify playzone is not available for grade 1:
      | page                 | field        | action           | value | timeout |
      | gamification_element | splash_arena | waitForNoElement |       |         |

  Scenario: Verify Playzone should assign for grade 4 user
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
    And the user performs below to select grade 4 :
      | page            | field      | action | value | timeout |
      | grade_selection | grade_four | click  |       | 20      |
    And the user performs below to select subject :
      | page              | field           | action         | value | timeout |
      | subject_selection | reading_subject | fireClickEvent |       | 40      |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                      | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/reading | 50      |
    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       |         |
      | parent_dashboard_page | i'll_take_it_later | click          |       | 10      |
    And the user performs below to verify playzone is available for grade 4:
      | page                 | field        | action         | value | timeout |
      | gamification_element | splash_arena | waitForElementVisible |       | 10      |
