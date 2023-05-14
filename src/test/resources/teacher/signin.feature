@b2b @regression @teacher_signin

Feature: Signin

  @B2B0070 @staging @preprod @prod @do_not_run
  Scenario: B2B0070_Google OAuth signin
    Given the user opens "teacher/dashboard" page
    And call custom method for signin using:
      | klass          | method           | params                             |
      | TeacherLibrary | googleOauthLogin | ${data.username}, ${data.password} |

  @B2B0212 @QA_Sandeep @Functionality_verify_OTP_link @staging
  Scenario: B2B0212_Verify Login Via OTP option is visible for Parent & Teacher SignIn
    Given the user is on login page
    Then verify otp login option is visible for Parent signin
    And verify otp login option is visible for Teacher signin
    And verify otp form is visible on click of otp login

  @B2B0213 @QA_Sandeep @Functionality_Otp_invalidEmail @staging
  Scenario: B2B0213_Verify Otp screen when user enters invalid email
    Given the user is on login page
    And verify otp login option is visible for Teacher signin
    Then verify otp form when invalid user email is entered

  @B2B0214 @QA_Sandeep @Functionality_Otp_max_failed @staging
  Scenario: B2B0214_Verify Otp screen when user enters invalid OTP [Max failed]
    Given the user is on login page
    And verify otp login option is visible for Teacher signin
    And verify otp form is visible on click of otp login
    Then verify error message when user enters invalid otp

  @B2B0215 @QA_Sandeep @Functionality_DB_Verified_OTP @staging
  Scenario: B2B0215_Verify Otp screen when user enters already verified OTP [DB]
    Given the user is on login page
    And verify otp login option is visible for Teacher signin
    And verify otp form is visible on click of otp login
    Then verify error message when user enters Verified OTP

  @B2B0216 @QA_Sandeep @Functionality_DB_Inititated_OTP @staging
  Scenario: B2B0216_Verify Otp screen when user enters already initiated OTP [DB]
    Given the user is on login page
    And verify otp login option is visible for Teacher signin
    And verify otp form is visible on click of otp login
    Then verify error message when user enters Initiated OTP

  @B2B0217 @QA_Sandeep @Functionality_ResendCode @staging
  Scenario: B2B0217_Verify resend link for Otp
    Given the user is on login page
    And verify otp login option is visible for Teacher signin
    And verify otp form is visible on click of otp login
    Then verify resend code is visible on otp screen

  @B2B0218 @QA_Sandeep @Functionality_ClassKode_UI @staging
  Scenario: B2B0218_Verify new UI for Class Code login
    Given the user is on teacher registration page
    When the user sign up as a US teacher
    And the user stores klass classcode and password
    Then verify new classcode ui for klass student login

  @B2B0219 @QA_Sandeep @Functionality_Invalid_KlassCode @staging
  Scenario: B2B0219_Verify UI for invalid Class Code login
    Given the user is on login page
    Then verify error message for invalid classcode

  @B2B0220 @QA_Sandeep @Functionality_InValid_PasswordLogin @staging
  Scenario: B2B0220_Verify UI for invalid student password login
    Given the user is on login page
    And the user logins into application
    When the user stores klass classcode and password
    Then verify ui for valid classcode login
    And verify password page ui for invalid cases

  @B2B0221 @QA_Sandeep @Functionality_Valid_PasswordLogin @staging
  Scenario: B2B0221_Verify UI for valid student password login
    Given the user is on login page
    And the user logins into application
    When the user stores klass classcode and password
    And verify ui for valid student password login