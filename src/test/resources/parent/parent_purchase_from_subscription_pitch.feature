@b2c  @regression @b2c_final

Feature: Purchase math plan from subscription pitch

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C00LOID @regression
  Scenario: Verify user is able to purchase the math plan from subscription pitch
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
      | page            | field     | action | value | timeout |
      | grade_selection | grade_two | fireClickEvent  |       |  40       |
    And the user performs below to select subject :`
      | page              | field        | action | value | timeout |
      | subject_selection | math_subject | fireClickEvent  |       | 100      |
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
      | page                  | field              | action | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | click  |       |         |
    And the user performs below to navigate on all topic page
      | page                  | field              | action | value | timeout |
      | parent_dashboard_page | all_topic | click  |       |         |
      |                  |                           |refreshPage | |         |
      | all_topic_page        | highlighted_content_group  | waitForElement| | |
      | all_topic_page | highlighted_content_group | click  |       |         |

    And extract the studentid from mysql
    And send request for completing playable using:
      """json
      {
        "url": "https://staging-api.splashmath.com",
        "path": "/sla/content/complete_playable",
        "method": "POST",
         "session_id": false,
        "query_params" : {
                  "studentId" :   "${data.student_id}",
                  "subject"   : "math",
                  "playableId" : 88,
                  "learningObjectiveId" : 156,
                  "timeSpent" : 100
  }
      }
    """
    And send request for completing playable using:
      """json
      {
        "url": "https://staging-api.splashmath.com",
        "path": "/sla/content/complete_playable",
        "method": "POST",
         "session_id": false,
        "query_params" : {
                  "studentId" :   "${data.student_id}",
                  "subject"   : "math",
                  "playableId" : 1752,
                  "learningObjectiveId" : 156,
                  "timeSpent" : 100
  }
      }
    """
    And the user performs below to get subscription pitch:
      | page          | field            | action | value |
      |all_topic_page |                  |refreshPage |         |
      |all_topic_page  | third_card_content_page |waitForElement| |
      |all_topic_page  | third_card_content_page |click| |
      |  cards_on_learning_path    |    parent_subscription_pitch    |waitForElementVisible||
      |cards_on_learning_path |    parent_subscription_pitch    |click||
      |                       |                           | refreshPage |  |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                     |
      | ParentLibrary | purchase1 | math, Quarterly, one_child |
    And call custom method for handling thankyou page by using:
      | klass         | method             |
      | ParentLibrary | handleThankYouPage |
    And the user performs below to validate product has been purchased
      | page                  | field    | action | value | timeout |
      | parent_dashboard_page | menu     | click  |       | 20      |
      | parent_dashboard_page | settings | click  |       | 20      |
      |                       |          | sleep  | 3     |         |
    And call custom method for retrieving otp using:
      | page                  | method    | timeout |
      | parent_dashboard_page | verifyAge |20       |
    And the user performs below to verify subscription details:
      | page          | field            | action              | value                          |
      | menu_page     | account_details  | click               |                                |
      |               |                  | waitForUrlToContain | subscription-details#/settings |
      | settings_page | student_accounts | verifyText          | 1 (0 unused)                   |