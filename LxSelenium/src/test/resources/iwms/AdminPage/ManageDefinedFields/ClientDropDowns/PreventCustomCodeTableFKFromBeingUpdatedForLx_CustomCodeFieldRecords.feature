@all
Feature: [JIRA Ref: AUTOMATION-1476] Prevent customCodeTableFK from being updated for Lx_CustomCodeField records.

  Scenario Outline: Prevent customCodeTableFK from being updated for Lx_CustomCodeField records.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/ManageDefinedFields/ClientDropDowns/"
    And I import following files:
      | CustomTableField-1476.xml |
    And I navigate to the admin dashboard
    And I click on the "Client Drop Downs" link
    Then I verify the following values in non frame grid "<Grid ID>"
      | Custom Drop Down Name | Description | Smart List Parent Drop Down | Actions        |
      | Drawing Group         |             |                             | edit \| delete |
      | Drawing Type          |             | Drawing Group               | edit \| delete |
    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name                  | value         |
      | Custom Drop Down Name | Drawing Group |
    And I wait for "Edit Custom Drop Down  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name                    | value    |
      | ParentCustomCodeTableID | <SELECT> |
    And I click on the "Cancel" button
    And I wait for modal window to close

    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name                  | value        |
      | Custom Drop Down Name | Drawing Type |
    And I wait for "Edit Custom Drop Down  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name                    | value         |
      | ParentCustomCodeTableID | Drawing Group |
    And I set following fields value on editable page
      | name                    | value    |
      | ParentCustomCodeTableID | <SELECT> |
    And I click on the "Update" button
    Then I see the following note on the "modal window"
      | Failed to add/update Custom Drop Down: Smart List Parent Drop Down is in use by Drop Down List |
    And I click on the "Cancel" button
    And I wait for modal window to close

    Examples:
      | Login User   | Login full username  | Grid ID               |
      | DeleteAccess | Delete Access Access | BOGridCustomCodeTable |