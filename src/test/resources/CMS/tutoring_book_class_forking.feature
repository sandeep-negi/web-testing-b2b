@tutoring @forking
Feature: Book Your Class Forking Flow

  Background:
    Given the user opens "splashcourses#/select-slot?trial_class=true&grade=5&utm_source[…]m_medium=referral&utm_campaign=forking_onboarding" page


  @CMS062 @book_your_free_class @new_user
  Scenario: The user performs the book your class for new user flow:
    When the user performs below Schedule your class screen field validation and enter personal detail using:
      | page                                  | field                                | action     | value                                 | timeout |
      | tutoring_forking_book_your_free_class | splashlearn_logo_header              | exists     |                                       | 10      |
      | tutoring_forking_book_your_free_class | book_your_free_class_header          | verifyText | Book Your Free Class                  |         |
      | tutoring_forking_book_your_free_class | parent_email_text_box                | exists     |                                       | 10      |
      | tutoring_forking_book_your_free_class | parent_name_text_box                 | exists     |                                       | 10      |
      | tutoring_forking_book_your_free_class | parent_phone_text_box                | exists     |                                       | 10      |
      | tutoring_forking_book_your_free_class | child_grade_drop_down                | exists     |                                       | 10      |
      | tutoring_forking_book_your_free_class | child_grade_drop_down                | click      |                                       | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_gradeK       | verifyText | Kindergarten                          | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_grade1       | verifyText | Grade 1                               | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_grade2       | verifyText | Grade 2                               | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_grade3       | verifyText | Grade 3                               | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_grade4       | verifyText | Grade 4                               | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_grade5       | verifyText | Grade 5                               | 10      |
      | tutoring_forking_book_your_free_class | child_grade_drop_down                | click      |                                       | 10      |
      | tutoring_forking_book_your_free_class | schedule_your_free_class_button_main | click      |                                       | 10      |
      | tutoring_forking_book_your_free_class | parent_email_error_message           | verifyText | Parent's Email cannot be empty        | 10      |
      | tutoring_forking_book_your_free_class | parent_email_text_box                | clear      |                                       |         |
      | tutoring_forking_book_your_free_class | parent_email_text_box                | type       | ${parentEmail}                        |         |
      | tutoring_forking_book_your_free_class | schedule_your_free_class_button_main | click      |                                       |         |
      | tutoring_forking_book_your_free_class | parent_name_error_message            | verifyText | Parent's Name cannot be empty         |         |
      | tutoring_forking_book_your_free_class | parent_name_text_box                 | clear      |                                       |         |
      | tutoring_forking_book_your_free_class | parent_name_text_box                 | type       | Splash Sam                            |         |
      | tutoring_forking_book_your_free_class | schedule_your_free_class_button_main | click      |                                       |         |
      | tutoring_forking_book_your_free_class | parent_phone_number_error_message    | verifyText | Parent's Phone Number cannot be empty |         |
      | tutoring_forking_book_your_free_class | parent_phone_text_box                | clear      |                                       |         |
      | tutoring_forking_book_your_free_class | parent_phone_text_box                | type       | 9898229382                            |         |
      | tutoring_forking_book_your_free_class | schedule_your_free_class_button_main | click      |                                       |         |
      | tutoring_forking_book_your_free_class | child_grade_error_message            | verifyText | Select your Child's Grade             |         |
      | tutoring_forking_book_your_free_class | child_grade_drop_down                | click      |                                       | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_gradeK       | click      |                                       |         |
      | tutoring_forking_book_your_free_class | schedule_your_free_class_button_main | click      |                                       |         |

    And the user performs below to enter detail of the class slots:
      | page                                 | field                           | action              | value                             | timeout |
      |                                      |                                 | waitForUrlToContain | /splashcourses#/trial-select-slot | 10      |
      | tutoring_forking_schedule_your_class | schedule_class_header           | verifyText          | Schedule Your Class               |         |
      | tutoring_forking_schedule_your_class | select_date_header              | verifyText          | Select Date                       |         |
      | tutoring_forking_schedule_your_class | select_date_first_slot_date     | exists              |                                   |         |
      | tutoring_forking_schedule_your_class | timezone_header                 | verifyText          | Timezone:                         |         |
      | tutoring_forking_schedule_your_class | select_time_first_slot_time     | exists              |                                   |         |
      | tutoring_forking_schedule_your_class | schedule_your_class_next_button | click               |                                   |         |

    And the user performs below to check the fields on OTP screen:
      | page                                 | field               | action              | value                        | timeout |
      |                                      |                     | waitForUrlToContain | /splashcourses#/verify-email | 10      |
      | tutoring_forking_verify_email_screen | verify_email_header | verifyText          | Verify email                 |         |
      | tutoring_forking_verify_email_screen | resend_code_button  | verifyText          | Resend Code                  |         |


    And call custom method for retrieving otp using:
      | klass        | method | params                        | var |
      | EmailLibrary | getOtp | ${data.parent_email_text_box} | otp |

    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} | 10      |

    And the user performs below to check fields on thank you screen:
      | page                              | field                      | action              | value                    | timeout |
      |                                   |                            | waitForUrlToContain | /splashcourses#/thankyou | 10      |
      | tutoring_forking_thank_you_screen | thank_you_screen_image     | exists              |                          | 10      |
      | tutoring_forking_thank_you_screen | logout_button              | exists              |                          | 10      |
      | tutoring_forking_thank_you_screen | logout_button              | verifyText          | Logout                   |         |
      | tutoring_forking_thank_you_screen | explore_splashlearn_button | verifyText          | Explore SplashLearn      |         |
      | tutoring_forking_thank_you_screen | explore_splashlearn_button | click               |                          |         |

    And the user performs the opening of math dashboard screen:
      | page | field | action              | value             | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard | 10      |

  @CMS063 @book_your_free_class @old_user
  Scenario: The user performs the book your class for old user flow:
    When the user performs below Schedule your class screen field validation and enter personal detail using:
      | page                                  | field                                | action     | value                                            | timeout |
      | tutoring_forking_book_your_free_class | book_your_free_class_header          | verifyText | Book Your Free Class                             |         |
      | tutoring_forking_book_your_free_class | parent_email_text_box                | clear      |                                                  |         |
      | tutoring_forking_book_your_free_class | parent_email_text_box                | type       | auto_parent+iz900a8hcjfce5r4mnr0@splashlearn.com |         |
      | tutoring_forking_book_your_free_class | parent_name_text_box                 | clear      |                                                  |         |
      | tutoring_forking_book_your_free_class | parent_name_text_box                 | type       | Splash Sam                                       |         |
      | tutoring_forking_book_your_free_class | parent_phone_text_box                | clear      |                                                  |         |
      | tutoring_forking_book_your_free_class | parent_phone_text_box                | type       | 9898229382                                       |         |
      | tutoring_forking_book_your_free_class | child_grade_drop_down                | click      |                                                  | 10      |
      | tutoring_forking_book_your_free_class | child_grade_down_option_gradeK       | click      |                                                  |         |
      | tutoring_forking_book_your_free_class | schedule_your_free_class_button_main | click      |                                                  |         |

    And the user performs below to check the fields on OTP screen:
      | page                                 | field               | action              | value                        | timeout |
      |                                      |                     | waitForUrlToContain | /splashcourses#/verify-email | 10      |
      | tutoring_forking_verify_email_screen | verify_email_header | verifyText          | Verify email                 |         |
      |                                      |                     | sleep               | 10                           |         |

    And call custom method for retrieving otp using:
      | klass        | method | params                                           | var |
      | EmailLibrary | getOtp | auto_parent+iz900a8hcjfce5r4mnr0@splashlearn.com | otp |

    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} | 10      |

    And the user performs below to enter detail of the class slots:
      | page                                 | field                           | action              | value                             | timeout |
      |                                      |                                 | waitForUrlToContain | /splashcourses#/trial-select-slot | 10      |
      | tutoring_forking_schedule_your_class | schedule_class_header           | verifyText          | Schedule Your Class               |         |
      | tutoring_forking_schedule_your_class | select_date_header              | verifyText          | Select Date                       |         |
      | tutoring_forking_schedule_your_class | select_date_first_slot_date     | exists              |                                   |         |
      | tutoring_forking_schedule_your_class | timezone_header                 | verifyText          | Timezone:                         |         |
      | tutoring_forking_schedule_your_class | select_time_first_slot_time     | exists              |                                   |         |
      | tutoring_forking_schedule_your_class | select_day_wednesday            | click               |                                   |         |
      | tutoring_forking_schedule_your_class | select_time                     | click               |                                   |         |
      | tutoring_forking_schedule_your_class | schedule_your_class_next_button | click               |                                   |         |

    And the user performs below to check fields on something wrong screen:
      | page                              | field                            | action              | value                     | timeout |
      |                                   |                                  | waitForUrlToContain | /splashcourses#/try-again | 10      |
      | tutoring_forking_thank_you_screen | something_wrong_try_again_button | exists              |                           | 10      |
      | tutoring_forking_thank_you_screen | something_wrong_header           | verifyText          | Something's wrong         |         |
      | tutoring_forking_thank_you_screen | something_wrong_try_again_button | click               |                           |         |

    And the user performs the checking of opening of trial slot booking screen on clicking try again:
      | page | field | action              | value                             | timeout |
      |      |       | waitForUrlToContain | /splashcourses#/trial-select-slot | 10      |
