@all
Feature: (AUTOMATION-1275) One Member Many Projects-Adding Member as Manager to Facility and Contract

#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: Pre-Condition
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | Member_Test-1275.xlsx                                  |
      | Adding_Manager_Testing_1255_Contract_Facility-1275.xml |
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I search member "<Member>"
    And I verify the following values in non frame grid "BOGridBOListExtGridPerson"
      | Name     | Member? |
      | <Member> | Yes     |

    Examples:
      | Member                 |
      | FC Entity Testing 1255 |

  Scenario Outline: Verify member not exist in summary tab of contract and facility entities
    When I navigate to entity type "Facilities" named "Adding Manager Testing-1255 Facility" through search option
    And I click on "Summary" tab
    Then I verify the following details is not present in non editable summary page in frame grid
      | Management    |               |
      | Delete Access | <Member Name> |

    When I navigate to entity type "Contracts" named "Adding Manager Testing-1255 Contract" through search option
    And I click on "Summary" tab
    Then I verify the following details is not present in non editable summary page in frame grid
      | Management    |               |
      | Delete Access | <Member Name> |

    Examples:
      | Member Name            |
      | FC Entity Testing 1255 |

  Scenario Outline: Adding Member as Manager to Facility and Contract
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name     | value      |
      | memberID | <MemberID> |

    And I click on "Next" Button
    And I verify the following message
      | Adding/removing <Member Name> in selected entities       |
      | Only show entities that will have a change in membership |
    And I click "Set Filters.." button
    And I wait for "Contact Info" modal window to open in non frame page
    And I set following fields value on editable page
      | name                    | value |
      | peSecInc_Program        | false |
      | peInc_Location          | false |
      | peInc_Project           | false |
      | peSecInc_CapitalProgram | false |
      | peInc_Parcel            | false |
      | peSecInc_Prototype      | false |
      | peInc_PotentialProject  | false |
      | peInc_CapitalProject    | false |
      | peInc_Facility          | true  |
      | peInc_Contract          | true  |
      | peSecInc_AssetContract  | false |

    And I click on the "Apply Filters" button
#    And I wait for "Contact Info" modal window to close
    And I search for record "1255"
    And I verify all rows count "2" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type        | Name                                 | Portfolio/Program | Parent Region             | Sub Region | Market             | Project Type | Current Membership | Planned Membership      |
      | RE Contract | Adding Manager Testing-1255 Contract | Lucernex-Selenium |                           |            | Legacy Market Area |              | Member             | Member  <remove>        |
      | Facility    | Adding Manager Testing-1255 Facility | Lucernex-Selenium | Central Dallas(Operating) |            | Central            |              | None               | None <Member> <Manager> |

    And I click "<remove>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value                                |
      | Name | Adding Manager Testing-1255 Contract |
      | Type | RE Contract                          |

    And I clear search field in the grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type        | Name                                 | Portfolio/Program | Parent Region             | Sub Region | Market             | Project Type | Current Membership | Planned Membership      |
      | RE Contract | Adding Manager Testing-1255 Contract | Lucernex-Selenium |                           |            | Legacy Market Area |              | Member             | None <Member> <Manager> |
      | Facility    | Adding Manager Testing-1255 Facility | Lucernex-Selenium | Central Dallas(Operating) |            | Central            |              | None               | None <Member> <Manager> |

    And I click "<Manager>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value                                |
      | Name | Adding Manager Testing-1255 Contract |
      | Type | RE Contract                          |

    And I click "<Manager>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value                                |
      | Name | Adding Manager Testing-1255 Facility |
      | Type | Facility                             |
    And I clear search field in the grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type        | Name                                 | Portfolio/Program | Parent Region             | Sub Region | Market             | Project Type | Current Membership | Planned Membership |
      | RE Contract | Adding Manager Testing-1255 Contract | Lucernex-Selenium |                           |            | Legacy Market Area |              | Member             | Manager  <remove>  |
      | Facility    | Adding Manager Testing-1255 Facility | Lucernex-Selenium | Central Dallas(Operating) |            | Central            |              | None               | Manager  <remove>  |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Selectively adding/removing <Member Name> (see below)                                                |
      | Finished processing                                                                                  |
      | Total Entities Modified: 2                                                                           |
      | No Errors encountered                                                                                |
      | * Added as manager to 2 entities                                                                     |

    Examples:
      | Member Name            | MemberID                |
      | FC Entity Testing 1255 | Testing 1255, FC Entity |


  Scenario Outline: Verify member added in summary tab of contract and facility entities
    When I navigate to entity type "Facilities" named "Adding Manager Testing-1255 Facility" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |          |
      | Delete Access | <Member> |

    When I navigate to entity type "Contracts" named "Adding Manager Testing-1255 Contract" through search option
    And I click on "Summary" tab
    And I verify the following details in non editable summary page in frame grid
      | Management    |          |
      | Delete Access | <Member> |

    Examples:
      | Member                 |
      | FC Entity Testing 1255 |