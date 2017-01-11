@all
Feature: (AUTOMATION-1301) One Member many Project-Remove Manager from all grid rows

  Scenario: Pre-Condition
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following file name:
      | Member_Test_15650.xlsx |
      | 16Entity_1301.xml           |

  Scenario Outline: Verify Manager exist in summary tab
    When I navigate to entity type "<Entity Type>" named "<Entity Name>" through search option
    Then I verify "<Entity Name>" name on the header
    And I verify the following details in non editable summary page in frame grid
      | Management    |               |
      | Delete Access | <Member Name> |

    Examples:
      | Member Name             | Entity Type      | Entity Name     |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 1  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 2  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 3  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 4  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 5  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 6  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 7  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 8  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 9  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 10 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 11 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 12 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 13 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 14 |
      | Member 7a Testing 15650 | Sites            | Site OMMP -19   |
      | Member 7a Testing 15650 | Sites            | Site OMMP -20   |


  Scenario Outline: Remove Manager from all grid rows displayed
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name     | value         |
      | memberID | <Member Name> |
    And I verify the following fields value on editable page
      | name                | value |
      | memberEditMode      | false |
      | applySchedTemplates | false |

    And I click on "Next" Button
    And I search for record "OMMP"
    And I verify rows count in multiple pages "16" in non frame grid "<Grid ID>"
    And I verify following values in non frame grid "<Grid ID>"
      | Type            | Name            | Portfolio/Program | Parent Region                     | Sub Region | Market             | Project Type | Current Membership | Planned Membership |
      | Opening Project | Project OMMP 1  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 2  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 3  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 4  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 5  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 6  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 7  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 8  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 9  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 10 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 11 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 12 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 13 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Opening Project | Project OMMP 14 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Site            | Site OMMP -19   | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |
      | Site            | Site OMMP -20   | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | Manager  <remove>  |

    And I click on the "Remove Manager from all grid rows" action of header "Planned Membership" in non frame grid "<Grid ID>"
    And I verify following values in non frame grid "<Grid ID>"
      | Type            | Name            | Portfolio/Program | Parent Region                     | Sub Region | Market             | Project Type | Current Membership | Planned Membership      |
      | Opening Project | Project OMMP 1  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 2  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 3  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 4  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 5  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 6  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 7  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 8  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 9  | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 10 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 11 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 12 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 13 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Opening Project | Project OMMP 14 | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Site            | Site OMMP -19   | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |
      | Site            | Site OMMP -20   | Lucernex-Selenium | Central(Central region - preOpen) |            | Legacy Market Area |              | Manager            | None <Member> <Manager> |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Selectively adding/removing <Member Full Name> (see below)                                           |
      | Finished processing                                                                                  |
      | Total Entities Modified: 16                                                                          |
      | No Errors encountered                                                                                |
      | * Removed from 16 entities                                                                           |


    Examples:
      | Member Name              | Grid ID      | Member Full Name        |
      | Testing 15650, Member 7a | entitySelect | Member 7a Testing 15650 |


  Scenario Outline: Verify Manager not exist in summary tab
    When I navigate to entity type "<Entity Type>" named "<Entity Name>" through search option
    Then I verify "<Entity Name>" name on the header
    And I verify the following details is not present in non editable summary page in frame grid
      | Management    |               |
      | Delete Access | <Member Name> |

    Examples:
      | Member Name             | Entity Type      | Entity Name     |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 1  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 2  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 3  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 4  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 5  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 6  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 7  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 8  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 9  |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 10 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 11 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 12 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 13 |
      | Member 7a Testing 15650 | Opening Projects | Project OMMP 14 |
      | Member 7a Testing 15650 | Sites            | Site OMMP -19   |
      | Member 7a Testing 15650 | Sites            | Site OMMP -20   |