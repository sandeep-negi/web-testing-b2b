@b2c @regression @b2c_final  @parent @gamification_parent
Feature: Learning Path

  Background:
    Given the user opens "/parents/register?ela=1&ab_test%5BParent-TiledDashboard%5D=gamification_v1" page

  @B2C008 @regression
  Scenario: Verify completion of learning_path
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
    And the user performs below to select grade 4 :
      | page            | field      | action         | value | timeout |
      | grade_selection | grade_four | fireClickEvent |       | 40      |
    And the user performs below to select subject :
      | page              | field        | action         | value | timeout |
      | subject_selection | math_subject | fireClickEvent |       | 100      |
    And call custom method for handling fork screen using:
      | klass         | method             |
      | ParentLibrary | handle_fork_screen |
    And call custom method for set weekly goal using:
      | klass         | method          | params |
      | ParentLibrary | weekly_goal_Set | 15,W   |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 20      |
    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       |         |
      | parent_dashboard_page | i'll_take_it_later | click          |       |         |
    And extract the studentid from mysql
    And send request for completing learning path using:
     """json
      {
        "url": "https://staging-api.splashmath.com",
        "path": "sla/content/complete_learning_path",
        "method": "POST",
         "session_id": false,
        "query_params" : {
                  "studentId" :   "${data.student_id}",
                  "subject"   : "math"

  }
      }
    """

    And call custom method for navigate on card page using:
      | klass         | method              |
      | ParentLibrary | verify_cards_screen |

    And call custom method for validate the card numbers using:
      | klass         | method       |
      | ParentLibrary | verify_cards |
