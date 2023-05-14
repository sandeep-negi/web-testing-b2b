@b2b @teacher_profile @regression @b2b_regression @teacher @staging @preprod @prod
Feature: Teacher Profile
  As a teacher, I have the option to view/edit my profile

  @B2B0008 @change_email @ashutosh @QA_Saurabh @SL-TC-1842 @api_teacher_signin
  Scenario: B2B0008_Verify teacher is able to change the email
    Given the user opens "profile" page
    And the user performs below to change the email
      | page            | field             | action                | value            | timeout |
      | teacher_profile | change_email      | click                 |                  |         |
      | edit_email      | password          | waitForElementVisible |                  |         |
      | edit_email      | password          | type                  | ${data.password} |         |
      | edit_email      | new_email         | type                  | ${teacherEmail}  |         |
      | edit_email      | new_email_submit  | click                 |                  |         |
      | edit_email      | verification_code | waitForElementVisible |                  |         |
    * call custom method for retrieving otp using:
      | klass        | method       | params            |var|
      | EmailLibrary | getOtpFromDB | ${data.new_email} |otp|
    And the user performs below to submit OTP
      | page       | field             | action | value       | timeout |
      | edit_email | verification_code | type   | ${data.otp} |         |
    And update user data in mongodb as:
      | field    | value             |
      | username | ${data.new_email} |

    Then the user opens "profile" page
    Then the user performs below to open user profile
      | page            | field          | action                | value | var           |
      | teacher_profile | update_profile | waitForElementVisible |       |               |
      | teacher_profile | email          | getAttribute          | value | changed_email |
    And call custom method for verifying new email is reflected in user's profile using:
      | klass              | method     | params                                   |
      | SplashLearnLibrary | assertText | ${data.changed_email}, ${data.new_email} |


  @B2B0009 @change_password @ashutosh @QA_Saurabh @api_retry_teacher_signin @alert @SL-TC-1843 @api_teacher_signin
  Scenario: B2B0009_Verify teacher is able to change the password

    Given the user opens "profile" page
    And call custom method for getting new password using:
      | klass              | method         | params           | var          |
      | SplashLearnLibrary | getNewPassword | ${data.password} | new_password |
    And call custom method for changing user password using:
      | klass          | method                | params                                 |
      | TeacherLibrary | changeTeacherPassword | ${data.password}, ${data.new_password} |
    And update user data in mongodb as:
      | field    | value                |
      | password | ${data.new_password} |
    And call custom method for verifying user is on profile page using:
      | klass          | method              | params  |
      | TeacherLibrary | userIsOnProfilePage | teacher |

#    TODO: Alert is getting closed when driver focus is switched to it. Uncomment below lines when this gets fixed
#    Then the user performs below to verify the change password success message
#      | page | field | action    | var              | timeout |
#      |      |       | alertText | actual_alert_msg |         |
#    And call custom method for verifying alert message for successful password change using:
#      | klass              | method     | params                                               |
#      | SplashLearnLibrary | assertText | ${data.actual_alert_msg}, ${data.expected_alert_msg} |


  @B2B0175 @QA_Sandeep @Functionality_3pmPopUpForUnlinkedUSStudent @SL-TC-4095
  Scenario: B2B0175_Verify 3pm parent pop up for unlinked US Klass student
    Given the user is on teacher registration page
    When the user sign up as a teacher
#    And the user stores klass classcode and password
    And user sets post school hour time
    And user signout from teacher dashboard
    When student login on his student dashboard using api
    Then verify parent pop up for unlinked student

  @B2B0176 @QA_Sandeep @Functionality_3pmPopUpForUnlinedAUSStudent @SL-TC-4096
  Scenario: B2B0176_Verify 3pm parent pop up for unlinked AUS Klass student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    And user sets post school hour time
    And user signout from teacher dashboard
    When student login on his student dashboard using api
    Then verify parent pop up for unlinked student

  @B2B0177 @QA_Sandeep @Functionality_3pmPopUpForUnlinkedUKStudent @SL-TC-4097
  Scenario: B2B0177_Verify 3pm parent pop up for unlinked UK Klass student
    Given the user is on teacher registration page
    When the user sign up as a teacher
    And user sets post school hour time
    And user signout from teacher dashboard
    When student login on his student dashboard using api
    Then verify parent pop up for unlinked student

  @B2B0178 @QA_Sandeep @Functionality_3pmPopUpForlinkedUSStudent @SL-TC-4098
  Scenario: B2B0178_Verify 3pm parent pop up for linked US Klass student
    Given the user is on login page
    And the user logins into application
    And user sets post school hour time
    And user signout from teacher dashboard
    When student login on his student dashboard using api
    Then verify parent pop up for linked student

  @B2B0179 @QA_Sandeep @Functionality_3pmPopUpForlinkedAUSStudent @SL-TC-4099
  Scenario: B2B0179_Verify 3pm parent pop up for linked AUS Klass student
    Given the user is on login page
    And the user logins into application
    And user sets post school hour time
    And user signout from teacher dashboard
    When student login on his student dashboard using api
    Then verify parent pop up for linked student

  @B2B0180 @QA_Sandeep @Functionality_3pmPopUpForlinkedUKStudent @SL-TC-4100
  Scenario: B2B0180_Verify 3pm parent pop up for linked UK Klass student
    Given the user is on login page
    And the user logins into application
    And user sets post school hour time
    And user signout from teacher dashboard
    When student login on his student dashboard using api
    Then verify parent pop up for linked student
