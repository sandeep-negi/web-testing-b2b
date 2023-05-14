@api
Feature: Teacher Login API

  Scenario: Login
    Given Login to Teacher account using:
      | email                                   | password |
      | auto_teacher+apitesting@splashlearn.com | 123456   |

