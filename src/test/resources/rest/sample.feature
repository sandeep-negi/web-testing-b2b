@api
Feature: Rest Example

  Scenario: send sample request
    Given send request for create assignment using:
    """json
      {
        "url": "https://www.splashlearn.com",
        "path": "/",
        "method": "GET",
        "session_id": false
      }
    """
