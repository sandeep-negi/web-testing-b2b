@b2b @reading @reading_assignment @teacher @regression

Feature: Klass Reading Assignment feature

  @B2B0030 @smoke @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_whole_class @create_assignment @whole_class @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1768
  Scenario: B2B0030_Verify user is able to create Reading Assignment of 'Letters A - Z' for whole class

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
    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for whole class using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to select whole class to assign assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |
      | assignment_sub_page | select_whole_class | click                 |       | 5       |
#      | assignment_sub_page | assign_button | click                 |       | 5       |
#      |                     |               | sleep                 | 3     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                       |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | Test1, ${data.class_subject} |


  @B2B0031 @ashutosh @QA_Saurabh @api_teacher_signin @reading_whole_class @create_assignment @whole_clas @load_entity_context @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1844
  Scenario: B2B0031_Verify user is able to create Reading Assignment of 'Reading Words' for whole class

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

    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for whole class using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to select whole class to assign assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |
      | assignment_sub_page | select_whole_class | click                 |       | 5       |
#      | assignment_sub_page | assign_button | click                 |       | 5       |
#      |                     |               | sleep                 | 3     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                       |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | Test1, ${data.class_subject} |


  @B2B0032 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_whole_class @create_assignment @whole_class @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1845
  Scenario: B2B0032_Verify user is able to create Reading Assignment of 'Sight Words' for whole class

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
    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for whole class using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to select whole class to assign assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |
      | assignment_sub_page | select_whole_class | click                 |       | 5       |
#      | assignment_sub_page | assign_button | click                 |       | 5       |
#      |                     |               | sleep                 | 3     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                       |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | Test2, ${data.class_subject} |


  @B2B0033 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_whole_class @create_assignment @whole_class @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1846
  Scenario: B2B0033_Verify user is able to create Reading Assignment of 'Decodable Books' for whole class

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
    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for whole class using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to select whole class to assign assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |
      | assignment_sub_page | select_whole_class | click                 |       | 5       |
#      | assignment_sub_page | assign_button | click                 |       | 5       |
#      |                     |               | sleep                 | 3     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                       |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | Test1, ${data.class_subject} |

  @B2B0034 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_whole_class @create_assignment @whole_class @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1847
  Scenario: B2B0034_Verify user is able to create Reading Assignment of 'Leveled Readers' for whole class

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

    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for whole class using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to select whole class to assign assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |
      | assignment_sub_page | select_whole_class | click                 |       | 5       |
#      | assignment_sub_page | assign_button | click                 |       | 5       |
#      |                     |               | sleep                 | 3     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                       |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | Test1, ${data.class_subject} |

  @B2B0035 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_selected_students @create_assignment @selected_students
  @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1848
  Scenario: B2B0035_Verify user is able to create Reading Assignment of 'Letters A - Z' for selected students

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

    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    When call custom method for creating assignment for selected students using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

#    And the user performs below to click on 'Selected Students' to assign the assignment :
#      | page                | field             | action                | value | timeout |
#      | assignment_sub_page | whole_class       | waitForElementVisible |       |         |

    And the user performs below to click on 'Selected Students' to assign the assignment :
      | page                | field             | action                | value | timeout |
      | assignment_sub_page | selected_students | waitForElementVisible |       |         |
      | assignment_sub_page | selected_students | click                 |       | 5       |
      |                     |                   | sleep                 | 3     |         |

    And call custom method for selecting the students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    Then call custom method for editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |

    Then call custom method for verifying the assignment for selected students using:
      | klass          | method                              | params                                             |
      | TeacherLibrary | verifyAssignmentForSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for  again closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student2}, ${data.class_subject} |

  @B2B0036 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_selected_students @create_assignment @selected_students @staging @preprod @prod
  @api_mark_all_assignments_complete @SL-TC-1849
  Scenario: B2B0036_Verify user is able to create Reading Assignment of 'Reading Words' for selected students

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

    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    When call custom method for creating assignment for selected students using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

#    And the user performs below to click on 'Selected Students' to assign the assignment :
#      | page                | field             | action                | value | timeout |
#      | assignment_sub_page | whole_class       | waitForElementVisible |       |         |

    And the user performs below to click on 'Selected Students' to assign the assignment :
      | page                | field             | action                | value | timeout |
      | assignment_sub_page | selected_students | waitForElementVisible |       |         |
      | assignment_sub_page | selected_students | click                 |       | 5       |
      |                     |                   | sleep                 | 3     |         |

    And call custom method for selecting the students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    Then call custom method for editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |


    Then call custom method for verifying the assignment for selected students using:
      | klass          | method                              | params                                             |
      | TeacherLibrary | verifyAssignmentForSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for  again closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |


    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}, ${data.class_subject} |

  @B2B0037 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_selected_students @create_assignment @selected_students
  @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1850
  Scenario: B2B0037_Verify user is able to create Reading Assignment of 'Sight Words' for selected students

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
    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    When call custom method for creating assignment for selected students using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

