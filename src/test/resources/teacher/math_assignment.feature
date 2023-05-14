@b2b @math_assignment @teacher

Feature: Klass Math Assignment feature

  @B2B0011 @smoke @regression @create_assignment @preprod @QA_Sandeep @staging @prod @api_teacher_signin @api_mark_all_assignments_complete @load_entity_context @SL-TC-1767

  Scenario: B2B0011_Verify user is able to create Assignment for whole class
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
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | Adam, ${data.class_subject} |

  @B2B0019 @regression @math_assignment_delete_yes @preprod @QA_Sandeep @staging @prod @Functionality_deleteAssignmentOn_Yes @SL-TC-1803
  Scenario: B2B0019_Verify user is able to delete Assignment for whole class after clicking 'yes' on delete Assignment pop up
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params          |
      | TeacherLibrary | selectKlassFromDropDown | assigment class |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu           | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                             |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                       |
      | TeacherLibrary | createAssignment | Recall addition using models |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                          |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                  |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | Assigment class, Recall addition using models, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value       | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | student_centre_page    | teacher_password        | type   | ${password} |         |
      | student_centre_page    | submit                  | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | teacher_dashboard_page | view_klasses_list       | click  |             | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params          |
      | TeacherLibrary | selectKlassFromDropDown | assigment class |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                               |
      | TeacherLibrary | selectUserActionForAssignment | Recall addition using models, Delete |
    And call custom method for confirm user action for Assignment using:
      | klass          | method                              | params |
      | TeacherLibrary | confirmUserActionToDeleteAssignment | Yes    |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assignment text after deleting using:
      | klass          | method                 | params                               |
      | TeacherLibrary | verifyUnAssignedLOText | Recall addition using models, Assign |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                     |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | Assigment class, Recall addition using models, notAssigned |

  @B2B0012 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @api_mark_all_assignments_complete @regression @create_assignment @selected_students @staging @preprod @prod @SL-TC-1804
  Scenario: B2B0012_Verify user is able to create Assignment for selected students

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for creating New assignment for selected students using:
      | klass          | method           | params                                            |
      | TeacherLibrary | createAssignment | ${data.content_group}, ${data.learning_objective} |

    When the user performs below to click on 'Assign to Selected Students'
      | page                | field             | action | value | timeout |
      | assignment_sub_page | selected_students | click  |       |         |

