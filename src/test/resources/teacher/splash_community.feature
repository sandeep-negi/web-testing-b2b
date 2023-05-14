@b2b @splash_community  @teacher @staging @prod @preprod

Feature: Splash Community feature

  @B2B0137 @QA_Sandeep @Functionality_SplashCommunityForNewUSTeacher_Visible @SL-TC-2324
  Scenario: B2B0137_Verify SplashCommunity and banner is appearing for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then splashCommunity should appear to US variant users

  @B2B0138 @QA_Sandeep @Functionality_SplashCommunityForNewNonUSTeacher_NotVisible @SL-TC-2325
  Scenario: B2B0138_Verify SplashCommunity is not appearing for New Non-US teacher
    Given the user is on teacher registration page
    When the user sign up as a UK teacher
    Then splash community modal should not appear
    And splash community should not appear on leftNav

  @B2B0139 @QA_Sandeep @Functionality_SplashCommunityForExistingUSTeacher_Math_Visible @do_not_run
  Scenario: B2B0139_Verify SplashCommunity is appearing for Existing US teacher having Math only Subject
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    When user visits his dashboard
    Then splash community should appear on leftNav

  @B2B0140 @QA_Sandeep @Functionality_SplashCommunityForExistingUSTeacher_MathReading_Visible @do_not_run
  Scenario: B2B0140_Verify SplashCommunity is appearing for Existing US teacher having Math + Reading Subject
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    When user visits his dashboard
    Then splash community should appear on leftNav

  @B2B0141 @QA_Sandeep @Functionality_SplashCommunityForExistingUSTeacher_Reading_Visible @do_not_run
  Scenario: B2B0141_Verify SplashCommunity is appearing for Existing US teacher having Reading only Subject
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    When user visits his dashboard
    Then splash community should appear on leftNav

  @B2B0142 @QA_Sandeep @Functionality_SplashCommunityForExistingNonUSTeacher_NotVisible @do_not_run
  Scenario: B2B0142_Verify SplashCommunity is not appearing for Existing Non-US teacher
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    When user visits his dashboard
    Then splash community should not appear on leftNav

  @B2B0143 @QA_Sandeep @Functionality_SplashCommunityForExistingUSTeacher_AddClass @do_not_run
  Scenario: B2B0143_Verify SplashCommunity is appearing for new added class for Existing US teacher
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    And user adds new class using api with details :
      | klassName    | gradeCode          | subjectPreferenceCd           |
      | ${data.name} | ${data.grade_code} | ${data.subject_preference_cd} |
    Then splash community modal should not appear
    Then splash community should appear on leftNav
    And splashCommunity banner should appear on all sub sections
    And user deletes the new added klass using api

  @B2B0144 @QA_Sandeep @Functionality_SplashCommunityForExistingNonUSTeacher_AddClass @do_not_run
  Scenario: B2B0144_Verify SplashCommunity is not appearing for new added class for Existing Non-US teacher
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    And user adds new class using api with details :
      | klassName    | gradeCode          | subjectPreferenceCd           |
      | ${data.name} | ${data.grade_code} | ${data.subject_preference_cd} |
    Then splash community modal should not appear
    Then splash community should not appear on leftNav
    And user deletes the new added klass using api

  @B2B0145 @QA_Sandeep @Functionality_SplashCommunityBannerForExistingUSTeacher_notJoined @do_not_run
  Scenario: B2B0145_Verify splashCommunity banner when Existing US user have not joined
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    When user visits his dashboard
    Then splash community should appear on leftNav
    And splashCommunity banner should appear on all sub sections

  @B2B0146 @QA_Sandeep @Functionality_SplashCommunityBannerForExistingUSTeacher_AlreadyJoined @do_not_run
  Scenario: B2B0146_Verify splashCommunity banner when Existing US user have already joined
    Given the user is on login page
    And the user logins using api with details :
      | userEmail        | userPassword     |
      | ${data.username} | ${data.password} |
    When user visits his dashboard
    Then splash community should appear on leftNav
    And splashCommunity banner should not appear on all sub sections

  @B2B0147 @QA_Sandeep @Functionality_SplashCommunityBannerForNewUSTeacher_Joined @do_not_run
  Scenario: B2B0147_Verify splashCommunity banner when New US user joins using modal
    Given the user is on teacher registration page
    And the user sign up as a US teacher
    When user joins splashCommunity from modal
    Then splashCommunity should appear to US variant users

  @B2B0148 @QA_Sandeep @Functionality_SplashCommunityBannerForNewUSTeacher_Joined @do_not_run
  Scenario: B2B0148_Verify splashCommunity banner when New US user joins using Banner
    Given the user is on teacher registration page
    And the user sign up as a US teacher
    Then splash community modal should appear
    When user joins splashCommunity from banner
    Then splashCommunity banner should not appear on all sub sections
    Then splashCommunity should appear to US variant users

  @B2B0149 @QA_Sandeep @Functionality_BannerForOtherKlass_DefaultKlass_joined @do_not_run
  Scenario: B2B0149_Verify banner for other Klass when default klass have already joined SplashCommunity
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    And user joins splashCommunity from modal
    When user adds new class using api with details :
      | klassName        | gradeCode | subjectPreferenceCd |
      | jack class first | 1         | 2                   |
    Then splash community modal should not appear
    And splashCommunity banner should not appear on all sub sections

  @B2B0150 @QA_Sandeep @Functionality_ModalForOtherKlass_DefaultKlass_notJoined @do_not_run
  Scenario: B2B0150_Verify other Klass should be able to join SplashCommunity when default klass have not joined
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then splash community modal should appear
    When user adds new class using api with details :
      | klassName        | gradeCode | subjectPreferenceCd |
      | jack class first | 1         | 2                   |
    And splashCommunity banner should appear on all sub sections
    When user joins splashCommunity from banner
    Then splashCommunity banner should not appear on all sub sections