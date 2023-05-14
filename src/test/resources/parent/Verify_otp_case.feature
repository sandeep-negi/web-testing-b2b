@b2c  @verify_otp
Feature: Verify OTP

  Background:
    Given the user opens "/parents/register?ab_test[Parent::Playzone]=Playzone_On_New" page

  Scenario Outline: OTP from gmail service
    When the user performs below to sign up using  <count>:
      | page              | field          | action | value          | timeout |
      | registration_page | parent_email   | type   | ${parentEmail} |         |
      | registration_page | Password       | type   | ${password}    |         |
      | registration_page | create_account | click  |                |         |
    And call custom method for retrieving otp using:
      | klass        | method | params               | var |
      | EmailLibrary | getOtp | ${data.parent_email} | otp |
    And the user performs below to enter otp:
      | page              | field | action         | value       | timeout |
      | verify_email_page | otp   | type           | ${data.otp} |         |
      |                   |       | sleep          | 10          |         |
      |                   |       | waitForSpinner |             | 10      |
    And the user performs below to select grade 1 :
      | page            | field     | action         | value | timeout |
      | grade_selection | grade_one | fireClickEvent |       | 20      |
    Examples:
      | count |
      | 1     |
      | 2     |
      | 3     |
      | 4     |
      | 5     |
      | 6     |
      | 7     |
      | 8     |
      | 9     |
      | 10    |
      | 11    |
      | 12    |
      | 13    |
      | 14    |
      | 15    |
      | 16    |
      | 17    |
      | 18    |
      | 19    |
      | 20    |
      | 21    |
      | 22    |
      | 23    |
      | 24    |
      | 25    |
      | 26    |
      | 27    |
      | 28    |
      | 29    |
      | 30    |
      | 31    |
      | 32    |
      | 33    |
      | 34    |
      | 35    |
      | 36    |
      | 37    |
      | 38    |
      | 39    |
      | 40    |
      | 41    |
      | 42    |
      | 43    |
      | 44    |
      | 45    |
      | 46    |
      | 47    |
      | 48    |
      | 49    |
      | 50    |
      | 51    |
      | 52    |
      | 53    |
      | 54    |
      | 55    |
      | 56    |
      | 57    |
      | 58    |
      | 59    |
      | 60    |
      | 61    |
      | 62    |
      | 63    |
      | 64    |
      | 65    |
      | 66    |
      | 67    |
      | 68    |
      | 69    |
      | 70    |
      | 71    |
      | 72    |
      | 73    |
      | 74    |
      | 75    |
      | 76    |
      | 77    |
      | 78    |
      | 79    |
      | 80    |
      | 81    |
      | 82    |
      | 83    |
      | 84    |
      | 85    |
      | 86    |
      | 87    |
      | 88    |
      | 89    |
      | 90    |
      | 91    |
      | 92    |
      | 93    |
      | 94    |
      | 95    |
      | 96    |
      | 97    |
      | 98    |
      | 99    |
      | 100   |
      | 101   |
      | 102   |
      | 103   |
      | 104   |
      | 105   |
      | 106   |
      | 107   |
      | 108   |
      | 109   |
      | 110   |
      | 111   |
      | 112   |
      | 113   |
      | 114   |
      | 115   |
      | 116   |
      | 117   |
      | 118   |
      | 119   |
      | 120   |
      | 121   |
      | 122   |
      | 123   |
      | 124   |
      | 125   |
      | 126   |
      | 127   |
      | 128   |
      | 129   |
      | 130   |
      | 131   |
      | 132   |
      | 133   |
      | 134   |
      | 135   |
      | 136   |
      | 137   |
      | 138   |
      | 139   |
      | 140   |
      | 141   |
      | 142   |
      | 143   |
      | 144   |
      | 145   |
      | 146   |
      | 147   |
      | 148   |
      | 149   |
      | 150   |