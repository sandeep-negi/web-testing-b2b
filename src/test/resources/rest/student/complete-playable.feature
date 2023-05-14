@api
Feature: Complete Playable

  Scenario: Get details from Database and send api request to complete playable
    Given store details from Database in Entity Context with teacher email "auto_teacher+apitesting@splashlearn.com"
    When send request for completing below playables:
      | studentFirstName | subject | learningObjectiveId | playableId |
      | Cook             | math    | 57                  | 1126       |
      | Cook             | math    |                     |            |