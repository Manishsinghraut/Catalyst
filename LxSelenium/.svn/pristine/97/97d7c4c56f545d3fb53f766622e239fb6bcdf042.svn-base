@all
Feature: Multiple Successor Scenario 3 - Start on Date in Future (Ref : Jira Ticket No : AUTOMATION-1330)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | MultipleSuccessorScenario_1330.xml                               |
      | Multiple_Successor_Scenario_3___Start_on_Date_in_Future_1330.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "Multiple Successor Scenario" Template to Multiple Successor Scenario 3 entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
#    And I switch to visible frame
#    And I verify the error message "No schedule information found"
#    And I switch to default frame
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                       |
      | taskTemplateIDToAssign | Multiple Successor Scenario |
      | startDate              | 12/31/2020                  |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 3 - Start on Date in Future, TX United States |

  Scenario Outline: As a delete user I verify the Testing 1 -In Process Successor A1 and Complete Successor A2 when Predecessor A is not begun
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Predecessor A" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I double click on "Successor A1" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Successor A2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "GroupA", status "In-process", % Done "20", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "01/04/2021" pluse 0 days,BL Start "12/31/2020" and BL End "01/07/2021"
    And I verify the task name "Predecessor A", status "Not begun", % Done "0", F/A Start is "12/31/2020" pluse 0 days,F/A End is "01/04/2021" pluse 0 days, F/A Duration "3 days", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Successor A1", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/06/2021"
    And I verify the task name "Successor A2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 3 - Start on Date in Future, TX United States |

  Scenario Outline: As a delete user I verify the Testing 2 -In-Process Successor B1 and Complete Successor B2 when Predecessor B is Completed
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Predecessor B" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I double click on "Successor B1" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Successor B2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "GroupB", status "In-process", % Done "67", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "01/07/2021"
    And I verify the task name "Predecessor B", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Successor B1", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/06/2021"
    And I verify the task name "Successor B2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 3 - Start on Date in Future, TX United States |


  Scenario Outline: As a delete user I verify the Testing 3 -In-Process Successor C1 and Complete Successor C2 when Predecessor C is Canceled
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Predecessor C" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I verify the error message "Failed: Unable to set status to Canceled"
    And I click "OK" button

    And I double click on "Predecessor C" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 3 - Start on Date in Future, TX United States |


  Scenario Outline: As a delete user I verify the Testing 4 -In Process Successor D1 and Complete Successor D2 when Predecessor D is In-Process
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Predecessor D" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Successor D1" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Successor D2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "GroupD", status "In-process", % Done "20", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 2 days, F/A Duration "3 days", BL Start "12/31/2020" and BL End "01/07/2021"
    And I verify the task name "Predecessor D", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 2 days, F/A Duration "3 day", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Successor D1", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/06/2021"
    And I verify the task name "Successor D2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 3 - Start on Date in Future, TX United States |