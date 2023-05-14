@sem_flow @parent @b2c @regression @b2c_final
Feature: Verify signup through landing page 1

  Background:
    Given the user opens "landing_page/1" page

  @B2C0013 @regression
  Scenario: Sign up as parent via landing page 1
    When the user performs below start free trial and select grade:
      | page             | field                 | action | value | timeout   |
      | sem_landing_page | start_your_free_trial | click  |       |   20      |
      | sem_landing_page | grade_1               | click  |       |   20      |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                               |
      | ParentLibrary | purchase1 | math_plus_reading, yearly, one_child |
    And the user performs below to enter password:
      | page             | field    | action              | value                          | timeout |
      |                  |          | sleep               | 30                             |         |
      |                  |          | waitForUrlToContain | parent-dashboard#/set-password |  30     |
      | sem_landing_page | password | type                | ${password}                    | 20        |
      | sem_landing_page | continue | click               |                                |  20       |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select subject and topic:
      | page              | field         | action | value | timeout |
      | subject_selection | math_subject  | click  |       |  20       |
      | topic-selection   | choose_for_me | click  |       | 5       |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below to take a tour:
      | page                  | field              | action | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | click  |       |   20      |
    And the user performs below interact parent connect screen:
      | page | field | action              | value                  | timeout |
      |      |       | waitForUrlToContain | parent-dashboard#/math | 20      |
      |      |       | sleep               | 5                      |         |
    And the user performs below to validate trial on account settings page
      | page                  | field    | action | value | timeout |
      | parent_dashboard_page | menu     | click  |       | 20      |
      | parent_dashboard_page | settings | click  |       | 20      |
      |                       |          | sleep  | 3     |         |
    And call custom method for retrieving otp using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to verify trialing details:
      | page          | field           | action              | value                          | timeout |
      | menu_page     | account_details | click               |                                |20       |
      |               |                 | waitForUrlToContain | subscription-details#/settings |20       |
      | settings_page | trial_period    | verifyText          | Your 7 days free trial ends    |20       |
