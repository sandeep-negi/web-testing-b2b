@api @teacher_creation @teacher_account @teacher_setup
Feature: Teacher account creation with Klass and Students added

  @teacher_creation_single
  Scenario Outline: Create Teacher account with single Student - <count>
    When user creates a teacher account on Splashlearn with below details:
    """json
      {
        "time_zone": "Asia/Kolkata",
        "first_name": "${firstName}",
        "last_name": "${lastName}",
        "email": "${teacherEmail}",
        "password": "${password}",
        "birth_year": "1996",
        "school_id": "",
        "school_name": "${firstName} school",
        "school_city": "ASHLAND",
        "country_code": "US",
        "zip_code": "32422"
      }
    """
    * user creates a new class with below details:
    """json
      {
        "klass_name": "${firstName} class",
        "grade_code": "<grade_code>",
        "subject": "<subject>",
        "students_count": "<students_count>"
      }
    """

#    allowed values for subject - ELA, MATH or MELA    - default value in case of errors - MELA
#    allowed values for grade_code - K, 1, 2, 3, 4, 5  - default value in case of errors - 1
#    allowed values for students_count - number greater than 0 - default value in case of errors - Random no. between 5-25
#    Serialized output with entities(Teacher, Klass and Students) details can be found in target/accounts/teachers<timestamp>.json
    Examples:



      | count | grade_code | subject | students_count |
      | 1     | K          | MATH     | 1               |

  @teacher_creation_bulk
  Scenario Outline: Create Teacher account - <count>
    When user creates a teacher account on Splashlearn with below details:
    """json
      {
        "time_zone": "Asia/Kolkata",
        "first_name": "${firstName}",
        "last_name": "${lastName}",
        "email": "${teacherEmail}",
        "password": "${password}",
        "birth_year": "1996",
        "school_id": "",
        "school_name": "${firstName} school",
        "school_city": "ASHLAND",
        "country_code": "US",
        "zip_code": "32422"
      }
    """
    * user creates a new class with below details:
    """json
      {
        "klass_name": "${firstName} class",
        "grade_code": "<grade_code>",
        "subject": "<subject>",
        "students_count": "<students_count>"
      }
    """

#    allowed values for subject - ELA, MATH or MELA    - default value in case of errors - MELA
#    allowed values for grade_code - K, 1, 2, 3, 4, 5  - default value in case of errors - 1
#    allowed values for students_count - number greater than 0 - default value in case of errors - Random no. between 5-25
#    Serialized output with entities(Teacher, Klass and Students) details can be found in target/accounts/teachers<timestamp>.json
    Examples:



      | count | grade_code | subject | students_count |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
      | 1     | K          | ELA     |                |
      | 2     | 1          | MELA    | 15             |
      | 3     | 2          | MATH    | 20             |
      | 4     | 3          | MATH    |                |
      | 5     | 4          | MATH    |                |
      | 6     | 5          | MATH    | 15             |
      | 7     | K          | ELA     |                |
      | 8     | 1          | MELA    | 15             |
      | 9     | 2          | MATH    | 20             |
      | 10    | 3          | MATH    | 25             |
