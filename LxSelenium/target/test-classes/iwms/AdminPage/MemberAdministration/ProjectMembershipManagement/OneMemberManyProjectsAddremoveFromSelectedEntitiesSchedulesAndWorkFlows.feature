@all
Feature: One Member Many Projects - Add/remove from selected entities?(Schedules and Work Flows) (Ref : Jira Ticket No : AUTOMATION1307-1307)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following file name:
      | Member_Test_15656_1307.xlsx    |
      | forms_1307.xml                 |
      | ScheduleTemplate15656_1307.xml |
      | 15656WFTemplate_1307.xml       |
      | 15656_Project_1307.xml         |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to Admin Dashboard and Assignee is successfully added on the schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Schedule 15656" from Schedule Template dropdown list
    And I click on "15656 A" link
    When I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully updated Task Item" message in the grid

    And I click on "15656 B" link
    When I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully updated Task Item" message in the grid

    And I click on "15656 C" link
    When I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully updated Task Item" message in the grid

    And I click on "15656 D" link
    When I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully updated Task Item" message in the grid

    And I verify the group "15656 A" is Auto-Assign Job Titles is "Delete Access"
    And I verify the group "15656 B" is Auto-Assign Job Titles is "Delete Access"
    And I verify the group "15656 C" is Auto-Assign Job Titles is "Delete Access"
    And I verify the group "15656 D" is Auto-Assign Job Titles is "Delete Access"


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and Assignee on workflow step is successfully updated
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click " Expand All " button
    And I click on "edit" step 1 of Form/Task "15656 Form(Assignees)" to assignee member
    When I verify the following fields value on editable page
      | name       | value |
      | StepNumber | 1     |
    And I set following fields value on editable page
      | name                       | value                 |
      | AssigneeTypeList_available | Testing, Member 15656 |
    And I click on ">>" Button
    And I click on the "Update" button
#    And I wait for modal window to close
#    And I wait for the Loading text to disappear in grid
    And I verify the following message "Successfully updated Step"

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to "15656 Project" -> Schedule tab
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I expand gantt chart

    And I open new task information pop up of "15656 A" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I open new task information pop up of "15656 B" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I open new task information pop up of "15656 C" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I open new task information pop up of "15656 D" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I switch to default frame

    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I wait for the Loading text to disappear

#    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
#      | Task Name | Assignees            | Status     | % Done | F/A Start      | F/A End        |
#      | 15656 A   | Member 15656 Testing | Completed  | 100    | [Today's Date] | [Today's Date] |
#      | 15656 B   | Member 15656 Testing | In-process | 0      | [Today's Date] | [Today's Date] |
#      | 15656 C   | Member 15656 Testing | Canceled   | 0      | 12/30/2020     | 12/30/2020     |
#      | 15656 D   | Member 15656 Testing | Not begun  | 0      | 12/31/2020     | 12/31/2020     |

    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees | Status     | % Done | F/A Start      | F/A End        |
      | 15656 A   |           | Completed  | 100    | [Today's Date] | [Today's Date] |
      | 15656 B   |           | In-process | 0      | [Today's Date] | [Today's Date] |
      | 15656 C   |           | Canceled   | 0      | 12/30/2020     | 12/30/2020     |
      | 15656 D   |           | Not begun  | 0      | 12/31/2020     | 12/31/2020     |

    And I switch to default frame

    And I click on the "Work Flow" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I verify row from non frame grid "BOGridLX_Grid_WorkFlow" having unique value "15656 WF" under column header "Name"
      | name             | value                |
      | Name             | 15656 WF             |
      | Title            |                      |
      | Status           | In-process           |
      | Days Open        |                      |
      | Begun            | [CURRENT DATE]       |
      | Completed        |                      |
      | Active Step      | 1                    |
      | Due Date         | [CURRENT DATE]       |
      | Current Assignee | Delete Access Access |
      | Current Approver |                      |
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name   | Third Level Tab | Grid              |
    | DeleteAccess | Delete Access Access | 15656 Project | Schedule        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "One Member Many Projects" tab
    And I set following fields value on editable page
      | name                | value                 |
      | memberID            | Testing, Member 15656 |
      | memberEditMode      | edit                  |
      | applySchedTemplates | true                  |

    And I click on Next button on "One Member Many Projects tab"
    And I wait for "Adding/removing Member 15656 Testing in selected entities" is visible

    And I search member "<Entity Name>"
    And I click on the "Member" row action of column "<Entity Name>" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "<Entity Name>" under column header "Name"
      | name               | value                             |
      | Type               | Opening Project                   |
      | Name               | <Entity Name>                     |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Legacy Market Area                |
      | Project Type       |                                   |
      | State              | TX                                |
      | Current Membership | None                              |

    And I click on Process Planned Membership button
    And I wait for "Total Entities Modified: 1" is visible
    And I see the following note on the "One Member Many Projects"
      | Finished processing |
    And I see the following note on the "One Member Many Projects"
      | Total Entities Modified: 1 |
    And I see the following note on the "One Member Many Projects"
      | No Errors encountered |
    And I see the following note on the "One Member Many Projects"
      | * Added as member to 1 entity |
    And I see the following note on the "One Member Many Projects"
      | * Task Assignee changes: Added 4 records |
    And I see the following note on the "One Member Many Projects"
      | * Work Flow Step Assignee changes: Added 1 record |


  Examples:
    | Login User   | Login full username  | Grid         | Entity Name   |
    | DeleteAccess | Delete Access Access | entitySelect | 15656 Project |

  Scenario Outline: As a delete user I Navigate to the schedule tab of "RMScheduleProject" and expand the schedule, and the "assignees" column" to fully view the member's name.
    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Work Flow" tab
    And I switch to visible frame
