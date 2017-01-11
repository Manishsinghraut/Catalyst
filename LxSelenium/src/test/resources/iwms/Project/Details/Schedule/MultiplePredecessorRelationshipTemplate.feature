@all
Feature: Testing-Single Predecessor Relationship Template (With associated Work Flow) (Ref : Jira Ticket No : AUTOMATION-1317)

  Scenario Outline: I import file for apply a Schedule template with Multiple Predecessor on Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | MPProject-10928_1317.xml           |
      | MultiplePredecessors10928_1317.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "manage schedule templates" and view the template in full template details tab
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Multiple Predecessors- 10928" from Schedule Template dropdown list
    And I verify the Days After Start "<Days After Start 1>" of Name "SB" on Template Details tab
    And I verify the Days After Start "<Days After Start 11>" of Name "SB" on Template Details tab
    And I verify the Days After Start "<Days After Start 12>" of Name "SB" on Template Details tab
    And I verify the Days After Start "<Days After Start 2>" of Name "SC" on Template Details tab
#    And I verify the Days After Start "<Days After Start 3>" of Name "SA" on Template Details tab

  Examples:
    | Login User   | Login full username  | Days After Start 1             | Days After Start 11            | Days After Start 12 | Days After Start 2                                                  | Days After Start 3                  |
    | DeleteAccess | Delete Access Access | 1 day(s) after 'PB1' completes | 1 day(s) after 'PB2' completes | (2)                 | 1 day(s) after 'PC2' completes\n1 day(s) after 'PC1' completes\n(2) | 2 day(s) after 'PA2' completes\n(3) |

  Scenario Outline: As a delete user I applying a "Multiple Predecessors- 10928" Template to MPProject-10928 entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                        |
      | taskTemplateIDToAssign | Multiple Predecessors- 10928 |
      | startDate              | 12/31/2020                   |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name     |
    | MPProject-10928 |

  Scenario Outline: As a delete user I verify When the predecessors are in-process
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "PB1" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "PB2" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "PB1", status "In-process", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "PB2", status "In-process", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "SB", status "Not begun", F/A Start is "[CURRENT DATE]" pluse 2 days,F/A End is "[CURRENT DATE]" pluse 2 days, F/A Duration "1 day", BL Start "01/04/2021" and BL End "01/04/2021"


    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     |
    | DeleteAccess | Delete Access Access | MPProject-10928 |


  Scenario Outline: As a delete user I verify When Canceling the predecessors
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "PC1" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "PC2" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I verify the error message "Failed: Unable to set status to Canceled"
    And I click "OK" button

    And I double click on "PC2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

#    And I drag the vertical split bar to right
#    And I verify the task name "PC1", status "Canceled", F/A Start is "01/04/2021" pluse 0 days,F/A End is "01/04/2021" pluse 0 days, F/A Duration "0 days", BL Start "12/31/2020" and BL End "12/31/2020"
#    And I verify the task name "PC2", status "Canceled", F/A Start is "12/31/2020" pluse 0 days,F/A End is "12/31/2020" pluse 0 days, F/A Duration "0 days", BL Start "12/31/2020" and BL End "12/31/2020"
#    And I verify the task name "SC", status "Not begun", F/A Start is "01/01/2021" pluse 0 days,F/A End is "01/01/2021" pluse 0 days, F/A Duration "1 day", BL Start "01/04/2021" and BL End "01/04/2021"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     |
    | DeleteAccess | Delete Access Access | MPProject-10928 |


  Scenario Outline: As a delete user I verify When Completing the predecessors
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

#    And I double click on "PC2" task
#    And I set task Status on edit popup of a task
#      | name             | value     |
#      | CodeTaskStatusID | Not begun |
#    And I click "Ok" button

    And I double click on "PA1" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I double click on "PA2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "PA1", status "Completed", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "PA2", status "Completed", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "SA", status "Not begun", F/A Start is "[CURRENT DATE]" pluse 3 days,F/A End is "[CURRENT DATE]" pluse 3 days, F/A Duration "1 day", BL Start "01/05/2021" and BL End "01/05/2021"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     |
    | DeleteAccess | Delete Access Access | MPProject-10928 |