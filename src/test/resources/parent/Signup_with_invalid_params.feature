@b2c  @regression @b2c_final @b2c_prod @invalid_params
Feature: signup with invalid parameters

  Background:
    Given the user opens "/parents/register?ab_test[Parent::Playzone]=Playzone_On_New" page

  Scenario: Verify user should get the validation message on email text box if input invalid email
    When the user performs below to sign up using:
      | page              | field                         | action                | value                        | timeout |
      | registration_page | parent_email                  | type                  | webtesting#splashlearn.com |         |
      | registration_page | Password                      | type                  | ${password}                  |         |
      | registration_page | validation_invalid_email_text | waitForElementVisible |                              | 5       |

  Scenario: Verify user should get the validation message on email text box when enter duplicate email
    When the user performs below to sign up using:
      | page              | field                           | action                | value                                    | timeout |
      | registration_page | parent_email                    | type                  | webtesting+na_11jul.pp@splashlearn.com |         |
      | registration_page | Password                        | type                  | ${password}                              |         |
      | registration_page | validation_duplicate_email_text | waitForElementVisible |                                          | 5       |

  Scenario: Verify user should get the validation message entering password less than 5 chars  or  digit
    When the user performs below to sign up using:
      | page              | field          | action                | value          | timeout |
      | registration_page | parent_email   | type                  | ${parentEmail} |         |
      | registration_page | Password       | type                  | 12345          |         |
      | registration_page | pwd_validation | waitForElementVisible |                | 15       |