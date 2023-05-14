@b2b @home_access @teacher @staging @preprod @prod

Feature: Home Access feature

  @B2B0162 @QA_Sandeep @Functionality_firstTimeVisitOnHomeAccessPage @SL-TC-2828
  Scenario: B2B0162_Verify UI When Home Access page is visited for the first time by new US signed up user
    Given the user is on teacher registration page
    When the user sign up as a teacher
    Then verify ui for users on first visit on home access page

  @B2B0163 @QA_Sandeep @Functionality_firstTimeVisitOnHomeAccessPage @SL-TC-2829
  Scenario: B2B0163_Verify UI When Home Access page is visited for the first time by new UK signed up user
    Given the user is on teacher registration page
    When the user sign up as a UK teacher
    Then verify ui for users on first visit on home access page

  @B2B0164 @QA_Sandeep @Functionality_firstTimeVisitOnHomeAccessPage @SL-TC-2830
  Scenario: B2B0164_Verify UI When Home Access page is visited for the first time by new AUS signed up user
    Given the user is on teacher registration page
    When the user sign up as a AUS teacher
    Then verify ui for users on first visit on home access page

  @B2B0165 @QA_Sandeep @Functionality_VisitHomeAccessPageMoreThanOnce @SL-TC-2831
  Scenario: B2B0165_Verify UI When Home Access page is visited more than once by user
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify ui for users on second visit on home access page

  @B2B0166 @QA_Sandeep @Functionality_existingUSUser_Variant_HomeAccessPage @SL-TC-2832
  Scenario: B2B0166_Verify variant Home Access page for existing US user
    Given the user is on login page
    And the user logins into application
    Then verify ui for variant users on home access page

  @B2B0167 @QA_Sandeep @Functionality_existingUSUser_Control_HomeAccessPage @SL-TC-2833
  Scenario: B2B0167_Verify control Home Access page for existing US user
    Given the user is on login page
    And the user logins into application
    Then verify ui for control users on home access page

  @B2B0168 @QA_Sandeep @Functionality_existingUKUser_Control_HomeAccessPage @SL-TC-2834
  Scenario: B2B0168_Verify control Home Access page for existing UK user
    Given the user is on login page
    And the user logins into application
    Then verify ui for control users on home access page

  @B2B0169 @QA_Sandeep @Functionality_existingUKUser_Variant_HomeAccessPage @SL-TC-2835
  Scenario: B2B0169_Verify variant Home Access page for existing UK user
    Given the user is on login page
    And the user logins into application
    Then verify ui for variant users on home access page

  @B2B0170 @QA_Sandeep @Functionality_existingAUSUser_Variant_HomeAccessPage @SL-TC-2836
  Scenario: B2B0170_Verify variant Home Access page for existing AUS user
    Given the user is on login page
    And the user logins into application
    Then verify ui for variant users on home access page

  @B2B0171 @QA_Sandeep @Functionality_existingAUSUser_Control_HomeAccessPage @SL-TC-2837
  Scenario: B2B0171_Verify control Home Access page for existing AUS user
    Given the user is on login page
    And the user logins into application
    Then verify ui for control users on home access page

  @B2B0172 @QA_Sandeep @Functionality_CopyInvite @SL-TC-2838 @do_not_run
  Scenario: B2B0172_Verify copy invite on Home Access page
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify copy invite functionality on home access page

  @B2B0173 @QA_Sandeep @Functionality_DownloadInvite @SL-TC-2839
  Scenario: B2B0173_Verify download invite on Home Access page
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify download invite functionality on home access page

  @B2B0174 @QA_Sandeep @Functionality_parentCount @SL-TC-2827 @do_not_run
  Scenario: B2B0174_Verify connected parent count on Home Access page
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify connected parent count on home access page