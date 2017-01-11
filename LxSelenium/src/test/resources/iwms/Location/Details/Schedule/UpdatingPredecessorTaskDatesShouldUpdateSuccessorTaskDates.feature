@all
Feature: (Ref : Jira Ticket No : AUTOMATION-894) Updating Predecessor task dates should correctly update successor task dates as per slack day numeric value

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | TenantImprovement.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I update predecessor task dates and verify whether corresponding successor task dates is updated
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "T.I. Framing" task
#    And I double click on "T.I. Framing" task
    And I click on "Successors" tab
    And I click "Add new" button
    And I enter task name "Lighting"
#    And I click "Ok" button
#
#    And I open new task information pop up of "T.I. Framing" task
#    And I click on "Successors" tab
    And I enter task type "Start-To-Start"
#    And I click "Ok" button
#
#    And I open new task information pop up of "T.I. Framing" task
#    And I click on "Successors" tab
    And I enter lead lag days "2 days"

    And I click "Ok" button
    And I wait for the Loading text to disappear
    And I open new task information pop up of "T.I. Framing" task
#    And I double click on "T.I. Framing" task
    And I verify the following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 12/31/2020 |
      | OriginalEndDate   | 12/31/2020 |
      | ActualStartDate   | 12/31/2020 |
      | ActualEndDate     | 12/31/2020 |
    Then I click "Cancel" button
#    And I double click on "Lighting" task
    And I open new task information pop up of "Lighting" task
    And I verify the following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 01/04/2021 |
      | OriginalEndDate   | 01/04/2021 |
      | ActualStartDate   | 01/04/2021 |
      | ActualEndDate     | 01/04/2021 |
    And I click "Cancel" button

    Examples:
      | Login User   | Login full username  | Entity Name        |
      | DeleteAccess | Delete Access Access | Tenant Improvement |