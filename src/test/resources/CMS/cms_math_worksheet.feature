@cms @MathWorksheet
Feature: Math Worksheet Screen

  Background:
    Given the user opens "math-worksheets" page


  @CMS040 @GradeK
  Scenario: The user performs the Grade k Game flow:
    When the user performs  Grade k flow below using:
      | page                               | field         | action              | value                                | timeout |
      | cms_all_grades_math_worksheet_page | gradek_header | click               |                                      | 10      |
      |                                    |               | waitForUrlToContain | /math-worksheets-for-kindergarteners | 10      |

    And the user performs the checking of Heading text:
      | page                               | field                 | action     | value                                   | timeout |
      | cms_all_grades_math_worksheet_page | gradek_screen_heading | verifyText | Counting Worksheets for Kindergarteners | 5       |

    And the user performs the checking of breadcrumb text:
      | page                               | field               | action     | value           | timeout |
      | cms_all_grades_math_worksheet_page | gradek_bread_crumb1 | verifyText | Home            | 5       |
      | cms_all_grades_math_worksheet_page | gradek_bread_crumb2 | verifyText | Math Worksheets | 5       |
      | cms_all_grades_math_worksheet_page | gradek_bread_crumb3 | verifyText | Kindergarten    | 5       |

  @CMS041 @Grade1
  Scenario: The user performs the Grade 1 Game flow:
    When the user performs  Grade 1 flow below using:
      | page                               | field         | action              | value                            | timeout |
      | cms_all_grades_math_worksheet_page | grade1_header | click               |                                  | 10      |
      |                                    |               | waitForUrlToContain | /math-worksheets-for-1st-graders | 10      |

    And the user performs the checking of Heading text:
      | page                               | field                 | action     | value                                       | timeout |
      | cms_all_grades_math_worksheet_page | grade1_screen_heading | verifyText | Counting Numbers Worksheets for 1st Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                               | field               | action     | value           | timeout |
      | cms_all_grades_math_worksheet_page | grade1_bread_crumb1 | verifyText | Home            | 5       |
      | cms_all_grades_math_worksheet_page | grade1_bread_crumb2 | verifyText | Math Worksheets | 5       |
      | cms_all_grades_math_worksheet_page | grade1_bread_crumb3 | verifyText | Grade 1         | 5       |

  @CMS042 @Grade2
  Scenario: The user performs the Grade 2 Game flow:
    When the user performs  Grade 2 flow below using:
      | page                               | field         | action              | value                            | timeout |
      | cms_all_grades_math_worksheet_page | grade2_header | click               |                                  | 10      |
      |                                    |               | waitForUrlToContain | /math-worksheets-for-2nd-graders | 10      |

    And the user performs the checking of Heading text:
      | page                               | field                 | action     | value                               | timeout |
      | cms_all_grades_math_worksheet_page | grade2_screen_heading | verifyText | Counting Worksheets for 2nd Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                               | field               | action     | value           | timeout |
      | cms_all_grades_math_worksheet_page | grade2_bread_crumb1 | verifyText | Home            | 5       |
      | cms_all_grades_math_worksheet_page | grade2_bread_crumb2 | verifyText | Math Worksheets | 5       |
      | cms_all_grades_math_worksheet_page | grade2_bread_crumb3 | verifyText | Grade 2         | 5       |

  @CMS043 @Grade3
  Scenario: The user performs the Grade 3 Game flow:
    When the user performs  Grade 3 flow below using:
      | page                               | field         | action              | value                            | timeout |
      | cms_all_grades_math_worksheet_page | grade3_header | click               |                                  | 10      |
      |                                    |               | waitForUrlToContain | /math-worksheets-for-3rd-graders | 10      |

    And the user performs the checking of Heading text:
      | page                               | field                 | action     | value                               | timeout |
      | cms_all_grades_math_worksheet_page | grade3_screen_heading | verifyText | Addition Worksheets for 3rd Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                               | field               | action     | value           | timeout |
      | cms_all_grades_math_worksheet_page | grade3_bread_crumb1 | verifyText | Home            | 5       |
      | cms_all_grades_math_worksheet_page | grade3_bread_crumb2 | verifyText | Math Worksheets | 5       |
      | cms_all_grades_math_worksheet_page | grade3_bread_crumb3 | verifyText | Grade 3         | 5       |

  @CMS044 @Grade4
  Scenario: The user performs the Grade 4 Game flow:
    When the user performs  Grade 4 flow below using:
      | page                               | field         | action              | value                            | timeout |
      | cms_all_grades_math_worksheet_page | grade4_header | click               |                                  | 10      |
      |                                    |               | waitForUrlToContain | /math-worksheets-for-4th-graders | 10      |

    And the user performs the checking of Heading text:
      | page                               | field                 | action     | value                               | timeout |
      | cms_all_grades_math_worksheet_page | grade4_screen_heading | verifyText | Addition Worksheets for 4th Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                               | field               | action     | value           | timeout |
      | cms_all_grades_math_worksheet_page | grade4_bread_crumb1 | verifyText | Home            | 5       |
      | cms_all_grades_math_worksheet_page | grade4_bread_crumb2 | verifyText | Math Worksheets | 5       |
      | cms_all_grades_math_worksheet_page | grade4_bread_crumb3 | verifyText | Grade 4         | 5       |

  @CMS045 @Grade5
  Scenario: The user performs the Grade 5 Game flow:
    When the user performs  Grade 5 flow below using:
      | page                               | field         | action              | value                            | timeout |
      | cms_all_grades_math_worksheet_page | grade5_header | click               |                                  | 10      |
      |                                    |               | waitForUrlToContain | /math-worksheets-for-5th-graders | 10      |

    And the user performs the checking of Heading text:
      | page                               | field                 | action     | value                                     | timeout |
      | cms_all_grades_math_worksheet_page | grade5_screen_heading | verifyText | Multiplication Worksheets for 5th Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                               | field               | action     | value           | timeout |
      | cms_all_grades_math_worksheet_page | grade5_bread_crumb1 | verifyText | Home            | 5       |
      | cms_all_grades_math_worksheet_page | grade5_bread_crumb2 | verifyText | Math Worksheets | 5       |
      | cms_all_grades_math_worksheet_page | grade5_bread_crumb3 | verifyText | Grade 5         | 5       |

  @CMS046 @Signin
  Scenario: when user signin on MathWorksheet Games screen
    When the user performs below to sign in using:
      | page                      | field        | action              | value   | timeout |
      | cms_all_grades_games_page | login_button | click               |         | 10      |
      |                           |              | waitForUrlToContain | /signin | 10      |

  @CMS047 @Signup
  Scenario: when user signup on Math Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field         | action              | value     | timeout |
      | cms_all_grades_games_page | signup_button | click               |           | 10      |
      |                           |               | waitForUrlToContain | /register | 10      |

  @CMS048 @SignupParentTopBanner
  Scenario: when user parent signup for free in top banner on Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field                    | action              | value                               | timeout |
      | cms_all_grades_games_page | parent_signup_top_banner | click               |                                     | 10      |
      |                           |                          | waitForUrlToContain | /parents/register#!/parent/creation | 10      |

  @CMS049 @SignupTeacherTopBanner
  Scenario: when user teacher signup for free in top banner on Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field                     | action              | value              | timeout |
      | cms_all_grades_games_page | teacher_signup_top_banner | click               |                    | 10      |
      |                           |                           | waitForUrlToContain | /teachers/register | 10      |

  @CMS050 @SignupFooterBanner
  Scenario: when user signup for free in footer on Worksheet Games screen
    When the user performs below to signup using:
      | page                      | field                    | action              | value     | timeout |
      | cms_all_grades_games_page | signupfree_bottom_banner | click               |           | 10      |
      |                           |                          | waitForUrlToContain | /register | 10      |