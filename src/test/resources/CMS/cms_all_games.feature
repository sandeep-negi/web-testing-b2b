@cms @allGames
Feature: All Games Screen

  Background:
    Given the user opens "games" page


  @CMS001 @GradePreK
  Scenario: The user performs the Pre k Game flow:
    When the user performs  PreK flow below using:
      | page                      | field            | action              | value                   | timeout |
      | cms_all_grades_games_page | gradeprek_header | click               |                         | 10      |
      |                           |                  | waitForUrlToContain | /games-for-preschoolers | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                    | action     | value                       | timeout |
      | cms_all_grades_games_page | gradepreK_screen_heading | verifyText | Math Games for Preschoolers | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field                  | action     | value            | timeout |
      | cms_all_grades_games_page | gradeprek_bread_crumb1 | verifyText | Home             | 5       |
      | cms_all_grades_games_page | gradeprek_bread_crumb2 | verifyText | Games            | 5       |
      | cms_all_grades_games_page | gradeprek_bread_crumb3 | verifyText | Pre-Kindergarten | 5       |

  @CMS002 @GradeK
  Scenario: The user performs the Grade k Game flow:
    When the user performs GradeK flow below using:
      | page                      | field         | action              | value                      | timeout |
      | cms_all_grades_games_page | gradek_header | click               |                            | 10      |
      |                           |               | waitForUrlToContain | /games-for-kindergarteners | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                 | action     | value                          | timeout |
      | cms_all_grades_games_page | gradek_screen_heading | verifyText | Math Games for Kindergarteners | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field               | action     | value        | timeout |
      | cms_all_grades_games_page | gradek_bread_crumb1 | verifyText | Home         | 5       |
      | cms_all_grades_games_page | gradek_bread_crumb2 | verifyText | Games        | 5       |
      | cms_all_grades_games_page | gradek_bread_crumb3 | verifyText | Kindergarten | 5       |

  @CMS003 @Grade1
  Scenario: The user performs the Grade 1 Game flow:
    When the user performs Grade 1 flow below using:
      | page                      | field         | action              | value                  | timeout |
      | cms_all_grades_games_page | grade1_header | click               |                        | 10      |
      |                           |               | waitForUrlToContain | /games-for-1st-graders | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                 | action     | value                      | timeout |
      | cms_all_grades_games_page | grade1_screen_heading | verifyText | Math Games for 1st Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field               | action     | value   | timeout |
      | cms_all_grades_games_page | grade1_bread_crumb1 | verifyText | Home    | 5       |
      | cms_all_grades_games_page | grade1_bread_crumb2 | verifyText | Games   | 5       |
      | cms_all_grades_games_page | grade1_bread_crumb3 | verifyText | Grade 1 | 5       |

  @CMS004 @Grade2
  Scenario: The user performs the Grade 2 Game flow:
    When the user performs Grade 2 flow below using:
      | page                      | field         | action              | value                  | timeout |
      | cms_all_grades_games_page | grade2_header | click               |                        | 10      |
      |                           |               | waitForUrlToContain | /games-for-2nd-graders | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                 | action     | value                      | timeout |
      | cms_all_grades_games_page | grade2_screen_heading | verifyText | Math Games for 2nd Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field               | action     | value   | timeout |
      | cms_all_grades_games_page | grade2_bread_crumb1 | verifyText | Home    | 5       |
      | cms_all_grades_games_page | grade2_bread_crumb2 | verifyText | Games   | 5       |
      | cms_all_grades_games_page | grade2_bread_crumb3 | verifyText | Grade 2 | 5       |

  @CMS005 @Grade3
  Scenario: The user performs the Grade 3 Game flow:
    When the user performs Grade 3 flow below using:
      | page                      | field         | action              | value                       | timeout |
      | cms_all_grades_games_page | grade3_header | click               |                             | 10      |
      |                           |               | waitForUrlToContain | /math-games-for-3rd-graders | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                 | action     | value                             | timeout |
      | cms_all_grades_games_page | grade3_screen_heading | verifyText | Place Value Games for 3rd Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field               | action     | value      | timeout |
      | cms_all_grades_games_page | grade3_bread_crumb1 | verifyText | Home       | 5       |
      | cms_all_grades_games_page | grade3_bread_crumb2 | verifyText | Games      | 5       |
      | cms_all_grades_games_page | grade3_bread_crumb3 | verifyText | Math Games | 5       |
      | cms_all_grades_games_page | grade3_bread_crumb4 | verifyText | Grade 3    | 5       |


  @CMS006 @Grade4
  Scenario: The user performs the Grade 4 Game flow:
    When the user performs Grade 4 flow below using:
      | page                      | field         | action              | value                       | timeout |
      | cms_all_grades_games_page | grade4_header | click               |                             | 10      |
      |                           |               | waitForUrlToContain | /math-games-for-4th-graders | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                 | action     | value                             | timeout |
      | cms_all_grades_games_page | grade4_screen_heading | verifyText | Place Value Games for 4th Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field               | action     | value      | timeout |
      | cms_all_grades_games_page | grade4_bread_crumb1 | verifyText | Home       | 5       |
      | cms_all_grades_games_page | grade4_bread_crumb2 | verifyText | Games      | 5       |
      | cms_all_grades_games_page | grade4_bread_crumb3 | verifyText | Math Games | 5       |
      | cms_all_grades_games_page | grade4_bread_crumb4 | verifyText | Grade 4    | 5       |

  @CMS007 @Grade5
  Scenario: The user performs the Grade 5 Game flow:
    When the user performs Grade 5 flow below using:
      | page                      | field         | action              | value                       | timeout |
      | cms_all_grades_games_page | grade5_header | click               |                             | 10      |
      |                           |               | waitForUrlToContain | /math-games-for-5th-graders | 10      |

    And the user performs the checking of Heading text:
      | page                      | field                 | action     | value                             | timeout |
      | cms_all_grades_games_page | grade5_screen_heading | verifyText | Place Value Games for 5th Graders | 5       |

    And the user performs the checking of breadcrumb text:
      | page                      | field               | action     | value      | timeout |
      | cms_all_grades_games_page | grade5_bread_crumb1 | verifyText | Home       | 5       |
      | cms_all_grades_games_page | grade5_bread_crumb2 | verifyText | Games      | 5       |
      | cms_all_grades_games_page | grade5_bread_crumb3 | verifyText | Math Games | 5       |
      | cms_all_grades_games_page | grade5_bread_crumb4 | verifyText | Grade 5    | 5       |

  @CMS008 @Signin
  Scenario: when user signin on All Games screen
    When the user performs below to sign in using:
      | page                      | field        | action              | value                            | timeout |
      | cms_all_grades_games_page | login_button | click               |                                  | 10      |
      |                           |              | waitForUrlToContain | /signin                          | 10      |
      | signin                    | parent       | click               |                                  | 10      |
      | registration_page         | parent_email | type                | sb+frontendtest1@splashlearn.com | 10      |
      | registration_page         | Password     | type                | 123456                           |         |
      | signin                    | login        | click               |                                  |         |
    And the user performs below navigate to Dashboard Screen:
      | page | field | action              | value               | timeout |
      |      |       | waitForUrlToContain | /parent-dashboard#/ | 10      |

  @CMS009 @Signup
  Scenario: when user signup on All Games screen
    When the user performs below to signup using:
      | page                      | field         | action              | value     | timeout |
      | cms_all_grades_games_page | signup_button | click               |           | 10      |
      |                           |               | waitForUrlToContain | /register | 10      |

  @CMS010 @SignupParentTopBanner
  Scenario: when user parent signup for free in top banner on All Games screen
    When the user performs below to signup using:
      | page                      | field                    | action              | value                               | timeout |
      | cms_all_grades_games_page | parent_signup_top_banner | click               |                                     | 10      |
      |                           |                          | waitForUrlToContain | /parents/register#!/parent/creation | 10      |

  @CMS011 @SignupTeacherTopBanner
  Scenario: when user teacher signup for free in top banner on All Games screen
    When the user performs below to signup using:
      | page                      | field                     | action              | value              | timeout |
      | cms_all_grades_games_page | teacher_signup_top_banner | click               |                    | 10      |
      |                           |                           | waitForUrlToContain | /teachers/register | 10      |


  @CMS012 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for non-grade/pre-k grade
    When the user performs checking of top banner heading for non-grade/pre-k grade using:
      | page                      | field                        | action     | value                                            | timeout |
      | cms_non_grade_page        | all_games_top_banner_heading | verifyText | Educational Learning Games For Kids              | 10      |
      | cms_all_grades_games_page | gradeprek_button             | click      | Pre-K                                            | 10      |
      | cms_all_grades_games_page | gradeprek_top_banner_heading | verifyText | Educational Learning Games For Preschoolers Kids | 10      |


  @CMS013 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for grade k
    When the user performs checking of top banner heading for grade k using:
      | page                      | field                     | action     | value                                               | timeout |
      | cms_all_grades_games_page | gradek_button             | click      | K                                                   | 10      |
      | cms_all_grades_games_page | gradek_top_banner_heading | verifyText | Educational Learning Games For Kindergarteners Kids | 10      |

  @CMS014 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for grade 1
    When the user performs checking of top banner heading for grade 1 using:
      | page                      | field                     | action     | value                                           | timeout |
      | cms_all_grades_games_page | grade1_button             | click      | 1                                               | 10      |
      | cms_all_grades_games_page | grade1_top_banner_heading | verifyText | Educational Learning Games For 1st Graders Kids | 10      |

  @CMS015 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for grade 2
    When the user performs checking of top banner heading for grade 2 using:
      | page                      | field                     | action     | value                                           | timeout |
      | cms_all_grades_games_page | grade2_button             | click      | 2                                               | 10      |
      | cms_all_grades_games_page | grade2_top_banner_heading | verifyText | Educational Learning Games For 2nd Graders Kids | 10      |

  @CMS016 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for grade 3
    When the user performs checking of top banner heading for grade 3 using:
      | page                      | field                     | action     | value                      | timeout |
      | cms_all_grades_games_page | grade3_button             | click      | 3                          | 10      |
      | cms_all_grades_games_page | grade3_top_banner_heading | verifyText | Math Games for 3rd Graders | 10      |

  @CMS017 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for grade 4
    When the user performs checking of top banner heading for grade 4 using:
      | page                      | field                     | action     | value                      | timeout |
      | cms_all_grades_games_page | grade4_button             | click      | 4                          | 10      |
      | cms_all_grades_games_page | grade4_top_banner_heading | verifyText | Math Games for 4th Graders | 10      |

  @CMS018 @TopBannerHeading
  Scenario: when user lands on All Games screen and verify banner heading for grade 5
    When the user performs checking of top banner heading for grade 5 using:
      | page                      | field                     | action     | value                      | timeout |
      | cms_all_grades_games_page | grade5_button             | click      | 5                          | 10      |
      | cms_all_grades_games_page | grade5_top_banner_heading | verifyText | Math Games for 5th Graders | 10      |

  @CMS019 @SignupFooterBanner
  Scenario: when user signup for free in footer on All Games screen
    When the user performs below to signup using:
      | page                      | field                    | action              | value     | timeout |
      | cms_all_grades_games_page | signupfree_bottom_banner | click               |           | 15      |
      |                           |                          | waitForUrlToContain | /register | 10      |