@all
Feature: (AUTOMATION-1278) Replace Member on Pre-Open Org Chart and Operating Org Chart(Portfolio/Site)

  Scenario Outline: Pre-Condition
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Member_Test-1278.xlsx |
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I verify the following values in non frame grid "BOGridBOListExtGridPerson"
      | Name       | Member? |
      | <Member 1> | Yes     |
      | <Member 2> | Yes     |

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Entity-1278.xml |

    Examples:
      | Member 1                  | Member 2                  |
      | Org Member 1 Testing 1258 | Org Member 2 Testing 1258 |

  Scenario Outline: Navigate to Portfolio and Site view members in member/Contacts tab
    When I navigate to entity type "Portfolios" named "TESTING1258 Portfolio" through search option
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    When I navigate to entity type "Sites" named "TESTING 1258 Site" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |          |
      | Delete Access | <Member> |
    And I switch to default frame
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    Examples:
      | Member                    |
      | Org Member 1 Testing 1258 |


  Scenario Outline: Navigate to Portfolio Expand all and view members for Preopen And Operating status
    When I navigate to entity type "Portfolios" named "TESTING1258 Portfolio" through search option
    And I navigate to "Org Chart"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name            | value              |
      | OperatingStatus | <Operating Status> |
    And I expand "<Region Name>" region list
    And I expand "<Sub Region Name>" region list
    Then I verify members in "<Region Name>" org chart
      | name          | value    |
      | Delete Access | <Member> |
    And I verify members in "<Sub Region Name>" org chart
      | name          | value    |
      | Delete Access | <Member> |
    And I verify members in "<Market Area>" org chart
      | name          | value    |
      | Delete Access | <Member> |

    Examples:
      | Member                    | Region Name           | Sub Region Name       | Market Area        | Operating Status |
      | Org Member 1 Testing 1258 | 1268 Pre Open Parent  | Pre Open Sub Reg 1258 | Legacy Market Area | Pre-open         |
      | Org Member 1 Testing 1258 | Parent Operating 1258 | Sub Operating 1258    | Central            | Operating        |

  Scenario Outline: Replace member from
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                        | value                      |
      | removeFromReplacedEntitites | true                       |
      | memberEditMode              | true                       |
      | orgChartMode                | true                       |
      | promoteReplacee             | true                       |
      | memberID                    | Testing 1258, Org Member 1 |
      | replaceWithMemberID         | Testing 1258, Org Member 2 |
    And I verify the following fields value on editable page
      | name                        | value                      |
      | memberID                    | Testing 1258, Org Member 1 |
      | replaceWithMemberID         | Testing 1258, Org Member 2 |
      | removeFromReplacedEntitites | true                       |
      | memberEditMode              | true                       |
      | orgChartMode                | true                       |
      | promoteReplacee             | true                       |
    And I click on "Next" Button
    And I verify the following message
      | Completely replacing <Member 1> with <Member 2> in ALL entities               |
      | * Completely replacing this member in all Org Charts (Operating and Pre-open) |

    And I verify all rows count "2" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type      | Name                  | Portfolio/Program     | Parent Region        | Sub Region | Market  | Project Type | Current Membership | Planned Membership |
      | Portfolio | TESTING1258 Portfolio | TESTING1258 Portfolio |                      |            |         |              | Member             | Replace            |
      | Site      | TESTING 1258 Site     | TESTING1258 Portfolio | 1268 Pre Open Parent |            | Central |              | Manager            | Replace            |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Replacing <Member 1> with <Member 2>                                                                 |
      | Finished processing                                                                                  |
      | Total Entities Modified: 2                                                                           |
      | No Errors encountered                                                                                |
      | * Replaced in 2 entities                                                                             |
      | Details:                                                                                             |
      | * Org Chart Member changes: Updated 6 records                                                        |

    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I click on "Activate/Deactivate" link
    And I verify a member "<Member 1>" has status activate
    And I verify a member "<Member 2>" has status activate


    Examples:
      | Member 1                  | Member 2                  |
      | Org Member 1 Testing 1258 | Org Member 2 Testing 1258 |

  Scenario Outline: Navigate to Portfolio and Site view members are replaced in member/Contacts tab
    When I navigate to entity type "Portfolios" named "TESTING1258 Portfolio" through search option
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    When I navigate to entity type "Sites" named "TESTING 1258 Site" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |          |
      | Delete Access | <Member> |
    And I switch to default frame
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    Examples:
      | Member                    |
      | Org Member 2 Testing 1258 |

  Scenario Outline: Navigate to Portfolio Expand all and view members are replaced for Preopen And Operating status
    When I navigate to entity type "Portfolios" named "TESTING1258 Portfolio" through search option
    And I navigate to "Org Chart"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name            | value              |
      | OperatingStatus | <Operating Status> |
    And I expand "<Region Name>" region list
    And I expand "<Sub Region Name>" region list

    Then I verify members in "<Region Name>" org chart
      | name          | value      |
      | Delete Access | <Member 2> |
    And I verify members in "<Sub Region Name>" org chart
      | name          | value      |
      | Delete Access | <Member 2> |
    And I verify members in "<Market Area>" org chart
      | name          | value      |
      | Delete Access | <Member 2> |

    Then I verify members in "<Region Name>" org chart not present
      | name          | value      |
      | Delete Access | <Member 1> |
    And I verify members in "<Sub Region Name>" org chart not present
      | name          | value      |
      | Delete Access | <Member 1> |
    And I verify members in "<Market Area>" org chart not present
      | name          | value      |
      | Delete Access | <Member 1> |

    Examples:
      | Member 2                  | Member 1                  | Region Name           | Sub Region Name       | Market Area        | Operating Status |
      | Org Member 2 Testing 1258 | Org Member 1 Testing 1258 | 1268 Pre Open Parent  | Pre Open Sub Reg 1258 | Legacy Market Area | Pre-open         |
      | Org Member 2 Testing 1258 | Org Member 1 Testing 1258 | Parent Operating 1258 | Sub Operating 1258    | Central            | Operating        |
