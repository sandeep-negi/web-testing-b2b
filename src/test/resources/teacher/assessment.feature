@b2b @assessment  @teacher @preprod @staging

Feature: Klass Assessment feature

  @B2B0013 @regression @create_assessment @QA_Sandeep @prod @api_teacher_signin @Functionality_createAssessmentForWholeClass @do_not_run
  Scenario: Verify user is able to create Assessment for Klass
    Given the user opens "teacher/dashboard" page
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params                |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assessment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for creating assessment for klass using:
      | klass          | method           | params   |
      | TeacherLibrary | createAssessment | Addition |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params             |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assessment on student dashboard using:
      | klass          | method                                     | params                               |
      | TeacherLibrary | verifyAssignedAssessmentOnStudentDashboard | Assessment klass, Addition, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value       | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | student_centre_page    | teacher_password        | type   | ${password} |         |
      | student_centre_page    | submit                  | click  |             |         |
      |                        |                         | sleep  | 5           |         |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for deleting Assigned Assessment as a clean up using:
      | klass          | method                   | params   |
      | TeacherLibrary | deleteAssignedAssessment | Addition |

  @B2B0023 @regression @delete_assessment @QA_Sandeep @prod @Functionality_deleteAssessmentForClass @do_not_run
  Scenario: Verify user is able to delete Assessment for Klass
    Given the user opens "signin" page
    And call custom method for signin using:
      | klass          | method | params                             |
      | TeacherLibrary | login  | ${data.username}, ${data.password} |
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assessment klass |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params                |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assessment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for creating assessment for klass using:
      | klass          | method           | params   |
      | TeacherLibrary | createAssessment | Addition |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params             |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assessment on student dashboard using:
      | klass          | method                                     | params                               |
      | TeacherLibrary | verifyAssignedAssessmentOnStudentDashboard | Assessment klass, Addition, assigned |
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
      | TeacherLibrary | selectKlassFromDropDown | assessment klass |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for deleting Assigned Assessment of klass using:
      | klass          | method                   | params   |
      | TeacherLibrary | deleteAssignedAssessment | Addition |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assessment on student dashboard using:
      | klass          | method                                     | params                                  |
      | TeacherLibrary | verifyAssignedAssessmentOnStudentDashboard | Assessment klass, Addition, notAssigned |

  @B2B0024 @regression @math_assessmnet_mark_as_complete_no @QA_Sandeep @prod @Functionality_markAssessmentComplete_No @do_not_run
  Scenario: Verify user is not able to mark Assessment as complete after clicking 'no' on complete Assessment pop up
    Given the user opens "signin" page
    And call custom method for signin using:
      | klass          | method | params                             |
      | TeacherLibrary | login  | ${data.username}, ${data.password} |
    When the user performs  signin flow below using:
      | page                   | field             | action | value | timeout |
      | teacher_dashboard_page | view_klasses_list | click  |       | 5       |
    And call custom method for selecting klass from list using:
      | klass          | method                  | params           |
      | TeacherLibrary | selectKlassFromDropDown | assessment klass |
    And the user performs below to select track assignment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params                |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assessment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for creating assessment for klass using:
      | klass          | method           | params   |
      | TeacherLibrary | createAssessment | Addition |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params             |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assessment on student dashboard using:
      | klass          | method                                     | params                               |
      | TeacherLibrary | verifyAssignedAssessmentOnStudentDashboard | Assessment klass, Addition, assigned |
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
      | TeacherLibrary | selectKlassFromDropDown | assessment klass |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for deleting assessment user action using:
      | klass          | method                              | params       |
      | TeacherLibrary | confirmUserActionToDeleteAssessment | Addition, No |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assessment on student dashboard using:
      | klass          | method                                     | params                               |
      | TeacherLibrary | verifyAssignedAssessmentOnStudentDashboard | Assessment klass, Addition, assigned |

  @B2B0200 @smoke @regression @create_assessment @QA_Sandeep @prod @api_teacher_signin @Functionality_createAssessment @SL-TC-1764
  Scenario: B2B0200_Create Assessment for Klass
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
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params                |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, notAssigned |
    And the user performs below to select assignment in 'left nav bar' :
      | page                   | field                          | action | value | timeout |
      | teacher_dashboard_page | left_nav_new_assessment_option | click  |       | 5       |
      |                        |                                | sleep  | 5     |         |
    And call custom method for creating assessment for klass using:
      | klass          | method           | params   |
      | TeacherLibrary | createAssessment | Addition |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
    And call custom method for verifying assigned assessment on teacher dashboard using:
      | klass          | method                                     | params             |
      | TeacherLibrary | verifyAssignedAssessmentOnTeacherDashboard | Addition, assigned |
    And the user performs below to select 'go to experience' :
      | page                   | field                    | action | value | timeout |
      | teacher_dashboard_page | go_to_student_experience | click  |       |         |
      |                        |                          | sleep  | 5     |         |
    And call custom method for verifying assigned assessment on student dashboard using:
      | klass          | method                                     | params                               |
      | TeacherLibrary | verifyAssignedAssessmentOnStudentDashboard | Assessment klass, Addition, assigned |
    And the user performs below to select 'go to teacher Dashboard' :
      | page                   | field                   | action | value       | timeout |
      | student_centre_page    | go_to_teacher_dashboard | click  |             |         |
      |                        |                         | sleep  | 5           |         |
      | student_centre_page    | teacher_password        | type   | ${password} |         |
      | student_centre_page    | submit                  | click  |             |         |
    And the user performs below to select track assessment in 'left nav bar' :
      | page                   | field                            | action | value | timeout |
      |                        |                                  | sleep  | 5     |         |
      | teacher_dashboard_page | left_nav_assess_menu             | click  |       | 5       |
      | teacher_dashboard_page | left_nav_track_assessment_option | click  |       | 5       |
      |                        |                                  | sleep  | 5     |         |
    And call custom method for deleting Assigned Assessment as a clean up using:
      | klass          | method                   | params   |
      | TeacherLibrary | deleteAssignedAssessment | Addition |

  @B2B00123 @prod @QA_Sandeep @Functionality_deleteAssessmentForClass @SL-TC-1773
  Scenario: B2B00123_Verify teacher is able to delete assessment
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    And user creates the assessment using api having details :
      | klassId          | assessmentName          | moduleId          |
      | ${data.klass_id} | ${data.assessment_name} | ${data.module_id} |
    When user deletes the assessment
    Then the assessment should not visible on user track assessment page
