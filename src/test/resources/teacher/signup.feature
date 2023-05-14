@b2b @teacher_signup @regression @b2b_regression @teacher @staging @preprod @prod
Feature: Teacher Signup
  As a user, I have the option to signup on Splashlearn as a Teacher

  @B2B0069 @smoke @ashutosh @QA_Saurabh @us_teacher @SL-TC-1864
  Scenario: B2B0069_Sign up as US splashlearn teacher
    Given the user opens "teachers/register" page
    And call custom method for creating teacher account using:
      | klass          | method            |
      | TeacherLibrary | signupAsUSTeacher |
    And call custom method for creating class using:
      | klass          | method     | params                              |
      | TeacherLibrary | addUSClass | ${firstName}'s class, Kindergarten, Math + Reading |
    And call custom method for selecting survey page questions using:
      | klass          | method     |
      | TeacherLibrary | handleSurveyQuestionPage|
    And call custom method for adding students to new class using:
      | klass          | method      | params                                             |
      | TeacherLibrary | addStudents | ${firstName}-${firstName}-${firstName} ${lastName} |

  @B2B0071 @ashutosh @QA_Saurabh @non_us_teacher @uk_signup @SL-TC-1860
  Scenario: B2B0071_Sign up as non-US splashlearn teacher
    Given the user opens "teachers/register" page
    And call custom method for creating UK teacher account using:
      | klass          | method               | params                    |
      | TeacherLibrary | signupAsNonUSTeacher | United Kingdom, Hampshire |
    And call custom method for creating class using:
      | klass          | method        | params                       |
      | TeacherLibrary | addNonUSClass | ${firstName}'s class, Year 3 |
    And call custom method for selecting survey page questions using:
      | klass          | method     |
      | TeacherLibrary | handleSurveyQuestionPage|
    And call custom method for adding students to new class using:
      | klass          | method      | params                                             |
      | TeacherLibrary | addStudents | ${firstName}-${firstName}-${firstName} ${lastName} |
