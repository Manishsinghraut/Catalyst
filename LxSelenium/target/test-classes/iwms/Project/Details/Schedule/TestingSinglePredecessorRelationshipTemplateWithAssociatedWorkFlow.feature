@all
Feature: Testing-Single Predecessor Relationship Template (With associated Work Flow) (Ref : Jira Ticket No : AUTOMATION-1316)

  Scenario Outline: I import file for apply a Schedule template with Multiple Predecessor on Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | SinglePredecessorTemplate_1316.xml |
      | WFTemplate10927_1316.xml           |
      | 10927_Project_1316.xml             |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify the create Single Predecessor Relationship Template with Predecessor (having start to start and Finish to start relationship)and successor task
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Single Predecessor Relationship" from Schedule Template dropdown list
    And I verify the Days After Start "<DaysAfterStart1>" of Name "On Hold" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart2>" of Name "Survey Facility (WF)" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart3>" of Name "Upload Master Drawings" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart4>" of Name "Complete File Review" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart5>" of Name "Submit Package to LL for Approval" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart6>" of Name "Bid Due Date" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart7>" of Name "Confirm with Operations start date/time" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart8>" of Name "Punchlist Complete" on Template Details tab
    And I verify the Days After Start "<DaysAfterStart9>" of Name "Update Facility Attributes" on Template Details tab
  Examples:
    | Login User   | Login full username  | DaysAfterStart1                                | DaysAfterStart2                                  | DaysAfterStart3                              | DaysAfterStart4                                  | DaysAfterStart5                                    | DaysAfterStart6                                   | DaysAfterStart7                                | DaysAfterStart8                                    | DaysAfterStart9                                   |
    | DeleteAccess | Delete Access Access | 1 day(s) after 'Cancelled Project' starts\n(1) | 0 day(s) after 'Request File Review' starts\n(3) | 1 day(s) after 'Survey Facility' starts\n(4) | 5 day(s) after 'Request File Review' starts\n(8) | 5 day(s) after 'Complete File Review' starts\n(13) | 20 day(s) after 'Survey Facility' completes\n(24) | 21 day(s) after 'Survey Facility' starts\n(24) | -1 day(s) after 'Project Complete' completes\n(90) | 0 day(s) after 'Project Complete' completes\n(91) |

  Scenario Outline: As a delete user I verify "WF Template 10927" Work flow has create
    Then I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click on "edit" row action in the grid "<Grid>" having the following header "Work Flow name" and cell value "WF Template 10927"
      | name        | value |
      | Description |       |
    And I verify these field values on editable page
      | name     | value               |
      | TaskName | Request File Review |
    And I click on the "Cancel" button

  Examples:
    | Grid                   |
    | BOGridWorkFlowTemplate |

  Scenario Outline: As a delete user I applying a "Single Predecessor Relationship" Template to 10927 Project entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                           |
      | taskTemplateIDToAssign | Single Predecessor Relationship |
      | startDate              | 12/31/2020                      |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name   |
    | 10927 Project |

  Scenario Outline: As a delete user I verify a "Single Predecessor Relationship" Template to 10927 Project entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Request File Review" task
    And I click on "Successors" tab
    And I verify the task name "Survey Facility", type "Start-To-Start" and Lead/Lag Days "0 days" on Successors tab
    And I verify the task name "Complete File Review", type "Start-To-Start" and Lead/Lag Days "5 days" on Successors tab
    And I click on "General" tab
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |

    And I verify the following fields value on editable page
      | name            | value          |
      | ActualStartDate | [CURRENT DATE] |
      | ActualEndDate   | [CURRENT DATE] |

    And I click "Ok" button
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Complete File Review", status "Not begun", F/A Start is "[CURRENT DATE]" pluse 5 days,F/A End is "[CURRENT DATE]" pluse 5 days, F/A Duration "1 day", BL Start "01/12/2021" and BL End "01/12/2021"
    And I verify the task name "Survey Facility ", status "In-process", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "01/06/2021" and BL End "01/06/2021"

    And I double click on "Project Complete" task
    And I click on "Successors" tab
    And I verify the task name "Punchlist Complete", type "Finish-To-Start" and Lead/Lag Days "-1 days" on Successors tab
    And I verify the task name "Update Facility Attributes", type "Finish-To-Start" and Lead/Lag Days "0 days" on Successors tab
    And I click on "General" tab
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |

    And I verify the following fields value on editable page
      | name            | value          |
      | ActualStartDate | [CURRENT DATE] |
      | ActualEndDate   | [CURRENT DATE] |

    And I click "Ok" button
#    And I drag the vertical split bar to right
#    And I drag the vertical split bar to right
#    And I drag the vertical split bar to right
#    And I drag the vertical split bar to right
    And I verify the task name "Punchlist Complete", status "Not begun", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 13 days, F/A Duration "14 days", BL Start "05/07/2021" and BL End "05/26/2021"
    And I verify the task name "Update Facility Attributes", status "Not begun", F/A Start is "[CURRENT DATE]" pluse 1 days,F/A End is "[CURRENT DATE]" pluse 5 days, F/A Duration "5 day", BL Start "05/10/2021" and BL End "05/14/2021"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   |
    | DeleteAccess | Delete Access Access | 10927 Project |