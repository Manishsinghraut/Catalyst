@all @smoke4
Feature: Search and Sort Functionality on Schedule (Ref : Jira Ticket No : AUTOMATION-991)

  Scenario Outline: I import file s040 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | s040.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Searching for task name
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I enter "complete design approval" in search box for search a task in gantt chart grid
    Then I verify the task "Complete Design Approval" of slack "521 days" shall be reflected correctly on spreed sheet
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s040        |

  Scenario Outline: As a delete user I Searching for task name
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I enter "complete" in search box for search a task in gantt chart grid
    Then I verify the task "Complete Site Characteristics" of slack "713 days" shall be reflected correctly on spreed sheet
    Then I verify the task "Complete Site Criteria Scorecard" of slack "713 days" shall be reflected correctly on spreed sheet
    Then I verify the task "Prelim Design Pkg Complete" of slack "670 days" shall be reflected correctly on spreed sheet
    Then I verify the task "Complete Design Approval" of slack "521 days" shall be reflected correctly on spreed sheet
    Then I verify the task "Complete Construction" of slack "438 days" shall be reflected correctly on spreed sheet
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s040        |

  Scenario Outline: As a delete user Sorting task name column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
#    And I click sort in header "Task Name" from grid "Lx-ui-GanttPanel" in "Sort Descending"
    And I move the cursor to "Task Name" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "Task Name" in "Ascending"
      | Cancel Project                      |
      | Cancelled Project                   |
      | On Hold                             |
      | Construction                        |
      | Bid Due Date                        |
      | Complete Construction               |
      | Complete Design Approval            |
      | Initiate Post Const Start Processes |
      | LL Delivery Date (Co)               |
      | Open Store                          |

    And I move the cursor to "Task Name" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "Task Name" in "Descending"
      | Technology       |
      | Wire Order       |
      | Wire Install     |
      | Voice Order      |
      | Voice Install    |
      | Site Survey      |
      | POS Order        |
      | POS On Deck      |
      | POS Install      |
      | Office Readiness |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting status column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "Status" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "Status" in "Ascending"
      | Canceled  |
      | Canceled  |
      | Canceled  |
      | Not begun |
      | Not begun |
      | Not begun |
      | Not begun |
      | Not begun |

    And I move the cursor to "Status" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "Status" in "Descending"
      | Not begun |
      | Not begun |
      | Not begun |
      | Not begun |
      | Not begun |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting F/A Start column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "F/A Start" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "F/A Start" in "Ascending"
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/17/2030 |
      | 02/20/2030 |
      | 03/01/2030 |
      | 03/12/2030 |

    And I move the cursor to "F/A Start" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "F/A Start" in "Descending"
      | 08/15/2030 |
      | 12/03/2030 |
      | 11/22/2030 |
      | 11/18/2030 |
      | 11/13/2030 |
      | 11/04/2030 |
      | 11/04/2030 |
      | 11/04/2030 |
      | 10/04/2030 |
      | 09/19/2030 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting F/A End column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "F/A End" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "F/A End" in "Ascending"
      | 06/13/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/17/2030 |
      | 02/20/2030 |
      | 03/01/2030 |
      | 03/12/2030 |

    And I move the cursor to "F/A End" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "F/A End" in "Descending"
      | 09/24/2032 |
      | 09/26/2032 |
      | 01/01/2030 |
      | 01/21/2031 |
      | 01/21/2031 |
      | 12/12/2030 |
      | 12/11/2030 |
      | 09/26/2030 |
      | 08/15/2030 |
      | 08/15/2030 |
      | 08/14/2030 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user Sorting BL Start column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "BL Start" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "BL Start" in "Ascending"
      | 01/01/2030 |
      | 01/01/2030 |
      | 09/26/2032 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/17/2030 |
      | 02/20/2030 |
      | 03/01/2030 |
      | 03/12/2030 |

    And I move the cursor to "BL Start" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "BL Start" in "Descending"
      | 08/15/2030 |
      | 12/03/2030 |
      | 11/22/2030 |
      | 11/18/2030 |
      | 11/13/2030 |
      | 11/04/2030 |
      | 11/04/2030 |
      | 11/04/2030 |
      | 10/04/2030 |
      | 09/19/2030 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting BL End column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "BL End" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "BL End" in "Ascending"
      | 06/13/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/17/2030 |
      | 02/20/2030 |
      | 03/01/2030 |
      | 03/12/2030 |

    And I move the cursor to "BL End" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "BL End" in "Descending"
      | 09/26/2032 |
      | 09/26/2032 |
      | 01/01/2030 |
      | 01/21/2031 |
      | 01/21/2031 |
      | 12/12/2030 |
      | 12/11/2030 |
      | 09/26/2030 |
      | 08/15/2030 |
      | 08/15/2030 |
      | 08/14/2030 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting Proj. Start column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "Proj. Start" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "Proj. Start" in "Ascending"
      | 01/01/2030 |
      | 01/01/2030 |
      | 09/26/2032 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/17/2030 |
      | 02/20/2030 |
      | 03/01/2030 |
      | 03/12/2030 |

    And I move the cursor to "Proj. Start" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "Proj. Start" in "Descending"
      | 08/15/2030 |
      | 12/03/2030 |
      | 11/22/2030 |
      | 11/18/2030 |
      | 11/13/2030 |
      | 11/04/2030 |
      | 11/04/2030 |
      | 11/04/2030 |
      | 10/04/2030 |
      | 09/19/2030 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting Proj. End column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "Proj. End" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "Proj. End" in "Ascending"
      | 06/13/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/01/2030 |
      | 01/17/2030 |
      | 02/20/2030 |
      | 03/01/2030 |
      | 03/12/2030 |

    And I move the cursor to "Proj. End" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "Proj. End" in "Descending"
      | 09/26/2032 |
      | 09/26/2032 |
      | 01/01/2030 |
      | 01/21/2031 |
      | 01/21/2031 |
      | 12/12/2030 |
      | 12/11/2030 |
      | 09/26/2030 |
      | 08/15/2030 |
      | 08/15/2030 |
      | 08/14/2030 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting % Done column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "% Done" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "% Done" in "Ascending"
      | 0 |
      | 0 |
      | 0 |
      | 0 |
      | 0 |
      | 0 |
    And I move the cursor to "% Done" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "% Done" in "Descending"
      | 0 |
      | 0 |
      | 0 |
      | 0 |
      | 0 |
      | 0 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user Sorting Comments column in ascending and descending order
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I move the cursor to "Comments" to display the sorting drop-down and select "Sort Ascending" from grid "<Grid>"
    And I verify the following sorted "Comments" in "Ascending"
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      |                                                                                                         |
      | Be sure to upload the approved package and comments to Drawings\Working Drawings\Other under Documents. |
      | CC: Be sure to send the ground break feed, thank you.                                                   |
      | Please remember to generate and send out the Store Opening Announcement for this location, thank you!   |
    And I move the cursor to "Comments" to display the sorting drop-down and select "Sort Descending" from grid "<Grid>"
    And I verify the following sorted "Comments" in "Descending"
      |                                                                                                       |
      |                                                                                                       |
      |                                                                                                       |
      |                                                                                                       |
      | Please send the permit set to the LL for his or her approval.  Thank you.                             |
      | Please remember to generate and send out the Store Opening Announcement for this location, thank you! |
      | CC: Be sure to send the ground break feed, thank you                                                  |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Grid              |
    | DeleteAccess | Delete Access Access | s040        | ^Lx-ui-GanttPanel |