#    And the user performs below to click on 'Selected Students' to assign the assignment :
#      | page                | field       | action                | value | timeout |
#      | assignment_sub_page | whole_class | waitForElementVisible |       |         |

    And call custom method for assigning to selected students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And the user performs below to wait for few seconds
      | page | field | action | value | timeout |
      |      |       | sleep  | 4     |         |

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
      | klass          | method                                                | params                                                   |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}-${data.student2}, ${data.class_subject} |

  @B2B0017 @ashutosh @QA_Saurabh @api_teacher_signin @load_entity_context @api_create_assignment_selected_students @regression @edit_assignment @selected_students @staging @preprod @prod @SL-TC-1805
  Scenario: B2B0017_Verify user is able to edit Assignment for selected students

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Assign curriculum, New assignment |

    And call custom method for editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to click on 'Selected Students' to assign the assignment :
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |

    And call custom method for assigning to selected students using:
      | klass          | method                       | params                                             |
      | TeacherLibrary | assignmentToSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And the user performs below to wait for few seconds
      | page | field | action | value | timeout |
      |      |       | sleep  | 4     |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |

    Then call custom method for again editing the assignment for selected students using:
      | klass          | method         | params                                            |
      | TeacherLibrary | editAssignment | ${data.content_group}, ${data.learning_objective} |

    And the user performs below to wait for assignment popup to open:
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       |         |

    Then call custom method for verifying the assignment for selected students using:
      | klass          | method                              | params                                             |
      | TeacherLibrary | verifyAssignmentForSelectedStudents | ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for closing the assignment popup using:
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


  @B2B0020 @regression @math_assignment_delete_no @preprod @QA_Sandeep @staging @prod @Functionality_deleteAssignmentOn_No @SL-TC-1806
  Scenario: B2B0020_Verify user is not able to delete Assignment for class after clicking 'no' on delete Assignment pop up
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment klass |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu           | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                             |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                       |
      | TeacherLibrary | createAssignment | Recall addition using models |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And the user performs below to select track assignment in 'left nav bar' :
      | page | field | action | value | timeout | locator                                |
      |      |       | click  |       | 5       | xpath=>//li[text()='Track assignment'] |
      |      |       | sleep  | 5     |         |                                        |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                               |
      | TeacherLibrary | selectUserActionForAssignment | Recall addition using models, Delete |
    And call custom method for confirm user action for Assignment using:
      | klass          | method                              | params |
      | TeacherLibrary | confirmUserActionToDeleteAssignment | No     |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                          |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                   |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | assignment klass, Recall addition using models, assigned |
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
      | TeacherLibrary | selectKlassFromDropDown | assignment klass |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for deleting Assigned LO as a clean up using:
      | klass          | method                   | params                       |
      | TeacherLibrary | deleteAssignedAssignment | Recall addition using models |

  @B2B0022 @regression @math_assignment_mark_as_complete_no @preprod @QA_Sandeep @staging @prod @Functionality_completeAssignment_No @SL-TC-1807
  Scenario: B2B0022_Verify user is not able to complete Assignment for class after clicking 'no' on complete Assignment pop up
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assignment klass |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu           | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                             |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                       |
      | TeacherLibrary | createAssignment | Recall addition using models |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And the user performs below to select track assignment in 'left nav bar' :
      | page | field | action | value | timeout | locator                                |
      |      |       | click  |       | 5       | xpath=>//li[text()='Track assignment'] |
      |      |       | sleep  | 5     |         |                                        |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                                         |
      | TeacherLibrary | selectUserActionForAssignment | Recall addition using models, Mark as complete |
    And call custom method for confirm user action for Assignment using:
      | klass          | method                              | params |
      | TeacherLibrary | confirmUserActionToDeleteAssignment | No     |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                          |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                   |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | assignment klass, Recall addition using models, assigned |
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
      | TeacherLibrary | selectKlassFromDropDown | assignment klass |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for deleting Assigned LO as a clean up using:
      | klass          | method                   | params                       |
      | TeacherLibrary | deleteAssignedAssignment | Recall addition using models |

  @B2B0021 @regression @math_assignment_mark_as_complete_yes @preprod @QA_Sandeep @staging @prod @Functionality_completeAssignmentOn_Yes @SL-TC-1808
  Scenario: B2B0021_Verify user is able to complete Assignment for class after clicking 'yes' on complete Assignment pop up
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
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params          |
      | TeacherLibrary | selectKlassFromDropDown | assigment class |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      |                        |                                | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu           | click  |       | 5       |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                             |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for selecting LO to create assignment for whole klass using:
      | klass          | method           | params                       |
      | TeacherLibrary | createAssignment | Recall addition using models |
    And the user performs below to select whole class to assign assignment :
      | page                | field       | action | value | timeout |
      |                     |             | sleep  | 2     |         |
      | assignment_sub_page | whole_class | click  |       | 5       |
      |                     |             | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on teacher dashboard using:
      | klass          | method                   | params                                                          |
      | TeacherLibrary | verifyAssignedAssignment | Recall addition using models, Assigned to whole class, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                  |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | Assigment class, Recall addition using models, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value       | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | student_centre_page    | teacher_password        | type   | ${password} |         |
      | student_centre_page    | submit                  | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | teacher_dashboard_page | view_klasses_list       | click  |             | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params          |
      | TeacherLibrary | selectKlassFromDropDown | assigment class |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assign_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for selecting action for Assignment using:
      | klass          | method                        | params                                         |
      | TeacherLibrary | selectUserActionForAssignment | Recall addition using models, Mark as complete |
    And call custom method for confirm user action for Assignment using:
      | klass          | method                              | params |
      | TeacherLibrary | confirmUserActionToDeleteAssignment | Yes    |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assignment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for verifying assignment text on teacher dashboard after marking complete using:
      | klass          | method                 | params                               |
      | TeacherLibrary | verifyUnAssignedLOText | Recall addition using models, Assign |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assignment on student dashboard using:
      | klass          | method                                     | params                                                     |
      | TeacherLibrary | verifyAssignedAssignmentOnStudentDashboard | Assigment class, Recall addition using models, notAssigned |

  @B2B0018 @ashutosh @QA_Saurabh @api_teacher_signin @edit_practice @load_entity_context @api_create_assignment_selected_students @SL-TC-1809
  @api_mark_all_assignments_complete_after @staging @preprod @prod
  Scenario: B2B0018_Verify user is able to edit practice assigned to the class

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
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 10     |         |
      | teacher_dashboard_page | left_nav_assign_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assignment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |

    Then call custom method for editing the practice using:
      | klass          | method                       | params                           |
      | TeacherLibrary | selectFromAssignmentCardMenu | ${data.learning_objective}, Edit |

    And the user performs below to assign to whole class:
      | page                | field              | action                | value | timeout |
      | assignment_sub_page | select_whole_class | waitForElementVisible |       | 10      |
      | assignment_sub_page | select_whole_class | click                 |       |         |
      | assignment_sub_page | assign_button      | click                 |       |         |
      |                     |                    | waitForSpinner        |       |         |
      |                     |                    | sleep                 | 4     |         |
      |                     |                    | waitForSpinner        |       |         |

    And call custom method for closing the popup using:
      | klass          | method              |
      | TeacherLibrary | closePopupIfPresent |
    Then call custom method for editing the practice for verification purpose using:
      | klass          | method                       | params                           |
      | TeacherLibrary | selectFromAssignmentCardMenu | ${data.learning_objective}, Edit |

    And the user performs a check whether practice has been modified correctly and is assigned to all students:
      | page                | field              | action    | timeout |
      | assignment_sub_page | select_whole_class | notExists | 3       |