#    And the user performs below to click on 'Selected Students' to assign the assignment :
#      | page                | field             | action                | value | timeout |
#      | assignment_sub_page | whole_class       | waitForElementVisible |       |         |

    And the user performs below to click on 'Selected Students' to assign the assignment :
      | page                | field             | action                | value | timeout |
      | assignment_sub_page | selected_students | waitForElementVisible |       |         |
      | assignment_sub_page | selected_students | click                 |       | 5       |
      |                     |                   | sleep                 | 3     |         |
    And call custom method for selecting the students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |
    Then call custom method for editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |
    Then call custom method for verifying the assignment for selected students using:
      | klass          | method                              | params                                             |
      | TeacherLibrary | verifyAssignmentForSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for  again closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |
    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student3}, ${data.class_subject} |

  @B2B0038 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_selected_students @create_assignment @selected_students
  @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1851
  Scenario: B2B0038_Verify user is able to create Reading Assignment of 'Decodable Books' for selected students

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
    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    When call custom method for creating assignment for selected students using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

#    And the user performs below to click on 'Selected Students' to assign the assignment :
#      | page                | field             | action                | value | timeout |
#      | assignment_sub_page | whole_class       | waitForElementVisible |       |         |

    And the user performs below to click on 'Selected Students' to assign the assignment :
      | page                | field             | action                | value | timeout |
      | assignment_sub_page | selected_students | waitForElementVisible |       |         |
      | assignment_sub_page | selected_students | click                 |       | 5       |
      |                     |                   | sleep                 | 3     |         |

    And call custom method for selecting the students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    Then call custom method for editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |


    Then call custom method for verifying the assignment for selected students using:
      | klass          | method                              | params                                             |
      | TeacherLibrary | verifyAssignmentForSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for  again closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student2}, ${data.class_subject} |

  @B2B0039 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_selected_students @create_assignment @selected_students
  @api_mark_all_assignments_complete @staging @preprod @prod @SL-TC-1852
  Scenario: B2B0039_Verify user is able to create Reading Assignment of 'Leveled Readers' for selected students

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
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for selected students using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

