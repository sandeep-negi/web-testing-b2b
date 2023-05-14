@b2b @practice_math_fact @regression @teacher @preprod @staging

Feature: Practice math facts feature
  To test practice math facts scenario

  @B2B000065 @practice_math_fact @regression @b2b_regression @do_not_run @duplicate_test_case
  Scenario: B2B000065_Teacher should be able to assign auto mode math practice to whole class
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field        | action | value                                    | timeout |
      | signin            | parent       | click  |                                          | 10      |
      | registration_page | parent_email | type   | webtesting+ss26may_n1nt1@splashlearn.com |         |
      | registration_page | Password     | type   | 123456                                   |         |
      | signin            | login        | click  |                                          | 10      |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |

    And the user performs click on assign new math fact practice
      | page                     | field              | action                | value | timeout |
      | assign_fact_fluency_page | assign_button      | waitForElementVisible |       | 200     |
      | assign_fact_fluency_page | assign_button      | click                 |       | 20      |
      | assign_fact_fluency_page | assign_whole_class | waitForElementVisible |       | 20      |
    And the user performs click on assign to whole class
      | page                     | field              | action                | value | timeout |
      | assign_fact_fluency_page | assign_whole_class | waitForElementVisible |       | 200     |
      | assign_fact_fluency_page | assign_whole_class | click                 |       | 20      |

    Then the user performs to see assigned successfully pop up
      | page                     | field      | action                | value | timeout |
      | assign_fact_fluency_page | share_link | waitForElementVisible |       | 20      |


  @B2B0080 @smoke @ashutosh @QA_Saurabh @assign_math_facts @whole_class @api_teacher_signin @staging @preprod @prod @unassign_math_facts @Functionality_assignMathFactToWholeClass @SL-TC-1765
  Scenario: B2B0080_Teacher should be able to assign maths practice to whole class successfully
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    * call custom method for assigning Math facts to whole class using:
      | klass          | method                                | params                     |
      | TeacherLibrary | assignMathFactsToWholeClassOnWeekDays | Addition & Subtraction, 10 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    * call custom method for assigning Math facts assignment on student dashboard using:
      | klass          | method                                                   | params                          |
      | TeacherLibrary | verifyMFFAssignmentOnStudentDashboardForMultipleStudents | test1, ${data.class_subject}, 5 |

  @B2B0081 @ashutosh @QA_Saurabh @assign_math_facts @selected_students @api_teacher_signin @staging @preprod @prod @unassign_math_facts @Functionality_assignMathFactToSelectedStudents @SL-TC-1814
  Scenario: B2B0081_Teacher should be able to assign math practice to selected students
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    * call custom method for assigning Math facts to selected students using:
      | klass          | method                                      | params                                  |
      | TeacherLibrary | assignMathFactsToSelectedStudentsOnWeekDays | Addition & Subtraction, 30, test1-test2 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    * call custom method for assigning Math facts assignment on student dashboard using:
      | klass          | method                                                   | params                          |
      | TeacherLibrary | verifyMFFAssignmentOnStudentDashboardForMultipleStudents | test1, ${data.class_subject}, 5 |

  @B2B0083 @practice_math_fact @preprod @QA_Sandeep @do_not_run
  Scenario: B2B0083_Verify teacher should able to change fact fluency settings before assigning to students

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
    And call custom method for handling mathFactModal using:
      | klass          | method              |
      | TeacherLibrary | handleMathFactModal |
    And call custom method for closing the studentLoginInstruction pop up using:
      | klass          | method                            |
      | TeacherLibrary | closeStudentLoginInstructionModal |
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |

    And call custom method for deleting existing klass using:
      | klass          | method              | params      |
      | TeacherLibrary | deleteKlassIfExists | Class First |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params           |
      | TeacherLibrary | selectActionFromManageAllClass | Class First, Add |
    And call custom method for closing the studentLoginInstruction pop up using:
      | klass          | method                            |
      | TeacherLibrary | closeStudentLoginInstructionModal |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                  |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                          |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Class First'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Class First'] |
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for verifying new added class on Manage all Classes screen using:
      | klass          | method            | params           |
      | TeacherLibrary | verifyKlassExists | Class First, Yes |
    And call custom method for selecting Go to Class from manage all classes screen using:
      | klass          | method                         | params                   |
      | TeacherLibrary | selectActionFromManageAllClass | Class First, Go to Class |
    And the user performs below to verify current class
      | page                   | field            | action                | value | timeout |
      | teacher_dashboard_page | account_dropdown | waitForElementVisible |       |         |
    And call custom method for verifying class on teacher dashboard screen using:
      | klass          | method                        | params      |
      | TeacherLibrary | verifyClassOnTeacherDashboard | Class First |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |

    And the user performs click on assign new math fact practice
      | page                     | field         | action                | value | timeout |
      | assign_fact_fluency_page | assign_button | waitForElementVisible |       | 200     |
      | assign_fact_fluency_page | assign_button | click                 |       | 20      |
    And call custom method for selecting fact fluency on screen using:
      | klass          | method                  |
      | TeacherLibrary | selectUnselectedOptions |

  @B2B0084 @ashutosh @QA_Saurabh @mf_view_progress @api_teacher_signin @staging @prod @Functionality_mathfactProgress @SL-TC-1815
  Scenario: B2B0084_Verify teacher is able to view progress for Math facts assignment

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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    And call custom method for opening view progress using:
      | klass          | method                |
      | TeacherLibrary | viewMathFactsProgress |
    And the user performs : screenshot capture step
      | action     |
      | screenshot |

  @B2B0085 @ashutosh @QA_Saurabh @mf_student_progress @api_teacher_signin @staging @do_not_run
  Scenario: B2B0085_Teacher should be able to view student progress - screens in progress

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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    And call custom method for opening view progress using:
      | klass          | method                |
      | TeacherLibrary | viewMathFactsProgress |
    And the user performs : screenshot capture step
      | action     |
      | screenshot |

  @B2B0086 @ashutosh @QA_Saurabh @mf_class_progress @api_teacher_signin @staging @do_not_run
  Scenario: B2B0086_Teacher should be able to view class report - screens in progress

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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    And call custom method for opening view progress using:
      | klass          | method                |
      | TeacherLibrary | viewMathFactsProgress |
    And the user performs : screenshot capture step
      | action     |
      | screenshot |

  @B2B0087 @ashutosh @QA_Saurabh @mf_DAR @api_teacher_signin @staging @do_not_run
  Scenario: B2B0087_Teacher should be able to view DAR report and DAR Pop Up - screens in progress

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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    And call custom method for opening view progress using:
      | klass          | method                |
      | TeacherLibrary | viewMathFactsProgress |
    And the user performs : screenshot capture step
      | action     |
      | screenshot |

  @B2B0090 @QA_Sandeep @un_assign_math_facts @whole_class @api_teacher_signin @staging @preprod @prod @Functionality_unassignMathfact_forAll @SL-TC-1816
  Scenario: B2B0090_Verify Teacher should be able to unassign Math fact practice for all students
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params    |
      | TeacherLibrary | selectKlassFromDropDown | math fact |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    * call custom method for assigning Math facts to whole class using:
      | klass          | method                                | params                     |
      | TeacherLibrary | assignMathFactsToWholeClassOnWeekDays | Addition & Subtraction, 30 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |

    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                             |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | math fact, Fact practice, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value            | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | student_centre_page    | teacher_password        | type   | ${data.password} |         |
      | student_centre_page    | submit                  | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | teacher_dashboard_page | view_klasses_list       | click  |                  | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params    |
      | TeacherLibrary | selectKlassFromDropDown | math fact |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |
    * call custom method for unassigning Math from whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | math fact, Fact practice, notAssigned |

  @B2B0091 @QA_Sandeep @un_assign_math_facts @selected_student @api_teacher_signin @staging @preprod @prod @Functionality_unassignMathfact_forFew @SL-TC-1817
  Scenario: B2B0091_Verify Teacher should be able to unassign Math fact practice for few students
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params    |
      | TeacherLibrary | selectKlassFromDropDown | math fact |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    * call custom method for assigning Math facts to whole class using:
      | klass          | method                                | params                     |
      | TeacherLibrary | assignMathFactsToWholeClassOnWeekDays | Addition & Subtraction, 30 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                             |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | math fact, Fact practice, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value            | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | student_centre_page    | teacher_password        | type   | ${data.password} |         |
      | student_centre_page    | submit                  | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | teacher_dashboard_page | view_klasses_list       | click  |                  | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params    |
      | TeacherLibrary | selectKlassFromDropDown | math fact |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |
    * call custom method for unassigning Math for selected student using:
      | klass          | method                              | params |
      | TeacherLibrary | unassignMathFactsToSelectedStudents | 1      |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                         |
      | TeacherLibrary | verifyAssignedAssignmentForSelectedStudent | math fact, MATH, Fact practice |

  @B2B0092 @QA_Sandeep @api_teacher_signin @staging @kindergarten_math @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1818
  Scenario: B2B0092_Verify Math Fact should not be visible for kindergarten math class
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting existing klass using:
      | klass          | method              | params             |
      | TeacherLibrary | deleteKlassIfExists | Kindergarten Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params                                 |
      | TeacherLibrary | addNewClassFromManageKlassPage | Kindergarten Class, Kindergarten, Math |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                         |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                                 |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Kindergarten Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Kindergarten Class'] |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params     |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |

  @B2B0093 @QA_Sandeep @api_teacher_signin @staging @kindergarten_reading @preprod @prod @Functionality_mathFact_eligibleSubject @SL-TC-1819
  Scenario: B2B0093_Math Fact should not be visible for kindergarten reading class
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting existing klass using:
      | klass          | method              | params             |
      | TeacherLibrary | deleteKlassIfExists | Kindergarten Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params                                 |
      | TeacherLibrary | addNewClassFromManageKlassPage | Kindergarten Class, Kindergarten, Reading |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                         |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                                 |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Kindergarten Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Kindergarten Class'] |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params     |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |

  @B2B0094 @QA_Sandeep @api_teacher_signin @staging @kindergarten_math_reading @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1820
  Scenario: B2B0094_Math Fact should not be visible for kindergarten math-reading class
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting existing klass using:
      | klass          | method              | params             |
      | TeacherLibrary | deleteKlassIfExists | Kindergarten Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params                                 |
      | TeacherLibrary | addNewClassFromManageKlassPage | Kindergarten Class, Kindergarten, Math + Reading |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                         |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                                 |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Kindergarten Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Kindergarten Class'] |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params     |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |

  @B2B0095 @QA_Sandeep @api_teacher_signin @staging @grade1 @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1821
  Scenario: B2B0095_Verify Math fact should visible for Math subject class having Grade greater than K
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting existing klass using:
      | klass          | method              | params     |
      | TeacherLibrary | deleteKlassIfExists | Math Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params                    |
      | TeacherLibrary | addNewClassFromManageKlassPage | Math Class, Grade 1, Math |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                 |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                         |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Math Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Math Class'] |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | visible |

  @B2B0096 @QA_Sandeep @api_teacher_signin @staging @grade1 @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1822
  Scenario: B2B0096_Verify Math fact should visible for Math+Reading subject class having Grade greater than K
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting existing klass using:
      | klass          | method              | params     |
      | TeacherLibrary | deleteKlassIfExists | Math Reading Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params                    |
      | TeacherLibrary | addNewClassFromManageKlassPage | Math Reading Class, Grade 1, Math + Reading |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                 |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                         |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Math Reading Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Math Reading Class'] |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | visible |

  @B2B0097 @QA_Sandeep @api_teacher_signin @staging @grade1 @preprod @prod @Functionality_mathFact_eligibleSubject @SL-TC-1823
  Scenario: B2B0097_Verify Math fact should not visible for Reading subject class having Grade greater than K
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting existing klass using:
      | klass          | method              | params     |
      | TeacherLibrary | deleteKlassIfExists | Reading Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params                    |
      | TeacherLibrary | addNewClassFromManageKlassPage | Reading Class, Grade 1, Reading |
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                 |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                         |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Reading Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Reading Class'] |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |

  @B2B0098 @QA_Sandeep @assign_math_facts @whole_class @api_teacher_signin @staging @unassign_math_facts @preprod @prod @Functionality_assignMF_from_TrackFactFluency @SL-TC-1824
  Scenario: B2B0098_Verify Teacher should be able to assign Math Fact from Track Fact Fluency section
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, Track fact practice |
    Then the user performs 'click on fact practice button'
      | page                     | field                    | action                | value | timeout |
      | assign_fact_fluency_page | go_to_fact_practice      | click                 |       |         |
      | assign_fact_fluency_page | assign_adaptive_practice | waitForElementVisible |       |         |

    * call custom method for assigning Math facts from track fact fluency to whole class using:
      | klass          | method                                          | params                     |
      | TeacherLibrary | assignMathFactsToWholeClassFromTrackFactFluency | Addition & Subtraction, 30 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    * call custom method for verifying assigned Math facts assignment on student dashboard using:
      | klass          | method                                                   | params                                |
      | TeacherLibrary | verifyMFFAssignmentOnStudentDashboardForMultipleStudents | test1 test2, ${data.class_subject}, 5 |

  @B2B0099 @QA_Sandeep @change_grade @api_teacher_signin @staging @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1825
  Scenario: B2B0099_Verify Math Fact Fluency should not be visible for class whose grade changes from higher grade to grade K
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params     |
      | TeacherLibrary | selectKlassFromDropDown | math class |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |

    And call custom method for verifying if current grade is grade 1 using:
      | klass          | method                     | params  |
      | TeacherLibrary | changeGradeFromManageClass | Grade 1, math class |

    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | visible |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                              |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | math class, Fact practice, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value            | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | student_centre_page    | teacher_password        | type   | ${data.password} |         |
      | student_centre_page    | submit                  | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | teacher_dashboard_page | view_klasses_list       | click  |                  | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | math class |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |

    And call custom method for changing current class grade to grade K using:
      | klass          | method                     | params  |
      | TeacherLibrary | changeGradeFromManageClass | Kindergarten, math class |

    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                              |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | math class, Fact practice, notAssigned |

  @B2B00100 @QA_Sandeep @change_grade @api_teacher_signin @staging @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1826
  Scenario: B2B00100_Verify Math Fact Fluency should be visible for class whose grade changes from grade K to higher grade
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params     |
      | TeacherLibrary | selectKlassFromDropDown | kindergarten class |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |
    And call custom method for verifying if current grade is grade K using:
      | klass          | method                     | params  |
      | TeacherLibrary | changeGradeFromManageClass | Kindergarten, kindergarten class |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                              |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | kindergarten class, Fact practice, notAssigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value            | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | student_centre_page    | teacher_password        | type   | ${data.password} |         |
      | student_centre_page    | submit                  | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | teacher_dashboard_page | view_klasses_list       | click  |                  | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | kindergarten class |
    When the user performs below to open 'dashboard from left nav'
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | dashboard_section | click  |       |         |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |
    And call custom method for changing current class grade to grade 1 using:
      | klass          | method                     | params  |
      | TeacherLibrary | changeGradeFromManageClass | Grade 1, kindergarten class |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | visible |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                              |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | kindergarten class, Fact practice, assigned |

  @B2B00101 @QA_Sandeep @change_grade @api_teacher_signin @staging @preprod @prod @Functionality_mathFact_eligibleGrade @SL-TC-1827
  Scenario: B2B00101_Verify Math Fact should not be visible for class whose grade changes from grade K [reading] to higher grade [reading]
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params     |
      | TeacherLibrary | selectKlassFromDropDown | kindergarten class |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |
    And call custom method for verifying if current grade is grade K using:
      | klass          | method                     | params  |
      | TeacherLibrary | changeGradeFromManageClass | Kindergarten, kindergarten class |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |
    When the user performs below to open 'dashboard from left nav'
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | dashboard_section | click  |       |         |
    When the user performs below to open 'Class Settings'
      | page                   | field          | action | value | timeout |
      | teacher_dashboard_page | manage_class   | click  |       |         |
      | teacher_dashboard_page | class_settings | click  |       |         |
    And call custom method for changing current class grade to grade 1 using:
      | klass          | method                     | params  |
      | TeacherLibrary | changeGradeFromManageClass | Grade 1, kindergarten class |
    And call custom method for verifying math facts for current classroom using:
      | klass          | method                             | params  |
      | TeacherLibrary | verifyMathFactsForCurrentClassroom | not visible |

  @B2B00102 @QA_Sandeep @mf_practice_day @selected_student @api_teacher_signin @staging @preprod @prod @Functionality_mathFact_currentDayAsPractice @SL-TC-1828
  Scenario: B2B00102_Verify Today MFF practice Cards should be visible on student dashboard if current day is Practice Day
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params    |
      | TeacherLibrary | selectKlassFromDropDown | math fact |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    * call custom method for assigning Math facts to classroom using:
      | klass          | method                        | params                            |
      | TeacherLibrary | assignMathFactToParticularDay | today, Addition & Subtraction, 30 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                   |
      | TeacherLibrary | verifyCurrentPracticeDayOnStudentDashboard | math fact, Fact practice, assigned today |

  @B2B00103 @QA_Sandeep @mf_practice_day @selected_student @api_teacher_signin @staging @preprod @prod @@Functionality_mathFact_currentDayNotAsPracticeDay @SL-TC-1829
  Scenario: B2B00103_Verify MFF Today Card should not be visible to Student Dashboard if current day is not a Practice Day
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params    |
      | TeacherLibrary | selectKlassFromDropDown | math fact |
    When the user performs to see math practice of left nav and opens assign math practice page
      | page                     | field                | action                | value | timeout |
      | assign_fact_fluency_page | assign_fact_left_nav | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | assign_fact_left_nav | click                 |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | waitForElementVisible |       | 20      |
      | assign_fact_fluency_page | new_fact_practice    | click                 |       | 20      |

    * call custom method for unassigning Math facts if assigned to whole class using:
      | klass          | method                         |
      | TeacherLibrary | unassignMathFactsForWholeClass |

    * call custom method for assigning Math facts to classroom using:
      | klass          | method                        | params                                |
      | TeacherLibrary | assignMathFactToParticularDay | not today, Addition & Subtraction, 30 |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                           | params                                        |
      | TeacherLibrary | verifyCurrentMathFactPracticeDay | math fact, Fact practice, notPracticeDayToday |

  @B2B0105 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @Functionality_assign_customTest @SL-TC-1830
  Scenario: B2B0105_Teacher should be able to assign custom test to class
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for deleting custom assigned math facts using:
      | klass          | method                | params      |
      | TeacherLibrary | trackCustomTestPage | Delete |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for assigning Math facts from custom test using:
      | klass          | method                                      | params                           |
      | TeacherLibrary | assignCustomMathFactToAllStudents | ${data.operators}, 30, 5, Adam-Alex |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    * call custom method for assigning Math facts assignment on student dashboard using:
      | klass          | method                                                   | params                          |
      | TeacherLibrary | verifyCustomMFFAssignmentOnStudentDashboardForStudents | Adam, ${data.class_subject}       |

  @B2B0110 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @Functionality_mathFact_markComplete @SL-TC-1831
  Scenario: B2B0110_Verify Teacher should be able to complete test by marking it as complete
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for deleting custom assigned math facts using:
      | klass          | method                | params      |
      | TeacherLibrary | trackCustomTestPage | Delete |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for assigning Math facts from custom test using:
      | klass          | method                                      | params                           |
      | TeacherLibrary | assignCustomMathFactToAllStudents | ${data.operators}, 30, 5, Adam-Alex |
    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                             |
      | TeacherLibrary | verifyAssignedCustomMathFactOnStudentDashboard | ${data.class_name}, ${data.learning_objective}, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value            | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
      | student_centre_page    | teacher_password        | type   | ${data.password} |         |
      | student_centre_page    | submit                  | click  |                  |         |
      |                        |                         | sleep  | 5                |         |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for marking complete custom assigned math facts using:
      | klass          | method                | params      |
      | TeacherLibrary | trackCustomTestPage | Mark as complete |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                |
      | TeacherLibrary | verifyAssignedCustomMathFactOnStudentDashboard | ${data.class_name}, ${data.learning_objective}, not assigned |


  @B2B0107 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @Functionality_assignCustomTest_ToSelected @SL-TC-1832
  Scenario: B2B0107_Verify Teacher should be able to assign custom test to selected student
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for deleting custom assigned math facts using:
      | klass          | method                | params      |
      | TeacherLibrary | trackCustomTestPage | Delete |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for assigning Math facts from custom test using:
      | klass          | method                                      | params                           |
      | TeacherLibrary | assignCustomMathFactToSelectedStudents | ${data.operators}, 30, 5, Adam |
    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                             |
      | TeacherLibrary | verifyAssignedCustomMathFactForSelectedStudents | ${data.class_name}, ${data.learning_objective}|

  @B2B0108 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @Functionality_editCustomTest @SL-TC-1833
  Scenario: B2B0108_Verify Teacher should be able to edit test i.e remove or add student
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for deleting custom assigned math facts using:
      | klass          | method              | params |
      | TeacherLibrary | trackCustomTestPage | Delete |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for assigning Math facts from custom test using:
      | klass          | method                                 | params                         |
      | TeacherLibrary | assignCustomMathFactToAllStudents | ${data.operators}, 30, 5, Adam |
    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                         | params                                                   |
      | TeacherLibrary | verifyAssignedCustomMathFactOnStudentDashboard | ${data.class_name}, ${data.learning_objective}, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                | field                   | action | value            | timeout |
      | student_centre_page | go_to_teacher_dashboard | click  |                  |         |
      |                     |                         | sleep  | 5                |         |
      | student_centre_page | teacher_password        | type   | ${data.password} |         |
      | student_centre_page | submit                  | click  |                  |         |
      |                     |                         | sleep  | 5                |         |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for editing custom assigned math facts using:
      | klass          | method              | params    |
      | TeacherLibrary | trackCustomTestPage | Edit test |
    * call custom method for editing custom assigned math facts using:
      | klass          | method             |
      | TeacherLibrary | addOrRemoveStudent |
    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closeMathFactPopupIfPresent |

    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                          | params                                         |
      | TeacherLibrary | verifyAssignedCustomMathFactForSelectedStudents | ${data.class_name}, ${data.learning_objective} |

  @B2B0111 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @Functionality_filter_trackTest @SL-TC-1834
  Scenario: B2B0111_Verify Teacher should be able to use filter on track test page
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    And call custom method for verifying filter on track custom test page using:
      | klass          | method                            | params                                                                       |
      | TeacherLibrary | verifyFilterOnTrackCustomTestPage | ${data.all}, ${data.completed}, ${data.ongoing}, ${data.marked_as_completed} |

  @B2B0109 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @SL-TC-1835
  Scenario: B2B0109_Verify Teacher should be able to view customized math fact report on track test screen
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    And call custom method for verifying class report on track custom test page using:
      | klass          | method                            | params                                                                       |
      | TeacherLibrary | verifyProgressOFStudentsOnTrackCustomTestPage | ${data.Adam}-${data.Alex} |

  @B2B0106 @QA_Sandeep @api_teacher_signin @staging @preprod @prod @custom_math_fact @Functionality_printWorksheet @SL-TC-1836
  Scenario: B2B0106_Verify Teacher should be able to assign custom math fact using print worksheet
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |

    * call custom method for deleting custom assigned math facts using:
      | klass          | method              | params |
      | TeacherLibrary | trackCustomTestPage | Delete |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign facts, New fact practice |
    * call custom method for assigning Math facts from custom test using:
      | klass          | method         | params                   |
      | TeacherLibrary | printWorksheet | ${data.operators}, 30, 5 |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      |                        |                          | sleep  | 5     |         |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                |
      | TeacherLibrary | verifyAssignedCustomMathFactOnStudentDashboard | ${data.class_name}, ${data.learning_objective}, not assigned |

  @B2B0131 @QA_Sandeep @api_teacher_signin @empty_state @staging @custom_math_fact @preprod @prod @Functionality_No_CustomTestCompletedByClass @SL-TC-1837
  Scenario: B2B0131_Verify when no custom test is completed by Class
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign facts, Track fact practice |
    And the user performs below to select 'track custom test' :
      | page                | field                    | action | value | timeout |
      | assignment_sub_page | select_track_custom_test | click  |       |         |
    Then call custom method for verifying no custom test completed by class using:
      | klass          | method                       | params                                  |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Completed (0), No assignments completed |

  @B2B0132 @QA_Sandeep @api_teacher_signin @empty_state @staging @custom_math_fact @preprod @prod @Functionality_No_OngoingCustomTest @SL-TC-1838
  Scenario: B2B0132_Verify when there is no ongoing custom test
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign facts, Track fact practice |
    And the user performs below to select 'track custom test' :
      | page                | field                    | action | value | timeout |
      | assignment_sub_page | select_track_custom_test | click  |       |         |
    Then call custom method for verifying no ongoing custom test assigned to class using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyStateFromDropDown| Ongoing (0), No ongoing custom test |

  @B2B0133 @QA_Sandeep @api_teacher_signin @empty_state @staging @custom_math_fact @preprod @prod @Functionality_No_CustomTestMarkedAsCompleted @SL-TC-1839
  Scenario: B2B0133_Verify when no custom test is marked as completed
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign facts, Track fact practice |
    And the user performs below to select 'track custom test' :
      | page                | field                    | action | value | timeout |
      | assignment_sub_page | select_track_custom_test | click  |       |         |
    Then call custom method for verifying no custom test is marked as completed using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyStateFromDropDown| Marked as completed (0), Nothing to show |

  @B2B0134 @QA_Sandeep @api_teacher_signin @empty_state @staging @custom_math_fact @preprod @prod @Functionality_No_CustomTestAssigned @SL-TC-1840
  Scenario: B2B0134_Verify when there is no custom test assigned
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign facts, Track fact practice |
    And the user performs below to select 'track custom test' :
      | page                | field                    | action | value | timeout |
      | assignment_sub_page | select_track_custom_test | click  |       |         |
    Then call custom method for verifying no custom test assigned to class using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyState| no_math_fact_assigned, There's no fact practice assigned to track. |

  @B2B0135 @QA_Sandeep @api_teacher_signin @staging @empty_state @custom_math_fact @preprod @prod @Functionality_No_PracticeAssigned @SL-TC-1841
  Scenario: B2B0135_Verify when there is no practice assigned to class
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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                 |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign facts, Track fact practice |
    Then call custom method for verifying no custom test assigned to class using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyState| no_math_fact_assigned, There's no fact practice assigned to track. |


