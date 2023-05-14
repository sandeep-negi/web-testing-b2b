@b2c @zero_access @parent
Feature: Zero Access Signup flow and trial start

  Background:
    Given the user opens "/parents/register?ela=1&ab_test[Parent-ZeroAccess]=video#!/parent/creation" page

  @B2C0019 @regression
  Scenario: Sign up as parent for Zero Access flow
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
    And the user performs below to select grade 3 :
      | page              | field         | action | value | timeout |
      | grade_selection   | grade_three   | click  |       |         |
      | subject_selection | math_subject  | click  |       |         |
    And the user performs below to select topic:
      | page            | field         | action | value | timeout |
      | topic-selection | choose_for_me | click  |       | 5       |
    And call custom method for set weekly goal using:
      | klass         | method          | params  |
      | ParentLibrary | weekly_goal_Set | 15,W    |
    And the user performs below to navigate on product page
      | page            | field       | action | value | timeout |
      | road_block_page | play_button | click  |       |         |
      | road_block_page | skip_button | click  |       | 10      |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                               |
      | ParentLibrary | purchase | math_plus_reading, yearly, one_child |
    And the user performs below interact parent connect screen:
      | page         | field          | action              | value                  | timeout |
      |parent_connect|i'll_do_it_later|waitForElement       |                        | 20      |
      |parent_connect|i'll_do_it_later|click                |                        | 20      |
      |              |                | waitForUrlToContain | parent-dashboard#/math | 20      |
      |              |                | sleep               | 5                      |         |
    And call custom method for parent spotlight using:
      | klass         | method                |
      | ParentLibrary | handleParentCoachMark |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      | parent_dashboard_page | cancel_popup          | click               |                           |         |
    And the user performs below navigate to settings page:
      | page                  | field           | action | value |
      | parent_dashboard_page | menu            | click  |       |
      | menu_page             | account_details | click  |       |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify subscription details:
      | page          | field               | action               | value                                   |
      |               |                     | waitForUrlToContain  | subscription-details#/settings          |
      | settings_page | current_plan        | verifyText           | Yearly                                  |
      | settings_page | student_accounts    | verifyText           | 1 (0 unused)                            |
      | settings_page | trial_period        | waitForTextToContain | Your (7\|8\|30) days free trial ends on |
      | settings_page | subscription_amount | verifyText           | Free Trial                              |
      | settings_page | subscription_status | verifyText           | Free Trial                              |
      | settings_page | charging_info       | waitForTextToContain | You would be automatically charged      |
    And the user performs below to cancel trial
      | page          | field                   | action | value |
      | settings_page | cancel_my_trial         | click  |       |
      | settings_page | i_faced_technical_issue | click  |       |
      | settings_page | continue                | click  |       |
      | settings_page | cancel_anyway           | click  |       |
      | settings_page | ok                      | click  |       |
    And save user data in mongodb
