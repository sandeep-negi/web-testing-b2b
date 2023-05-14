@b2b @onboarding_persona @teacher

Feature: Onboarding persona feature

  @B2B0153 @QA_Sandeep @Functionality_persona1 @SL-TC-2334 @staging @preprod @prod
  Scenario: B2B0153_Verify persona 1 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 1 is set on teacher dashboard

  @B2B0154 @QA_Sandeep @Functionality_persona2 @SL-TC-2335 @staging @preprod @prod
  Scenario: B2B0154_Verify persona 2 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 2 is set on teacher dashboard

  @B2B0155 @QA_Sandeep @Functionality_persona3 @SL-TC-2336 @staging @preprod @prod
  Scenario: B2B0155_Verify persona 3 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 3 is set on teacher dashboard

  @B2B0156 @QA_Sandeep @Functionality_persona4 @SL-TC-2337 @staging @preprod @prod
  Scenario: B2B0156_Verify persona 4 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 4 is set on teacher dashboard

  @B2B0157 @QA_Sandeep @Functionality_persona5 @SL-TC-2338 @staging @preprod @prod
  Scenario: B2B0157_Verify persona 5 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 5 is set on teacher dashboard

  @B2B0158 @QA_Sandeep @Functionality_persona6 @staging @SL-TC-2339 @staging @preprod @prod
  Scenario: B2B0158_Verify persona 6 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 6 is set on teacher dashboard

  @B2B0159 @QA_Sandeep @Functionality_persona7 @staging @SL-TC-2340 @staging @preprod @prod
  Scenario: B2B0159_Verify persona 7 is getting set for New US teacher
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 7 is set on teacher dashboard

  @B2B0160 @QA_Sandeep @Functionality_PersonaChecklist_Completion @staging @preprod @prod
  Scenario: B2B0160_Verify Persona Checklist completion
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    Then verify persona 3 is set on teacher dashboard
    And user is able to complete persona step checklist

    # LO completion only work on staging
  @B2B0161 @QA_Sandeep @Functionality_CreateAndCompleteAssignment @staging @preprod
  Scenario: B2B0161_Verify user is able to create and complete Assignment
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    And user resolves his timezone
#   And user gets klass student info
    And the user stores klass classcode and password
    When user creates assignment for class using api
    And user completes math assignment using api
    Then assignment should be marked as completed on track Assignment page
    And math assignment should be marked as completed on student dashboard section
