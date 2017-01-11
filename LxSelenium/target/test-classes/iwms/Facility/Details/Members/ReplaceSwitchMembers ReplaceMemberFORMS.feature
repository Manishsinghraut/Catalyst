@all
Feature: Replace/Switch Members : Replace Member - FORMS (Ref : Jira Ticket No : AUTOMATION-1285)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals/Forms/"
    And I import following file name:
      | 1266_Members_1285.xlsx |
      | 1266_forms_1285.xml    |
      | 1266_Facility_1285.xml |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Replace/Switch Members : Replace Member - FORMS
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I switch to visible frame
    And I expand all form lists
    And I click on the "<Check Out>" link for title "0001"
    And I switch to default frame
    And I add following members
      | Duncan 1266, Tim |
    And I click on the "Update & Check in" button

    And I switch to visible frame
    And I expand all form lists
    And I click on the "<Check Out>" link for title "0002"
    And I switch to default frame
    And I add following members
      | Duncan 1266, Tim |
    And I click on the "Update" button
    And I click "Close" button

    And I switch to visible frame
    And I expand all form lists
    And I click on the "<Check Out>" link for title "0003"
    And I switch to default frame
    And I add following members
      | Duncan 1266, Tim |
    And I click on the "Update & Check in" button

    And I switch to visible frame
    And I click on the "<Close>" link
    And I switch to default frame
    And I switch to "Close form window" child window
    And I click on "Close Issue" Button


  Examples:
    | Login User   | Login full username  | Entity Name   | Third Level Tab |
    | DeleteAccess | Delete Access Access | 1266 Facility | Forms           |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab
    And I set following fields value on editable page
      | name                        | value               |
      | memberID                    | Duncan 1266, Tim    |
      | removeFromReplacedEntitites | false               |
      | replaceWithMemberID         | Leonard 1266, Kawhi |
      | promoteReplacee             | false               |
      | memberEditMode              | edit                |
    And I click on Next button on "Replace / Switch Members tab"

    And I search member "<Entity Name>"
    And I click on the "replace" row action of column "<Entity Name>" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "<Entity Name>" under column header "Name"
      | name               | value                     |
      | Type               | Facility                  |
      | Name               | <Entity Name>             |
      | Portfolio/Program  | Lucernex-Selenium         |
      | Parent Region      | Central Dallas(Operating) |
      | Sub Region         |                           |
      | Market             | Central                   |
      | Project Type       |                           |
      | Current Membership | Member                    |
      | Planned Membership | Replace                   |

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 1" is visible
    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
    And I see the following note on the "Replace / Switch Members"
      | Finished processing |
    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 1 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 1 entity |

    And I see the following note on the "Replace / Switch Members"
      | Form Assignee changes: Added 3 records Deleted 3 records |

  Examples:
    | Login User   | Login full username  | Entity Name   | Grid         |
    | DeleteAccess | Delete Access Access | 1266 Facility | entitySelect |

  Scenario Outline: As a delete user I Navigate to Location A-11371 > Members/Contacts and ensure that cMember 11371 is displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I set following fields value on editable page
      | name       | value             |
      | statusType | Open/Closed Items |
    And I click on submit button
    And I verify a title "0001" has assignees "<Assignees>"
    And I verify a title "0002" has assignees "<Assignees>"
    And I verify a title "0003" has assignees "<Assignees>"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   | Third Level Tab | Assignees          |
    | DeleteAccess | Delete Access Access | 1266 Facility | Forms           | Kawhi Leonard 1266 |


