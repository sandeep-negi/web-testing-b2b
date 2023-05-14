

Feature: Delete account for unpaid user

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  Scenario Outline: sign up multiple times
    When the user performs below to sign up using  <count>:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params               | var | timeout |
      | EmailLibrary | getOtp | ${data.parent_email} | otp | 10      |
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.otp} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select grade 2 :
      | page            | field     | action | value | timeout |
      | grade_selection | grade_two | click  |       | 20      |
    And the user performs below to select subject :`
      | page              | field        | action | value | timeout |
      | subject_selection | math_subject | click  |       | 40      |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    Examples:
      | count |
      | 1     |
      | 2     |
      | 3     |
      | 4     |
      | 5     |
      | 6     |
      | 7     |
      | 8     |
      | 9     |
