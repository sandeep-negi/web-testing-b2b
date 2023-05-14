@b2c   @b2c_final @b2c_prod @b2c_final_login @smoke
Feature: Membership details for unpaid user

  Background:
    Given the user opens "signin" page

  @B2C007 
  Scenario: Verify membership details for unpaid user on account setting page
    When the user performs below to sign in using:
      | page              | field        | action | value            | timeout |
      |                   |                       | sleep                          | 10               |         |
      | login_page        | parents_teacher_login | retryClicksUntilElementPresent |                  | 20      |
      | registration_page | parent_email          | waitForElement                 |                  | 30      |
      | registration_page | parent_email | type   | ${data.username} | 10      |
      | registration_page | Password     | type   | ${data.password} |         |
      | signin            | login        | click  |                  | 20      |
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
    And the user performs below to verify the membership details for unpaid user :
      | page          | field                          | action              | value    | timeout |
      | menu_page     | account_details                | click               |          | 20      |
      | settings_page | unpaid_user_membership_details | waitForElement      |          | 20      |
      | settings_page | view_plan_button               | waitForElement      |          | 10      |
      | settings_page | view_plan_button               | click               |          | 10      |
      |               |                                | waitForUrlToContain | purchase | 40      |
    And the user performs below to navigate  on product page from dashboard :
      | page                  | field                      | action         | value | timeout |
      | purchase_page         | cross_button               | click          |       | 20      |
      | parent_dashboard_page | gamification_unlock_button | waitForElement |       | 20      |
      | parent_dashboard_page | gamification_unlock_button | click          |       |         |
      |                       |                            | refreshPage    |       |         |
