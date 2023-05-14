@tutoring @splashcourse
Feature: Book Your Class Splashcourse Flow

  Background:
    Given the user opens "http://staging-1.splashlearn.com/splashcourses" page


  @CMS064 @book_your_course @new_user @landing_screen
  Scenario: The user performs the book your class for new user flow till splashcourse landing screen:
    When the user performs below  screen field validation and enter email using:
      | page                                   | field                      | action     | value                           | timeout |
      | tutoring_splashcourse_enter_your_email | user_email_header          | verifyText | Enter your email to get started |         |
      | tutoring_splashcourse_enter_your_email | parent_email_field_label   | verifyText | PARENT'S EMAIL ID               |         |
      | tutoring_splashcourse_enter_your_email | parent_email_submit_button | click      |                                 | 10      |
      | tutoring_splashcourse_enter_your_email | parent_email_error_message | verifyText | Please enter valid email        |         |
      | tutoring_splashcourse_enter_your_email | parent_email_text_box      | clear      |                                 |         |
      | tutoring_splashcourse_enter_your_email | parent_email_text_box      | type       | ${parentEmail}                  |         |
      | tutoring_splashcourse_enter_your_email | parent_email_submit_button | click      |                                 | 10      |

    And the user performs validation of fields on splashcourse screen:
      | page                            | field                              | action              | value                                       | timeout |
      |                                 |                                    | waitForUrlToContain | /tutoring/courses                           | 10      |
      | tutoring_courses_landing_screen | course_heading                     | verifyText          | Get Ahead with Live Online Tutoring for K-5 | 10      |
      | tutoring_courses_landing_screen | home_course_breadcrumb_1           | verifyText          | Home                                        | 10      |
      | tutoring_courses_landing_screen | home_course_breadcrumb_2           | verifyText          | Courses                                     | 10      |
      | tutoring_courses_landing_screen | home_grade_dropdown                | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_content_type_games_option     | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_content_type_worksheet_option | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_content_type_liveCourses      | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_course_type_math_option       | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_course_type_ela_option        | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_course_type_ela_option        | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_course_book_your_class_button | exists              |                                             |         |
      | tutoring_courses_landing_screen | home_course_book_your_class_button | click               |                                             |         |


  @CMS065 @book_your_course @new_user @grade_screen
  Scenario: The user performs the book your class for new user flow till splashcourse grade screen for Gradek:
    When the user performs below to go to courses screen using:
      | page                                   | field                      | action              | value                           | timeout |
      | tutoring_splashcourse_enter_your_email | user_email_header          | verifyText          | Enter your email to get started |         |
      | tutoring_splashcourse_enter_your_email | parent_email_text_box      | type                | ${parentEmail}                  |         |
      | tutoring_splashcourse_enter_your_email | parent_email_submit_button | click               |                                 | 10      |
      |                                        |                            | waitForUrlToContain | /tutoring/courses               | 10      |

    And the user performs validation of grade drop down fields on splashcourse screen:
      | page                            | field                             | action | value | timeout |
      | tutoring_courses_landing_screen | home_grade_dropdown               | click  |       |         |
      | tutoring_courses_landing_screen | home_grade_dropdown_gradek_option | exists |       |         |
      | tutoring_courses_landing_screen | home_grade_dropdown_grade1_option | exists |       |         |
      | tutoring_courses_landing_screen | home_grade_dropdown_grade2_option | exists |       |         |
      | tutoring_courses_landing_screen | home_grade_dropdown_grade3_option | exists |       |         |
      | tutoring_courses_landing_screen | home_grade_dropdown_grade4_option | exists |       |         |
      | tutoring_courses_landing_screen | home_grade_dropdown_grade5_option | exists |       |         |

    And the user performs validation of on Gradek splashcourse screen:
      | page                             | field                             | action              | value                                               | timeout |
      | tutoring_courses_landing_screen  | home_grade_dropdown_gradek_option | click               |                                                     |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-kindergarteners               | 10      |
      | tutoring_couses_gradewise_screen | courses_gradek_heading            | verifyText          | Kindergarten Math Courses                           |         |
      | tutoring_couses_gradewise_screen | courses_gradek_breadcrumb_1       | verifyText          | Home                                                |         |
      | tutoring_couses_gradewise_screen | courses_gradek_breadcrumb_2       | verifyText          | Courses                                             |         |
      | tutoring_couses_gradewise_screen | courses_gradek_breadcrumb_3       | verifyText          | Kindergarten                                        |         |
      | tutoring_couses_gradewise_screen | courses_gradek_course_card        | click               |                                                     | 10      |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses/ultimate-kindergarten-math-course | 10      |
      |                                  |                                   | back                |                                                     |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-kindergarteners               | 10      |

    And the user performs validation of on Grade1 splashcourse screen:
      | page                             | field                             | action              | value                                              | timeout |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | click               |                                                    |         |
      | tutoring_courses_landing_screen  | home_grade_dropdown_grade1_option | click               |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-1st-graders                  | 10      |
      | tutoring_couses_gradewise_screen | courses_grade1_heading            | verifyText          | 1st Grade Math Courses                             |         |
      | tutoring_couses_gradewise_screen | courses_grade1_breadcrumb_1       | verifyText          | Home                                               |         |
      | tutoring_couses_gradewise_screen | courses_grade1_breadcrumb_2       | verifyText          | Courses                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade1_breadcrumb_3       | verifyText          | Grade 1                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade1_course_card        | click               |                                                    | 10      |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-1-math-course | 10      |
      |                                  |                                   | back                |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-1st-graders                  | 10      |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | exists              |                                                    | 10      |

    And the user performs validation of on Grade2 splashcourse screen:
      | page                             | field                             | action              | value                                              | timeout |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | click               |                                                    |         |
      | tutoring_courses_landing_screen  | home_grade_dropdown_grade2_option | click               |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-2nd-graders                  | 10      |
      | tutoring_couses_gradewise_screen | courses_grade2_heading            | verifyText          | 2nd Grade Math Courses                             |         |
      | tutoring_couses_gradewise_screen | courses_grade2_breadcrumb_1       | verifyText          | Home                                               |         |
      | tutoring_couses_gradewise_screen | courses_grade2_breadcrumb_2       | verifyText          | Courses                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade2_breadcrumb_3       | verifyText          | Grade 2                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade2_course_card        | click               |                                                    | 10      |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-2-math-course | 10      |
      |                                  |                                   | back                |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-2nd-graders                  | 10      |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | exists              |                                                    | 10      |

    And the user performs validation of on Grade3 splashcourse screen:
      | page                             | field                             | action              | value                                              | timeout |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | click               |                                                    |         |
      | tutoring_courses_landing_screen  | home_grade_dropdown_grade3_option | click               |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-3rd-graders                  | 10      |
      | tutoring_couses_gradewise_screen | courses_grade3_heading            | verifyText          | 3rd Grade Courses                                  |         |
      | tutoring_couses_gradewise_screen | courses_grade3_breadcrumb_1       | verifyText          | Home                                               |         |
      | tutoring_couses_gradewise_screen | courses_grade3_breadcrumb_2       | verifyText          | Courses                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade3_breadcrumb_3       | verifyText          | Grade 3                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade3_course_card        | click               |                                                    | 10      |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-3-math-course | 10      |
      |                                  |                                   | back                |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-3rd-graders                  | 10      |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | exists              |                                                    | 10      |

    And the user performs validation of on Grade4 splashcourse screen:
      | page                             | field                             | action              | value                                              | timeout |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | click               |                                                    |         |
      | tutoring_courses_landing_screen  | home_grade_dropdown_grade4_option | click               |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-4th-graders                  | 10      |
      | tutoring_couses_gradewise_screen | courses_grade4_heading            | verifyText          | 4th Grade Courses                                  |         |
      | tutoring_couses_gradewise_screen | courses_grade4_breadcrumb_1       | verifyText          | Home                                               |         |
      | tutoring_couses_gradewise_screen | courses_grade4_breadcrumb_2       | verifyText          | Courses                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade4_breadcrumb_3       | verifyText          | Grade 4                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade4_course_card        | click               |                                                    | 10      |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-4-math-course | 10      |
      |                                  |                                   | back                |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-4th-graders                  | 10      |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | exists              |                                                    | 10      |

    And the user performs validation of on Grade5 splashcourse screen:
      | page                             | field                             | action              | value                                              | timeout |
      | tutoring_courses_landing_screen  | home_grade_dropdown               | click               |                                                    |         |
      | tutoring_courses_landing_screen  | home_grade_dropdown_grade5_option | click               |                                                    |         |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses-for-5th-graders                  | 10      |
      | tutoring_couses_gradewise_screen | courses_grade5_heading            | verifyText          | 5th Grade Courses                                  |         |
      | tutoring_couses_gradewise_screen | courses_grade5_breadcrumb_1       | verifyText          | Home                                               |         |
      | tutoring_couses_gradewise_screen | courses_grade5_breadcrumb_2       | verifyText          | Courses                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade5_breadcrumb_3       | verifyText          | Grade 5                                            |         |
      | tutoring_couses_gradewise_screen | courses_grade5_course_card        | click               |                                                    | 10      |
      |                                  |                                   | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-5-math-course | 10      |

  @CMS066 @book_your_course @new_user @grade_screen
  Scenario: The user performs the validation of links under content type section:
    When the user performs below to validate Games link under Content type section screen using:
      | page                                   | field                          | action              | value                           | timeout |
      | tutoring_splashcourse_enter_your_email | user_email_header              | verifyText          | Enter your email to get started |         |
      | tutoring_splashcourse_enter_your_email | parent_email_text_box          | type                | ${parentEmail}                  |         |
      | tutoring_splashcourse_enter_your_email | parent_email_submit_button     | click               |                                 | 10      |
      |                                        |                                | waitForUrlToContain | /tutoring/courses               | 10      |
      | tutoring_courses_landing_screen        | home_content_type_games_option | click               |                                 | 10      |
      |                                        |                                | waitForUrlToContain | /games                          | 10      |
      |                                        |                                | back                |                                 |         |
      |                                        |                                | waitForUrlToContain | /tutoring/courses               | 10      |
      | tutoring_courses_landing_screen        | home_grade_dropdown            | exists              |                                 | 10      |

    And the user performs below to validate Worksheet link under Content type section screen using:
      | page                            | field                              | action              | value             | timeout |
      | tutoring_courses_landing_screen | home_content_type_worksheet_option | click               |                   | 10      |
      |                                 |                                    | waitForUrlToContain | /math-worksheets  | 10      |
      |                                 |                                    | back                |                   |         |
      |                                 |                                    | waitForUrlToContain | /tutoring/courses | 10      |
      | tutoring_courses_landing_screen | home_grade_dropdown                | exists              |                   | 10      |

    And the user performs below to validate Live Courses link under Content type section screen using:
      | page                            | field                         | action              | value             | timeout |
      | tutoring_courses_landing_screen | home_content_type_liveCourses | click               |                   | 10      |
      |                                 |                               | waitForUrlToContain | /tutoring/courses | 10      |


  @CMS074 @book_your_course @new_user @subject_screen
  Scenario: The user performs the validation of links under Courses type section:
    When the user performs signing up of new user using:
      | page                                   | field                      | action              | value                           | timeout |
      | tutoring_splashcourse_enter_your_email | user_email_header          | verifyText          | Enter your email to get started |         |
      | tutoring_splashcourse_enter_your_email | parent_email_text_box      | type                | ${parentEmail}                  |         |
      | tutoring_splashcourse_enter_your_email | parent_email_submit_button | click               |                                 | 10      |
      |                                        |                            | waitForUrlToContain | /tutoring/courses               | 10      |

    And the user performs validation for option under math courses using:
      | page                                | field                                | action              | value                                              | timeout |
      | tutoring_courses_landing_screen     | home_course_type_math_option         | click               |                                                    | 10      |
      |                                     |                                      | waitForUrlToContain | /tutoring/math-courses                             | 10      |
      | tutoring_courses_landing_screen     | home_courses_math_drop_down_option_1 | exists              |                                                    | 10      |
      | tutoring_courses_subjectwise_screen | course_math_header                   | verifyText          | Math Courses                                       | 10      |
      | tutoring_courses_subjectwise_screen | course_math_breadcrumb_1             | verifyText          | Home                                               | 10      |
      | tutoring_courses_subjectwise_screen | course_math_breadcrumb_2             | verifyText          | Courses                                            | 10      |
      | tutoring_courses_subjectwise_screen | course_math_breadcrumb_3             | verifyText          | Math                                               | 10      |
      | tutoring_courses_subjectwise_screen | course_math_book_your_free_class     | click               |                                                    | 10      |
      |                                     |                                      | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-3-math-course | 10      |
      |                                     |                                      | back                |                                                    |         |
      |                                     |                                      | waitForUrlToContain | /tutoring/math-courses                             | 10      |
      | tutoring_courses_landing_screen     | home_grade_dropdown                  | exists              |                                                    | 10      |


    And the user performs validation for option under ela courses using:
      | page                                | field                               | action              | value                                                 | timeout |
      | tutoring_courses_landing_screen     | home_course_type_ela_option         | click               |                                                       | 10      |
      |                                     |                                     | waitForUrlToContain | /tutoring/ela-courses                                 | 10      |
      | tutoring_courses_landing_screen     | home_courses_ela_drop_down_option_1 | exists              |                                                       | 10      |
      | tutoring_courses_subjectwise_screen | course_ela_header                   | verifyText          | ELA Courses                                           | 10      |
      | tutoring_courses_subjectwise_screen | course_ela_breadcrumb_1             | verifyText          | Home                                                  | 10      |
      | tutoring_courses_subjectwise_screen | course_ela_breadcrumb_2             | verifyText          | Courses                                               | 10      |
      | tutoring_courses_subjectwise_screen | course_ela_breadcrumb_3             | verifyText          | ELA                                                   | 10      |
      | tutoring_courses_subjectwise_screen | course_ela_book_your_free_class     | click               |                                                       | 10      |
      |                                     |                                     | waitForUrlToContain | /tutoring/courses/the-ultimate-grade-3-reading-course | 10      |