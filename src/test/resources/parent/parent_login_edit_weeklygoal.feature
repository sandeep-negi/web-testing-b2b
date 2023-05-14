@b2c @login_flow_parent  @parent
Feature: Parent login flow and Edit weekly schedule

  Background:
    Given the user opens "signin" page


  @B2C007
  Scenario: Verify weekly goal update:
    When the user performs  signin flow below using:
      | page              | field        | action | value            | timeout |
      | signin            | parent       | click  |                  | 10      |
      | registration_page | parent_email | type   | ${data.username} | 10      |
      | registration_page | Password     | type   | ${data.password} |         |
      | signin            | login        | click  |                  | 20      |
    And the user performs on menu icon to select Edit Weekly schedule:
      | page                  | field                | action | value | timeout |
      | parent_dashboard_page | menu                 | click  |       | 20      |
      |                       |                      | sleep  | 3     |         |
      | menu_page             | edit_weekly_schedule | click  |       |         |
    And call custom method for retrieving otp using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to Edit weekly schedule:
      | page                  | field              | action         | value | timeout |
      | edit_weekly_goal_page | minute_a_week      | click          |       |         |
      |                       |                    | sleep          | 3     |         |
      | edit_weekly_goal_page | everyday           | click          |       |         |
      | edit_weekly_goal_page | wednesday          | click          |       |         |
      | edit_weekly_goal_page | monday             | click          |       |         |
      | edit_weekly_goal_page | am                 | fireClickEvent |       |         |
      | edit_weekly_goal_page | pm                 | fireClickEvent |       |         |
      | edit_weekly_goal_page | time               | fireClickEvent |       |         |
      |                       |                    | sleep          | 3     |         |
      | edit_weekly_goal_page | email_notification | click          |       |         |
      | edit_weekly_goal_page | save_changes       | click          |       |         |
