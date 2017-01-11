@all
Feature: (Jira Ref. : AUTOMATION-1396) Read-only field testing on Editable Reports

  Scenario Outline: Import xmls as delete user
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | EFSLocation-1396.xml    |
      | SecurityReport-1396.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Read-only field testing on Editable Reports
    When I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name        | value          |
      | Report Name | SecurityReport |
    And I switch to "Reports" child window
    And I verify the following values are "editable"
      | USD                           |
      | This is to test security 1396 |
      | Legacy Market Area            |
      |                               |
    And I verify the following values are "non-editable"
      | [Today's Date] |
      | <Entity Name>  |
    And I verify the following values in non frame grid
      | Name          | Currency Type | Description                   | Market Area        | Notes |
      | <Entity Name> | USD           | This is to test security 1396 | Legacy Market Area |       |

    Then I close the "Reports" child window
    And I switch to main window


    Examples:
      | Entity Name | Grid ID     |
      | EFSLocation | ^editBOGrid |