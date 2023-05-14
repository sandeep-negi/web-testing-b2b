@b2c  @regression @b2c_final @b2c_prod @math_facts @parent
Feature: Math facts


  Background:
    Given the user opens "signin" page

  @B2C0023 @regression
  Scenario: verify old math facts for grade K student
    When the user performs below to sign in using:
      | page              | field                 | action                         | value            | timeout |
      |                   |                       | sleep                          | 10               |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | registration_page | parent_email          | type                           | ${data.username} | 20      |
      | registration_page | Password              | type                           | ${data.password} |         |
      | signin            | login                 | click                          |                  | 20      |
    And the user performs below to verify the mathfacts:
      | page                  | field                   | action              | value               | timeout |
      |                       |                         | waitForUrlToContain | /parent-dashboard#/ | 40      |
      | parent_dashboard_page | ela_toggle_gamification | waitForElement      |                     | 10      |
      | parent_dashboard_page | old_math_facts          | waitForElement      |                     | 10      |
      | parent_dashboard_page | old_math_facts          | click               |                     | 20      |
      | parent_dashboard_page | math_facts_start_button | click               |                     | 20      |

  @B2C007 @regression
  Scenario: verify old math facts for grade 2 student
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field                 | action                         | value            | timeout |
      |                   |                       | sleep                          | 10               |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | registration_page | parent_email          | type                           | ${data.username} | 20      |
      | registration_page | Password              | type                           | ${data.password} |         |
      | signin            | login                 | click                          |                  | 20      |
    And the user performs below to verify the mathfacts:
      | page                  | field                   | action              | value               | timeout |
      |                       |                         | waitForUrlToContain | /parent-dashboard#/ | 40      |
      | parent_dashboard_page | ela_toggle_gamification | waitForElement      |                     | 10      |
      | parent_dashboard_page | new_math_facts          | waitForElement      |                     | 10      |
      | parent_dashboard_page | new_math_facts          | click               |                     | 20      |
