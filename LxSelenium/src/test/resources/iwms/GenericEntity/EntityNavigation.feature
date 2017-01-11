@all @smoke @smoke1Dot1
Feature: Test the navigation of all entities and sub-tabs
  that are common to all entities. Logged in as Lx Administrator

  Background:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: Navigation through all entity tabs should take me to Details, Summary
#    When I navigate to "<entity-type>"
    When I navigate to "<entity-type>" entity
    Then I see that I am on the "<entity-type>" entity tab
    And I see that I am on the second level tab "Details"
    And I see that I am on the third level tab "Summary"

    Examples:
      | entity-type |
      | Portfolio   |
      | Program     |
      | Prototype   |
      | Site        |
      | Project     |
      | Location    |
      | Parcel      |
      | Facility    |
      | Contract    |

  Scenario Outline: Program, Site, Project, Location, Parcel, and Facility should have access to all sub-tabs
#    When I click on the "<entity-type>" entity tab
    When I navigate to "<entity-type>" entity
    And I see that I am on the "<entity-type>" entity tab
    Then I can navigate to these tabs:
      | Members/Contacts |
      | Summary          |
      | Forms            |
      | Work Flow        |
      | Documents        |
      | Binders          |
      | Schedule         |
      | Budget           |

    Examples:
      | entity-type |
      | Program     |
      | Site        |
      | Project     |
      | Location    |
      | Parcel      |
      | Facility    |

  Scenario Outline: Program and Prototype should not see the schedule tab
#    When I click on the "<entity-type>" entity tab
    When I navigate to "<entity-type>" entity
    And I see that I am on the "<entity-type>" entity tab
    Then I can navigate to these tabs:
      | Members/Contacts |
      | Summary          |
      | Members/Contacts |
      | Forms            |
      | Work Flow        |
      | Documents        |
      | Binders          |
      | Budget           |

    Examples:
      | entity-type |
      | Program     |
      | Prototype   |

  Scenario Outline: Navigate through multiple second and third level tabs
#    Given I click on the "<entity-type>" entity tab
    When I navigate to "<entity-type>" entity
    And I see that I am on the "<entity-type>" entity tab
    When I click on the second level tab "<2nd-level-tab>"
    Then I see that I am on the second level tab "<2nd-level-tab>"
    When I click on the third level tab "<3rd-level-tab>"
    Then I see that I am on the third level tab "<3rd-level-tab>"

    Examples:
      | entity-type | 2nd-level-tab | 3rd-level-tab      |
      | Portfolio   | Demographics  | Criteria           |
      | Site        | Demographics  | Demographics Study |
      | Project     | Equipment     | Work Orders        |
      | Contract    | Payment Info  | Transactions       |

  Scenario Outline: Navigate to a particular entity by the entity's name.
    Given I search Lx for "<entity-name>"
    When I click on the "<entity-name>" link under "<entity-type>"
    Then I see that I am on the entity "<entity-name>"

    Examples:
      | entity-name | entity-type |
      | Project's   | Project     |
      | Site's      | Site        |

  Scenario Outline: Navigation through entities via comma delimited strings
    When I navigate to "<1st-level>,<2nd-level>,<3rd-level>"
    Then I see that I am on the "<1st-level>" entity tab
    And I see that I am on the second level tab "<2nd-level>"
    And I see that I am on the third level tab "<3rd-level>"

    Examples:
      | 1st-level | 2nd-level    | 3rd-level  |
      | Portfolio | Demographics | Criteria   |
      | Contract  | Payment Info | Recoveries |

  Scenario: Contracts should not see the budget tab
    When I click on the "Contract" entity tab
    And I see that I am on the "Contract" entity tab
    Then I can navigate to these tabs:
      | Members/Contacts |
      | Summary          |
      | Members/Contacts |
      | Forms            |
      | Work Flow        |
      | Documents        |
      | Binders          |
      | Schedule         |