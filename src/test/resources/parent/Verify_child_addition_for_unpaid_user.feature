@b2c  @b2c_final @b2c_prod @2nd_child_Addition @smoke
Feature: Second child addition

  Background:
    Given the user opens "signin" page

  @B2C007
  Scenario: Verify unpaid user is not able to add another  child
    When the user performs below to sign in using:
      | page              | field                 | action                         | value            | timeout |
      |                   |                       | sleep                          | 10               |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | registration_page | parent_email          | type                           | ${data.username} | 10      |
      | registration_page | Password              | type                           | ${data.password} |         |
      | signin            | login                 | click                          |                  | 20      |
    And the user performs below to be on dashbaord:
      | page                  | field                   | action              | value               | timeout |
      |                       |                         | waitForUrlToContain | /parent-dashboard#/ | 40      |
      | parent_dashboard_page | ela_toggle_gamification | waitForElement      |                     | 10      |
    And the user performs below to go on menu page:
      | page                  | field    | action | timeout |
      | parent_dashboard_page | menu     | click  |         |
      | parent_dashboard_page | settings | click  |         |
    And call custom method for retrieving otp using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to verify add child button is not present for unpaid user:
      | page      | field      | action           | timeout |
      | menu_page | add_player | waitForNoElement | 10      |


