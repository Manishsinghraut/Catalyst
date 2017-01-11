@all
Feature: Canceled Task - PredecessorSuccessor Relationship (Ref : Jira Ticket No : AUTOMATION-1320)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | CanceledTaskRelationshipTesting_1320.xml |
      | 10937_Project_1320.xml                   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "Canceled Task Relationship Testing" and view the template in full template details tab
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Canceled Task Relationship Testing" from Schedule Template dropdown list
    And I verify the Days After Start "0" of Name "Predecessor to be Canceled" on Template Details tab
    And I verify the Days After Start "2" of Name "Predecessor A" on Template Details tab
    And I verify the Days After Start "3" of Name "Predecessor B" on Template Details tab
    And I verify the Days After Start "2 day(s) after 'Predecessor A' completes" of Name "Successor A" on Template Details tab
    And I verify the Days After Start "3 day(s) after 'Predecessor to be Canceled' completes" of Name "Successor A" on Template Details tab
    And I verify the Days After Start "(11)" of Name "Successor A" on Template Details tab

    And I verify the Days After Start "5 day(s) after 'Predecessor B' starts" of Name "Successor B" on Template Details tab
    And I verify the Days After Start "5 day(s) after 'Predecessor to be Canceled' completes" of Name "Successor B" on Template Details tab
    And I verify the Days After Start "(13)" of Name "Successor B" on Template Details tab

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "Canceled Task Relationship Testing" Template to 10937 Project entity and Multiple Predecessor Relationship
    Given I Login to IWMS using "DeleteAccess" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                              |
      | taskTemplateIDToAssign | Canceled Task Relationship Testing |
      | startDate              | 07/31/2020                         |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I expand gantt chart

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right

    And I verify the task name "Group A", status "Not begun", F/A Start is "07/31/2020" pluse 0 days,F/A End is "08/11/2020" pluse 0 days, F/A Duration "8 days",Slack "0 days", BL Start "07/31/2020" and BL End "08/11/2020"
    And I verify the task name "Predecessor to be Canceled", status "Not begun", F/A Start is "07/31/2020" pluse 0 days,F/A End is "08/11/2020" pluse 0 days, F/A Duration "8 days",Slack "0 days", BL Start "07/31/2020" and BL End "08/11/2020"

    And I verify the task name "Predecessor A", status "Not begun", F/A Start is "08/04/2020" pluse 0 days,F/A End is "08/07/2020" pluse 0 days, F/A Duration "4 days",Slack "5 days", BL Start "08/04/2020" and BL End "08/07/2020"
    And I verify the task name "Predecessor B", status "Not begun", F/A Start is "08/05/2020" pluse 0 days,F/A End is "08/07/2020" pluse 0 days, F/A Duration "3 days",Slack "5 days", BL Start "08/05/2020" and BL End "08/07/2020"

    And I verify the task name "Group B", status "Not begun", F/A Start is "08/17/2020" pluse 0 days,F/A End is "08/25/2020" pluse 0 days, F/A Duration "7 days",Slack "2 days", BL Start "08/17/2020" and BL End "08/25/2020"
    And I verify the task name "Successor A", status "Not begun", F/A Start is "08/17/2020" pluse 0 days,F/A End is "08/21/2020" pluse 0 days, F/A Duration "5 days",Slack "2 days", BL Start "08/17/2020" and BL End "08/21/2020"
    And I verify the task name "Successor B", status "Not begun", F/A Start is "08/19/2020" pluse 0 days,F/A End is "08/25/2020" pluse 0 days, F/A Duration "5 days",Slack "0 days", BL Start "08/19/2020" and BL End "08/25/2020"

    And I double click on "Predecessor to be Canceled" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I switch to default frame
  Examples:
    | Entity Name   |
    | 10937 Project |

  Scenario Outline: As a delete user I applying a "Canceled Task Relationship Testing" Template to 10937 Project entity and Single Predecessor relationship
#    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Predecessor A" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button
    And I verify the error message "Failed: Unable to set status to Canceled"
    And I click "OK" button

#    And I verify the task name "Group A", status "Not begun", F/A Start is "08/04/2020" pluse 0 days,F/A End is "08/11/2020" pluse 0 days, F/A Duration "6 days",Slack "0 days", BL Start "07/31/2020" and BL End "08/07/2020"
#    And I verify the task name "Predecessor to be Canceled", status "Not begun", F/A Start is "08/12/2020" pluse 0 days,F/A End is "08/12/2020" pluse 0 days, F/A Duration "1 days",Slack "0 days", BL Start "07/31/2020" and BL End "08/11/2020"
#
#    And I verify the task name "Predecessor A", status "Not begun", F/A Start is "08/04/2020" pluse 0 days,F/A End is "08/07/2020" pluse 0 days, F/A Duration "4 days",Slack "0 days", BL Start "08/04/2020" and BL End "08/07/2020"
#    And I verify the task name "Predecessor B", status "Not begun", F/A Start is "08/05/2020" pluse 0 days,F/A End is "08/07/2020" pluse 0 days, F/A Duration "3 days",Slack "0 days", BL Start "08/05/2020" and BL End "08/07/2020"
#
#    And I verify the task name "Group B", status "Not begun", F/A Start is "08/12/2020" pluse 0 days,F/A End is "08/18/2020" pluse 0 days, F/A Duration "5 days",Slack "0 days", BL Start "08/12/2020" and BL End "08/18/2020"
#    And I verify the task name "Successor A", status "Not begun", F/A Start is "08/12/2020" pluse 0 days,F/A End is "08/18/2020" pluse 0 days, F/A Duration "5 days",Slack "0 days", BL Start "08/12/2020" and BL End "08/18/2020"
#    And I verify the task name "Successor B", status "Not begun", F/A Start is "08/12/2020" pluse 0 days,F/A End is "08/18/2020" pluse 0 days, F/A Duration "5 days",Slack "0 days", BL Start "08/12/2020" and BL End "08/18/2020"

    And I switch to default frame
  Examples:
    | Entity Name   |
    | 10937 Project |
