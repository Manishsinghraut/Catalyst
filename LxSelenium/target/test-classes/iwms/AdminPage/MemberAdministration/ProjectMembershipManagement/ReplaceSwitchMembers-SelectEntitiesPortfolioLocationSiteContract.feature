@all
Feature: (AUTOMATION-1274)Replace/Switch Members - Select Entities (Portfolio/Location/Site/Contract)

#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario: Precondition
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Member_Test-1274.xlsx |
      | Entity-1274.xml       |

  Scenario Outline: Verify member exist in member/Contacts tab of selected entities
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    Examples:
      | Entities                | Entity Type | Member                        |
      | Replace II Portfolio    | Portfolios  | Replace Member 1 Testing 1241 |
      | Replace Member Location | Locations   | Replace Member 1 Testing 1241 |
      | Replace Contract        | Contracts   | Replace Member 1 Testing 1241 |
      | Selected Site           | Sites       | Replace Member 1 Testing 1241 |

  Scenario Outline: Verify member exist in summary tab of site entity
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |          |
      | Delete Access | <Member> |

    Examples:
      | Entities      | Entity Type | Member                        |
      | Selected Site | Sites       | Replace Member 1 Testing 1241 |

  Scenario Outline: Replace member from entities
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                        | value                          |
      | removeFromReplacedEntitites | true                           |
      | promoteReplacee             | true                           |
      | memberID                    | Testing 1241, Replace Member 1 |
      | replaceWithMemberID         | Testing 1241, Replace Member 2 |

    And I click on "Next" Button
    And I verify the following message
      | Replacing <Member 1> with <Member 2> in selected entities |
      | Only show entities that will have a change in membership  |

    And I verify all rows count "4" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type      | Name                    | Portfolio/Program    | Parent Region | Sub Region | Market  | Project Type | Current Membership | Planned Membership |
      | RE Contract  | Replace Contract        | Replace II Portfolio |               |            |         |              | Member             | Member  <replace>  |
      | Location  | Replace Member Location | Replace II Portfolio |               |            |         |              | Member             | Member  <replace>  |
      | Portfolio | Replace II Portfolio    | Replace II Portfolio |               |            |         |              | Member             | Member  <replace>  |
      | Site      | Selected Site           | Replace II Portfolio | Level1        |            | Central |              | Manager            | Manager  <replace> |
    And I click "<replace>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value            |
      | Type | RE Contract         |
      | Name | Replace Contract |

    And I click "<replace>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value                   |
      | Type | Location                |
      | Name | Replace Member Location |

    And I click "<replace>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value         |
      | Type | Site          |
      | Name | Selected Site |

    And I clear search field in the grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type      | Name                    | Portfolio/Program    | Parent Region | Sub Region | Market  | Project Type | Current Membership | Planned Membership       |
      | RE Contract  | Replace Contract        | Replace II Portfolio |               |            |         |              | Member             | Replace  <don't replace> |
      | Location  | Replace Member Location | Replace II Portfolio |               |            |         |              | Member             | Replace  <don't replace> |
      | Portfolio | Replace II Portfolio    | Replace II Portfolio |               |            |         |              | Member             | Member  <replace>        |
      | Site      | Selected Site           | Replace II Portfolio | Level1        |            | Central |              | Manager            | Replace  <don't replace> |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Replacing <Member 1> with <Member 2>                                                                 |
      | Finished processing                                                                                  |
      | Total Entities Modified: 3                                                                           |
      | No Errors encountered                                                                                |
      | * Replaced in 3 entities                                                                             |

    Examples:
      | Member 1                      | Member 2                      |
      | Replace Member 1 Testing 1241 | Replace Member 2 Testing 1241 |

  Scenario Outline: Verify member replaced in member/Contacts tab of selected entities
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    Examples:
      | Entities                | Entity Type | Member                        |
      | Replace II Portfolio    | Portfolios  | Replace Member 1 Testing 1241 |
      | Replace Member Location | Locations   | Replace Member 2 Testing 1241 |
      | Replace Contract        | Contracts   | Replace Member 2 Testing 1241 |
      | Selected Site           | Sites       | Replace Member 2 Testing 1241 |

  Scenario Outline: Verify member replaced in summary tab of site entity
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |          |
      | Delete Access | <Member> |

    Examples:
      | Entities      | Entity Type | Member                        |
      | Selected Site | Sites       | Replace Member 2 Testing 1241 |

