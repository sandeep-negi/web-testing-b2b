@b2b @summer_learning @teacher @staging

Feature: Summer Learning feature

   # Variant - Variant - Control
  @B2B0203 @QA_Sandeep @Functionality_US_User_SummerLearning_[V-V-C]
  Scenario: B2B0203_Verify features for existing US user having Summer Variant Segment[V-V-C]
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is visible on dashboard
    And verify discount should not visible on dashboard
    And verify discount should not visible on home access page

  # Control - Variant - Control
  @B2B0204 @QA_Sandeep @Functionality_US_User_SummerLearning_[C-V-C]
  Scenario: B2B0204_Verify features for existing US user having Summer Control Segment[C-V-C]
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is not visible on dashboard
    And verify discount should visible on dashboard
    And verify discount should visible on home access page

  # Variant - Control - Variant
  @B2B0205 @QA_Sandeep @Functionality_US_User_SummerLearning_[V-C-V]
  Scenario: B2B0205_Verify features for existing US user having Summer Variant Segment[V-C-V]
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is visible on dashboard
    And verify discount should not visible on dashboard
    And verify discount should not visible on home access page

   # Variant - Control - Control
  @B2B0206 @QA_Sandeep @Functionality_US_User_SummerLearning_[V-C-C]
  Scenario: B2B0206_Verify features for existing US user having Summer Variant Segment[V-C-C]
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is visible on dashboard
    And verify discount should not visible on dashboard
    And verify discount should not visible on home access page

  # Control - Control - Control
  # Variant - Variant - Variant

  @B2B0209 @QA_Sandeep @Functionality_UK_User_SummerLearning
  Scenario: B2B0209_Verify features for existing UK user
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is not visible for non US user
    And verify discount should visible on dashboard
    And verify discount should visible on home access page

  @B2B0210 @QA_Sandeep @Functionality_AUS_User_SummerLearning
  Scenario: B2B0210_Verify features for existing AUS user
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is not visible for non US user
    And verify discount should visible on dashboard
    And verify discount should visible on home access page

  @B2B0211 @QA_Sandeep @Functionality_Canada_User_SummerLearning
  Scenario: B2B0211_Verify features for existing Canada user having Summer Variant Segment
    Given the user is on login page
    And the user logins into application
    Then verify summerLearning is visible on dashboard
    And verify discount should not visible on dashboard
    And verify discount should not visible on home access page
