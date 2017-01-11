@all
Feature: (AUTOMATION-1277) Remove Manager from All entities (Facility and Project)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario: Precondition
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Members_Test-1277.xlsx |
      | TESTING-1277.xml       |

  Scenario: Verify member exist in member/Contacts tab of selected entities
    When I navigate to entity type "Opening Projects" named "Remove Manager Project" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name           | Title            | Phone          | Email | Employer          | Job Function         | User Class       |
      | Team Member | Remove Manager | Lx Administrator | (111) 111-1111 |       | Selenium-Employer | System Administrator | Lx Administrator |

    When I navigate to entity type "Opening Projects" named "Remove Manager Project 2" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name           | Title            | Phone          | Email | Employer          | Job Function         | User Class       |
      | Team Member | Remove Manager | Lx Administrator | (111) 111-1111 |       | Selenium-Employer | System Administrator | Lx Administrator |

    When I navigate to entity type "Facilities" named "Remove Manager Facility" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "2" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name             | Title            | Phone          | Email                  | Employer          | Job Function         | User Class       |
      | Team Member | Lx Administrator | Lx Administrator | 972-403-7100   | WebMaster@Lucernex.com | Lucernex          | Lx Administrator     | Team Member      |
      | Team Member | Remove Manager   | Lx Administrator | (111) 111-1111 |                        | Selenium-Employer | System Administrator | Lx Administrator |

    When I navigate to entity type "Facilities" named "Remove Manager Facility 2" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "2" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name             | Title            | Phone          | Email                  | Employer          | Job Function         | User Class       |
      | Team Member | Lx Administrator | Lx Administrator | 972-403-7100   | WebMaster@Lucernex.com | Lucernex          | Lx Administrator     | Team Member      |
      | Team Member | Remove Manager   | Lx Administrator | (111) 111-1111 |                        | Selenium-Employer | System Administrator | Lx Administrator |

  Scenario Outline: Remove manager from entities and verify member is not deactivated
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I verify tab "One Member Many Projects" is selected by default
    And I set following fields value on editable page
      | name           | value           |
      | memberID       | Manager, Remove |
      | memberEditMode | true            |

    And I click on "Next" Button
    And I verify the following message
      | Completely removing <Member> from ALL entities |
    And I verify all rows count "4" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type            | Name                      | Portfolio/Program | Parent Region                     | Sub Region | Market  | Project Type | Current Membership | Planned Membership |
      | Facility        | Remove Manager Facility   | Lucernex-Selenium | Central Dallas(Operating)         |            | Central |              | Manager            | None               |
      | Facility        | Remove Manager Facility 2 | Lucernex-Selenium | Central Dallas(Operating)         |            | Central |              | Manager            | None               |
      | Opening Project | Remove Manager Project    | Lucernex-Selenium | Central(Central region - preOpen) |            | Central |              | Manager            | None               |
      | Opening Project | Remove Manager Project 2  | Lucernex-Selenium | Central(Central region - preOpen) |            | Central |              | Manager            | None               |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Completely removing <Member> from ALL entities (see below)                                           |
      | Finished processing                                                                                  |
      | Total Entities Modified: 4                                                                           |
      | No Errors encountered                                                                                |
      | * Removed from 4 entities                                                                            |
    And I verify the following text not present in non frame page
      | * Completely removing this member from the Org Chart (Operating and Pre-open) |
      | * Deactivating this member after removing                                     |
      | Details:                                                                      |
      | * Org Chart Member changes: Deleted 2 records                                 |
      | Successfully deactivated '<Member>'                                           |

    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I click on "Activate/Deactivate" link
    And I verify a member "<Member>" has status activate

    Examples:
      | Member         |
      | Remove Manager |

  Scenario: Verify member replaced in member/Contacts tab of selected entities
    When I navigate to entity type "Opening Projects" named "Remove Manager Project" through search option
    And I click on "Members/Contacts" tab
    And I wait for the Loading text to disappear
    And I verify grid "BOGridMember" is empty with the following message "No rows to display"

    When I navigate to entity type "Opening Projects" named "Remove Manager Project 2" through search option
    And I click on "Members/Contacts" tab
    And I wait for the Loading text to disappear
    And I verify grid "BOGridMember" is empty with the following message "No rows to display"

    When I navigate to entity type "Facilities" named "Remove Manager Facility" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name             | Title            | Phone        | Email                  | Employer | Job Function     | User Class  |
      | Team Member | Lx Administrator | Lx Administrator | 972-403-7100 | WebMaster@Lucernex.com | Lucernex | Lx Administrator | Team Member |

    When I navigate to entity type "Facilities" named "Remove Manager Facility 2" through search option
    And I click on "Members/Contacts" tab
    And I verify all rows count "1" in the frame grid "BOGridMember"
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name             | Title            | Phone        | Email                  | Employer | Job Function     | User Class  |
      | Team Member | Lx Administrator | Lx Administrator | 972-403-7100 | WebMaster@Lucernex.com | Lucernex | Lx Administrator | Team Member |
