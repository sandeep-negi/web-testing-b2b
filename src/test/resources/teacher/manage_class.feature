@b2b @manage_class @regression @b2b_regression @teacher
Feature: Manage Class
  As a teacher, I have the option to manage classes.

  @B2B0004 @ashutosh @QA_Saurabh @regression @Edit_student_name @api_teacher_signin @staging @preprod @prod @SL-TC-1789
  Scenario: B2B0004_Edit student details
    Given the user opens "teacher/dashboard" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    When the user performs below steps to navigate to student roster
      | page           | field          | action | value | timeout |
      | student_roster | manage_class   | click  |       |         |
      | student_roster | student_roster | click  |       |         |

    And  the user performs below to edit firstname:
      | page           | field                   | action      | value        | timeout | var |
      | student_roster | edit_first_student_icon | click       |              | 10      |     |
      | student_roster | first_name              | clear       |              | 10      |     |
      | student_roster | first_name              | type        | ${firstName} | 10      |     |
      | student_roster | save_button             | click       |              | 10      |     |
      |                |                         | refreshpage |              | 10      |     |

    And call custom method for verifying student name in student roster using:
      | klass          | method                | params             |
      | TeacherLibrary | verifyStudentsInKlass | ${data.first_name} |

  @B2B0005 @ashutosh @QA_Saurabh @regression @Edit_picture_password @api_teacher_signin @staging @preprod @prod @SL-TC-1790
  Scenario: B2B0005_Edit picture password

    Given the user opens "teacher/dashboard" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    And the user performs below steps to change picture password
      | page           | field          | action | value | timeout |
      | student_roster | manage_class   | click  |       |         |
      | student_roster | student_roster | click  |       |         |
    And call custom method for changing picture password using:
      | klass          | method                | params           |
      | TeacherLibrary | changePicturePassword | ${data.student1} |

  @B2B0006 @student_password_type @ashutosh @QA_Saurabh @api_teacher_signin @staging @preprod @prod @SL-TC-1791
  Scenario: B2B0006_Verify student's password type is changed to 'Text'

    Given the user opens "teacher/dashboard" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |

    And the user performs below to change password type to Text and Save changes
      | page           | field              | action | value | timeout |
      | class_settings | password_type_text | click  |       |         |
      | class_settings | save_changes       | click  |       |         |

    Then the user performs 'a check whether text password is reflected in Student Roster'
      | page                   | field            | action           | value | timeout |
      | teacher_dashboard_page | student_roster   | click            |       | 5       |
      | student_roster         | picture_password | waitForNoElement |       | 5       |
      |                        |                  | screenshot       |       |         |
    And the user performs below to change password type to picture for next run
      | page                   | field                 | action                | value | timeout |
      | teacher_dashboard_page | class_settings        | waitForElementVisible |       |         |
      | teacher_dashboard_page | class_settings        | click                 |       |         |
      | class_settings         | password_type_picture | click                 |       |         |
      | class_settings         | save_changes          | click                 |       |         |


  @B2B0007 @student_text_password @ashutosh @QA_Saurabh @api_teacher_signin @staging @preprod @prod @SL-TC-1792
  Scenario: B2B0007_Verify teacher is able to change student's text password and save

    Given the user opens "teacher/dashboard" page
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
      |                        |                | sleep  | 5     |         |

    And the user performs below to edit student's text password and save
      | page           | field         | action           | value                  | timeout | locator                                                               |
      |                |               | click            |                        |         | xpath=>(//div[text()='Edit student details']/preceding-sibling::i)[1] |
      | student_roster | text_password | clear            |                        |         |                                                                       |
      | student_roster | text_password | type             | ${studentTextPassword} |         |                                                                       |
      | student_roster | save_button   | click            |                        |         |                                                                       |
      | student_roster | save_button   | waitForNoElement |                        |         |                                                                       |
    Then the user performs 'a check whether password is updated correctly'
      | page           | field             | action      | value                 | timeout | locator                                                 |
      |                |                   | refreshpage |                       |         |                                                         |
      | student_roster | student1_password | verifyText  | ${data.text_password} |         | xpath=>(//div[@class='student-password']/child::div)[1] |
      |                |                   | screenshot  |                       |         |                                                         |

  @B2B0014 @ashutosh @QA_Saurabh @add_class @api_teacher_signin @staging @preprod @prod @SL-TC-1793
  Scenario: B2B0014_Add New Class

    Given the user opens "teacher/dashboard" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    And call custom method for closing the studentLoginInstruction pop up using:
      | klass          | method                            |
      | TeacherLibrary | closeStudentLoginInstructionModal |
    When the user performs below to open 'Add New Class' page
      | page                    | field             | action                | value | timeout |
      | teacher_dashboard_page  | view_klasses_list | click                 |       |         |
      | teacher_dashboard_page  | add_klass         | waitForElementVisible |       | 5       |
      | teacher_dashboard_page  | add_klass         | click                 |       |         |
      | add_klass_students_page | create_new_klass  | waitForElement        |       | 10      |
    And the user performs below to create a new class
      | page                    | field            | action         | value                           | timeout |
      | add_klass_students_page | klass_name       | type           | ${data.class_name}-${firstName} |         |
      | add_klass_students_page | klass_grade      | select         | ${data.class_grade}             | 5       |
      | add_klass_students_page | klass_subject    | select         | ${data.class_subject}           | 5       |
      | add_klass_students_page | create_new_klass | click          |                                 | 5       |
      | add_klass_students_page | add_students     | waitForElement |                                 | 10      |

    And the user performs below to add students to newly created class
      | page                    | field               | action           | value                                                | timeout |
      | add_klass_students_page | student_names       | type             | ${firstName}, ${firstName}, ${firstName} ${lastName} |         |
      | add_klass_students_page | add_students        | click            |                                                      | 10      |
      | add_klass_students_page | done_adding_student | waitForElement   |                                                      | 20      |
      | add_klass_students_page | done_adding_student | click            |                                                      |         |
      | add_klass_students_page | done_adding_student | waitForNoElement |                                                      | 30      |
    And call custom method for closing the studentLoginInstruction pop up using:
      | klass          | method                            |
      | TeacherLibrary | closeStudentLoginInstructionModal |

#    Then the user performs 'a check whether new class is created and displayed under view classes list'
#      | page                   | field             | action         | value | timeout | locator                                            |
#      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                                    |
#      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//*[@title='${data.klass_name}']/parent::li |
#      |                        |                   | screenshot     |       |         |                                                    |

    Then call custom method for deleting newly added class as part of test case cleanup using:
      | klass          | method         | params             |
      | TeacherLibrary | deleteKlassApi | ${data.klass_name} |

  @B2B0015 @add_students @ashutosh @QA_Saurabh @api_teacher_signin @staging @preprod @prod @load_entity_context @SL-TC-1794
  Scenario: B2B0015_Add Students to existing class

    Given the user opens "teacher/dashboard" page
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
      |                        |                | sleep  | 5     |         |

    And the user performs below to add students for given class
      | page                    | field               | action         | value                      | timeout |
      | student_roster          | add_students        | click          |                            | 60      |
      | add_klass_students_page | add_students        | waitForElement |                            | 60      |
      | add_klass_students_page | student_names       | type           | ${firstName}, ${firstName} |         |
      | add_klass_students_page | add_students        | click          |                            | 5       |
#      | add_klass_students_page | done_adding_student | waitForNoElement |                                                      | 7       |
      | add_klass_students_page | done_adding_student | waitForElement |                            |         |
      | add_klass_students_page | done_adding_student | click          |                            | 5       |

    Then the user performs below to verify whether new students are added to given class
      | page                   | field          | action                | timeout |
      | teacher_dashboard_page | manage_class   | click                 |         |
      | teacher_dashboard_page | student_roster | click                 |         |
      | student_roster         | add_students   | waitForElementVisible | 60      |

    And call custom method for verifying whether students are added to given class using:
      | klass          | method                | params                |
      | TeacherLibrary | verifyStudentsInKlass | ${data.student_names} |

    And call custom method for deleting students as part of testcase cleanup using:
      | klass          | method            | params                |
      | TeacherLibrary | deleteStudentsApi | ${data.student_names} |

  @B2B0016 @delete_class @ashutosh @QA_Saurabh @load_entity_context @api_addClass @api_teacher_signin @staging @preprod @prod @SL-TC-1795
  Scenario: B2B0016_Verify user is able to delete class

    Given the user opens "teacher/dashboard" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    And the user performs below to open class list using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |

    And call custom method for selecting klass from list using:
      | klass          | method                  | params                  |
      | TeacherLibrary | selectKlassFromDropDown | ${data.class_to_delete} |
    And call custom method for closing the studentLoginInstruction pop up using:
      | klass          | method                            |
      | TeacherLibrary | closeStudentLoginInstructionModal |

    When the user performs below to open 'Class Settings'
      | page                   | field          | action |
      | teacher_dashboard_page | manage_class   | click  |
      | teacher_dashboard_page | class_settings | click  |

    And the user performs below to delete the class
      | page           | field                  | action                | value  | timeout |
      | class_settings | delete_class           | waitForElementVisible |        |         |
      | class_settings | delete_class           | click                 |        |         |
      | class_settings | enter_text_delete      | waitForElementVisible |        | 5       |
      | class_settings | enter_text_delete      | type                  | delete |         |
      | class_settings | permanent_delete_class | click                 |        |         |
      |                |                        | waitForSpinner        |        |         |
      | class_settings | delete_class           | waitForNoElement      |        |         |

    Then the user performs a check to confirm the given class is deleted
      | page                   | field             | action                | locator                                                  |
      | teacher_dashboard_page | view_klasses_list | waitForElementVisible |                                                          |
      | teacher_dashboard_page | view_klasses_list | click                 |                                                          |
      |                        |                   | waitForNoElement      | xpath=>//*[@title='${data.delete_classname}']/parent::li |

  @B2B0056 @ashutosh @QA_Saurabh @api_teacher_signin @edit_parent_invite @staging @preprod @prod @SL-TC-1796 @do_not_run
  Scenario: B2B0056_Verify teacher is able to edit parent invite

    Given the user opens "teacher/dashboard" page
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

    And call custom method for editing parent email using:
      | klass          | method           | params           | var                       |
      | TeacherLibrary | editParentInvite | ${data.student2} | student2_new_parent_email |

    And call custom method for fetching parent signup link sent to parent's email using:
      | klass        | method            | params                            | var                |
      | EmailLibrary | getHomeAccessLink | ${data.student2_new_parent_email} | parent_signup_link |


  @B2B0057 @preview_parent_invite @ashutosh @QA_Saurabh @api_teacher_signin @staging @preprod @prod @SL-TC-1797

  Scenario: B2B0057_Verify teacher is able to preview invite

    Given the user opens "teacher/dashboard" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    And the user performs below to open 'Student roster' and click on 'Preview invite'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | student_roster | click  |       |         |

    And the user performs below to click on 'Preview invite'
      | page           | field               | action                | value | timeout |
      | student_roster | preview_invite      | click                 |       |         |
      | common         | close_preview_modal | waitForElementVisible |       |         |
      |                |                     | screenshot            |       |         |

  @B2B0058 @api_teacher_signin @load_entity_context @parent_signup @parent_invite @ashutosh @QA_Saurabh
  @api_add_students_existing_class @api_delete_students_after @staging @preprod @prod @SL-TC-1798 @do_not_run
  Scenario: B2B0058_Verify parent is able to signup once invite is sent

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

    And the user performs below for parent sign up using:
      | page                  | field        | action         | value | timeout |
      |                       |              | waitForSpinner |       |         |
      | parent_dashboard_page | parents_menu | waitForElement |       | 20      |
      |                       |              | waitForSpinner |       | 10      |
      |                       |              | screenshot     |       |         |


  @B2B0059 @single_thread @api_teacher_signin @parent_signup @copy_invite @ashutosh @QA_Saurabh @load_entity_context
  @api_add_students_existing_class @do_not_run @staging @preprod @prod
  Scenario: B2B0059_Verify parent is able to setup an account via 'Copy Invite'

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

    And call custom method for copying parent invite using:
      | klass          | method                   |
      | TeacherLibrary | copyAndStoreParentInvite |

    And the user performs below to save all cookies and then delete them and switch to new window using:
      | action            | value  | timeout | var                       |
      | getAllCookies     |        |         | teacher_dashboard_cookies |
      | deleteAllCookies  |        |         |                           |
      | switchToNewWindow | window |         | teacher_dashboard_handle  |

    Then the user performs below to open parent invite link
      | action | value                      |
      | open   | ${data.parent_invite_link} |

    And the user performs below for parent sign up using:
      | page              | field          | action | value            | timeout |
      | registration_page | parent_email   | type   | ${parentEmail}   |         |
      | registration_page | Password       | type   | ${data.password} |         |
      | registration_page | parents_DOB    | type   | 1990             |         |
      | registration_page | create_account | click  |                  |         |

    And call custom method for retrieving otp using:
      | klass        | method       | params               |
      | EmailLibrary | getOtpFromDB | ${data.parent_email} |

    And the user performs below to enter otp:
      | page              | field | action | value       | timeout |
      | verify_email_page | otp   | type   | ${data.otp} | 10      |

    And the user performs below to complete the registration:
      | page                  | field                        | action           | value              | timeout | locator                                                                         |
      | registration_page     | class_code_type              | type             | ${data.class_code} |         |                                                                                 |
      | registration_page     | class_code_continue          | click            |                    |         |                                                                                 |
      | registration_page     | class_code_continue          | waitForNoElement |                    |         |                                                                                 |
      |                       |                              | click            |                    |         | xpath=>//*[@class='student-name' and text()='${data.api_student_1}']/parent::li |
      |                       |                              | click            |                    |         | xpath=>//a[text()='Yes, Continue']                                              |
      |                       |                              | waitForSpinner   |                    |         |                                                                                 |
      | parent_dashboard_page | continue_with_limited_access | waitForElement   |                    |         |                                                                                 |
      | parent_dashboard_page | continue_with_limited_access | click            |                    |         |                                                                                 |
      | parent_dashboard_page | parents_menu                 | waitForElement   |                    |         |                                                                                 |
      |                       |                              | waitForSpinner   |                    |         |                                                                                 |
      |                       |                              | screenshot       |                    |         |                                                                                 |

  @B2B0060 @smoke @api_teacher_signin @parent_reminder @ashutosh @QA_Saurabh @staging @preprod @prod @SL-TC-1766 @do_not_run
  Scenario: B2B0060_Verify reminder is sent to the parent to setup account

    Given the user opens "teacher/dashboard" page
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

    And call custom method for sending reminder to parent using:
      | klass          | method       | params           |
      | TeacherLibrary | sendReminder | ${data.student1} |

    And call custom method for fetching parent signup link sent to parent's email using:
      | klass        | method            | params                  | var                |
      | EmailLibrary | getHomeAccessLink | ${data.student1_parent} | parent_signup_link |

  @B2B0040 @delete_student @preprod @alert @do_not_run
  Scenario: B2B0040_Verify student is deleted
    Given the user opens "signin" page
    And call custom method for signin using:
      | klass          | method | params                             |
      | TeacherLibrary | login  | ${data.username}, ${data.password} |
    When the user performs below to switch to given class
      | page                   | field             | action                | value | timeout | locator                                            |
      | teacher_dashboard_page | view_klasses_list | click                 |       |         |                                                    |
      |                        |                   | waitForElementVisible |       |         | xpath=>//*[@title='${data.class_name}']/parent::li |
      |                        |                   | click                 |       |         | xpath=>//*[@title='${data.class_name}']/parent::li |
      | student_roster         | manage_class      | click                 |       |         |                                                    |
      | student_roster         | student_roster    | click                 |       |         |                                                    |
      |                        |                   | waitForSpinner        |       |         |                                                    |

    And call custom method for deleting student using:
      | klass          | method        | params                                  |
      | TeacherLibrary | deleteStudent | ${data.class_name},${data.student_name} |

  @B2B0041 @ashutosh @QA_Saurabh @invite_parent @api_teacher_signin @load_entity_context @parent_invite @do_not_run
  @api_add_students_existing_class @api_delete_students_after @staging @preprod @prod
  Scenario: B2B0041_Invite parent as PTL
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

  @B2B0072 @ashutosh @QA_Saurabh @grade_options @staging @preprod @prod @uk_grade_verify @SL-TC-1800
  Scenario Outline: B2B0072_Log in as uk teacher and verify the available grade options

    Given the user opens "signin" page
    And call custom method for signin using:
      | klass          | method | params                             |
      | TeacherLibrary | login  | ${data.username}, ${data.password} |
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |

    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |

    And call custom method for verifying grades using:
      | klass          | method             | params           |
      | TeacherLibrary | verifyGradeOptions | <ExpectedGrades> |
    Examples:
      | ExpectedGrades                            |
      | Year 1-Year 2-Year 3-Year 4-Year 5-Year 6 |


  @B2B0073 @ashutosh @QA_Saurabh @grade_options @staging @preprod @prod @us_grade_verify @SL-TC-1801
  Scenario Outline: B2B0073_Log in as us teacher and verify the available grade options

    Given the user opens "signin" page
    And call custom method for signin using:
      | klass          | method | params                             |
      | TeacherLibrary | login  | ${data.username}, ${data.password} |
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |

    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |

    And call custom method for ensuring class settings page using:
      | klass          | method                  |
      | TeacherLibrary | ensureClassSettingsPage |
    And call custom method for verifying grades using:
      | klass          | method             | params           |
      | TeacherLibrary | verifyGradeOptions | <ExpectedGrades> |
    Examples:
      | ExpectedGrades                                       |
      | Kindergarten-Grade 1-Grade 2-Grade 3-Grade 4-Grade 5 |

  @B2B0136 @QA_Sandeep @change_class_code @api_teacher_signin @staging @preprod @prod @Functionality_changeClassCode @SL-TC-1802
  Scenario: B2B0136_Teacher should able to change Class Code
    Given the user opens "teacher/dashboard" page
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
    And call custom method for changing classcode for klass using:
      | klass          | method          |
      | TeacherLibrary | changeClassCode |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |
    And call custom method for verifying login using new classcode using:
      | klass          | method                    |
      | TeacherLibrary | verifyLoginUsingClassCode |

