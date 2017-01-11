@all
Feature: (AUTOMATION-1276) Deactivating and Removing Member from All Entities(Program/Prototype/Site)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: Pre-Condition
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Member_Test-1276.xlsx |
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I search member "<Member>"
    And I verify the following values in non frame grid "BOGridBOListExtGridPerson"
      | Name     | Member? |
      | <Member> | Yes     |

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | RemoveMemberEntities-1276.xml |

    Examples:
      | Member              |
      | Member Testing 1256 |

  Scenario Outline: Navigate to Capital Program Testing-1256 > Org Chart and ensure that Member Testing 1256 Member is displayed
    When I navigate to entity type "Capital Programs" named "Capital Program Testing-1256" through search option
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email            | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       | QA1@lucernex.com | Selenium-Employer | Delete Access | Delete Access |

    And I switch to default frame
    And I navigate to "Org Chart"
    Then I verify members in "<Region Name>" org chart
      | name          | value    |
      | Delete Access | <Member> |

    When I navigate to entity type "Sites" named "Site Testing-1256" through search option
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email            | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       | QA1@lucernex.com | Selenium-Employer | Delete Access | Delete Access |

    When I navigate to entity type "Prototype" named "Prototype Testing-1256"
    And I click on "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name     | Title         | Phone | Email            | Employer          | Job Function  | User Class    |
      | Broker | <Member> | Delete Access |       | QA1@lucernex.com | Selenium-Employer | Delete Access | Delete Access |


    Examples:
      | Member              | Region Name |
      | Member Testing 1256 | PR-CP       |

  Scenario Outline: Deactivate member
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name             | value      |
      | memberID         | <MemberID> |
      | memberEditMode   | true       |
      | removeOrgChart   | true       |
      | deactivateMember | true       |

    And I click on "Next" Button
    And I verify the following message
      | Completely removing <Member Name> from ALL entities                            |
      | * Completely removing this member from all Org Charts (Operating and Pre-open) |
      | * Deactivating this member after removing                                      |

    And I verify the following values in non frame grid "entitySelect"
      | Type            | Name                         | Portfolio/Program            | Parent Region                                       | Sub Region | Market  | Project Type | Current Membership | Planned Membership |
      | Capital Program | Capital Program Testing-1256 | Capital Program Testing-1256 |                                                     |            |         |              | Member             | None               |
      | Prototype       | Prototype Testing-1256       | Lucernex-Selenium            |                                                     |            |         |              | Member             | None               |
      | Site            | Site Testing-1256            | Lucernex-Selenium            | Central (Central region - preOpen) Frisco(Pre-Open) |            | Central |              | Member             | None               |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Completely removing <Member Name> from ALL entities (see below)                                      |
      | * Completely removing this member from the Org Chart (Operating and Pre-open)                        |
      | * Deactivating this member after removing                                                            |
      | Finished processing                                                                                  |
      | Total Entities Modified: 3                                                                           |
      | No Errors encountered                                                                                |
      | * Removed from 3 entities                                                                            |
      | Details:                                                                                             |
      | * Org Chart Member changes: Deleted 1 record                                                         |
      | Successfully deactivated '<Member Name>'                                                             |

    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I click on "Activate/Deactivate" link
    And I verify a member "<Member Name>" has status inactivate

    Examples:
      | Member Name         | MemberID             |
      | Member Testing 1256 | Testing 1256, Member |

  Scenario Outline: Navigate to Capital Program Testing-1256 > Org Chart and ensure that Member Testing 1256 Member is removed
    When I navigate to entity type "Capital Programs" named "Capital Program Testing-1256" through search option
    And I click on "Members/Contacts" tab
    And I wait for the Loading text to disappear
    Then I verify grid "BOGridMember" is empty with the following message "No rows to display"

    And I switch to default frame
    And I navigate to "Org Chart"
    Then I verify members in "<Region Name>" org chart not present
      | name          | value    |
      | Delete Access | <Member> |

    When I navigate to entity type "Sites" named "Site Testing-1256" through search option
    And I click on "Members/Contacts" tab
    And I wait for the Loading text to disappear
    Then I verify grid "BOGridMember" is empty with the following message "No rows to display"

    When I navigate to entity type "Prototype" named "Prototype Testing-1256"
    And I click on "Members/Contacts" tab
    And I wait for the Loading text to disappear
    Then I verify grid "BOGridMember" is empty with the following message "No rows to display"

    Examples:
      | Member              | Region Name |
      | Member Testing 1256 | PR-CP       |