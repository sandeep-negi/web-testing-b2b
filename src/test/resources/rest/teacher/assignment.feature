@api
Feature: Assignment API

  Scenario: Mark specific assignment as complete
    Given Login to Teacher account using:
      | email                                   | password |
      | auto_teacher+apitesting@splashlearn.com | 123456   |

    When send request to "complete assignment"
      | klass | learningObjectiveId |
      | Test  | 1                   |

    When send request to "complete all assignment" for klass ""
      | klass | learningObjectiveId |
      | Test  | 1                   |

  Scenario: Mark all assignments as complete
    Given Login to Teacher account using:
      | email                                   | password |
      | auto_teacher+apitesting@splashlearn.com | 123456   |

    When send request to "complete all assignment" for klass ""
