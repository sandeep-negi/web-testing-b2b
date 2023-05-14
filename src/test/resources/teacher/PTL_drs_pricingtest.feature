@b2c  @regression  @teacher
Feature: Verify pricingtest details of PTL DRS user

  @B2B0202 @b2b @api_teacher_signin @load_entity_context @parent_signup @parent_invite
  @api_add_students_existing_class @api_delete_students_after @preprod @do_not_run
  Scenario: B2B0202_Verify pricing test details of DRS PTL user

    Given the teacher switches to "${data.class_name}" class
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    And the user performs below to open 'Student roster'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | student_roster | click  |       |         |

    And call custom method for sending invite to parent for given student using:
      | klass          | method           | params                | var                   |
      | TeacherLibrary | sendParentInvite | ${data.api_student_1} | student1_parent_email |


    And call custom method for fetching parent signup link sent to parent's email using:
      | klass        | method            | params                        | var                |
      | EmailLibrary | getHomeAccessLink | ${data.student1_parent_email} | parent_signup_link |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for sending invite to parent for given student using:
      | klass          | method               | params                     |
      | TeacherLibrary | openParentSignupLink | ${data.parent_signup_link} |


    And the user performs below for parent sign up using:
      | page              | field          | action | value            | timeout |
      | registration_page | Password       | type   | ${data.password} |         |
#      | registration_page | parents_DOB    | type   | 1990             |         |
      | registration_page | create_account | click  |                  |         |

    And call custom method for retrieving otp using:
      | klass        | method       | params                        |var|
      | EmailLibrary | getOtpFromDB | ${data.student1_parent_email} |otp|

    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} | 10      |

    And the user performs below to continue with limited access:
      | page                  | field                        | action                | value | timeout |
      | parent_dashboard_page | continue_with_limited_access | waitForElementVisible |       | 15      |
      | parent_dashboard_page | continue_with_limited_access | click                 |       |         |

    And call custom method for verifying pricing test using:
      | klass          | method            | params                        |
      | TeacherLibrary | verifyPricingTest | ${data.student1_parent_email} |



