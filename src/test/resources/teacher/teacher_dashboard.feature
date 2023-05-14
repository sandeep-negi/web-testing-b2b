@b2b @teacher_dashboard @teacher

Feature: Teacher dashboard feature

  @B2B0010 @regression @student_centre @preprod @sandeep @staging @prod @api_teacher_signin @Functionality_navigateToClassroom @SL-TC-1861
  Scenario: B2B0010_Verify user navigation from 'Select your classroom' page
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
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action         | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click          |       |         |
      |                        |                          | sleep          | 5     |         |
      | student_centre_page    | go_to_teacher_dashboard  | waitForElement |       | 10      |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                | field                   | action | value       | timeout |
      | student_centre_page | go_to_teacher_dashboard | click  |             |         |
      |                     |                         | sleep  | 5           |         |
      | student_centre_page | teacher_password        | type   | ${password} |         |
      | student_centre_page | submit                  | click  |             |         |
      |                     |                         | sleep  | 5           |         |
    And the user performs to verify navigation from 'go to teacher Dashboard' to 'teacher dashboard':
      | page                   | field             | action              | value             | timeout |
      |                        |                   | waitForUrlToContain | teacher/dashboard | 10      |
      | teacher_dashboard_page | teacher_dashboard | verifyText          | Class Dashboard         |         |

  @B2B0002 @smoke @preprod @QA_Sandeep @staging @prod @api_teacher_signin @Functionality_addClass @SL-TC-1770
  Scenario: B2B0002_Verify teacher is able to add a class successfully
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
    And the user performs below to select 'add class'from dropdown on teacher dashboard:
      | page                    | field               | action                | value         | timeout |
      | teacher_dashboard_page  | view_klasses_list   | click                 |               | 5       |
      | teacher_dashboard_page  | add_klass           | waitForElementVisible |               |         |
      | teacher_dashboard_page  | add_klass           | click                 |               | 5       |
      | add_klass_students_page | create_new_klass    | waitForElement        |               | 10      |
      | add_klass_students_page | klass_name          | type                  | classfirst    |         |
      | add_klass_students_page | klass_grade         | click                 |               |         |
      | add_klass_students_page | klass_grade         | select                | Grade 2       |         |
      | add_klass_students_page | klass_subject       | click                 |               |         |
      | add_klass_students_page | klass_subject       | select                | Math          |         |
      | add_klass_students_page | create_new_klass    | click                 |               |         |
      |                         |                     | sleep                 | 5             |         |
      | add_klass_students_page | add_students        | waitForElement        |               | 10      |
      | add_klass_students_page | student_names       | type                  | adam,alex,sam |         |
      | add_klass_students_page | add_students        | click                 |               |         |
      | add_klass_students_page | done_adding_student | waitForElement        |               | 10      |
      | add_klass_students_page | done_adding_student | click                 |               |         |
      |                         |                     | sleep                 | 5             |         |
    And call custom method for closing the studentLoginInstruction pop up using:
      | klass          | method                            |
      | TeacherLibrary | closeStudentLoginInstructionModal |
    And call custom method for verifying added klass in the list using:
      | klass          | method              | params             |
      | TeacherLibrary | verifyNewAddedKlass | ${data.klass_name} |
    And call custom method for deleting added klass as a clean up using:
      | klass          | method           | params             |
      | TeacherLibrary | deleteAddedKlass | ${data.klass_name} |

  @B2B0001 @preprod @QA_Sandeep @staging @prod @Functionality_verifyTeacherLogin @SL-TC-1862
  Scenario: B2B0001_Verify teacher should be able to logged in successfully and navigate to the dashboard
    Given the user opens "signin" page
    And call custom method for signin using:
      | klass          | method | params                             |
      | TeacherLibrary | login  | ${data.username}, ${data.password} |
    And call custom method for closing the Springboard Enroll pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSpringboardModal |
    And call custom method for closing the Splashlearn Community pop up using:
      | klass          | method                         |
      | TeacherLibrary | closeSplashlearnCommunityModal |
    And the user performs to verify user is on teacher dashboard :
      | page                   | field             | action              | value              | timeout |
      |                        |                   | waitForUrlToContain | /teacher/dashboard | 10      |
      | teacher_dashboard_page | teacher_dashboard | verifyText          | Class Dashboard          |         |

  @B2B0003 @preprod @QA_Sandeep @staging @prod @api_teacher_signin @Functionality_visitStudentDashboard @SL-TC-1863
  Scenario: B2B0003_Verify teacher is able to visit student dashboard successfully
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
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying teacher lands on student dashboard successfully using:
      | klass          | method                 |
      | TeacherLibrary | verifyStudentDashboard |

  @student_login @api_teacher_signin @class_code @ashutosh @QA_Saurabh @do_not_run @staging @preprod @prod
  Scenario Outline: Verify correct class code is copied and student is able to login via class code and text/picture password
    Given read test data for <TestCaseId>
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
    When call custom method for storing class information using:
      | klass          | method                                 | params             |
      | TeacherLibrary | storeClassCodeAndPasswordFromClipboard | ${data.class_name} |
    And the user performs below to delete all cookies and open new window :
      | action            | value  | timeout | var                      |
      | deleteAllCookies  |        |         |                          |
      | switchToNewWindow | window |         | teacher_dashboard_handle |
    And the user opens "student" page
    And call custom method for login as student using:
      | klass          | method                   | params             |
      | TeacherLibrary | studentLoginViaClassCode | , ${data.student2} |
    And call custom method for parent signup if mandatory popup is present using:
      | klass          | method                | params           |
      | TeacherLibrary | mandatoryParentSignUp | ${data.student2} |
    And the user performs below to take screenshot of student-dashboard page:
      | page | field | action     | value | timeout |
      |      |       | screenshot |       |         |

    @B2B0047 @single_thread @text_password @preprod
    Examples:
      | TestCaseId |
      | B2B0047    |

    @B2B0048 @single_thread @picture_password @preprod
    Examples:
      | TestCaseId |
      | B2B0048    |

  @B2B0181 @QA_Sandeep @Functionality_USTeacher_NoLinkedStudent @staging @preprod @prod
  Scenario: B2B0181_Verify parent connected count on US Teacher Dashboard for no linked Student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify parent connected count when no student is linked

  @B2B0182 @QA_Sandeep @Functionality_AUSTeacher_NoLinkedStudent @staging @preprod @prod
  Scenario: B2B0182_Verify parent connected count on AUS Teacher Dashboard for no linked Student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify parent connected count when no student is linked

  @B2B0183 @QA_Sandeep @Functionality_UKTeacher_NoLinkedStudent @staging @preprod @prod
  Scenario: B2B0183_Verify parent connected count on UK Teacher Dashboard for no linked Student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify parent connected count when no student is linked

  @B2B0184 @QA_Sandeep @Functionality_USTeacher_LinkedStudent @staging @preprod @prod @do_not_run
  Scenario: B2B0184_Verify parent connected count on US Teacher Dashboard for linked Student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify parent connected count when student is linked

  @B2B0185 @QA_Sandeep @Functionality_AUSTeacher_LinkedStudent @staging @preprod @prod @do_not_run
  Scenario: B2B0185_Verify parent connected count on AUS Teacher Dashboard for linked Student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify parent connected count when student is linked

  @B2B0186 @QA_Sandeep @Functionality_UKTeacher_LinkedStudent @staging @preprod @prod @do_not_run
  Scenario: B2B0186_Verify parent connected count on UK Teacher Dashboard for linked Student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify parent connected count when student is linked

  @B2B0187 @QA_Sandeep @Functionality_US_NudgeOnAssigningAssignment @staging @preprod @prod
  Scenario: B2B0187_Verify Nudge for New US users when user Assigns 3 LO from same group
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify Nudge appears when user assigns 3 LOs from same group

  @B2B0188 @QA_Sandeep @Functionality_AUS_NudgeOnAssigningAssignment @staging @preprod @prod
  Scenario: B2B0188_Verify Nudge for New AUS users when user Assigns 3 LO from same group
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify Nudge appears when user assigns 3 LOs from same group

  @B2B0189 @QA_Sandeep @Functionality_UK_NudgeOnAssigningAssignment @staging @preprod @prod
  Scenario: B2B0189_Verify Nudge for New UK users when user Assigns 3 LO from same group
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify Nudge appears when user assigns 3 LOs from same group

  @B2B0190 @QA_Sandeep @Functionality_US_NudgeOnNavigatingFromReviewPage @staging @preprod @prod
  Scenario: B2B0190_Verify Nudge for New US users when user navigates from review section page
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify Nudge appears when user navigates from review section page

  @B2B0191 @QA_Sandeep @Functionality_AUS_NudgeOnNavigatingFromReviewPage @staging @preprod @prod
  Scenario: B2B0191_Verify Nudge for New AUS users when user navigates from review section page
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify Nudge appears when user navigates from review section page

  @B2B0192 @QA_Sandeep @Functionality_UK_NudgeOnNavigatingFromReviewPage @staging @preprod @prod
  Scenario: B2B0192_Verify Nudge for New UK users when user navigates from review section page
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify Nudge appears when user navigates from review section page

  @B2B0193 @QA_Sandeep @Functionality_US_NudgeForLinkedStudent @staging @preprod @prod
  Scenario: B2B0193_Verify Nudge for US users class where atleast 1 student is linked
    Given the user is on login page
    And the user logins into application
    Then verify Nudge not appears when user navigates from review section page

  @B2B0194 @QA_Sandeep @Functionality_AUS_NudgeForLinkedStudent @staging @preprod @prod
  Scenario: B2B0194_Verify Nudge for AUS users class where atleast 1 student is linked
    Given the user is on login page
    And the user logins into application
    Then verify Nudge not appears when user navigates from review section page

  @B2B0195 @QA_Sandeep @Functionality_UK_NudgeForLinkedStudent @staging @preprod @prod
  Scenario: B2B0195_Verify Nudge for UK users class where atleast 1 student is linked
    Given the user is on login page
    And the user logins into application
    Then verify Nudge not appears when user navigates from review section page

  @B2B0196 @QA_Sandeep @Functionality_US_NudgeForExistingUser @staging @preprod @prod
  Scenario: B2B0196_Verify Nudge for existing US users
    Given the user is on login page
    And the user logins into application
    Then verify Nudge for existing user

  @B2B0197 @QA_Sandeep @Functionality_AUS_NudgeForExistingUser @staging @preprod @prod
  Scenario: B2B0197_Verify Nudge for existing AUS users
    Given the user is on login page
    And the user logins into application
    Then verify Nudge for existing user

  @B2B0198 @QA_Sandeep @Functionality_UK_NudgeForExistingUser @staging @preprod @prod
  Scenario: B2B0198_Verify Nudge for existing UK users
    Given the user is on login page
    And the user logins into application
    Then verify Nudge for existing user