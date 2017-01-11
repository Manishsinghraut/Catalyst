@all
Feature: Replace/Switch Members - Schedule tasks and notification (Ref : Jira Ticket No : AUTOMATION-1282)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Members/"
    And I import following file name:
      | RScheduleMembers_1282.xlsx |
      | RMScheduleProject_1282.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "RMScheduleProject" -> Schedule tab
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I expand gantt chart

    And I open new task information pop up of "TaskB-1262" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I open new task information pop up of "TaskC-1262" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I open new task information pop up of "TaskD-1262" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |

    And I click on "Notifications" tab
    And I click on "<<Add Notify>>" link
    And I switch to default frame
    And I set following fields value on editable page
      | name                         | value                            |
      | NotifyName                   | Test notifee                     |
      | AlertType                    | After Task Complete Notification |
      | _checkbox_EnableForEMail     | false                            |
      | _checkbox_EnableForDashboard | false                            |
      | DaysOffsetFromTargetDate     | 0                                |
      | availMemberIDList            | 1262, RScheduleMemberOne         |
    And I click on ">>" Button
    And I click on the "Update" button
    And I switch to visible frame
    And I click on "Save Notifications" Button
    And I click "Ok" button
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Third Level Tab |
    | DeleteAccess | Delete Access Access | RMScheduleProject | Schedule        |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab
    And I set following fields value on editable page
      | name                        | value                    |
      | memberID                    | 1262, RScheduleMemberOne |
      | removeFromReplacedEntitites | false                    |
      | replaceWithMemberID         | 1262, RScheduleMemberTwo |
      | promoteReplacee             | false                    |
      | memberEditMode              | edit                     |
    And I click on Next button on "Replace / Switch Members tab"
    And I click on the "replace" row action of column "RMScheduleProject" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "RMScheduleProject" under column header "Name"
      | name               | value                              |
      | Type               | Opening Project                    |
      | Name               | RMScheduleProject                  |
      | Portfolio/Program  | Lucernex-Selenium                  |
      | Parent Region      | Central(Central region - preOpen)) |
      | Sub Region         |                                    |
      | Market             | Central                            |
      | Project Type       |                                    |
      | Current Membership | Member                             |
      | Planned Membership | Replace                            |

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 1" is visible
    And I wait for "Replacing RScheduleMemberOne 1262 with RScheduleMemberTwo 1262" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 1 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 1 entity |

    And I see the following note on the "Replace / Switch Members"
      | * Task Assignee changes: Added 3 records Deleted 3 records |

    And I see the following note on the "Replace / Switch Members"
      | * Notify Member changes: Added 1 record Deleted 1 record |

  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to the schedule tab of "RMScheduleProject" and expand the schedule, and the "assignees" column" to fully view the member's name.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart

    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name  | Assignees               | Status     | % Done | F/A Start      | F/A End        |
      | TaskB-1262 | RScheduleMemberTwo 1262 | In-process | 0      | [Today's Date] | [Today's Date] |
      | TaskC-1262 | RScheduleMemberOne 1262 | Completed  | 100    | [Today's Date] | [Today's Date] |
      | TaskD-1262 | RScheduleMemberTwo 1262 | Canceled   | 0      | 12/30/2030     | 12/30/2030     |
      | TaskA-1262 | RScheduleMemberTwo 1262 | Not begun  | 0      | 12/31/2030     | 12/31/2030     |

    And I open new task information pop up of "TaskD-1262" task
    And I click on "Notifications" tab
    And I click on "edit" link
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                         | value                            |
      | NotifyName                   | Test notifee                     |
      | AlertType                    | After Task Complete Notification |
      | _checkbox_EnableForEMail     | false                            |
      | _checkbox_EnableForDashboard | false                            |
      | DaysOffsetFromTargetDate     | 0                                |
      | MemberIDList                 | 1262, RScheduleMemberTwo         |

    And I click on the "Close" button
    And I switch to visible frame
    And I click "Cancel" button
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Third Level Tab |
    | DeleteAccess | Delete Access Access | RMScheduleProject | Schedule        |
