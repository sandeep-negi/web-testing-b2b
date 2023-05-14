@b2c @parent @parent_profile @preprod @staging @prod
Feature: Edit Parent's profile

  @B2B0062 @change_email @b2b @ashutosh @QA_Saurabh @api_teacher_signin
  Scenario: Verify parent is able to change the email
    Given the user opens "parent-dashboard" page
    And call custom method for opening change Email page using:
      | klass          | method            | params                                              |
      | TeacherLibrary | visitAccountSettings | ${data.parentDOB},${data.password} |
    * the user performs below to change the email
      | page                   | field                   | action                | value            | timeout |
      | edit_email             | new_email               | type                  | ${parentEmail}   |         |
      | edit_email             | new_email_submit        | click                 |                  |         |
      | edit_email             | verification_code       | waitForElementVisible |                  |         |
    * call custom method for retrieving otp using:
      | klass        | method       | params            |var|
      | EmailLibrary | getOtpFromDB | ${data.new_email} |otp|
    * the user performs below to submit OTP
      | page       | field             | action | value       | timeout |
      | edit_email | verification_code | type   | ${data.otp} |         |
    * update user data in mongodb as:
      | field    | value             |
      | username | ${data.new_email} |
    * the user opens "profile#/settings" page
    * the user performs below to open parent account details page for verification
      | page                   | field                   | action                | value | var           |
      | parent_account_details | edit_parent_profile_btn | click                 |       |               |
      | parent_account_details | email                   | waitForElementVisible |       |               |
      | parent_account_details | email                   | getAttribute          | value | changed_email |
    Then call custom method for verifying new email is reflected in user's profile using:
      | klass              | method     | params                                   |
      | SplashLearnLibrary | assertText | ${data.changed_email}, ${data.new_email} |

  @B2B0063 @change_password @b2b @ashutosh @QA_Saurabh @api_teacher_signin
  Scenario: Verify parent is able to change account password
    Given the user opens "parent-dashboard" page
    And the user performs below to open menu page:
      | page                  | field               | action                | value             | timeout |
      | parent_dashboard_page | parents_menu        | click                 |                   |         |
      | parent_dashboard_page | settings            | waitForElementVisible |                   |         |
      | parent_dashboard_page | settings            | click                 |                   |         |
      | parent_dashboard_page | parent_dob_password | waitForElementVisible |                   |         |
      | parent_dashboard_page | parent_dob_password | type                  | ${data.parentDOB} |         |
      |                       |                     | waitForSpinner        |                   |         |

    * the user performs below to open 'Account Details' page:
      | page      | field           | action                | value | timeout |
      | menu_page | account_details | waitForElementVisible |       |         |
      | menu_page | account_details | click                 |       |         |
      |           |                 | waitForSpinner        |       |         |


    * call custom method for getting new password using:
      | klass              | method         | params           | var          |
      | SplashLearnLibrary | getNewPassword | ${data.password} | new_password |
    * the user performs below to change the password
      | page                   | field                   | action                | value                | timeout |
      | parent_account_details | edit_parent_profile_btn | click                 |                      |         |
      | parent_account_details | change_password_link    | click                 |                      | 20      |
      | edit_password          | current_password        | waitForElementVisible |                      |         |
      | edit_password          | current_password        | type                  | ${data.password}     |         |
      | edit_password          | new_password_field      | type                  | ${data.new_password} |         |
      | edit_password          | confirm_new_password    | type                  | ${data.new_password} |         |
      | edit_password          | change_button           | click                 |                      |         |
    And update user data in mongodb as:
      | field    | value                |
      | password | ${data.new_password} |
    And call custom method for verifying user is on profile page using:
      | klass              | method         |params|
      | TeacherLibrary | userIsOnProfilePage |parent|

    #    TODO: Alert is getting closed when driver focus is switched to it. Uncomment below lines when this gets fixed
#    Then the user performs below to verify the change password success message
#      | page | field | action    | var              | timeout |
#      |      |       | alertText | actual_alert_msg |         |
#    * call custom method for verifying alert message for successful password change using:
#      | klass              | method     | params                                               |
#      | SplashLearnLibrary | assertText | ${data.actual_alert_msg}, ${data.expected_alert_msg} |
