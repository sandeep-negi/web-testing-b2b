@b2c  @regression @b2c_final @b2c_prod @b2c_final_login @b2c_final1 @parent @gamification_parent
Feature: User Login & Logout

  Background:
    Given the user opens "signin" page

  @B2C007  @smoke
  Scenario: Verify user is able to login and logout
    When the user performs below to sign in using:
      | page              | field                 | action                         | value            | timeout |
      |                   |                       |sleep                           |10                      |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                        | 20      |
      | registration_page | parent_email          | waitForElement                 |                        | 30      |
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
    And the user performs below for logout:
      | page         | field        | action         | timeout |
      | menu_page    | logout       | waitForElement |         |
      | menu_page    | logout       | click          | 20      |
      | landing_page | login_button | waitForElement |   20      |

  @B2C0021
  Scenario: Verify user is able to login and logout via facebook
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field                 | action                         | value                  | timeout |
      |                   |                       |sleep                           |10                      |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                        | 20      |
      | registration_page | parent_email          | waitForElement                 |                        | 30      |
      | signin            | facebook_login        | click                          |                        | 20      |
      |                   |                       | waitForUrlToContain            | facebook.com/login.php | 20      |
      | signin            | facebook_email        | type                           | ${data.username}       | 20      |
      | signin            | facebook_password     | type                           | ${data.password}       | 20      |
      | signin            | facbook_login_button  | click                          |                        | 20      |
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
    And the user performs below for logout:
      | page         | field        | action         | timeout |
      | menu_page    | logout       | waitForElement |         |
      | menu_page    | logout       | click          | 20      |
      | landing_page | login_button | waitForElement |   20      |

  @B2C0022
  Scenario: Verify user is able to login and logout via gmail
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field                 | action                  | value                    | timeout |
      |                   |                       |sleep                           |10                      |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                        | 20      |
      | registration_page | parent_email          | waitForElement                 |                        | 30      |
      | signin            | google_login          | click                   |                          | 20      |
      |                   |                       | waitForUrlToContain     | google.com | 60      |
      | registration_page | parent_email          | type                    | ${data.username}         | 10      |
      | signin            | google_next           | click                   |                          | 20      |
      | signin            | google_pwd            | waitForElementClickable |                          | 20      |
      | signin            | google_pwd            | type                    | ${data.password}         | 20      |
      | signin            | google_next           | click                   |                          | 20      |
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
    And the user performs below for logout:
      | page         | field        | action         | timeout |
      | menu_page    | logout       | waitForElement |         |
      | menu_page    | logout       | click          | 20      |
      | landing_page | login_button | waitForElement |   20      |
