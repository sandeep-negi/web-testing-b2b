@api
Feature: Teacher Signup API

  Scenario: Signup
    Given user creates a teacher account on Splashlearn with below details:
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
        "school_city": "OREGON",
        "country_code": "US",
        "zip_code": "97045"
      }
    """


  Scenario: Create Multiple Teacher accounts
    Given user creates 5 teacher accounts on Splashlearn with below details:
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

