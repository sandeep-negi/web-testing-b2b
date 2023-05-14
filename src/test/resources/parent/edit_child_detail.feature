@b2c  @b2c_final @b2c_prod @b2c_final1 @edit_child_detail @parent  @smoke
Feature: Edit child's details

  @B2C007
  Scenario: Verify user is able to edit child's details
    Given the user opens "signin" page
    When the user performs  signin flow below using:
      | page              | field                 | action                         | value            | timeout |
      |                   |                       | sleep                          | 10               |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | login_page        | user_email            | type                           | ${data.username} |         |
      | login_page        | user_password         | type                           | ${data.password} |         |
      | login_page        | login_button          | click                          |                  | 20      |
      |                   |                       | sleep                          | 15               |         |
      | login_page        | weekly_schedule_popup | clickIfPresent                 |                  | 10      |
    And the user performs below to navigate on menu page:
      | page                  | field    | action | value | timeout |
      | parent_dashboard_page | menu     | click  |       | 20      |
      | parent_dashboard_page | settings | click  |       | 20      |
      |                       |          | sleep  | 10    |         |
    And call custom method for entering age gate using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |

  @B2B0061 @ashutosh @QA_Saurabh @edit_child @b2b @preprod @staging @prod
  Scenario: Verify parent is able to change child's name
    Given the user opens "signin" page
    When call custom method for signin using:
      | klass         | method | params                             |
      | ParentLibrary | login  | ${data.username}, ${data.password} |

    * the user performs below to open menu page:
      | page                  | field               | action                | value             | timeout |
      |                       |                     | waitForSpinner        |                   |         |
      | parent_dashboard_page | parents_menu        | waitForElementVisible |                   |         |
      | parent_dashboard_page | parents_menu        | click                 |                   |         |
      | parent_dashboard_page | settings            | waitForElementVisible |                   |         |
      | parent_dashboard_page | settings            | click                 |                   |         |
      | parent_dashboard_page | parent_dob_password | waitForElementVisible |                   |         |
      | parent_dashboard_page | parent_dob_password | type                  | ${data.parentDOB} |         |
      |                       |                     | waitForSpinner        |                   |         |

    * the user performs below to open 'edit student details' page:
      | page      | field               | action                | value | timeout |
      | menu_page | edit_player_details | waitForElementVisible |       | 20      |
      | menu_page | edit_player_details | click                 |       |         |
      |           |                     | waitForSpinner        |       |         |

    * the user performs below to edit child's name and save changes:
      | page                     | field        | action                | value        | timeout |
      | edit_child_details_pages | child_name   | waitForElementVisible |              | 20      |
      | edit_child_details_pages | child_name   | clear                 |              |         |
      | edit_child_details_pages | child_name   | type                  | ${firstName} |         |
      | edit_child_details_pages | save_button  | click                 |              |         |
      |                          |              | sleep                 | 2            |         |
      |                          |              | waitForSpinner        |              |         |
      | parent_dashboard_page    | parents_menu | waitForElementVisible |              |         |

  @B2C007
  Scenario: Verify user is able to edit weekly goal
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field                 | action                         | value            | timeout |
      |                   |                       | sleep                          | 10               |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | login_page        | user_email            | type                           | ${data.username} |         |
      | login_page        | user_password         | type                           | ${data.password} |         |
      | login_page        | login_button          | click                          |                  | 20      |
      |                   |                       | sleep                          | 15               |         |
    And the user performs below to be on dashbaord:
      | page                  | field                   | action              | value               | timeout |
      |                       |                         | waitForUrlToContain | /parent-dashboard#/ | 50      |
      | parent_dashboard_page | ela_toggle_gamification | waitForElement      |                     | 10      |
    And the user performs below to go on menu page:
      | page                  | field    | action | timeout |
      | parent_dashboard_page | menu     | click  |         |
      | parent_dashboard_page | settings | click  |         |
    And call custom method for retrieving otp using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to update weekly goal
      | page                  | field                | action         | value | timeout |
      | menu_page             | edit_weekly_schedule | click          |       |         |
      | edit_weekly_goal_page | minute_a_week        | click          |       |         |
      |                       |                      | sleep          | 3     |         |
      | edit_weekly_goal_page | everyday             | click          |       |         |
      | edit_weekly_goal_page | wednesday            | click          |       |         |
      | edit_weekly_goal_page | monday               | click          |       |         |
      | edit_weekly_goal_page | am                   | fireClickEvent |       |         |
      | edit_weekly_goal_page | pm                   | fireClickEvent |       |         |
      | edit_weekly_goal_page | time                 | fireClickEvent |       |         |
      |                       |                      | sleep          | 3     |         |
      | edit_weekly_goal_page | email_notification   | click          |       |         |
      | edit_weekly_goal_page | save_changes         | click          |       |         |

