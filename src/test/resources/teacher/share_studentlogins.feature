@b2b @QA_Akanksha @share_studentlogins @regression @teacher @staging @preprod @prod
Feature: Share Student Logins


  @B2B0507
  Scenario: Verify student login instructions are copied successfully
    Given the user is on login page
    When the user logins into application
    Then Verify student login instructions are copied successfully
