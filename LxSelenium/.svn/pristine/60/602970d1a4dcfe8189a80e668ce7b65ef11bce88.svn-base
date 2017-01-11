@all
Feature: (Ref : Jira Ticket No : AUTOMATION-800) As an edit user I can able to edit schedule template task

  Scenario Outline: I import file for edit schedule template task
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | ImportedLocation(1).xml |
      | PredecessorProject.xml  |
      | ScheduleGroup.xml       |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to apply Schedule Template to entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startStopWhenRadio     | start      |
      | startDate              | 12/31/2020 |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I double click on "Task 1.1" task
    And I click on "Predecessors" tab
    And I click "Add new" button
    And I enter task name "Task 1.2"
    And I click "Ok" button

    And I expand gantt chart
    And I double click on "Task 1.2" task
    And I click on "Notifications" tab
    And I click on "<<Add Notify>>" link
    And I switch to default frame
    And I set following fields value on editable page
      | name                         | value                             |
      | NotifyName                   | Before task Completion            |
      | AlertType                    | Before Task Complete Notification |
      | _checkbox_EnableForEMail     | true                              |
      | _checkbox_EnableForDashboard | true                              |
      | DaysOffsetFromTargetDate     | 1                                 |
      | availMemberIDList            | Administrator, Lx                 |
    And I click on ">>" Button
    And I click on the "Update" button
    And I switch to visible frame
    And I click on "Save Notifications" Button
    And I verify a row from reports grid "^taskeditor" having the following header and cell value pair
      | name              | value                  |
      | Notification Name | Before task Completion |
    And I click "Ok" button
    And I verify success message "Successfully updated Task Item"
    And I click on the "Save Changes" action panel button


    Examples:
      | Login User   | Login full username  | Item     | Entity Name         | Third Level Tab | Template      |
      | DeleteAccess | Delete Access Access | Facility | Predecessor Project | Schedule        | ScheduleGroup |