#    And I click " Expand All " button
    And I wait for the Loading text to disappear

#    And I verify the following values in frame grid "BOGridLX_Grid_WorkFlow"
#      | Name     | Title | Status     | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee                             | Current Approver |
#      | 15656 WF |       | In-process |           | [Today's Date] |           | 1           | [Today's Date] | Delete Access Access \n Member 15656 Testing |                  |
#    And I verify the "Member 15656 Testing" Assignee on work flow grid
#    And I verify the "Delete Access Access" Assignee on work flow grid

    And I verify row from non frame grid "BOGridLX_Grid_WorkFlow" having unique value "15656 WF" under column header "Name"
      | name             | value                |
      | Name             | 15656 WF             |
      | Title            |                      |
      | Status           | In-process           |
      | Days Open        |                      |
      | Begun            | [CURRENT DATE]       |
      | Completed        |                      |
      | Active Step      | 1                    |
      | Due Date         | [CURRENT DATE]       |
      | Current Assignee | Delete Access Access |
      | Current Approver |                      |

    And I verify row from non frame grid "BOGridLX_Grid_WorkFlow" having unique value "15656 WF" under column header "Name"
      | name             | value                |
      | Name             | 15656 WF             |
      | Title            |                      |
      | Status           | In-process           |
      | Days Open        |                      |
      | Begun            | [CURRENT DATE]       |
      | Completed        |                      |
      | Active Step      | 1                    |
      | Due Date         | [CURRENT DATE]       |
      | Current Assignee | Member 15656 Testing |
      | Current Approver |                      |

    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart

    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees            | Status     | % Done | F/A Start      | F/A End        |
      | 15656 A   | Member 15656 Testing | Completed  | 100    | [Today's Date] | [Today's Date] |
      | 15656 B   | Member 15656 Testing | In-process | 0      | [Today's Date] | [Today's Date] |
      | 15656 C   | Member 15656 Testing | Canceled   | 0      | 12/30/2020     | 12/30/2020     |
      | 15656 D   | Member 15656 Testing | Not begun  | 0      | 12/31/2020     | 12/31/2020     |

    And I switch to default frame

    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "BOGridMember" having unique value "Delete Access Access" under column header "Name"
      | name         | value                |
      | Type         | Broker               |
      | Name         | Delete Access Access |
      | Title        | Delete Access        |
      | Phone        | 456.236.3698         |
      | Email        | svcQA@lucernex.com   |
      | Employer     | Lucernex             |
      | Job Function | System Administrator |
      | User Class   | Delete Access        |

    And I verify a row from grid "BOGridMember" having unique value "Member 15656 Testing" under column header "Name"
      | name         | value                |
      | Type         | Broker               |
      | Name         | Member 15656 Testing |
      | Title        | Delete Access        |
      | Phone        |                      |
      | Email        |                      |
      | Employer     | Selenium-Employer    |
      | Job Function | Delete Access        |
      | User Class   | Delete Access        |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   | Third Level Tab |
    | DeleteAccess | Delete Access Access | 15656 Project | Schedule        |
