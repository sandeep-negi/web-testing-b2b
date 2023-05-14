@b2c @Verify_dropdown_for_gamification_user  @parent @gamification_parent
Feature: Verify_dropdown_on_cards_page_for_gamification_user

  Background:
    Given the user opens "signin" page

  @B2C006 @regression
  Scenario: when user signin
    When the user performs below to sign in using:
      | page              | field        | action | value            | timeout |
      | signin            | parent       | click  |                  | 10      |
      | signin            | parent       | click  |                  | 10      |
      | registration_page | parent_email | type   | ${data.username} | 10      |
      | registration_page | Password     | type   | ${data.password} |         |
      | signin            | login        | click  |                  |  20     |
    And the user performs below to go on card screen :
      | page              | field        | action | value            | timeout |
      |gamification_element|cards_button |click   |                  |     20  |
    And call custom method for selection of subject card using:
      | klass         | method   | params             |value| timeout |
      | ParentLibrary | selectSubjectName | Reading |       |20       |
    And call custom method for selection of subject card using:
      | klass         | method   | params             |value| timeout |
      | ParentLibrary | selectSubjectName | Math |       |20       |






