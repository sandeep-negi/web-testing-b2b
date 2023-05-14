@b2c @skip_sign_up
Feature: Sign up & Purchase as a parent using skip sign up flow

  Background:
    Given the user opens "?skip_signup=trial" page
    And the user performs below using:
      | page         | field                    | action | value        | timeout |
      | landing_page | parents_start_free_trial | click  |              |         |


  @TC004 @regression
  Scenario: Sign up as parent via skip sign up flow skipping personalization, purchase math & yearly plan
    When the user performs below to sign up using:
      | page     | field                 | action         | value        | timeout |
      | poq_page | first_grade           | fireClickEvent |              | 20      |
      | poq_page | other                 | fireClickEvent |              | 30      |
      | poq_page | child_nick_name       | type           | ${firstName} |         |
      | poq_page | next                  | click          |              |         |
      | poq_page | subject_screen_header | waitForElement |              | 20      |
      | poq_page | math                  | fireClickEvent |              |         |
    And the user performs below to interact fork screen :
      | page        | field | action              | value               | timeout |
      |             |       | sleep               | 5                   |         |
      |             |       | waitForUrlToContain | child-onboard#/fork |         |
      | fork_screen | no    | fireClickEvent      |                     |         |
    And the user performs below to skip personalisation :
      | page     | field                        | action         | value | timeout |
      | poq_page | skip_personalization         | fireClickEvent |       |         |
      | poq_page | looks_good_see_learning_path | click          |       |         |
      | poq_page | start_playing                | click          |       |         |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                  |
      | ParentLibrary | purchase | math, yearly, one_child |
    And the user performs below to verify email and enter password:
      | page             | field    | action              | value                          | timeout |
      |                  |          | sleep               | 15                             |         |
      |                  |          | waitForUrlToContain | parent-dashboard#/set-password |         |
      | sem_landing_page | password | type                | password                       |         |
      | sem_landing_page | continue | click               |                                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field                | action              | value                  | timeout |
      | verify_email_page | otp                  | type                | ${data.otp}            |         |
      |                   |                      | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |                      | sleep               | 5                      |         |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      | parent_dashboard_page | spotlight             | clickByAction       |                           |         |
      |                       |                       | waitForUrlToContain | parent-dashboard#/parents |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | back                  | click               |                           |         |
      | parent_dashboard_page | set_later_in_settings | click               |                           |         |
    And the user performs below navigate to settings page:
      | page                  | field           | action         | value |
      | parent_dashboard_page | menu            | fireClickEvent | 30    |
      | menu_page             | account_details | click          | 20    |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify subscription details:
      | page          | field            | action               | value                                  |
      |               |                  | waitForUrlToContain  | subscription-details#/settings         |
      | settings_page | current_plan     | verifyText           | Yearly                                 |
      | settings_page | student_accounts | verifyText           | 1 (0 unused)                           |
      | settings_page | trial_period     | waitForTextToContain | Your (7\|8\|30) days free trial ends on|
    And save user data in mongodb

  @TC005 @regression
  Scenario: Sign up as parent via skip sign up flow skipping personalization, purchase math + reading & yearly plan
    When the user performs below to sign up using:
      | page     | field                 | action         | value        | timeout |
      | poq_page | first_grade           | fireClickEvent |              | 20      |
      | poq_page | other                 | fireClickEvent |              | 30      |
      | poq_page | child_nick_name       | type           | ${firstName} |         |
      | poq_page | next                  | click          |              |         |
      | poq_page | subject_screen_header | waitForElement |              | 20      |
      | poq_page | math                  | fireClickEvent |              |         |
    And the user performs below to interact fork screen :
      | page        | field | action              | value               | timeout |
      |             |       | sleep               | 5                   |         |
      |             |       | waitForUrlToContain | child-onboard#/fork |         |
      | fork_screen | no    | fireClickEvent      |                     |         |
    And the user performs below to skip personalisation :
      | page     | field                        | action         | value | timeout |
      | poq_page | skip_personalization         | fireClickEvent |       |         |
      | poq_page | looks_good_see_learning_path | click          |       |         |
      | poq_page | start_playing                | click          |       |         |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                               |
      | ParentLibrary | purchase | math_plus_reading, yearly, one_child |
    And the user performs below to verify email and enter password:
      | page             | field    | action              | value                          | timeout |
      |                  |          | sleep               | 15                             |         |
      |                  |          | waitForUrlToContain | parent-dashboard#/set-password |         |
      | sem_landing_page | password | type                | password                       |         |
      | sem_landing_page | continue | click               |                                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field                | action              | value                  | timeout |
      | verify_email_page | otp                  | type                | ${data.otp}            |         |
      |                   |                      | waitForUrlToContain  | parent-dashboard#/math | 20      |
      |                   |                      | sleep               | 5                      |         |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      | parent_dashboard_page | spotlight             | clickByAction       |                           |         |
      |                       |                       | waitForUrlToContain | parent-dashboard#/parents |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | back                  | click               |                           |         |
      | parent_dashboard_page | set_later_in_settings | click               |                           |         |
    And the user performs below navigate to settings page:
      | page                  | field           | action | value |
      | parent_dashboard_page | menu            | click  | 20    |
      | menu_page             | account_details | click  | 20    |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify subscription details:
      | page          | field            | action               | value                                  |
      |               |                  | waitForUrlToContain  | subscription-details#/settings         |
      | settings_page | current_plan     | verifyText           | Yearly                                 |
      | settings_page | student_accounts | verifyText           | 1 (0 unused)                           |
      | settings_page | trial_period     | waitForTextToContain | Your (7\|8\|30) days free trial ends on|
    And save user data in mongodb

  @TC006 @regression
  Scenario: Sign up as parent via skip sign up flow skipping personalization, purchase reading & monthly plan
    When the user performs below to sign up using:
      | page     | field                 | action         | value        | timeout |
      | poq_page | first_grade           | fireClickEvent |              | 20      |
      | poq_page | other                 | fireClickEvent |              | 30      |
      | poq_page | child_nick_name       | type           | ${firstName} |         |
      | poq_page | next                  | click          |              |         |
      | poq_page | subject_screen_header | waitForElement |              | 20      |
      | poq_page | math                  | fireClickEvent |              |         |
    And the user performs below to interact fork screen :
      | page        | field | action              | value               | timeout |
      |             |       | sleep               | 5                   |         |
      |             |       | waitForUrlToContain | child-onboard#/fork |         |
      | fork_screen | no    | fireClickEvent      |                     |         |
    And the user performs below to skip personalisation :
      | page     | field                        | action         | value | timeout |
      | poq_page | skip_personalization         | fireClickEvent |       |         |
      | poq_page | looks_good_see_learning_path | click          |       |         |
      | poq_page | start_playing                | click          |       |         |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                        |
      | ParentLibrary | purchase | reading, quarterly, one_child |
    And the user performs below to verify email and enter password:
      | page             | field    | action              | value                          | timeout |
      |                  |          | sleep               | 15                             |         |
      |                  |          | waitForUrlToContain | parent-dashboard#/set-password |         |
      | sem_landing_page | password | type                | password                       |         |
      | sem_landing_page | continue | click               |                                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field                | action              | value                  | timeout |
      | verify_email_page | otp                  | type                | ${data.otp}            |         |
      |                   |                      | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |                      | sleep               | 5                      |         |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      | parent_dashboard_page | spotlight             | clickByAction       |                           |         |
      |                       |                       | waitForUrlToContain | parent-dashboard#/parents |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | back                  | click               |                           |         |
      | parent_dashboard_page | set_later_in_settings | click               |                           |         |
    And the user performs below navigate to settings page:
      | page                  | field           | action | value |
      | parent_dashboard_page | menu            | click  | 20    |
      | menu_page             | account_details | click  | 20    |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify subscription details:
      | page          | field            | action               | value                                  |
      |               |                  | waitForUrlToContain  | subscription-details#/settings         |
      | settings_page | current_plan     | verifyText           | Yearly                                 |
      | settings_page | student_accounts | verifyText           | 1 (0 unused)                           |
      | settings_page | trial_period     | waitForTextToContain | Your (7\|8\|30) days free trial ends on|
    And save user data in mongodb

  @TC007 @regression
  Scenario: Sign up as parent via skip sign up flow skipping personalization, purchase math + reading & yearly plan for up to 3 children
    When the user performs below to sign up using:
      | page     | field                 | action         | value        | timeout |
      | poq_page | first_grade           | fireClickEvent |              | 20      |
      | poq_page | other                 | fireClickEvent |              | 30      |
      | poq_page | child_nick_name       | type           | ${firstName} |         |
      | poq_page | next                  | click          |              |         |
      | poq_page | subject_screen_header | waitForElement |              | 20      |
      | poq_page | math                  | fireClickEvent |              |         |
    And the user performs below to interact fork screen :
      | page        | field | action              | value               | timeout |
      |             |       | sleep               | 5                   |         |
      |             |       | waitForUrlToContain | child-onboard#/fork |         |
      | fork_screen | no    | fireClickEvent      |                     |         |
    And the user performs below to skip personalisation :
      | page     | field                        | action         | value | timeout |
      | poq_page | skip_personalization         | fireClickEvent |       |         |
      | poq_page | looks_good_see_learning_path | click          |       |         |
      | poq_page | start_playing                | click          |       |         |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                             |
      | ParentLibrary | purchase | math_plus_reading, yearly, up_to_3 |
    And the user performs below to verify email and enter password:
      | page             | field    | action              | value                          | timeout |
      |                  |          | sleep               | 15                             |         |
      |                  |          | waitForUrlToContain | parent-dashboard#/set-password |         |
      | sem_landing_page | password | type                | password                       |         |
      | sem_landing_page | continue | click               |                                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field                | action              | value                  | timeout |
      | verify_email_page | otp                  | type                | ${data.otp}            |         |
      |                   |                      | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |                      | sleep               | 5                      |         |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      | parent_dashboard_page | spotlight             | clickByAction       |                           |         |
      |                       |                       | waitForUrlToContain | parent-dashboard#/parents |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | back                  | click               |                           |         |
      | parent_dashboard_page | set_later_in_settings | click               |                           |         |
    And the user performs below navigate to settings page:
      | page                  | field           | action | value |
      | parent_dashboard_page | menu            | click  | 20    |
      | menu_page             | account_details | click  | 20    |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify subscription details:
      | page          | field            | action               | value                                  |
      |               |                  | waitForUrlToContain  | subscription-details#/settings         |
      | settings_page | current_plan     | verifyText           | Yearly                                 |
      | settings_page | student_accounts | verifyText           | 1 (0 unused)                           |
      | settings_page | trial_period     | waitForTextToContain | Your (7\|8\|30) days free trial ends on|
    And save user data in mongodb

  @TC008 @regression
  Scenario: Sign up as parent via skip sign up flow without skipping personalization, purchase math + reading & yearly plan
    When the user performs below to sign up using:
      | page     | field                 | action         | value        | timeout |
      | poq_page | first_grade           | fireClickEvent |              | 20      |
      | poq_page | other                 | fireClickEvent |              | 30      |
      | poq_page | child_nick_name       | type           | ${firstName} |         |
      | poq_page | next                  | click          |              |         |
      | poq_page | subject_screen_header | waitForElement |              | 20      |
      | poq_page | math                  | fireClickEvent |              |         |
    And the user performs below to interact fork screen :
      | page        | field | action              | value               | timeout |
      |             |       | sleep               | 5                   |         |
      |             |       | waitForUrlToContain | child-onboard#/fork |         |
      | fork_screen | no    | fireClickEvent      |                     |         |
    And the user performs below to skip personalisation :
      | page     | field                        | action | value | timeout |
      | poq_page | yes                          | click  |       |         |
      |          |                              | sleep  | 2     |         |
      | poq_page | yes                          | click  |       |         |
      |          |                              | sleep  | 2     |         |
      | poq_page | yes                          | click  |       |         |
      |          |                              | sleep  | 2     |         |
      | poq_page | yes                          | click  |       |         |
      |          |                              | sleep  | 2     |         |
      | poq_page | yes                          | click  |       |         |
      | poq_page | looks_good_see_learning_path | click  |       | 20      |
      | poq_page | start_playing                | click  |       |         |
    And call custom method for purchasing math yearly plan for 1 child using:
      | klass         | method   | params                               |
      | ParentLibrary | purchase | math_plus_reading, yearly, one_child |
    And the user performs below to verify email and enter password:
      | page             | field    | action              | value                          | timeout |
      |                  |          | sleep               | 15                             |         |
      |                  |          | waitForUrlToContain | parent-dashboard#/set-password |         |
      | sem_landing_page | password | type                | password                       |         |
      | sem_landing_page | continue | click               |                                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field                | action              | value                  | timeout |
      | verify_email_page | otp                  | type                | ${data.otp}            |         |
      |                   |                      | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |                      | sleep               | 5                      |         |
    And the user performs below:
      | page                  | field                 | action              | value                     | timeout |
      | parent_dashboard_page | spotlight             | clickByAction       |                           |         |
      |                       |                       | waitForUrlToContain | parent-dashboard#/parents |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | okay                  | click               |                           |         |
      | parent_dashboard_page | back                  | click               |                           |         |
      | parent_dashboard_page | set_later_in_settings | click               |                           |         |
    And the user performs below navigate to settings page:
      | page                  | field           | action | value |
      | parent_dashboard_page | menu            | click  | 20    |
      | menu_page             | account_details | click  | 20    |
    And call custom method for retrieving otp using:
      | method    |
      | verifyAge |
    And the user performs below to verify subscription details:
      | page          | field            | action               | value                                  |
      |               |                  | waitForUrlToContain  | subscription-details#/settings         |
      | settings_page | current_plan     | verifyText           | Yearly                                 |
      | settings_page | student_accounts | verifyText           | 1 (0 unused)                           |
      | settings_page | trial_period     | waitForTextToContain | Your (7\|8\|30) days free trial ends on|
    And save user data in mongodb

  @TC009
  Scenario: Sign up as parent via skip sign up flow to perform V1 A/B flow visiting fork and priming screen to reach to tutoring page and to Parent dashboard after purchase.
    When the user performs below to sign up using:
      | page              | field                 | action         | value          | timeout |
      | poq_page          | first_grade           | click          |                |         |
      | poq_page          | subject_screen_header | waitForElement |                | 20      |
      | poq_page          | math                  | fireClickEvent |                |         |
      | fork_priming_page | yes                   | clickIfPresent |                |         |
      | fork_priming_page | lets_pick_a_course   | click          |                |         |
      | collection_page   | book_your_free_class  | click          |                |         |
      | collection_page   | book_your_free_trial  | click          |                |         |
      | collection_page   | parent's_email_id     | type           | ${parentEmail} |         |
      | collection_page   | continue_button       | click          |                |         |
      | collection_page   | next                  | click          |                |         |
    And call custom method for enter card details  using:
      | klass         | method           | params |
      | ParentLibrary | enterCardDetails |        |
    And the user performs below to complete the purchase flow:
      | page             | field    | action | value    | timeout |
      | collection_page  | book_now | click  |          |         |
      |                  |          | sleep  | 5        |         |
      | sem_landing_page | password | type   | password |         |
      | settings_page    | continue | click  |          |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to thank you screen on splash courses page:
      | page            | field               | action | value     | timeout |
      | collection_page | parent_phone_number | type   | 122233445 |         |
      | collection_page | submit              | click  |           |         |
      |                 |                     | sleep  | 5         |         |
      | collection_page | explore_splashLearn | click  |           |         |
      |                 |                     | sleep  | 5         |         |

    And save user data in mongodb

  @TC0010
  Scenario: Sign up as parent via skip sign up flow to perform V1 A/B flow visiting fork and priming screen and select continue without SplashLearn screen.
    When the user performs below to sign up using:
      | page              | field                        | action         | value | timeout |
      | poq_page          | first_grade                  | click          |       |         |
      | poq_page          | subject_screen_header        | waitForElement |       | 20      |
      | poq_page          | math                         | fireClickEvent |       |         |
      | fork_priming_page | yes                          | clickIfPresent |       |         |
      | fork_priming_page | continue_without_tutoring    | click          |       |         |
      | poq_page          | skip_personalization         | fireClickEvent |       |         |
      | poq_page          | looks_good_see_learning_path | click          |       |         |
      | poq_page          | start_playing                | click          |       |         |
    And call custom method for enter card details  using:
      | klass         | method           | params |
      | ParentLibrary | enterCardDetails |        |
    And the user performs below to complete the purchase flow:
      | page             | field    | action | value    | timeout |
      | collection_page  | book_now | click  |          |         |
      |                  |          | sleep  | 5        |         |
      | sem_landing_page | password | type   | password |         |
      | settings_page    | continue | click  |          |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field | action              | value                  | timeout |
      | verify_email_page | otp   | type                | ${data.otp}            |         |
      |                   |       | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |       | sleep               | 5                      |         |

    And save user data in mongodb

  @TC0011
  Scenario: Sign up as parent via skip sign up flow to perform V1 A/B flow visiting fork to select Not Sure option.
    When the user performs below to sign up using:
      | page              | field                        | action         | value | timeout |
      | poq_page          | first_grade                  | click          |       |         |
      | poq_page          | subject_screen_header        | waitForElement |       | 20      |
      | poq_page          | math                         | fireClickEvent |       |         |
      | fork_priming_page | not_sure                     | clickIfPresent |       |         |
      | poq_page          | skip_personalization         | fireClickEvent |       |         |
      | poq_page          | looks_good_see_learning_path | click          |       |         |
      | poq_page          | start_playing                | click          |       |         |
    And call custom method for enter card details  using:
      | klass         | method           | params |
      | ParentLibrary | enterCardDetails |        |
    And the user performs below to complete the purchase flow:
      | page             | field    | action | value    | timeout |
      | collection_page  | book_now | click  |          |         |
      |                  |          | sleep  | 5        |         |
      | sem_landing_page | password | type   | password |         |
      | settings_page    | continue | click  |          |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field | action              | value                  | timeout |
      | verify_email_page | otp   | type                | ${data.otp}            |         |
      |                   |       | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |       | sleep               | 5                      |         |
    And save user data in mongodb

  @TC0012
  Scenario: Sign up as parent via skip sign up flow to perform V0 A/B flow visiting fork screen to reach to tutoring page.
    When the user performs below to sign up using:
      | page              | field                 | action         | value          | timeout |
      | poq_page          | first_grade           | click          |                |         |
      | poq_page          | subject_screen_header | waitForElement |                | 20      |
      | poq_page          | math                  | fireClickEvent |                |         |
      | fork_priming_page | yes                   | click          |                |         |
      | collection_page   | book_your_free_class  | click          |                |         |
      | collection_page   | book_your_free_trial  | click          |                |         |
      | collection_page   | parent's_email_id     | type           | ${parentEmail} |         |
    And call custom method for enter card details  using:
      | klass         | method           | params |
      | ParentLibrary | enterCardDetails |        |
    And the user performs below to complete the purchase flow:
      | page             | field    | action | value    | timeout |
      | collection_page  | book_now | click  |          |         |
      |                  |          | sleep  | 5        |         |
      | sem_landing_page | password | type   | password |         |
      | settings_page    | continue | click  |          |         |
    And call custom method for retrieving otp using:
      | klass        | method | params        | var |
      | EmailLibrary | getOtp | ${data.email} | otp |
    And the user performs below to verify email and enter password:
      | page              | field | action              | value                  | timeout |
      | verify_email_page | otp   | type                | ${data.otp}            |         |
      |                   |       | waitForUrlToContain | parent-dashboard#/math | 20      |
      |                   |       | sleep               | 5                      |         |
    And save user data in mongodb
