@all
Feature: Testing-Regression Independent Template (Ref : Jira Ticket No : AUTOMATION-1318)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | Testing_10929_Project_1318.xml |
      | RegressionIndependent_1318.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "Testing 1029 Schedule Template" and view the template in full template details tab
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Testing 1029 Schedule Template" from Schedule Template dropdown list
    And I verify the Days After Start "0" of Name "Task 10929 A" on Template Details tab
    And I verify the Days After Start "9" of Name "Task 10929 B" on Template Details tab
    And I verify the Days After Start "9" of Name "Task 10929 C" on Template Details tab
    And I verify the Days After Start "38" of Name "Task 10929 D" on Template Details tab

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "Testing 1029 Schedule Template" Template to MPProject-10928 entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                          |
      | taskTemplateIDToAssign | Testing 1029 Schedule Template |
      | startDate              | 12/31/2020                     |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name           |
    | Testing 10929 Project |

  Scenario Outline: As a delete user I verify the dates will be the same, regardless of status change
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Task 10929 A" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I double click on "Task 10929 B" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button


    And I double click on "Task 10929 C" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I double click on "Task 10929 D" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right

    And I verify the task name "Testing 10929 Schedule", status "In-process", % Done "2", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "01/13/2021" pluse 0 days,BL Start "12/31/2020" and BL End "04/19/2021"
    And I verify the task name "Task 10929 A", status "Not begun", F/A Start is "12/31/2020" pluse 0 days,F/A End is "01/13/2021" pluse 0 days, F/A Duration "10 days", BL Start "12/31/2020" and BL End "01/13/2021"
    And I verify the task name "Task 10929 B", status "Canceled", F/A Start is "01/13/2021" pluse 0 days,F/A End is "01/13/2021" pluse 0 days, F/A Duration "0 days", BL Start "01/13/2021" and BL End "01/13/2021"
    And I verify the task name "Task 10929 C", status "Completed", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/13/2021" and BL End "02/23/2021"
    And I verify the task name "Task 10929 D", status "In-process", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 39 days, F/A Duration "40 days", BL Start "02/23/2021" and BL End "04/19/2021"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name           |
    | DeleteAccess | Delete Access Access | Testing 10929 Project |

