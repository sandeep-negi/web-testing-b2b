@b2c  @regression @b2c_final @b2c_nishtha @Gamification_user_signup_free_quota_over @parent @gamification_parent
Feature: Free cards for unpaid user

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C00LOID @regression
  Scenario: Verify unpaid user can play only 2 free cards
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
      | verify_email_page | otp            | waitForElementVisible |                | 40      |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select grade 2 :
      | page            | field     | action         | value | timeout |
      | grade_selection | grade_two | fireClickEvent |       | 40      |
    And the user performs below to select subject :
      | page              | field        | action         | value | timeout |
      | subject_selection | math_subject | fireClickEvent |       | 100     |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 50      |
    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       |         |
      | parent_dashboard_page | i'll_take_it_later | click          |       |         |
    And the user performs to go on learning path:
      | page                   | field         | action         | timeout |
      | cards_on_learning_path | learning_path | waitForElement | 10      |
      | cards_on_learning_path | learning_path | click          | 10      |
      | cards_on_learning_path |               | refreshPage    |         |
      | cards_on_learning_path | first_card    | waitForElement |         |
      | cards_on_learning_path | first_card    | click          |         |
    And extract the studentid from mysql
    And send request for completing playable using:
      """json
      {
        "path": "/sla/content/complete_playable",
        "method": "POST",
         "session_id": false,
         "micro_service": true,
        "query_params" : {
                  "studentId" :   "${data.student_id}",
                  "subject"   : "math",
                  "playableId" : "${data.Playable_id_01}",
                  "learningObjectiveId" : "${data.LearningObjective_id_01}",
                  "timeSpent" : 100

  }
      }
    """
    And the user performs to go on learning path:
      | page                   | field       | action         | timeout |
      | cards_on_learning_path |             | refreshPage    |         |
      | cards_on_learning_path | second_card | waitForElement |         |
      | cards_on_learning_path | second_card | click          |         |
    And send request for completing playable using:
      """json
      {
        "path": "/sla/content/complete_playable",
        "method": "POST",
         "session_id": false,
         "micro_service": true,
        "query_params" : {
                  "studentId" :   "${data.student_id}",
                  "subject"   : "math",
                  "playableId" : "${data.Playable_id_02}",
                  "learningObjectiveId" : "${data.LearningObjective_id_01}",
                  "timeSpent" : 100

  }
      }
    """
    And the user performs to go on learning path:
      | page                   | field                     | action                | timeout |
      | cards_on_learning_path |                           | refreshPage           |         |
      | cards_on_learning_path | third_card                | waitForElement        |         |
      | cards_on_learning_path | third_card                | click                 |         |
      | cards_on_learning_path | parent_subscription_pitch | waitForElementVisible |         |
      | cards_on_learning_path | parent_subscription_pitch | click                 |         |



