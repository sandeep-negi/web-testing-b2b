@b2b @download_worksheet @regression @teacher @staging

Feature: Download worksheet

  # Converted to keyword driven TC to Page design object pattern
#  Scenario: Verify User is able to download worksheet
#    Given the user opens "teacher/dashboard" page
#    And call custom method for closing the Springboard Enroll pop up using:
#      | klass          | method                |
#      | TeacherLibrary | closeSpringboardModal |
#    And call custom method for closing the Splashlearn Community pop up using:
#      | klass          | method                         |
#      | TeacherLibrary | closeSplashlearnCommunityModal |
#    And the user performs below to select 'download worksheet' :
#      | page                   | field              | action | value | timeout |
#      | teacher_dashboard_page | download_worksheet | click  |       |         |
#      |                        |                    | sleep  | 5     |         |
#    And call custom method for verifying downloaded worksheet using:
#      | klass          | method                  | params |
#      | TeacherLibrary | verifyDownloadWorksheet | 2      |

  @B2B0117 @api_teacher_signin @preprod @prod @QA_Sandeep @Functionality_verifyWorksheet @SL-TC-1776
  Scenario: B2B0117_Verify Math Worksheet section when there is no saved and no downloaded worksheet
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
    And the user performs below to select 'download worksheet' :
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
      |                        |                    | sleep  | 5     |         |
    And call custom method for verifying no saved and no downloaded worksheet using:
      | klass          | method                              |
      | TeacherLibrary | verifyNoSavedAndDownloadedWorksheet |

  @B2B0123 @api_teacher_signin @preprod @prod @QA_Sandeep @Functionality_verifyWorksheetFilter @SL-TC-1777
  Scenario: B2B0123_Verify working of filter for worksheet
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
    And the user performs below to select 'download worksheet' :
      | page                   | field              | action | value | timeout |
      |                        |                    | sleep  | 5     |         |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
      |                        |                    | sleep  | 5     |         |
    And call custom method for verifying download worksheet filter using:
      | klass          | method                               | params   |
      | TeacherLibrary | verifyTopicFilterInDownloadWorksheet | Addition |

  @B2B0124 @api_teacher_signin @api_delete_saved_worksheets @load_entity_context @preprod @prod @QA_Sandeep @Functionality_saveWorksheet @SL-TC-1778
  Scenario: B2B0124_Verify user is able to save the worksheet
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
    And the user performs below to select 'download worksheet' :
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
      |                        |                    | sleep  | 5     |         |
    And call custom method for Saving worksheet using:
      | klass          | method        | params |
      | TeacherLibrary | saveWorkSheet | 2      |
    And call custom method for verifying saved worksheet using:
      | klass          | method               |
      | TeacherLibrary | verifySavedWorksheet |

  @B2B0125 @api_teacher_signin @api_delete_saved_worksheets @load_entity_context @preprod @prod @QA_Sandeep @Functionality_unsaveWorksheet @SL-TC-1779
  Scenario: B2B0125_Verify user is able to un-save the saved worksheet
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
    And the user performs below to select 'download worksheet' :
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
      |                        |                    | sleep  | 5     |         |
    And call custom method for Saving worksheet using:
      | klass          | method        | params |
      | TeacherLibrary | saveWorkSheet | 2      |
    And call custom method for un-save worksheet using:
      | klass          | method          |
      | TeacherLibrary | unSaveWorksheet |
    And call custom method for verifying unsaved worksheet using:
      | klass          | method                 |
      | TeacherLibrary | verifyUnSavedWorksheet |

  @B2B0112 @api_teacher_signin @preprod @prod @QA_Saurabh @SL-TC-1780
  Scenario: B2B0112_Verify Download worksheet option is appearing for U.S teacher having grade>k
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
    And the user performs see the download worksheet option
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | exists |       |         |
    And the user performs click to download worksheet
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
    And the user performs user can see the text addition
      | page                   | field    | action | value | timeout |
      | teacher_dashboard_page | addition | exists |       |         |
    And the user performs user click on ELA worksheet button
      | page                   | field                  | action | value | timeout |
      | teacher_dashboard_page | ela_worksheet_nav_link | click  |       |         |
    Then the user performs user can see the text reading
      | page                   | field   | action | value | timeout |
      | teacher_dashboard_page | reading | exists |       |         |

  @B2B0113 @api_teacher_signin @preprod @prod @QA_Saurabh @SL-TC-1781
  Scenario: B2B0113_Verify Download worksheet option is appearing for U.K teacher having subject M only
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
    Then the user performs user having subject M can  see the download worksheet option
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | exists |       |         |
    And the user performs click to download worksheet
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
    And the user performs user can see the text addition
      | page                   | field    | action | value | timeout |
      | teacher_dashboard_page | addition | exists |       |         |
    And the user performs user click on ELA worksheet button
      | page                   | field                  | action | value | timeout |
      | teacher_dashboard_page | ela_worksheet_nav_link | click  |       |         |
    Then the user performs user can see the text reading
      | page                   | field   | action | value | timeout |
      | teacher_dashboard_page | reading | exists |       |         |

  @B2B0114 @api_teacher_signin @preprod @prod @QA_Saurabh @SL-TC-1782
  Scenario: B2B0114_Verify Download worksheet option is appearing for U.S teacher having subject M+R
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
    Then the user performs user having subject M+R can  see the download worksheet option
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | exists |       |         |
    And the user performs click to download worksheet
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
    And the user performs user can see the text addition
      | page                   | field    | action | value | timeout |
      | teacher_dashboard_page | addition | exists |       |         |
    And the user performs user click on ELA worksheet button
      | page                   | field                  | action | value | timeout |
      | teacher_dashboard_page | ela_worksheet_nav_link | click  |       |         |
    Then the user performs user can see the text reading
      | page                   | field   | action | value | timeout |
      | teacher_dashboard_page | reading | exists |       |         |

  @B2B0115 @api_teacher_signin @preprod @prod @QA_Saurabh @SL-TC-1783
  Scenario: B2B0115_Verify Download worksheet option is appearing for U.S teacher having subject R only
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
    Then the user performs user having subject R can  see the download worksheet option
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | exists |       |         |
    And the user performs click to download worksheet
      | page                   | field              | action | value | timeout |
      | teacher_dashboard_page | download_worksheet | click  |       |         |
    And the user performs user can see the text addition
      | page                   | field    | action | value | timeout |
      | teacher_dashboard_page | addition | exists |       |         |
    And the user performs user click on ELA worksheet button
      | page                   | field                  | action | value | timeout |
      | teacher_dashboard_page | ela_worksheet_nav_link | click  |       |         |
    Then the user performs user can see the text reading
      | page                   | field   | action | value | timeout |
      | teacher_dashboard_page | reading | exists |       |         |

  @B2B0116 @QA_Sandeep @Functionality_DownloadWorksheet @staging @preprod @prod
  Scenario: Verify User is able to download worksheet
    Given the user is on login page
    And the user logins into application
    Then verify user is able to download worksheet