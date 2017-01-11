@all
Feature: Ability to add Multi Value Field Type (Jira Ref. AUTOMATION-1344)

  Scenario Outline: As a delete user I Import the following  files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | PortfolioSprint16_1344.xml |
      | LocationSprint16_1344.xml  |
      | Project13455_1344.xml      |
      | page_layouts_1344.xml      |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario: As a delete user I verify The Message displayed "Successfully updated Custom Drop down
    And I navigate to the admin dashboard
    And I click on the "Client Drop Downs" link
    And I click on the "edit" row action of column "Multi Value" of column "0" from grid "BOGridCustomCodeTable"
    And I set following fields value on editable page
      | name                                     | value                |
      | _CustomCodeField_CustomCodeFieldName_add | Entity Multi Value 1 |
    And I click "add" link "from Edit Custom Drop Down popup window"

    And I set following fields value on editable page
      | name                                     | value                |
      | _CustomCodeField_CustomCodeFieldName_add | Entity Multi Value 2 |
    And I click "add" link "from Edit Custom Drop Down popup window"

    And I set following fields value on editable page
      | name                                     | value                |
      | _CustomCodeField_CustomCodeFieldName_add | Entity Multi Value 3 |
    And I click "add" link "from Edit Custom Drop Down popup window"

    And I set following fields value on editable page
      | name                                     | value                |
      | _CustomCodeField_CustomCodeFieldName_add | Entity Multi Value 4 |
    And I click "add" link "from Edit Custom Drop Down popup window"
    And I click "Update" button
    And I verify the following message "Successfully updated Custom Drop Down"


  Scenario: As a delete user I verify The The Multi Value field shall be updated successfully.
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I expand the the following data fields group
      | Summary Information         |
      | General Summary Information |
    And I click "edit" for field "MultiValue"
    And I switch to "Manage data fields" child window
    And I set following fields value on editable page
      | name       | value |
      | MultiValue | true  |
    And I click on the update button
    And I close the "Manage data fields" child window
    And I switch to main window


  Scenario Outline: As a delete user I verify Multi Value drop-down should display
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I select following Multi Value from dropdown
      | Entity Multi Value 1 |
      | Entity Multi Value 2 |
      | Entity Multi Value 3 |
      | Entity Multi Value 4 |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify the field "Multi Value" has "Entity Multi Value 1, Entity Multi Value 2, Entity Multi Value 3, Entity Multi Value 4"
    And I switch to default frame

  Examples:
    | Entity Name   | Second Level Tab |
    | Project 13455 | Details          |