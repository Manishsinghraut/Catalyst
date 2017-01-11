@all
Feature: Applying a Template with a Predecessor Task from the Diffrent Template (Ref : Jira Ticket No : AUTOMATION-890)

  Scenario Outline: I import file for apply schedule template and Predecessor Task from the diffrent Template entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals/Schedule/"
    And I import following file name:
      | PredecessorTaskFromTheDiffrentTemplate.xml |
      | ScheduleTemplateAA.xml                     |
      | ScheduleTemplateBB.xml                     |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user Applying a Template with a Predecessor Task from the Diffrent Template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "BB Schedule Template" from Schedule Template dropdown list
    And I click on "Creative Task 1" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Creative Task 1 |
    And I verify "Simple Task 2" should be displayed Predecessor
    And I click on the "Close" button
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                |
      | taskTemplateIDToAssign | AA Schedule Template |
      | startDate              | 12/31/2020           |
    And I click on the "Append Schedule Template" button
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                |
      | taskTemplateIDToAssign | BB Schedule Template |
      | startDate              | 12/31/2020           |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "Creative Task 1" task
    And I click on "Predecessors" tab
    And I verify "Simple Task 2" should be displayed Predecessor tab
    And I click "Cancel" button
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                                 |
    | DeleteAccess | Delete Access Access | Predecessor Task from the diffrent Template |