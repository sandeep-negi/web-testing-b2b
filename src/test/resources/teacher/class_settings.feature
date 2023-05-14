@b2b @QA_Akanksha @class_settings @regression @teacher @staging @preprod @prod
  Feature: Class Settings

    @B2B0500
    Scenario: Verify user is able to change the class name
      Given the user is on login page
      When the user logins into application
      And the user lands on class settings page
      Then Verify user is able to change the class name

    @B2B0501
      Scenario: Verify user is able to delete the class
      Given the user is on login page
      When the user logins into application
      And user adds new class using api
      Then Verify user is able to delete the class

    @B2B0502
    Scenario: Verify user is able to change the class grade
      Given the user is on login page
      When the user logins into application
      And the user lands on class settings page
      Then Verify user is able to change the class grade

    @B2B0503
    Scenario: Verify user is able to change the password mode as Individual and password type as Text
      Given the user is on login page
      When the user logins into application
      And the user lands on class settings page
      Then Verify user is able to change the password mode as Individual and password type as Text

    @B2B0504
    Scenario: Verify user is able to change the password mode as Individual and password type as Picture
      Given the user is on login page
      When the user logins into application
      And the user lands on class settings page
      Then Verify user is able to change the password mode as Individual and password type as Picture

    @B2B0505
    Scenario: Verify user is able to change the password mode as Common and password type as Text
      Given the user is on login page
      When the user logins into application
      And the user lands on class settings page
      Then Verify user is able to change the password mode as Common and password type as Text

    @B2B0506
    Scenario: Verify user is able to change the password mode as Common and password type as Picture
      Given the user is on login page
      When the user logins into application
      And the user lands on class settings page
      Then Verify user is able to change the password mode as Common and password type as Picture









