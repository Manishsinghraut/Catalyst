@all
Feature: (AUTOMATION-1272 )One Member Many Projects - Project and Capital Project

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario: Precondition
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Members-1272.xlsx              |
      | OneMemberManyProjects-1272.xml |

  Scenario Outline: Verify member exist in all the the entities
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name                          | Title            | Phone | Email | Employer          | Job Function         | User Class       |
      | Team Member | Test Case Member 1 1239, None | Lx Administrator |       |       | Selenium-Employer | System Administrator | Lx Administrator |

    Examples:
      | Entities               | Entity Type      |
      | Portfolio Testing-1239 | Portfolio        |
      | facility TESTING-1239  | Facilities       |
      | facility TESTING-1239  | Capital Projects |

  Scenario Outline: Remove member from entities
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I verify tab "One Member Many Projects" is selected by default
    And I set following fields value on editable page
      | name             | value                          |
      | memberID         | 1239, None, Test Case Member 1 |
      | memberEditMode   | true                           |
      | removeOrgChart   | true                           |
      | deactivateMember | true                           |
    And I click on "Next" Button
    And I verify the following message
      | Completely removing <Member> from ALL entities                                 |
      | * Completely removing this member from all Org Charts (Operating and Pre-open) |
      | * Deactivating this member after removing                                      |
    And I verify all rows count "3" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type            | Name                   | Portfolio/Program      | Parent Region | Sub Region | Market  | Project Type | State | Current Membership | Planned Membership |
      | Capital Project | facility TESTING-1239  | Portfolio Testing-1239 | Chicago       |            | Central |              | IL    |Member             | None               |
      | Facility        | facility TESTING-1239  | Portfolio Testing-1239 | Chicago       |            | Central |              |       |Member             | None               |
      | Portfolio       | Portfolio Testing-1239 | Portfolio Testing-1239 |               |            |         |              |       |Member             | None               |
    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Completely removing <Member> from ALL entities (see below)                                           |
      | * Completely removing this member from the Org Chart (Operating and Pre-open)                        |
      | * Deactivating this member after removing                                                            |
      | Finished processing                                                                                  |
      | Total Entities Modified: 3                                                                           |
      | No Errors encountered                                                                                |
      | * Removed from 3 entities                                                                            |
      | Details:                                                                                             |
      | * Org Chart Member changes: Deleted 2 records                                                        |
      | Successfully deactivated '<Member>'                                                                  |

    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I click on "Activate/Deactivate" link
    And I verify a member "<Member>" has status inactivate

    Examples:
      | Member                        |
      | Test Case Member 1 1239, None |

  Scenario Outline: Verify member removed from all the the entities
    When I navigate to entity type "<Entity Type>" named "<Entities>" through search option
    And I click on "Members/Contacts" tab
    And I wait for the Loading text to disappear
    And I verify grid "BOGridMember" is empty with the following message "No rows to display"

    Examples:
      | Entities               | Entity Type      |
      | Portfolio Testing-1239 | Portfolio        |
      | facility TESTING-1239  | Facilities       |
      | facility TESTING-1239  | Capital Projects |