#    And the user performs below to click on 'Selected Students' to assign the assignment :
#      | page                | field             | action                | value | timeout |
#      | assignment_sub_page | whole_class       | waitForElementVisible |       |         |

    And the user performs below to click on 'Selected Students' to assign the assignment :
      | page                | field             | action                | value | timeout |
      | assignment_sub_page | selected_students | waitForElementVisible |       |         |
      | assignment_sub_page | selected_students | click                 |       | 5       |
      |                     |                   | sleep                 | 3     |         |

    And call custom method for selecting the students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    Then call custom method for editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |

    Then call custom method for verifying the assignment for selected students using:
      | klass          | method                              | params                                             |
      | TeacherLibrary | verifyAssignmentForSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for  again closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student3}, ${data.class_subject} |

  @B2B0053 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @reading_assignment @preview
  @api_mark_all_assignments_complete @do_not_run @staging @preprod @prod
  Scenario: B2B0053_Verify user is able to preview the assignment

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
    When call custom method for opening SubMenu using:
      | klass          | method            | params                                                   |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating assignment for whole class using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to select whole class to assign assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |
      | assignment_sub_page | select_whole_class | click                 |       | 5       |
      |                     |                    | sleep                 | 5     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    And the user performs below to open the playable and close it :
      | page   | field               | action                | value | timeout | locator                               |
      |        |                     | click                 |       |         | xpath=>//*[text()='${data.playable}'] |
      | common | iframe_close_button | waitForElementVisible |       |         |                                       |
      |        |                     | screenshot            |       |         |                                       |
      | common | iframe_close_button | click                 |       |         |                                       |

    And call custom method for closing the preview popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

  @B2B0051 @regression @reading_assignment_delete_yes @preprod @QA_Sandeep @staging @prod @api_teacher_signin @Functionality_deleteAssignmentOn_Yes @SL-TC-1853
  Scenario: B2B0051_Verify user is able to delete Assignment for whole class after clicking 'yes' on delete Assignment pop up
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
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment class |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_reading_menu   | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                                      |
      | TeacherLibrary | verifyAssignedAssignment | Identify and place r blends in a word, Assigned to whole class, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                                |
      | TeacherLibrary | createAssignment | Identify and place r blends in a word |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                                   |
      | TeacherLibrary | verifyAssignedAssignment | Identify and place r blends in a word, Assigned to whole class, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                                  | params                                                                 |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboardHavingSubject | Assignment class, reading, Identify and place r blends in a word, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value       | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | student_centre_page    | teacher_password        | type   | ${password} |         |
      | student_centre_page    | submit                  | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | teacher_dashboard_page | view_klasses_list       | click  |             | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment class |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_reading_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                                        |
      | TeacherLibrary | selectUserActionForAssignment | Identify and place r blends in a word, Delete |
    And call custom method for confirm user action for Assignment using:
      | klass          | method                              | params |
      | TeacherLibrary | confirmUserActionToDeleteAssignment | Yes    |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assignment text after deleting using:
      | klass          | method                 | params                                        |
      | TeacherLibrary | verifyUnAssignedLOText | Identify and place r blends in a word, Assign |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                                  | params                                                                    |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboardHavingSubject | Assignment class, reading, Identify and place r blends in a word, notAssigned |

  @B2B0052 @regression @reading_assignment_mark_as_complete_yes @preprod @QA_Sandeep @staging @prod @api_teacher_signin @Functionality_completeAssignmentOn_Yes @SL-TC-1854
  Scenario: B2B0052_Verify user is able to complete Assignment for class after clicking 'yes' on complete Assignment pop up
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
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment class |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_reading_menu           | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                                      |
      | TeacherLibrary | verifyAssignedAssignment | Identify and place r blends in a word, Assigned to whole class, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                                |
      | TeacherLibrary | createAssignment | Identify and place r blends in a word |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                                   |
      | TeacherLibrary | verifyAssignedAssignment | Identify and place r blends in a word, Assigned to whole class, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                                  | params                                                                 |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboardHavingSubject | Assignment class, reading, Identify and place r blends in a word, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value       | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | student_centre_page    | teacher_password        | type   | ${password} |         |
      | student_centre_page    | submit                  | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | teacher_dashboard_page | view_klasses_list       | click  |             | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment class |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_reading_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                                                  |
      | TeacherLibrary | selectUserActionForAssignment | Identify and place r blends in a word, Mark as complete |
    And call custom method for confirm user action for Assignment using:
      | klass          | method                              | params |
      | TeacherLibrary | confirmUserActionToDeleteAssignment | Yes    |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assignment text on teacher dashboard after marking complete using:
      | klass          | method                 | params                                        |
      | TeacherLibrary | verifyUnAssignedLOText | Identify and place r blends in a word, Assign |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                                  | params                                                                    |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboardHavingSubject | Assignment class, reading, Identify and place r blends in a word, notAssigned |

  @B2B0050 @regression @edit_reading_assignment @preprod @QA_Sandeep @staging @prod @api_teacher_signin @Functionality_editAssignment @SL-TC-1855
  Scenario: B2B0050_Verify user is able to edit Assignment for class
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
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment class |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_reading_menu           | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                                      |
      | TeacherLibrary | verifyAssignedAssignment | Identify and place r blends in a word, Assigned to 1 student(s), notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                                |
      | TeacherLibrary | createAssignment | Identify and place r blends in a word |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                                   |
      | TeacherLibrary | verifyAssignedAssignment | Identify and place r blends in a word, Assigned to whole class, assigned |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                                      |
      | TeacherLibrary | selectUserActionForAssignment | Identify and place r blends in a word, Edit |
    And call custom method for editing practice for Assignment using:
      | klass          | method                           | params |
      | TeacherLibrary | editAssignedAssignmentForStudent | 1      |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                       |
      | TeacherLibrary | verifyAssignedAssignmentForSelectedStudent | assignment class, ELA, Identify and place r blends in a word |

  @B2B0152 @QA_Sandeep @Functionality_CompleteReadingAssignment_LO @staging @SL-TC-2247 @preprod
  Scenario: B2B0152_Verify user should able to complete ELA Assignment by playing playables
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    And user resolves his timezone
    And the user stores klass classcode and password
    When user creates assignment for class using api
    And user completes reading assignment using api
    Then assignment should be marked as completed on track Assignment page
    And reading assignment should be marked as completed on student dashboard section
