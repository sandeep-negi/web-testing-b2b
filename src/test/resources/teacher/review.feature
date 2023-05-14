@b2b @review @teacher @regression @staging @api_teacher_signin @staging @preprod @prod

Feature: Review

  @B2B0025 @ashutosh @QA_Saurabh @class_progress @grid_view @math @load_entity_context @api_mark_all_assignments_complete @SL-TC-1856
  Scenario: B2B0025_Verify user is able to assign the assignment from grid view to selected students

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Review, Class report |
    When call custom method for creating assignment for selected students using:
      | klass          | method                                          | params                                                                                                |
      | TeacherLibrary | createAssignmentForSelectedStudentsFromGridView | ${data.content_group}, ${data.learning_objective}, ${data.student1}-${data.student2}-${data.student3} |
    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}, ${data.class_subject} |

  @B2B0026 @ashutosh @QA_Saurabh @class_progress @grid_view @math @api_mark_all_assignments_complete @load_entity_context @SL-TC-1857
  Scenario: B2B0026_Verify user is able to assign the assignment from grid view to group of students

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Review, Class report |

    And call custom method for creating assignment for group of students using:
      | klass          | method                                         | params                                            |
      | TeacherLibrary | createAssignmentForGroupOfStudentsFromGridView | ${data.content_group}, ${data.learning_objective} |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}, ${data.class_subject} |

  @B2B0027 @smoke @ashutosh @QA_Saurabh @class_progress @group_view @math @whole_class @load_entity_context @api_mark_all_assignments_complete @SL-TC-1769
  Scenario: B2B0027_Verify user is able to assign the assignment from group view to whole class

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Review, Class report |

    And call custom method for selecting group view using:
      | klass          | method                          |
      | TeacherLibrary | selectGroupViewFromReportOption |

    And call custom method for creating assignment for group of students using:
      | klass          | method                                     | params                                                                   |
      | TeacherLibrary | createAssignmentForWholeClassFromGroupView | ${data.content_group}, ${data.standard_name}, ${data.learning_objective} |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |

    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}, ${data.class_subject} |

  @B2B0028 @ashutosh @QA_Saurabh @class_progress @group_view @math @selected_students @load_entity_context @api_mark_all_assignments_complete @SL-TC-1858
  Scenario: B2B0028_Verify user is able to assign the assignment from group view to selected students

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Review, Class report |

    And call custom method for selecting group view using:
      | klass          | method                          |
      | TeacherLibrary | selectGroupViewFromReportOption |

    And call custom method for creating assignment for group of students using:
      | klass          | method                                           | params                                                                                                                       |
      | TeacherLibrary | createAssignmentForSelectedStudentsFromGroupView | ${data.content_group}, ${data.standard_name}, ${data.learning_objective}, ${data.student1}-${data.student2}-${data.student3} |
    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}, ${data.class_subject} |

  @B2B0029 @ashutosh @QA_Saurabh @class_progress @group_view @math @selected_students @edit_assignment
  @api_create_assignment_selected_students @api_mark_all_assignments_complete_after @load_entity_context @SL-TC-1859
  Scenario: B2B0029_Verify editing an assignment for selected students in Group view

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
      | klass          | method            | params                                        |
      | TeacherLibrary | selectFromLeftNav | ${data.class_subject}, Review, Class report |

    And call custom method for selecting group view using:
      | klass          | method                          |
      | TeacherLibrary | selectGroupViewFromReportOption |

    And call custom method for creating assignment for group of students using:
      | klass          | method                                           | params                                                                                                                       |
      | TeacherLibrary | editCreateAssignmentForSelectedStudentsGroupView | ${data.content_group}, ${data.standard_name}, ${data.learning_objective}, ${data.student1}-${data.student2}-${data.student3} |

    And call custom method for storing class information using:
      | klass          | method                        | params             |
      | TeacherLibrary | storeClassCodeAndPasswordInfo | ${data.class_name} |
    And call custom method for closing browser using:
      | klass              | method       |
      | SplashLearnLibrary | closeBrowser |

    And call custom method for verifying assignments for multiple students using:
      | klass          | method                                                | params                                  |
      | TeacherLibrary | verifyAssignmentOnStudentDashboardForMultipleStudents | ${data.student1}, ${data.class_subject} |