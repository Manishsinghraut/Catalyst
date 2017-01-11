@all
Feature: Edit the Label of a Global Field (Jira Ref. AUTOMATION-1343)

  Scenario Outline: As a delete user I Import the following  files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | Portfolio__Sprint_16_1343.xml |
      | Location_sprint_16_1343.xml   |
      | LGForm_1343.xml               |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify "Global field label Jurisdiction was updated" notification will display on top
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I click " Add Form... " button
    And I switch to default frame
    And I set following fields value on editable page
      | name          | value       |
      | PageLayoutID" | LGForm-2228 |
    And I click "OK" button
    And I verify the following fields value on editable page
      | name                  | value              |
      | Location_LocationName | Location sprint 16 |
    And I verify the text "Jurisdiction" on "popup window"
    And I click "Close" button
    And I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I click on the "Global Fields"
    And I expand the the following data fields group
      | Location     |
    And I expand the following sub data fields group
      | Address Info |
    And I click "edit label" for field JurisdictionID
    And I switch to "Manage data fields" child window
    And I set following fields value on editable page
      | name         | value |
      | DefaultLabel | JR#   |
    And I click on the update button
    And I switch to main window

  Examples:
    | Entity Name        | Second Level Tab | Third Level Tab |
    | Location sprint 16 | Details          | Forms           |


  Scenario Outline: As a delete user I verify the field "jurisdiction" will have changed to "JR#"
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I click " Add Form... " button
    And I switch to default frame
    And I set following fields value on editable page
      | name          | value       |
      | PageLayoutID" | LGForm-2228 |
    And I click "OK" button
    And I verify the following fields value on editable page
      | name                  | value              |
      | Location_LocationName | Location sprint 16 |
    And I verify the text "JR#" on "popup window"
    And I click "Close" button

  Examples:
    | Entity Name        | Second Level Tab | Third Level Tab |
    | Location sprint 16 | Details          | Forms           |