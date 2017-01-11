@all
Feature: (Ref : Jira Ticket No : Automation-993), Selecting and Unselecting a column

  Scenario Outline: Precondition: I import file for Selecting and Unselecting a column feature test

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | ColumnsLocation-993.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify ability to select or unselect the columns he shall be available on all column headers
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I drag the vertical split bar to right
    And I click on the "Spreadsheet" action panel button
    And I click on the "Spread Sheet" action panel button
    And I click on the "Spreadsheet" action panel button

    And I move the cursor to the following headers in the grid "<Grid ID>" view downward arrow
      | #            |
      | Task Name    |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |

    And I verify the following headers present in grid "<Grid ID>"
      | Assignees |
      | % Done    |
      | Slack     |

    And I select the following menu items exist for column header "F/A Duration" in the grid  "<Grid ID>"
      | Assignees |
      | % Done    |
      | Slack     |

    And I verify the following headers not present in grid "<Grid ID>"
      | Assignees |
      | % Done    |
      | Slack     |

    And I select the following menu items exist for column header "Status" in the grid  "<Grid ID>"
      | Assignees |
      | % Done    |
      | Slack     |

    And I verify the following headers present in grid "<Grid ID>"
      | Assignees |
      | % Done    |
      | Slack     |

    And I verify the following menu items exist for column header "#" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "Task Name" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "Assignees" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "Status" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "% Done" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |

    And I verify the following menu items exist for column header "F/A Start" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header " F/A End" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "F/A Duration" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "Slack" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "Comments" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "BL Start" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "BL End" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |
    And I verify the following menu items exist for column header "Proj. Start" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |

    And I verify the following menu items exist for column header "Proj. End" in the grid  "<Grid ID>"
      | #            |
      | Assignees    |
      | Status       |
      | % Done       |
      | F/A Start    |
      | F/A End      |
      | F/A Duration |
      | Slack        |
      | Comments     |
      | BL Start     |
      | BL End       |
      | Proj. Start  |
      | Proj. End    |


    Examples:
      | Login User   | Login full username  | Entity Name          | Grid ID           |
      | DeleteAccess | Delete Access Access | Columns Location-993 | ^Lx-ui-GanttPanel |