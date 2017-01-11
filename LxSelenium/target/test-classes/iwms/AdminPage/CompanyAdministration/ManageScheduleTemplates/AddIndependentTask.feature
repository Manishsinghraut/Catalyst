@all
Feature: (JIRA - AUTOMATION-604) As a delete user I can able to add independent task

  Scenario Outline: I import file for add independent task feature
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Create_Project.xls            |
      | Temp_for_Independent_Task.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: (Ref : Jira Ticket No : Automation-604) As a delete user I can apply schedule template to an entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "Project" named "<Project>"
    And I Search for the "<Project>" that was created
    And Click on the name of the "<Project>" in the results pop-up
    Then I see "<Project>" name on the header
    And I click on the "Schedule" tab
#    And I wait for the Loading text to disappear
    And I click on the "Apply Template" action panel button
    And I wait for modal window to open
    And I see the "Apply Schedule Template" modal window
    And I set fields values on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startDate              | 07/01/2020          |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I verify text value in a page
      | value   |
      | <Group> |
      | <Task>  |

    Examples:
      | Schedule Template    | Group | Task                        | Login User   | Login full username  | Project       |
      | Add Independent Task | Group | Add another task above this | DeleteAccess | Delete Access Access | Test Schedule |

  Scenario Outline: As a delete I add new task above existing task
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "Project" named "<Project>"
    And I Search for the "<Project>" that was created
    And Click on the name of the "<Project>" in the results pop-up
    Then I see "<Project>" name on the header
    And I click on the "Schedule" tab
    And I wait for the Loading text to disappear
    And I expand gantt chart
    And I add new task above "<Task>" task
#    And I double click on "New task" task
    And I open new task information pop up of "New task" task
#    And I set following fields value on editable page
#      | name                    | value              |
#      | TaskName                | <Independent task> |
#      | CodeTaskStatusID        | Canceled           |
#      | TaskEndsCodeDayOfWeekID | Sunday             |
#      | OriginalStartDate       | 08/07/2020         |
#      | OriginalEndDate         | 08/08/2020         |
#      | ProjectedStartDate      | 09/07/2020         |
#      | ProjectedEndDate        | 09/08/2020         |
#      | ActualStartDate         | 10/07/2020         |
#      | ActualEndDate           | 10/08/2020         |
#      | PercentComplete         | 40%                |
#      | ActualDuration          | 4 days             |
    And I set following fields value on editable page
      | name     | value              |
      | TaskName | <Independent task> |
    And I click "Ok" button
#    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I verify text value in a page
      | value              |
      | <Independent task> |

    Examples:
      | Task                        | Independent task | Login User   | Login full username  | Project       |
      | Add another task above this | Independent task | DeleteAccess | Delete Access Access | Test Schedule |


  Scenario Outline: As a delete I add notification to task
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "Project" named "<Project>"
    And I Search for the "<Project>" that was created
    And Click on the name of the "<Project>" in the results pop-up
    Then I see "<Project>" name on the header
    And I click on the "Schedule" tab
    And I wait for the Loading text to disappear
    And I expand gantt chart
#    And I double click on "<Independent task>" task
    And I open new task information pop up of "<Independent task>" task
    And I click on "Notifications" link
    And I click on "<<Add Notify>>" link
    And I switch to default frame
    And I set fields values on editable page
      | name                         | value                            |
      | NotifyName                   | Notification 1                   |
      | AlertType                    | After Task Complete Notification |
      | _checkbox_EnableForEMail     | true                             |
      | _checkbox_EnableForDashboard | true                             |
      | DaysOffsetFromTargetDate     | 4                                |
      | availMemberIDList            | Access, Delete                   |
    And I click on ">>" Button
    And I click on the "Update" button
    And I verify text value in a page
      | value             |
      | Notification Name |
      | Notification 1    |
    And I click "Ok" button
#    And I switch to default frame
    And I click on the "Save Changes" action panel button
#    And I wait for the Loading text to disappear

    Examples:
      | Independent task | Login User   | Login full username  | Project       |
      | Independent task | DeleteAccess | Delete Access Access | Test Schedule |

#  Scenario Outline: (Ref : Jira Ticket No : Automation-603) As a delete user I can able to delete schedule template from entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    And I navigate to entity type "Project" named "<Project>"
#    And I Search for the "<Project>" that was created
#    And Click on the name of the "<Project>" in the results pop-up
#    Then I see "<Project>" name on the header
#    And I click on the "Schedule" tab
#    And I wait for the Loading text to disappear
#    And I click on the "Delete Schedule" action panel button
#    And I wait for modal window to open
#    And I see the "Confirm Delete" modal window
#    And I click on the "Yes" button
#    Then I wait for modal window to close
#    And I wait for the Loading text to disappear
#    And I see "No schedule information found" message in the header
#    Examples:
#      | Login User   | Login full username  | Project       |
#      | DeleteAccess | Delete Access Access | Test Schedule |


