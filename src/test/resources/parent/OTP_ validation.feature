@b2c  @regression @b2c_final @b2c_prod @OTP_validation
Feature: OTP validation on OTP screen

  Background:
    Given the user opens "/parents/register?ab_test[Parent::Playzone]=Playzone_On_New" page


  Scenario: Verify user should get the validation message on enter invalid OTP
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
    And the user performs below to enter otp and validate the message:
      | page              | field                | action                | value | timeout |
      | verify_email_page | otp                  | type                  | 1234  |         |
      |                   |                      | sleep                 | 10    |         |
      |                   |                      | waitForSpinner        |       | 10      |
      | verify_email_page | wrong_otp_validation | waitForElementVisible |       | 15      |


  Scenario: Verify user should get the validation message on enter invalid OTP multiple time
    When the user performs below to sign up using:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
    And the user performs below to enter otp  and validate the message:
      | page              | field                        | action                | value | timeout |
      | verify_email_page | otp                          | type                  | 1234  |         |
      |                   |                              | sleep                 | 10    |         |
      |                   |                              | waitForSpinner        |       | 10      |
      | verify_email_page | otp                          | clear                 |   |         |
      |                   |                              | sleep                 | 10    |         |
      |                   |                              | waitForSpinner        |       | 10      |
      | verify_email_page | otp                          | type                  | 1234  |         |
      |                   |                              | sleep                 | 10    |         |
      |                   |                              | waitForSpinner        |       | 10      |
      | verify_email_page | otp                          | clear                 |   |         |
      |                   |                              | sleep                 | 10    |         |
      |                   |                              | waitForSpinner        |       | 10      |
      | verify_email_page | otp                          | type                  | 1234  |         |
      |                   |                              | sleep                 | 10    |         |
      |                   |                              | waitForSpinner        |       | 10      |
      | verify_email_page | multiple_time_otp_validation | waitForElementVisible |       | 15      |