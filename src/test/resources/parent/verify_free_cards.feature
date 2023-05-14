@b2c @zero_access @parent
Feature: User login

  Background:
    Given the user opens "signin" page

   @regression
  Scenario: when user signin
    When the user performs below to sign in using:
      | page              | field        | action | value            | timeout |
      | signin            | parent       | click  |                  | 10      |
      | signin            | parent       | click  |                  | 10      |
      | registration_page | parent_email | type   | webtesting+na_22dec.pp2@splashlearn.com | 10      |
      | registration_page | Password     | type   | 123456|         |
      | signin            | login        | click  |                  |  20     |
    And the user performs below to be on dashbaord:
      | page              | field        | action | value            | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math |  20    |
#    And the user performs to go on learning path:
#      | page                  | field            | action | timeout |
#      |cards_on_learning_path |learning_path     |click    |10       |
#      |cards_on_learning_path |                  |refresh |         |
#      |cards_on_learning_path |first_card     |waitForElement    |     |
#      |cards_on_learning_path |first_card     |click    |     |
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