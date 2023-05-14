@b2b @PTL_Access_rule @regression @b2b_regression @PTL @do_not_run
Feature: PTL Dashbaord Access Rule
  To test the content access rule for free PTL

  @B2B0065 @PTL_Access_rule @regression @b2b_regression @preprod @prod

  Scenario: B2B0065_verify after school hour pop-up comes if user play Learning path in math after 3pm when free PTL is setup
    Given the user opens "signin" page
    When the user performs below to sign in using:

      | page              | field        | action | value            | timeout |
      | signin            | parent       | click  |                  | 10      |
      | registration_page | parent_email | type   | ${data.username} |         |
      | registration_page | Password     | type   | ${data.password} |         |
      | signin            | login        | click  |                  |  10       |

    When the user performs click on learning path :
      | page               | field              | action                | value | timeout |
      | PTL_Dashboard_Page | after_school_hours | waitForElementVisible |       | 200     |
      | PTL_Dashboard_Page | Learning_path_tile | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | Learning_path_tile | click                 |       | 20      |

    And the user performs click on first learning path playable
      | page               | field    | action                | value | timeout |
      | PTL_Dashboard_Page | lp_card1 | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | lp_card1 | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | lp_card1 | click                 |       | 20      |

    Then the user performs to see subscripton pop up
      | page               | field                 | action                | value | timeout |
      | PTL_Dashboard_Page | lp_subscription_popup | waitForElementVisible |       | 20      |

  @B2B0066 @PTL_Access_rule @regression @b2b_regression @preprod @prod
  Scenario: B2B0066_verify subscription pop up comes if user play locked content in maths when free PTL is setup
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field        | action | value                   | timeout |
      | signin            | parent       | click  |                         | 10      |
      | registration_page | parent_email | type   | ${data.username} | 10      |
      | registration_page | Password     | type   | ${data.password}                  |         |
      | signin            | login        | click  |                         | 20      |

    When the user performs click on All_topics :
      | page               | field              | action                | value | timeout |
      | PTL_Dashboard_Page | after_school_hours | waitForElementVisible |       | 200      |
      | PTL_Dashboard_Page | all_topics_tile    | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | all_topics_tile    | click                 |       | 20      |

    And the user performs click on First play button on LO
      | page               | field                | action                | value | timeout |
      | PTL_Dashboard_Page | first_cg_play_button | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | first_cg_play_button | click                 |       | 20      |

    Then the user performs to see subscripton pop up
      | page               | field                         | action                | value | timeout |
      | PTL_Dashboard_Page | subscription_popup_all_topics | waitForElementVisible |       | 20      |

  @B2B0067 @PTL_Access_rule @regression @b2b_regression @preprod @prod
  Scenario: B2B0067_verify user is able to play maths assignment after 3pm when free PTL is setup
    Given the user opens "signin" page
    When the user performs below to sign in using:
      | page              | field        | action | value                   | timeout |
      | signin            | parent       | click  |                         | 10      |
      | registration_page | parent_email | type   | ${data.username} | 10      |
      | registration_page | Password     | type   | ${data.password}                 |         |
      | signin            | login        | click  |                         | 20     |
    When the user performs click on From my teacher box :
      | page               | field              | action                | value | timeout |
      | PTL_Dashboard_Page | after_school_hours | waitForElementVisible |       | 200      |
      | PTL_Dashboard_Page | from_my_teacher    | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | from_my_teacher    | click                 |       | 20      |

    And the user performs click first assignment playable
      | page               | field                     | action                | value | timeout |
      | PTL_Dashboard_Page | first_assignment_playable | waitForElementVisible |       | 20      |
      | PTL_Dashboard_Page | first_assignment_playable | click                 |       | 20      |

    Then the user performs to see iframe close button
      | page               | field                | action                | value | timeout |
      | PTL_Dashboard_Page | i_frame_close_button | waitForElementVisible |       | 20      |
