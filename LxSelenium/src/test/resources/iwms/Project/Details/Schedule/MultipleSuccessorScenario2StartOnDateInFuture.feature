@all
Feature: Multiple Successor Scenario 2 - Start on Date in Future (Ref : Jira Ticket No : AUTOMATION-1329)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | Multiple_Successor_Scenario_2___Start_on_Date_in_Future_1329.xml |
      | MultipleSuccessorScenarioScheduleTemplate_1329.xml               |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "Multiple Successor Scenario" Template to Multiple Successor Scenario 2 - Start on Date in Future entity
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
    | Multiple Successor Scenario 2 - Start on Date in Future, TX United States |

  Scenario Outline: As a delete user I verify the Testing 1 -Cancel Successor A1 and Complete Successor A2 when Predecessor A is not begun
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
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "Successor A2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I switch to default frame
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "GroupA", status "In-process", % Done "25", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "01/05/2021" pluse 0 days,BL Start "12/31/2020" and BL End "01/07/2021"
    And I verify the task name "Predecessor A", status "Not begun", % Done "0", F/A Start is "12/31/2020" pluse 0 days,F/A End is "01/04/2021" pluse 0 days, F/A Duration "3 days", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Successor A1", status "Canceled", % Done "0", F/A Start is "01/05/2021" pluse 0 days,F/A End is "01/05/2021" pluse 0 days, F/A Duration "0 days", BL Start "01/06/2021" and BL End "01/06/2021"
    And I verify the task name "Successor A2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 2 - Start on Date in Future, TX United States |

  Scenario Outline: As a delete user I verify the Testing 2 -Cancel Successor B1 and Complete Successor B2 when Predecessor B is Completed
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
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "Successor B2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I switch to default frame
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "GroupB", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 1 days, F/A Duration "2 days", BL Start "12/31/2020" and BL End "01/07/2021"
    And I verify the task name "Predecessor B", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Successor B1", status "Canceled", % Done "0", F/A Start is "[CURRENT DATE]" pluse 1 days,F/A End is "[CURRENT DATE]" pluse 1 days, F/A Duration "0 days", BL Start "01/06/2021" and BL End "01/06/2021"
    And I verify the task name "Successor B2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 2 - Start on Date in Future, TX United States |


  Scenario Outline: As a delete user I verify the Testing 3 -Cancel Successor C1 and Complete Successor C2 when Predecessor C is Canceled
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Predecessor C" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I verify the error message "Failed: Unable to set status to Canceled"
    And I click "OK" button

    And I double click on "Predecessor C" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

#    And I verify the task name "GroupC", status "Not begun", % Done "0", F/A Start is "12/31/2020" pluse 0 days,F/A End is "01/05/2020" pluse 0 days, F/A Duration "4 days", BL Start "12/31/2020" and BL End "01/07/2021"
#    And I verify the task name "Predecessor C", status "Not begun", % Done "0", F/A Start is "12/31/2020" pluse 0 days,F/A End is "12/31/2020" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "01/04/2021"
#    And I verify the task name "Successor C1", status "Not begun", % Done "0", F/A Start is "01/04/2021" pluse 0 days,F/A End is "01/04/2021" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/06/2021"
#    And I verify the task name "Successor C2", status "Not begun", % Done "0", F/A Start is "01/04/2021" pluse 0 days,F/A End is "01/05/2021" pluse 0 days, F/A Duration "2 days", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 2 - Start on Date in Future, TX United States |


  Scenario Outline: As a delete user I verify the Testing 4 -Cancel Successor D1 and Complete Successor D2 when Predecessor D is In-Process
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
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "Successor D2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I switch to default frame
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "GroupD", status "In-process", % Done "25", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 3 days, F/A Duration "4 days", BL Start "12/31/2020" and BL End "01/07/2021"
    And I verify the task name "Predecessor D", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 2 days, F/A Duration "3 days", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Successor D1", status "Canceled", % Done "0", F/A Start is "[CURRENT DATE]" pluse 3 days,F/A End is "[CURRENT DATE]" pluse 3 days, F/A Duration "0 days", BL Start "01/06/2021" and BL End "01/06/2021"
    And I verify the task name "Successor D2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/07/2021"

    And I switch to default frame

  Examples:
    | Entity Name                                                               |
    | Multiple Successor Scenario 2 - Start on Date in Future, TX United States |