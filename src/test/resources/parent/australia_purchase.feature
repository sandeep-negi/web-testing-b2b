@b2c @australia @parent
Feature: Australian Signup flow

  Background:
    Given the user opens "https://staging-au.splashlearn.com/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page


  @B2C0026 @regression
  Scenario: Sign up as Australian Parent with lower grade and select subject reading while onboarding
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params               | var |
      | EmailLibrary | getOtp | ${data.parent_email} | otp |
    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} |         |
    And the user performs below to select grade 3 :
      | page            | field              | action         | value | timeout |
      | grade_selection | grade_Kindergarten | click          |       | 200     |
      |                 |                    | waitForSpinner |       | 100     |
    And the user performs below to select subject :`
      | page              | field        | action | value | timeout |
      | subject_selection | reading_subject | click  |       | 20      |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                      | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/reading | 50      |
    And the user performs below to take a tour:
      | page                  | field              | action |
      | parent_dashboard_page | i'll_take_it_later | click  |
  @B2C0026 @regression
  Scenario: Sign up as Australian Parent with higher grade and select subject math while onboarding
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params               | var |
      | EmailLibrary | getOtp | ${data.parent_email} | otp |
    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} |         |
    And the user performs below to select grade 3 :
      | page            | field              | action         | value | timeout |
      | grade_selection | grade_five | click          |       | 200     |
      |                 |                    | waitForSpinner |       | 100     |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                      | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 50      |
    And the user performs below to take a tour:
      | page                  | field              | action |
      | parent_dashboard_page | i'll_take_it_later | click  |