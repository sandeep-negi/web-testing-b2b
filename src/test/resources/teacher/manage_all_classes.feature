@b2b @manage_all_classes  @teacher @staging @api_teacher_signin

Feature: Manage all classes feature

  @B2B0042 @promote_class @QA_Sandeep @prod @preprod @Functionality_promoteClass @SL-TC-1784
  Scenario: B2B0042_Verify 'promote class' feature on Manage all Classes page
    Given the user opens "classes/manage?src=ml" page
    And call custom method for selecting promote from manage all classes screen using:
      | klass          | method                         | params                    |
      | TeacherLibrary | selectActionFromManageAllClass | Jason Math Class, Promote |

  @B2B0043 @transfer_class @preprod @QA_Sandeep @prod @Functionality_TransferClass @SL-TC-1785
  Scenario: B2B0043_Verify 'transfer class' feature on Manage all Classes page
    Given the user opens "classes/manage?src=ml" page
    And call custom method for deleting existing klass using:
      | klass          | method              | params          |
      | TeacherLibrary | deleteKlassIfExists | Jason Math Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params               |
      | TeacherLibrary | selectActionFromManageAllClass | Jason Math Class, Add |
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
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for selecting promote from manage all classes screen using:
      | klass          | method                         | params                     |
      | TeacherLibrary | selectActionFromManageAllClass | Jason Math Class, Transfer |

  @B2B0044 @go_to_class @preprod @QA_Sandeep @prod @Functionality_GoToClass @SL-TC-1786
  Scenario: B2B0044_Verify 'Go to Class' feature on Manage all Classes page
    Given the user opens "classes/manage?src=ml" page
    And call custom method for closing the SummerLearning pop up using:
      | klass          | method                |
      | TeacherLibrary | closeSummerLearningPopUp |
    And call custom method for selecting Go to Class from manage all classes screen using:
      | klass          | method                         | params                          |
      | TeacherLibrary | selectActionFromManageAllClass | James Class Second, Go to Class |
    And the user performs below to verify current class
      | page                   | field            | action                | value | timeout |
      | teacher_dashboard_page | account_dropdown | waitForElementVisible |       |         |
    And call custom method for verifying class on teacher dashboard screen using:
      | klass          | method                        | params             |
      | TeacherLibrary | verifyClassOnTeacherDashboard | James Class Second |

  @B2B0045 @add_class @preprod @QA_Sandeep @prod @Functionality_addClass @SL-TC-1787
  Scenario: B2B0045_Verify 'add class' feature on Manage all Classes page
    Given the user opens "classes/manage?src=ml" page
    And call custom method for deleting existing klass using:
      | klass          | method              | params          |
      | TeacherLibrary | deleteKlassIfExists | Max Third Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params               |
      | TeacherLibrary | selectActionFromManageAllClass | Max Third Class, Add |
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
    Then the user performs 'a check whether new class is created and displayed under view classes list'
      | page                   | field             | action         | value | timeout | locator                                      |
      | teacher_dashboard_page | view_klasses_list | click          |       |         |                                              |
      | teacher_dashboard_page |                   | waitForElement |       |         | xpath=>//li/strong[@title='Max Third Class'] |
      | teacher_dashboard_page |                   | click          |       |         | xpath=>//li/strong[@title='Max Third Class'] |
    And the user performs below to open user profile page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for verifying new added class on Manage all Classes screen using:
      | klass          | method            | params               |
      | TeacherLibrary | verifyKlassExists | Max Third Class, Yes |

  @B2B0046 @delete_class @preprod @QA_Sandeep @prod @Functionality_deleteClass @SL-TC-1788
  Scenario: B2B0046_Verify 'delete class' feature on Manage all Classes page
    Given the user opens "classes/manage?src=ml" page
    And call custom method for deleting existing klass using:
      | klass          | method              | params          |
      | TeacherLibrary | deleteKlassIfExists | Max Third Class |
    And call custom method for adding new class from manage all classes screen using:
      | klass          | method                         | params               |
      | TeacherLibrary | selectActionFromManageAllClass | Max Third Class, Add |
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
    And the user performs below to open manage all classes page
      | page                    | field                   | action                | value | timeout |
      | teacher_dashboard_page  | account_dropdown        | waitForElementVisible |       |         |
      | teacher_dashboard_page  | account_dropdown        | click                 |       |         |
      | teacher_dashboard_page  | manage_all_classes_link | click                 |       |         |
      | manage_all_classes_page | add_new_class           | waitForElementVisible |       |         |
    And call custom method for deleting new added class on Manage all Classes screen using:
      | klass          | method                         | params                  |
      | TeacherLibrary | selectActionFromManageAllClass | Max Third Class, Delete |
    And call custom method for verifying deleted class on Manage all Classes screen using:
      | klass          | method            | params              |
      | TeacherLibrary | verifyKlassExists | Max Third Class, No |