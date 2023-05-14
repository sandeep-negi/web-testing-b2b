@b2c @ela_higherGrades @parent
Feature: ELA 3-5 signup and purchase

  Background:
    Given the user opens "parents/register?ela=1&ab_test[Parent-TiledDashboard]=tileddashboard_on#!/parent/creation" page

  @B2C0015 @regression
  Scenario: Sign up as parent for ELA 3-5
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | parents_DOB    | type   | 1999           |         |
      | registration_page | create_account | click  |                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params               | var |
      | EmailLibrary | getOtp | ${data.parent_email} | otp |
    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} |         |
    And the user performs below to select grade 3 and subject ELA:
      | page              | field           | action | value | timeout |
      | grade_selection   | grade_four      | click  |       |         |
      | subject_selection | reading_subject | click  |       |         |
    And the user performs below to interact forking screen:
      | page        | field                   | action | value | timeout |
      | fork_screen | No_select_on_forkScreen | click  |       |         |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below to take a tour:
      | page                  | field       | action | value | timeout |
      | parent_dashboard_page | take_a_tour | click  |       |         |
    And call custom method for parent spotlight using:
      | klass         | method                |
      | ParentLibrary | handleParentCoachMark |
    And the user performs below to click on unlock content:
      | page                  | field                  | action | value | timeout |
      | parent_dashboard_page | unlock_all_content_one | click  |       | 20      |
    And call custom method for purchasing only ELA plan for 1 child using:
      | klass         | method   | params                     |
      | ParentLibrary | purchase | reading, yearly, one_child |
    And the user performs below interact parent connect screen:
      | page         | field          | action              | value                  | timeout |
      |parent_connect|i'll_do_it_later|waitForElement       |                        | 20      |
      |parent_connect|i'll_do_it_later|click                |                        | 20      |
    And the user performs below to verify if unlock button is not coming for ELA:
      | page                  | field                  | action           | value | timeout |
      | parent_dashboard_page | unlock_all_content_one | waitForNoElement |       | 20      |
    And the user performs below to upgrade plan:
      | page                  | field                  | action | value | timeout |
      | parent_dashboard_page | math_toggle            | click  |       | 20      |
      | parent_dashboard_page | unlock_all_content_one | click  |       | 20      |
      | purchase_page         | switch_plan            | click  |       | 20      |
      | purchase_page         | pay_now_one           | click  |       | 20      |
    And the user performs below interact parent connect screen:
      | page         | field          | action              | value                  | timeout |
      |parent_connect|i'll_do_it_later|waitForElement       |                        | 20      |
      |parent_connect|i'll_do_it_later|click                |                        | 20      |
    And the user performs below to verify if unlock button is not coming for math:
      | page                  | field                  | action           | value | timeout |
      | parent_dashboard_page | unlock_all_content_one | waitForNoElement |       | 20      |
    And save user data in mongodb
