@all
Feature: (Ref : Jira Ticket No : Automation-877), The status should change to "In Process" from "Not begun" when % complete is any value other than zero

  Scenario Outline: I import file The status should change to "In Process" from "Not begun" when % complete is any value other than zero

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | ChangeTaskStatus-877.xml   |
      | TaskStatusTemplate-877.xml |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/02/2020 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close

    Examples:
      | Login User   | Login full username  | Entity Name          | Template               |
      | DeleteAccess | Delete Access Access | ChangeTaskStatus-877 | TaskStatusTemplate-877 |


  Scenario Outline: As a delete user I verify the status should change to "In Process" from "Not begun" when % complete is any value other than zero
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "<Task Name>" task
    And I verify the following fields value on editable page
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I set following spin button fields values on editable page
      | name            | value                 |
      | PercentComplete | <Percentage Complete> |
    And I click on the "Ok" button
    And I open new task information pop up of "<Task Name>" task
    And I verify the following fields value on editable page
      | name             | value      |
      | CodeTaskStatusID | In Process |

    Examples:
      | Login User   | Login full username  | Entity Name          | Task Name        | Percentage Complete |
      | DeleteAccess | Delete Access Access | ChangeTaskStatus-877 | CT Status Task A | 10                  |
      | DeleteAccess | Delete Access Access | ChangeTaskStatus-877 | CT Status Task B | 22                  |
      | DeleteAccess | Delete Access Access | ChangeTaskStatus-877 | CT Status Task C | 99                  |