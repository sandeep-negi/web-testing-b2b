@cms @nonGradeScreen
Feature: Math Games Screen

  Background:
    Given the user opens " " page


  @CMS051 @NonGrade
  Scenario: The user performs the Non Grade All Game flow:
    When the user performs Non Grade All Game flow below using:
      | page               | field                      | action              | value     | timeout |
      | cms_non_grade_page | curriculum_header_button   | clickByAction       |           | 10      |
      | cms_non_grade_page | all_games_drop_down_option | verifyText          | All Games | 5       |
      | cms_non_grade_page | all_games_drop_down_option | click               |           | 10      |
      |                    |                            | waitForUrlToContain | /games    | 10      |

    And the user performs the checking of Heading text:
      | page               | field                    | action     | value                       | timeout |
      | cms_non_grade_page | all_games_screen_heading | verifyText | Math Games for Preschoolers | 5       |

    And the user performs the checking of breadcrumbtext:
      | page               | field                  | action     | value | timeout |
      | cms_non_grade_page | all_games_bread_crumb1 | verifyText | Home  | 5       |
      | cms_non_grade_page | all_games_bread_crumb2 | verifyText | Games | 5       |


  @CMS052 @NonGrade
  Scenario: The user performs the Non Grade Math Game flow:
    When the user performs Non Grade Math Game flow below using:
      | page               | field                       | action              | value       | timeout |
      | cms_non_grade_page | curriculum_header_button    | clickByAction       |             | 10      |
      | cms_non_grade_page | math_games_drop_down_option | verifyText          | Math Games  | 5       |
      | cms_non_grade_page | math_games_drop_down_option | click               |             | 10      |
      |                    |                             | waitForUrlToContain | /math-games | 10      |

    And the user performs the checking of Heading text:
      | page               | field                     | action     | value                       | timeout |
      | cms_non_grade_page | math_games_screen_heading | verifyText | Math Games for Preschoolers | 5       |

    And the user performs the checking of breadcrumbtext:
      | page               | field                   | action     | value      | timeout |
      | cms_non_grade_page | math_games_bread_crumb1 | verifyText | Home       | 5       |
      | cms_non_grade_page | math_games_bread_crumb2 | verifyText | Games      | 5       |
      | cms_non_grade_page | math_games_bread_crumb3 | verifyText | Math Games | 5       |

  @CMS053 @NonGrade
  Scenario: The user performs the Non Grade Ela Game flow:
    When the user performs Non Grade Ela Game flow below using:
      | page               | field                      | action              | value      | timeout |
      | cms_non_grade_page | curriculum_header_button   | clickByAction       |            | 10      |
      | cms_non_grade_page | ela_games_drop_down_option | verifyText          | ELA Games  | 5       |
      | cms_non_grade_page | ela_games_drop_down_option | click               |            | 10      |
      |                    |                            | waitForUrlToContain | /ela-games | 10      |

    And the user performs the checking of Heading text:
      | page               | field                    | action     | value                      | timeout |
      | cms_non_grade_page | ela_games_screen_heading | verifyText | ELA Games for Preschoolers | 5       |

    And the user performs the checking of breadcrumbtext:
      | page               | field                  | action     | value     | timeout |
      | cms_non_grade_page | ela_games_bread_crumb1 | verifyText | Home      | 5       |
      | cms_non_grade_page | ela_games_bread_crumb2 | verifyText | Games     | 5       |
      | cms_non_grade_page | ela_games_bread_crumb3 | verifyText | ELA Games | 5       |

  @CMS054 @NonGrade
  Scenario: The user performs the Non Grade Worksheet Game flow:
    When the user performs Non Grade Worksheet Game flow below using:
      | page               | field                           | action              | value            | timeout |
      | cms_non_grade_page | curriculum_header_button        | clickByAction       |                  | 10      |
      | cms_non_grade_page | math_worksheet_drop_down_option | verifyText          | Math Worksheets  | 5       |
      | cms_non_grade_page | math_worksheet_drop_down_option | click               |                  | 10      |
      |                    |                                 | waitForUrlToContain | /math-worksheets | 10      |

    And the user performs the checking of Heading text:
      | page               | field                         | action     | value                               | timeout |
      | cms_non_grade_page | math_worksheet_screen_heading | verifyText | Math Worksheets for Kindergarteners | 5       |

    And the user performs the checking of breadcrumbtext:
      | page               | field                       | action     | value           | timeout |
      | cms_non_grade_page | math_worksheet_bread_Crumb1 | verifyText | Home            | 5       |
      | cms_non_grade_page | math_worksheet_bread_Crumb2 | verifyText | Math Worksheets | 5       |

  @CMS055 @Signin
  Scenario: when user signin on NonGrade Games screen
    When the user performs below to sign in using:
      | page                      | field                           | action              | value            | timeout |
      | cms_non_grade_page        | curriculum_header_button        | clickByAction       |                  | 10      |
      | cms_non_grade_page        | math_worksheet_drop_down_option | verifyText          | Math Worksheets  | 5       |
      | cms_non_grade_page        | math_worksheet_drop_down_option | click               |                  | 10      |
      |                           |                                 | waitForUrlToContain | /math-worksheets | 10      |
      | cms_all_grades_games_page | login_button                    | click               |                  | 10      |
      |                           |                                 | waitForUrlToContain | /signin          | 10      |

  @CMS056 @Signup
  Scenario: when user signup on Non-Grade screen
    When the user performs below to signup using:
      | page                      | field                           | action              | value            | timeout |
      | cms_non_grade_page        | curriculum_header_button        | clickByAction       |                  | 10      |
      | cms_non_grade_page        | math_worksheet_drop_down_option | verifyText          | Math Worksheets  | 5       |
      | cms_non_grade_page        | math_worksheet_drop_down_option | click               |                  | 10      |
      |                           |                                 | waitForUrlToContain | /math-worksheets | 10      |
      | cms_all_grades_games_page | signup_button                   | click               |                  | 10      |
      |                           |                                 | waitForUrlToContain | /register        | 10      |

  @CMS057 @SignupParentTopBanner
  Scenario: when user parent signup for free in top banner on Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field                           | action              | value                               | timeout |
      | cms_non_grade_page        | curriculum_header_button        | clickByAction       |                                     | 10      |
      | cms_non_grade_page        | Math_Worksheet_drop_down_option | verifyText          | Math Worksheets                     | 5       |
      | cms_non_grade_page        | Math_Worksheet_drop_down_option | click               |                                     | 10      |
      |                           |                                 | waitForUrlToContain | /math-worksheets                    | 10      |
      | cms_all_grades_games_page | parent_signup_top_banner        | click               |                                     | 10      |
      |                           |                                 | waitForUrlToContain | /parents/register#!/parent/creation | 10      |

  @CMS058 @SignupTeacherTopBanner
  Scenario: when user teacher signup for free in top banner on Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field                           | action              | value              | timeout |
      | cms_non_grade_page        | curriculum_header_button        | clickByAction       |                    | 10      |
      | cms_non_grade_page        | math_worksheet_drop_down_option | verifyText          | Math Worksheets    | 5       |
      | cms_non_grade_page        | math_worksheet_drop_down_option | click               |                    | 10      |
      |                           |                                 | waitForUrlToContain | /math-worksheets   | 10      |
      | cms_all_grades_games_page | teacher_signup_top_banner       | click               |                    | 10      |
      |                           |                                 | waitForUrlToContain | /teachers/register | 10      |

  @CMS059 @SignupFooterBanner
  Scenario: when user signup for free in footer on Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field                           | action              | value            | timeout |
      | cms_non_grade_page        | curriculum_header_button        | clickByAction       |                  | 10      |
      | cms_non_grade_page        | math_worksheet_drop_down_option | verifyText          | Math Worksheets  | 5       |
      | cms_non_grade_page        | math_worksheet_drop_down_option | click               |                  | 10      |
      |                           |                                 | waitForUrlToContain | /math-worksheets | 10      |
      | cms_all_grades_games_page | signupfree_bottom_banner        | click               |                  | 10      |
      |                           |                                 | waitForUrlToContain | /register        | 10      |


  @CMS060 @NonGrade
  Scenario: The user performs the Non Grade Tutoring Games flow:
    When the user performs Non Grade Tutoring flow below using:
      | page               | field                               | action              | value             | timeout |
      | cms_non_grade_page | online_tutoring_header              | click               |                   | 10      |
      |                    |                                     | waitForUrlToContain | /tutoring/courses | 10      |
      | cms_non_grade_page | online_tutoring_screen_games_option | click               |                   | 10      |
      |                    |                                     | waitForUrlToContain | /games            | 10      |

  @CMS061 @NonGrade
  Scenario: The user performs the Non Grade Tutoring Worksheet flow:
    When the user performs Non Grade Tutoring flow below using:
      | page               | field                                   | action              | value             | timeout |
      | cms_non_grade_page | online_tutoring_header                  | click               |                   | 10      |
      |                    |                                         | waitForUrlToContain | /tutoring/courses | 10      |
      | cms_non_grade_page | online_tutoring_screen_worksheet_option | click               |                   | 10      |
      |                    |                                         | waitForUrlToContain | /math-worksheets  | 10      |