#    And the user stores klass classcode and password
    And user signout from teacher dashboard
    When the students login on their dashboard using api :
      | studentName           | studentId           | studentPassword           |
      | ${data.student1_name} | ${data.student1_id} | ${data.student1_password} |
    Then the assessment should not visible on student dashboard

  @B2B00124 @prod @QA_Sandeep @Functionality_createAssessment @SL-TC-1774
  Scenario: B2B00124_Verify teacher is able to create assessment
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    And user deletes the assessment using api having details :
      | klassId          | assessmentName          | moduleId          |
      | ${data.klass_id} | ${data.assessment_name} | ${data.module_id} |
    When user creates the assessment
    Then the assessment should be visible on user track assessment page
    And user signout from teacher dashboard
    When the students login on their dashboard using api :
      | studentName           | studentId           | studentPassword           |
      | ${data.student1_name} | ${data.student1_id} | ${data.student1_password} |
    And the assessment should be visible on student dashboard

  @B2B00125 @prod @QA_Sandeep @Functionality_markAssessmentComplete_No @SL-TC-1775
  Scenario: B2B00125_Verify Assessment is not marked as complete after clicking 'no' on complete Assessment pop up
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    And user deletes the assessment using api having details :
      | klassId          | assessmentName          | moduleId          |
      | ${data.klass_id} | ${data.assessment_name} | ${data.module_id} |
    When user creates the assessment
    And the user clicks on no option on complete assessment pop up
    Then the assessment should be visible on user track assessment page
    And user signout from teacher dashboard
    When the students login on their dashboard using api :
      | studentName           | studentId           | studentPassword           |
      | ${data.student1_name} | ${data.student1_id} | ${data.student1_password} |
    And the assessment should be visible on student dashboard
