@all
Feature: (Ref : Jira Ticket No : Automation-1006), Delete the Schedule Task associated with the WorkFlow

  Scenario Outline: Precondition: I import file for Delete the Schedule Task associated with the WorkFlow and
  As a delete user I delete the Schedule Task associated with the WorkFlow

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | DTWForm.xml               |
#      | DeleteTaskWF(2).xml       | issue IWMS-21655
      | DeleteTaskWF_New-1006.xml |
      | DeleteTaskWFProject.xml   |


    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Submit required forms" task
    Then I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button in modal window "Editing Task for DeleteTaskWFProject"
    And I wait for the Loading text to disappear
    And I click on the "Work Flow" tab
    And I switch to visible frame
    And I wait for the loading text to be disappear
#    And I Expand the "DeleteTaskWF" work flow to expose the first step to invite bidders
#    And I click on "<Expand All>" link
    And I click " Expand All " button
    And I click on "DTW" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I click on the "Complete" button
    And I wait for modal window to close
    And I switch to visible frame
    And I verify grid item "Prepare proposal" present is "true" in grid "issueMainDiv"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I right click on task "Prepare proposal " and perform action "Delete task(s)"
    #And I click "Delete task(s)" button
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I see "Failed: Task is part of a workflow" message in the header


    Examples:
      | Login User   | Login full username  | Entity Name         |
      | DeleteAccess | Delete Access Access | DeleteTaskWFProject |