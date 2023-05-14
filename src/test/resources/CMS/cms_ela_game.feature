@cms @elaGames
Feature: Ela Games Screen

  Background:
    Given the user opens "ela-games" page


  @CMS020 @GradePreK
  Scenario: The user performs the Grade Pre k Game flow:
    When the user performs  Grade PreK flow below using:
      | page                          | field            | action              | value                       | timeout |
      | cms_all_grades_ela_games_page | gradeprek_header | click               |                             | 10      |
      |                               |                  | waitForUrlToContain | /ela-games-for-preschoolers | 10      |

    And the user performs the checking of Heading text:
      | page                          | field                    | action     | value                          | timeout |
      | cms_all_grades_ela_games_page | gradePreK_screen_heading | verifyText | Reading Games for Preschoolers | 5       |

    And the user performs the checking of breadcrumb text:
      | page                          | field                  | action     | value            | timeout |
      | cms_all_grades_ela_games_page | gradeprek_bread_crumb1 | verifyText | Home             | 5       |
      | cms_all_grades_ela_games_page | gradeprek_bread_crumb2 | verifyText | Games            | 5       |
      | cms_all_grades_ela_games_page | gradeprek_bread_crumb3 | verifyText | ELA Games        | 5       |
      | cms_all_grades_ela_games_page | gradeprek_bread_crumb4 | verifyText | Pre-Kindergarten | 5       |

  @CMS021 @gradeK
  Scenario: The user performs the Grade k Game flow:
    When the user performs  Grade K flow below using:
      | page                          | field         | action              | value                          | timeout |
      | cms_all_grades_ela_games_page | gradek_header | click               |                                | 10      |
      |                               |               | waitForUrlToContain | /ela-games-for-kindergarteners | 10      |

    And the user performs the checking of Heading text:
      | page                          | field                 | action     | value                             | timeout |
      | cms_all_grades_ela_games_page | gradeK_screen_heading | verifyText | Reading Games for Kindergarteners | 5       |

    And the user performs the checking of breadcrumb text:
      | page                          | field               | action     | value        | timeout |
      | cms_all_grades_ela_games_page | gradek_bread_crumb1 | verifyText | Home         | 5       |
      | cms_all_grades_ela_games_page | gradek_bread_crumb2 | verifyText | Games        | 5       |
      | cms_all_grades_ela_games_page | gradek_bread_crumb3 | verifyText | ELA Games    | 5       |
      | cms_all_grades_ela_games_page | gradek_bread_crumb4 | verifyText | Kindergarten | 5       |

  @CMS022 @grade1
  Scenario: The user performs the Grade 1 Game flow:
    When the user performs  Grade 1 flow below using:
      | page                          | field         | action              | value                      | timeout |
      | cms_all_grades_ela_games_page | grade1_header | click               |                            | 10      |
      |                               |               | waitForUrlToContain | /ela-games-for-1st-graders | 10      |

    And the user performs the checking of Heading text:
      | page                          | field                 | action     | value                         | timeout |
      | cms_all_grades_ela_games_page | grade1_screen_heading | verifyText | Reading Games for 1st Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                          | field               | action     | value     | timeout |
      | cms_all_grades_ela_games_page | grade1_bread_crumb1 | verifyText | Home      | 5       |
      | cms_all_grades_ela_games_page | grade1_bread_crumb2 | verifyText | Games     | 5       |
      | cms_all_grades_ela_games_page | grade1_bread_crumb3 | verifyText | ELA Games | 5       |
      | cms_all_grades_ela_games_page | grade1_bread_crumb4 | verifyText | Grade 1   | 5       |


  @CMS023 @grade2
  Scenario: The user performs the Grade 2 Game flow:
    When the user performs  Grade 2 flow below using:
      | page                          | field         | action              | value                      | timeout |
      | cms_all_grades_ela_games_page | grade2_header | click               |                            | 10      |
      |                               |               | waitForUrlToContain | /ela-games-for-2nd-graders | 10      |

    And the user performs the checking of Heading text:
      | page                          | field                 | action     | value                         | timeout |
      | cms_all_grades_ela_games_page | grade2_screen_heading | verifyText | Reading Games for 2nd Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                          | field               | action     | value     | timeout |
      | cms_all_grades_ela_games_page | grade2_bread_crumb1 | verifyText | Home      | 5       |
      | cms_all_grades_ela_games_page | grade2_bread_crumb2 | verifyText | Games     | 5       |
      | cms_all_grades_ela_games_page | grade2_bread_crumb3 | verifyText | ELA Games | 5       |
      | cms_all_grades_ela_games_page | grade2_bread_crumb4 | verifyText | Grade 2   | 5       |

  @CMS024 @Signin
  Scenario: when user signin on ELA Games screen
    When the user performs below to sign in using:
      | page                      | field        | action              | value   | timeout |
      | cms_all_grades_games_page | login_button | click               |         | 10      |
      |                           |              | waitForUrlToContain | /signin | 10      |

  @CMS025 @Signup
  Scenario: when user signup on ELA Games screen
    When the user performs below to signup using:
      | page                      | field         | action              | value     | timeout |
      | cms_all_grades_games_page | signup_button | click               |           | 10      |
      |                           |               | waitForUrlToContain | /register | 10      |

  @CMS026 @SignupParentTopBanner
  Scenario: when user parent signup for free in top banner on ELA Games screen
    When the user performs below to signup using:
      | page                      | field                    | action              | value                               | timeout |
      | cms_all_grades_games_page | parent_signup_top_banner | click               |                                     | 10      |
      |                           |                          | waitForUrlToContain | /parents/register#!/parent/creation | 10      |

  @CMS027 @SignupFooterBanner
  Scenario: when user signup for free in footer on ELA Games screen
    When the user performs below to signup using:
      | page                      | field                    | action              | value     | timeout |
      | cms_all_grades_games_page | signupfree_bottom_banner | click               |           | 10      |
      |                           |                          | waitForUrlToContain | /register | 10      |