#      | track_assignment_sub_page | modify_button | click     |         |

  @B2B0127 @regression @math_assignment @empty_state @QA_Sandeep @staging @api_teacher_signin @preprod @prod @Functionality_noAssignmentAssigned @SL-TC-1810
  Scenario: B2B0127_Verify when no [math/reading] assignment is assigned to class
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
      | klass          | method            | params                                                          |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign curriculum, Track assignment |
    Then call custom method for verifying no assigned math assignment using:
      | klass          | method           | params                                  |
      | TeacherLibrary | verifyEmptyState | empty_state_text, There's no ongoing assignment to track. Create new assignment to track progress here.|
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                         |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_ela}, Assign curriculum, Track assignment |
    And call custom method for verifying no assigned reading assignment using:
      | klass          | method           | params                                                                                |
      | TeacherLibrary | verifyEmptyState | empty_state_text, There's no ongoing assignment to track. Create new assignment to track progress here.|

  @B2B0128 @regression @math_assignment @empty_state @QA_Sandeep @staging @api_teacher_signin @preprod @prod @Functionality_noAssignmentCompletedByClass @SL-TC-1811
  Scenario: B2B0128_Verify when no assignment[math/reading] is completed by class
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
      | klass          | method            | params                                                          |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign curriculum, Track assignment |
    Then call custom method for verifying no math assignment completed by class using:
      | klass          | method                   | params |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Completed (0), No assignments completed   |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                         |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_ela}, Assign curriculum, Track assignment |
    Then call custom method for verifying no reading assignment completed by class using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Completed (0), No assignments completed   |

  @B2B0129 @regression @math_assignment @empty_state @QA_Sandeep @staging @api_teacher_signin @preprod @prod @Functionality_noAssignmentMarkedAsCompleted @SL-TC-1812
  Scenario: B2B0129_Verify when no assignment[math/reading] is marked as completed by teacher
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
      | klass          | method            | params                                                          |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign curriculum, Track assignment |
    Then call custom method for verifying no math assignment marked completed teacher using:
      | klass          | method                   | params |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Marked as completed (0), Nothing to show   |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                         |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_ela}, Assign curriculum, Track assignment |
    Then call custom method for verifying no reading assignment marked completed by teacher using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Marked as completed (0), Nothing to show |

  @B2B0130 @regression @math_assignment @empty_state @QA_Sandeep @staging @api_teacher_signin @preprod @prod @Functionality_noAssignmentIsInOngoingState @SL-TC-1813
  Scenario: B2B0130_Verify when no assignment is in ongoing state
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
      | klass          | method            | params                                                          |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_math}, Assign curriculum, Track assignment |
    Then call custom method for verifying no math assignment in ongoing state using:
      | klass          | method                   | params |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Ongoing (0), No ongoing assignment   |
    And call custom method for opening SubMenu using:
      | klass          | method            | params                                                         |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject_ela}, Assign curriculum, Track assignment |
    Then call custom method for verifying no reading assignment in ongoing state using:
      | klass          | method                   | params  |
      | TeacherLibrary | verifyEmptyStateFromDropDown | Ongoing (0), No ongoing assignment |

  @B2B0151 @QA_Sandeep @Functionality_CompleteMathAssignment_LO @staging @SL-TC-2326 @preprod
  Scenario: B2B0151_Verify user should able to complete Math Assignment by playing playables
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    And user resolves his timezone
    And the user stores klass classcode and password
    When user creates assignment for class using api
    And user completes math assignment using api
    Then assignment should be marked as completed on track Assignment page
    And math assignment should be marked as completed on student dashboard section
