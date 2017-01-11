@all
Feature: (AUTOMATION-1273 )Replace/Switch Members - All Entities (Portfolio/Location/Project)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario: Precondition
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | MemberTest-1273.xlsx                          |
      | Project_Membership_Management_Entity-1273.xml |

  Scenario Outline: Verify member exist in member/Contacts tab of all the entities
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name                           | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | Member Switch One Testing 1240 | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    Examples:
      | Entities                                | Entity Type      |
      | Project Membership Management Portfolio | Portfolios       |
      | Replace Location                        | Locations        |
      | Replace Project                         | Opening Projects |

  Scenario Outline: Verify member exist in summary tab of project entity
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |                                |
      | Delete Access | Member Switch One Testing 1240 |

    Examples:
      | Entities        | Entity Type      |
      | Replace Project | Opening Projects |

  Scenario Outline: Replace member from entities
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I verify tab "One Member Many Projects" is selected by default
    And I click on "Replace / Switch Members" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                        | value                           |
      | memberID                    | Testing 1240, Member Switch One |
      | replaceWithMemberID         | Testing 1240, Member Switch Two |
      | removeFromReplacedEntitites | true                            |
      | memberEditMode              | true                            |
      | removeFromReplacedEntitites | true                            |
    And I click on "Next" Button
    And I verify the following message
      | Completely replacing <Member 1> with <Member 2> in ALL entities |

    And I verify all rows count "3" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type            | Name                                    | Portfolio/Program                       | Parent Region | Sub Region | Market             | Project Type | Current Membership | Planned Membership |
      | Location        | Replace Location                        | Project Membership Management Portfolio |               |            |                    |              | Member             | Replace            |
      | Opening Project | Replace Project                         | Project Membership Management Portfolio | PM2           |            | Legacy Market Area |              | Manager            | Replace            |
      | Portfolio       | Project Membership Management Portfolio | Project Membership Management Portfolio |               |            |                    |              | Member             | Replace            |
    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Replacing <Member 1> with <Member 2>                                                                 |
      | Finished processing                                                                                  |
      | Total Entities Modified: 3                                                                           |
      | No Errors encountered                                                                                |
      | * Replaced in 3 entities                                                                             |

    Examples:
      | Member 1                       | Member 2                       |
      | Member Switch One Testing 1240 | Member Switch Two Testing 1240 |

  Scenario Outline: Verify member is replaced in member/Contacts tab of all the entities
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name                           | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Broker | Member Switch Two Testing 1240 | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |

    Examples:
      | Entities                                | Entity Type      |
      | Project Membership Management Portfolio | Portfolios       |
      | Replace Location                        | Locations        |
      | Replace Project                         | Opening Projects |

  Scenario Outline: Verify member is replaced in summary tab of project entity
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |                                |
      | Delete Access | Member Switch Two Testing 1240 |

    Examples:
      | Entities        | Entity Type      |
      | Replace Project | Opening Projects |

