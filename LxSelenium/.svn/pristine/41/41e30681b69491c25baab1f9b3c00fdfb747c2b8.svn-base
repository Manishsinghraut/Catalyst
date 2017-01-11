@all
Feature: Add Documents to Task schedule pop up (Ref : Jira Ticket No : AUTOMATION-883)

  Scenario Outline: I import file for apply schedule template and S008 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details"
    And I import following file name:
      | NovemberScheduleTemplate.xml |
      | S008.xml                     |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user Adding a file
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Documents" tab
    And I switch to visible frame
    And I click on Add Root Folders link on documents tab
    Then I set following fields value on editable page
      | name                   | value      |
      | entry | Schedule |
    And I click on the add to list button
    And I click on "Create the list of folders" button from "Add root folders for S008 pop up window"
    And I switch to default frame
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/01/2020 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "Submit required forms" task
    And I click on "Documents" tab
    And I click on "Add" button from "Editing Task for S008 on documents tab of pop up window"
    And I click the drop down
    And I switch to default frame
    And I attach following schedule document files from "Data/ImportDataFiles/iwms/Location/Details":
      | S008.xml |
    And I click on file "S008.xml" link
    And I switch to visible frame
    And I click on Ok button from file upload popup window
    And I switch to default frame

  Examples:
    | Template          | Login User   | Login full username  | Entity Name |
    | November Schedule | DeleteAccess | Delete Access Access | S008        |

  Scenario Outline: As a delete user Removing the file
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "Submit required forms" task
    And I click on "Documents" tab
    And I click the red minus sign in the document list
    And I switch to default frame
    And I click on "Yes" button from "Confirm delete pop up window"

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | S008        |


  Scenario Outline: As a delete user Uploading a file with special characters
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "Submit required forms" task
    And I click on "Documents" tab
    And I click on "Add" button from "Editing Task for S008 on documents tab of pop up window"
    And I click the drop down
    And I switch to default frame
    And I attach following schedule document files from "Data/ImportDataFiles/iwms/Location/Details":
      | #@%$Budget(Version=1).xls |
    And I click on file "#@%$Budget.xls" link
    And I switch to visible frame
    And I click the download button next to the file name
    And I click on Ok button from file upload popup window
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | S008        |