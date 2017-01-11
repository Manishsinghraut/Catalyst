@all
Feature: (Ref : Jira Ticket No : Automation-878), Printable View - Schedule

  Scenario Outline: I import file for Printable View - Schedule scenario test

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | 2015CompanySchedule-878.xml |
      | s011-878.xml                |

    And I navigate to entity type "<Item>" named "<Entity Name>"

    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/31/2020 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I expand gantt chart
    And I click on the "Printable View" action panel button
    And I switch to visible frame
    And I see the "Export Settings" modal window
    And I verify the following fields value on editable page
      | name       | value             |
      | range      | Complete schedule |
      | exporterId | Single page       |
    And I click on the "Export" button
    And I click "Export" button
    #Improvement
    Then I verify file name "LxImage" of type ".png" downloaded successfully
#    And I switch to "Prntable View" child window
#    And I verify the following values in non frame grid "divBody"
#      | Task Name                    | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration |
#      | *Identify Available Property |           | Not begun | 0      | 12/31/2020 | 02/10/2021 | 30 days      |
#    And I close the "Printable View" child window
#    And I switch to main window
    And I expand gantt chart
    And I open new task information pop up of "*Identify Available Property" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I click on the "Save Changes" action panel button
    And I click on the "Printable View" action panel button
    And I switch to visible frame
    And I click "Export" button
    #Improvement
    Then I verify file name "LxImage" of type ".png" downloaded successfully
#    And I switch to "Printable View" child window
#    And I verify the following values in non frame grid "divBody"
#      | Task Name                    | Assignees | Status     | % Done | F/A Start      | F/A End       | F/A Duration |
#      | *Identify Available Property |           | In-process | 0      | [Today's Date] | [Duration 30] | 30 days      |
#    And I close the "Printable View" child window
#    And I switch to main window


    Examples:
      | Login User   | Login full username  | Entity Name | Template                  | Item     |
      | DeleteAccess | Delete Access Access | s011-878    | 2015 Company Schedule-878 | Location |