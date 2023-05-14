@b2c @mentor_flow @parent @regression @b2c_final
Feature: Mentor flow signup with grade3

  Background:
    Given the user opens "?mentor_flow=true&skip_signup=control" page

  @B2C0023 @regression
  Scenario: Sign up as parent for mentor flow and book mentor session while onboarding
    When the user performs below to sign up using:
      | page              | field               | action | value          | timeout |
      | signin            | parent_try_for_free | click  |                | 30      |
      | registration_page | parent_email        | type   | ${parentEmail} | 30      |
      | registration_page | Password            | type   | ${password}    | 30      |
      | registration_page | create_account      | click  |                | 30      |
      | verify_email_page | otp            | waitForElementVisible |                | 40      |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    When the user performs below to enter child name using:
      | page     | field           | action         | value        | timeout |
      | poq_page | child_nick_name | waitForElement |              | 30      |
      | poq_page | child_nick_name | type           | ${firstName} | 30      |
      | poq_page | next            | click          |              | 30      |
    When the user performs below to select grade using:
      | page     | field       | action              | value                                   | timeout |
      | poq_page | third_grade | fireClickEvent      |                                         | 20      |
      |          |             | waitForUrlToContain | /parent-dashboard#/onboarding-questions | 30      |
    When the user performs below to answer onboarding mentor questions:
      | page                  | field              | action | value | timeout |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | behind_grade_level | click  |       |         |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | question_two       | click  |       |         |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | question_three     | click  |       |         |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | question_four      | click  |       |         |
      |                       |                    | sleep  | 5     |         |
    When the user performs below to interact mentor screen:
      | page                  | field    | action              | value                         | timeout |
      |                       |          | waitForUrlToContain | /parent-dashboard#/lp-mapping |         |
      |                       |          | sleep               | 5                             |         |
      | mentor_questions_page | continue | waitForElement      |                               | 20      |
      | mentor_questions_page | continue | fireClickEvent      |                               | 20      |

    When the user performs below to interact session booking screen:
      | page                  | field           | action         | value      | timeout |
      |                       |                 | sleep          | 15         |         |
      | mentor_questions_page | select_day      | waitForElement |            | 20      |
      | mentor_questions_page | select_day      | click          |            | 20      |
      | mentor_questions_page | select_time     | click          |            | 20      |
      | mentor_questions_page | phone_number    | type           | 1234567890 | 20      |
      | mentor_questions_page | confirm_session | click          |            | 20      |
      |                       |                 | sleep          | 10         |         |

    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       | 30      |
      | parent_dashboard_page | i'll_take_it_later | click          |       | 30      |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 50      |


  @B2C0024 @regression
  Scenario: Sign up as parent for mentor flow and user does not book mentor session while onboarding
    When the user performs below to sign up using:
      | page              | field               | action | value          | timeout |
      | signin            | parent_try_for_free | click  |                | 30      |
      | registration_page | parent_email        | type   | ${parentEmail} | 30      |
      | registration_page | Password            | type   | ${password}    | 30      |
      | registration_page | create_account      | click  |                | 30      |
      | verify_email_page | otp            | waitForElementVisible |                | 40      |
    And extract the OTP from mysql
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.OTP} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    When the user performs below to enter child name using:
      | page     | field           | action         | value        | timeout |
      | poq_page | child_nick_name | waitForElement |              | 30      |
      | poq_page | child_nick_name | type           | ${firstName} | 30      |
      | poq_page | next            | click          |              | 30      |
    When the user performs below to select grade using:
      | page     | field       | action              | value                                   | timeout |
      | poq_page | third_grade | fireClickEvent      |                                         | 20      |
      |          |             | waitForUrlToContain | /parent-dashboard#/onboarding-questions | 30      |
    When the user performs below to answer onboarding mentor questions:
      | page                  | field              | action | value | timeout |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | behind_grade_level | click  |       |         |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | question_two       | click  |       |         |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | question_three     | click  |       |         |
      |                       |                    | sleep  | 3     |         |
      | mentor_questions_page | question_four      | click  |       |         |
      |                       |                    | sleep  | 5     |         |
    When the user performs below to interact mentor screen:
      | page                  | field    | action              | value                         | timeout |
      |                       |          | waitForUrlToContain | /parent-dashboard#/lp-mapping |         |
      |                       |          | sleep               | 5                             |         |
      | mentor_questions_page | continue | waitForElement      |                               | 20      |
      | mentor_questions_page | continue | fireClickEvent      |                               | 20      |

    When the user performs below to interact session booking screen:
      | page                  | field          | action         | value | timeout |
      |                       |                | sleep          | 15    |         |
      | mentor_questions_page | not_interested | waitForElement |       | 20      |
      | mentor_questions_page | not_interested | click          |       | 20      |
      |                       |                | sleep          | 10    |         |

    And the user performs below to take a tour:
      | page                  | field              | action         | value | timeout |
      | parent_dashboard_page | i'll_take_it_later | waitForElement |       | 30      |
      | parent_dashboard_page | i'll_take_it_later | click          |       | 30      |
    And the user performs below:
      | page | field | action              | value                   | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/math | 50      |
    And the user performs :
      | page                 | field         | action      | value | timeout |
      | gamification_element | unlock_button | click       |       | 10      |
      |                      |               | refreshPage |       | 10      |
    And call custom method for purchasing math plus reading family using:
      | klass         | method    | params                             |
      | ParentLibrary | purchase1 | math_plus_reading, yearly, up_to_3 |
    And call custom method for handling thankyou page by using:
      | klass         | method             |
      | ParentLibrary | handleThankYouPage |
