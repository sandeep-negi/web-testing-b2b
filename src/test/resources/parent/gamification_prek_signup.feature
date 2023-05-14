@b2c @Gamification_user_signup @parent @gamification_parent
Feature: Gamification_user_signup_for_preK

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C005 @regression
  Scenario: Sign up as gamification user
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | parents_DOB    | type   | 1999           |         |
      | registration_page | create_account | click  |                |        |
    And call custom method for retrieving otp using:
      | klass        | method | params               | var | timeout |
      | EmailLibrary | getOtp | ${data.parent_email} | otp | 10      |
    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} |         |
    And the user performs below to select grade preK :
      | page            | field         | action | value | timeout |
      | grade_selection | grade_preK   | click  |       |         |
    And the user performs below to select subject :`
      | page            | field         | action | value | timeout |
      | subject_selection | math_subject   | click  |       |         |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below:
      | page                  | field            | action |value| timeout |
      |      |       | waitForUrlToContain | parent-dashboard#/math |  20    |
      | parent_dashboard_page | header | waitForElement  | | 30   |
    And save user data in mongodb