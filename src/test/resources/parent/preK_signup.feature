@b2c @preK_signup @parent
Feature: Normal signup for PreK user

  Background:
    Given the user opens "/parents/register#!/parent/creation" page

  @TC010
  Scenario: Sign up as parent for PreK grade
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
      | verify_email_page | otp   | type   | ${data.otp} | 10      |
    And the user performs below to select grade 3 and topic:
      | page              | field        | action | value | timeout |
      | grade_selection   | grade_preK   | click  |       |         |
      | subject_selection | math_subject | click  |       |         |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below interact parent connect screen:
      | page | field | action              | value                  | timeout |
      |      |       | waitForUrlToContain | parent-dashboard#/math | 20      |
      |      |       | sleep               | 5                      |         |
    And the user performs below:
      | page                  | field        | action              | value                     | timeout |
      | parent_dashboard_page | spotlight    | clickByAction       |                           | 10      |
      |                       |              | waitForUrlToContain | parent-dashboard#/parents | 10      |
      | parent_dashboard_page | okay         | click               |                           |         |
      |                       |              | sleep               | 5                         |         |
      | parent_dashboard_page | okay         | click               |                           |         |
      | parent_dashboard_page | back         | click               |                           |         |
      | parent_dashboard_page | cancel_popup | click               |                           |         |
    And the user performs below to change subject:
      | page         | field          | action              | value                        | timeout |
      | landing_page | ela_toggle     | click               |                              | 10      |
      |              |                | waitForUrlToContain | /parent-dashboard#/reading   | 10      |
      | landing_page | math_toggle    | click               |                              | 10      |
      |              |                | waitForUrlToContain | parent-dashboard#/math       | 10      |
    And the user performs below to verify old math facts for prek user:
      | page         | field          | action              | value                        | timeout |
      |              |                | sleep               | 5                            |         |
      | landing_page | old_math_facts | click               |                              | 10      |
      |              |                | waitForUrlToContain | /parent-dashboard#/mathfacts | 10      |
      | math_facts   | back_button    | click               |                              |         |
    And the user performs below navigate to settings page:
      | page                  | field               | action              | value                       | timeout |
      | parent_dashboard_page | menu                | click               |                             |         |
      | menu_page             | edit_player_details | click               |                             | 10      |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify math facts on settings page
      | page       | field              | action           | value | timeout |
      |            |                    | sleep            | 5     |         |
      | math_facts | math_facts_setting | waitForNoElement |       |         |
    And save user data in mongodb







