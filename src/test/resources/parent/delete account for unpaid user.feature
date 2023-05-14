@b2c  @regression @b2c_final @b2c_prod

Feature: Delete account for unpaid user

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  Scenario: Verify unpaid user is able to delete the account
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
    And the user performs below to select grade 3 :
      | page            | field       | action         | value | timeout |
      | grade_selection | grade_three | fireClickEvent |       | 20      |
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
      | page                  | field              | action | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | click  |       |         |
    And the user performs below to navigate on menu page:
      | page                  | field    | action | value | timeout |
      | parent_dashboard_page | menu     | click  |       | 20      |
      | parent_dashboard_page | settings | click  |       | 20      |
      |                       |          | sleep  | 3     |         |
    And call custom method for entering age gate using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to navigate on delete account page:
      | page      | field          | action         | value |
      | menu_page | delete_account | waitForElement | 10    |
      | menu_page | delete_account | click          |       |
      | menu_page | delete_button  | waitForElement | 10    |
      | menu_page | delete_button  | click          |       |
      |           |                | sleep          | 5     |
    And extract the OTP for account deletion
    And the user performs below to enter otp on Account Deletion Confirmation page:
      | page              | field                | action | value        | timeout |
      |                   |                      | sleep  | 5            |         |
      | verify_email_page | account_deletion_otp | type   | ${data.OTP1} |         |
    And the user performs to validate user has been deleted:
      | page              | field                 | action                         | value            | timeout |
      | landing_page      | login_button          | waitForElement                 |                  | 30      |
      | landing_page      | login_button          | click                          |                  |         |
      | landing_page      | login_button          | waitForElement                 |                  | 30      |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | registration_page | parent_email          | type                           | ${data.parent_email} | 30      |
      | registration_page | Password              | type                           | ${data.Password} |  10       |
      | signin            | login                 | click                          |                  | 20      |
      | registration_page | invalid_email_pwd       | waitForElement                 |                  | 30    |




