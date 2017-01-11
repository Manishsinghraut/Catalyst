@all
Feature: Single Predecessor Template - Start on date in future (Ref : Jira Ticket No : AUTOMATION-1321)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | Testing_10938_1321.xml              |
      | ASinglePredecessorTemplate_1321.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "A Single Predecessor Relationship" Template to Testing 10938, AR United States entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                             |
      | taskTemplateIDToAssign | A Single Predecessor Relationship |
      | startDate              | 12/31/2020                        |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name                     |
    | Testing 10938, AR United States |

  Scenario Outline: As a delete user I verify the Predecessor not begun-Complete Successor in Future
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Single Predecessor 1" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I double click on "Single Successor 1" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Single Group 1", status "In-process", % Done "50", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "12/31/2020" pluse 0 days,BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Single Predecessor 1", status "Not begun", F/A Start is "12/31/2020" pluse 0 days,F/A End is "12/31/2020" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "Single Successor 1", status "Completed", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/04/2021" and BL End "01/04/2021"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                     |
    | DeleteAccess | Delete Access Access | Testing 10938, AR United States |

  Scenario Outline: As a delete user I verify the Predecessor is cancelled -Complete successor in future
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Single Predecessor 2" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I verify the error message "Failed: Unable to set status to Canceled"
    And I click "OK" button

    And I double click on "Single Successor 2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I verify the error message "Failed: Unable to set status to Canceled"
    And I click "OK" button

    And I switch to default frame

  Examples:
    | Entity Name                     |
    | Testing 10938, AR United States |

  Scenario Outline: As a delete user I verify the Predecessor is in progress -Complete successor in future
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Single Predecessor 3" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Single Successor 3" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Single Group 3", status "In-process", % Done "50", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Single Predecessor 3", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "Single Successor 3", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/04/2021" and BL End "01/04/2021"

    And I switch to default frame

  Examples:
    | Entity Name                     |
    | Testing 10938, AR United States |


  Scenario Outline: As a delete user I verify the  Predecessor is completed -Complete successor in future
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Single Predecessor 4" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I double click on "Single Successor 4" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Single Group 4", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "01/04/2021"
    And I verify the task name "Single Predecessor 4", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "Single Successor 4", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/04/2021" and BL End "01/04/2021"

    And I switch to default frame

  Examples:
    | Entity Name                     |
    | Testing 10938, AR United States |
