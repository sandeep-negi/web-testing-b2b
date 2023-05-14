@b2c @Gamification_user_signup @parent @gamification_parent
Feature: Gamification_user_signup

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C006 @regression
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
    And the user performs below to select grade 2 :
      | page            | field         | action | value | timeout |
      | grade_selection | grade_two   | click  |       |         |
    And the user performs below to select subject :`
      | page            | field         | action | value | timeout |
      | subject_selection | math_subject   | click  |       |         |
    And the user performs below to select topic:
      | page            | field         | action | value | timeout |
      | topic-selection | choose_for_me | click  |       | 5       |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below:
      | page                  | field            | action |value|
      |      |       | waitForUrlToContain | /parent-dashboard#/math |
      | parent_dashboard_page | gamification_bar | waitForElement |  |
    And save user data in mongodb


