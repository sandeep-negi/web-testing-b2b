@b2c @Gamification__family_plan_purchase @parent @gamification_parent
Feature: Gamification_user_signup_for_reading_dashboard

  Background:
    Given the user opens "parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C0016 @regression
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
    And the user performs below to select subject :
      | page            | field         | action | value | timeout |
      | subject_selection | math_subject   | click  |       |         |
 And call custom method for handling fork screen using:
      | klass         | method          |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math  |   20                                        |
    And call custom method for handling coachmark using:
      | klass         | method          |
      | ParentLibrary | handleParentCoachMark |
    And the user performs :
      | page            | field         | action | value | timeout |
      | gamification_element | unlock_button | click  |       | 10       |
    |                      |               | refreshPage| |    10     |
    And call custom method for purchase family plan using:
      | klass         | method   | params                               |
      | ParentLibrary | purchase | math_plus_reading, yearly, up_to_three_child |
    And the user performs below interact parent connect screen:
      | page | field | action              | value                  | timeout |
      |      |       | waitForUrlToContain | parent-dashboard#/math | 20      |
      |      |       | sleep               | 5                      |         |
