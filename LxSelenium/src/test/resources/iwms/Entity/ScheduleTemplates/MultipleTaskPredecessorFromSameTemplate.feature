@all
Feature: (Ref : Jira Ticket No : Automation-880), Add Multiple Task Predecessor from same Template

  Scenario Outline: I import file for apply schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | Entity_22277.xml                            |
      | MultipleTaskPredecessorFromSameTemplate.xml |
      | RegressionIndependent.xml                   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I can able to add Predecessor Task and Notification
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/31/2030 |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I click on the "Spreadsheets" action panel button
    And I expand gantt chart
#    And I double click on "Prepare budget" task
    And I open new task information pop up of "Prepare budget" task
    And I verify the following fields value on editable page
      | name               | value      |
      | ActualStartDate    | 12/31/2030 |
      | ActualEndDate      | 12/31/2030 |
      | OriginalStartDate  | 12/31/2030 |
      | OriginalEndDate    | 12/31/2030 |
      | ProjectedStartDate | 12/31/2030 |
      | ProjectedEndDate   | 12/31/2030 |
    And I click on the "Cancel" button

    And I add the following task on "Predecessors" tab to the "Prepare budget" task
      | Bid Due Date              |
      | Intial Start Project      |
      | TaskPred                  |
      | Complete Signage Retrofit |

#    And I click on the "Save Changes" action panel button
#    And I double click on "Prepare budget" task
    And I open new task information pop up of "Prepare budget" task
    And I verify the following fields value on editable page
      | name               | value      |
      | ActualStartDate    | 01/06/2031 |
      | ActualEndDate      | 01/06/2031 |
      | OriginalStartDate  | 01/06/2031 |
      | OriginalEndDate    | 01/06/2031 |
      | ProjectedStartDate | 01/06/2031 |
      | ProjectedEndDate   | 01/06/2031 |

    And I click on "Predecessors" tab
    And I verify the following tasks in a page
      | Bid Due Date              |
      | Intial Start Project      |
      | TaskPred                  |
      | Complete Signage Retrofit |
    And I click on the "Cancel" button

  Examples:
    | Template               | Login User   | Login full username  | Entity Name  |
    | Regression Independent | DeleteAccess | Delete Access Access | Entity-22277 |