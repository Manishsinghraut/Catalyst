@all
Feature: Change Forecast Date (Ref : Jira Ticket No : AUTOMATION-873)

  Scenario Outline: I import file for apply schedule template and S007 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details"
    And I import following file name:
      | NovemberScheduleTemplate.xml |
      | S007.xml                     |
      | Bars-0075.xml                |
      | Spreadsheet-s0075.xml        |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user Change forecast date for a task on the task pop-up.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/01/2018 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "Prepare proposal" task
    When I set following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/03/2018 |
      | ActualEndDate   | 01/03/2018 |
    And I click "Ok" button
    And I double click on "Prepare proposal" task
    When I verify the following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/03/2018 |
      | ActualEndDate   | 01/03/2018 |
    And I switch to default frame

  Examples:
    | Template          | Login User   | Login full username  | Entity Name | Item     |
    | November Schedule | DeleteAccess | Delete Access Access | s007        | Location |


  Scenario Outline: As a delete user Change forecast date for a task on the task pop-up.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/01/2018 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    And I Right click on the 3 "rd" blue bar "Prepare proposal" task on the bar graph/timeline and click "Task information..." to edit the task
    When I set following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/03/2018 |
      | ActualEndDate   | 01/03/2018 |
    And I click "Ok" button
    And I double click on "Prepare proposal" task
    When I verify the following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/03/2018 |
      | ActualEndDate   | 01/03/2018 |
    And I switch to default frame

  Examples:
    | Template          | Login User   | Login full username  | Entity Name | Item     |
    | November Schedule | DeleteAccess | Delete Access Access | Bars-0075   | Location |


  Scenario Outline: As a delete user change forecast date for a task on the spreadsheet view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/01/2018 |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "Prepare proposal" task
    When I set following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/03/2018 |
      | ActualEndDate   | 01/03/2018 |
    And I click "Ok" button
    And I double click on "Prepare proposal" task
    When I verify the following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/03/2018 |
      | ActualEndDate   | 01/03/2018 |
    And I switch to default frame


  Examples:
    | Template          | Login User   | Login full username  | Entity Name       | Item     |
    | November Schedule | DeleteAccess | Delete Access Access | Spreadsheet-s0075 | Location |