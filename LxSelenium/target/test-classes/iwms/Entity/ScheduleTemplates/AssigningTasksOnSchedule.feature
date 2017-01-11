@all
Feature: Assigning Tasks on Schedule (Ref : Jira Ticket No : AUTOMATION-892)

  Scenario Outline: I import file for apply schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | ScheduleMembers.xlsx             |
      | TaskAssigneeScheduleTemplate.xml |
      | ScheduleTaskAssigneeSite.xml     |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify the members/contacts for the Entity and verify Schedule is existing with Starts Date as 12/29/2020.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Members/Contacts" tab
    And I verify a important row from grid "<Grid Id>" having unique value "Aaron Member1" under column header "Name"
      | name         | value               |
      | Type         | Broker              |
      | Name         | Aaron Member1       |
      | Title        | Delete Access       |
      | Phone        | (460) 258-9631      |
      | Email        | QA1@lucernex.com    |
      | Employer     | Selenium-Employer   |
      | Job Function | Delete Access       |
      | User Class   | Lease Administrator |
    And I verify a important row from grid "<Grid Id>" having unique value "Abbey Member2" under column header "Name"
      | name         | value               |
      | Type         | Broker              |
      | Name         | Abbey Member2       |
      | Title        | Delete Access       |
      | Phone        | (460) 269-6089      |
      | Email        | QA1@lucernex.com    |
      | Employer     | Selenium-Employer   |
      | Job Function | Delete Access       |
      | User Class   | Lease Administrator |
    And I verify a important row from grid "<Grid Id>" having unique value "Hamilton Member3" under column header "Name"
      | name         | value               |
      | Type         | Broker              |
      | Name         | Hamilton Member3    |
      | Title        | Delete Access       |
      | Phone        | (460) 269-6089      |
      | Email        | QA1@lucernex.com    |
      | Employer     | Selenium-Employer   |
      | Job Function | Delete Access       |
      | User Class   | Lease Administrator |
    And I verify a important row from grid "<Grid Id>" having unique value "Mabel Member4" under column header "Name"
      | name         | value               |
      | Type         | Broker              |
      | Name         | Mabel Member4       |
      | Title        | Delete Access       |
      | Phone        | (460) 269-6090      |
      | Email        | QA1@lucernex.com    |
      | Employer     | Selenium-Employer   |
      | Job Function | Delete Access       |
      | User Class   | Lease Administrator |
    And I switch to default frame
    Then I click on the "Schedule" tab
    And I expand gantt chart
    And I verify the F/A Start Date "12/29/2020" and End "12/31/2020" for task "<Task Name>"

    Examples:
      | Login User   | Login full username  | Entity Name                 | Grid Id      | Task Name      |
      | DeleteAccess | Delete Access Access | Schedule Task Assignee Site | BOGridMember | Assignee Group |

  Scenario Outline: As a delete user i verify members are displayed in alphabetical order in the edit task popup window

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    Then I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Assignee Task A" task
    Then I click on "Assignees" tab in the popup window of edit task

    And I click "Add new" button
    And I verify members are displayed in alphabetical order in the dropdown of edit task
    And I click "Cancel" button

    Examples:
      | Login User   | Login full username  | Entity Name                 |
      | DeleteAccess | Delete Access Access | Schedule Task Assignee Site |

  Scenario Outline: As a delete user i add Assignees to a task and verify the same

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    Then I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Assignee Task A" task
    Then I click on "Assignees" tab in the popup window of edit task

    And I click "Add new" button
    And I enter task name "Abbey Member2"

    And I click "Add new" button
    And I enter task name "Hamilton Member3"

    And I click "Add new" button
    And I enter task name "Mabel Member4"

    And I click "Ok" button
    And I wait for the Loading text to disappear

    And I double click on "Assignee Task A" task
    Then I click on "Assignees" tab in the popup window of edit task

    And I verify the following values in "<Grid Id>":
      | name          | value         |
      | Assignee Name | Mabel Member4 |
    And I verify the following values in "<Grid Id>":
      | name          | value            |
      | Assignee Name | Hamilton Member3 |
    And I verify the following values in "<Grid Id>":
      | name          | value         |
      | Assignee Name | Abbey Member2 |

    And I click "Cancel" button

    Examples:
      | Login User   | Login full username  | Entity Name                 | Grid Id     |
      | DeleteAccess | Delete Access Access | Schedule Task Assignee Site | ^taskeditor |

  Scenario Outline: As a delete user i verify adding duplicate members to the task is not allowed

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    Then I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Assignee Task A" task

    Then I click on "Assignees" tab in the popup window of edit task
    And I click "Add new" button
    And I enter task name "Mabel Member4"
    And I click "Ok" button

    And I verify "Please correct marked errors to save changes" message in Inactive Schedule pop up
    And I click "OK" button

    Then I click "Remove" button
    And I click "Ok" button
    And I wait for the Loading text to disappear


    Examples:
      | Login User   | Login full username  | Entity Name                 |
      | DeleteAccess | Delete Access Access | Schedule Task Assignee Site |

  Scenario Outline: As a delete user I add all members to a task and I verify them in Assignees Tab of edit task pop up window and Assignee colum in the schedule table

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Assignee Task B" task
    Then I click on "Assignees" tab in the popup window of edit task

    And I click "Add new" button
    And I enter task name "Aaron Member1"

    And I click "Add new" button
    And I enter task name "Abbey Member2"

    And I click "Add new" button
    And I enter task name "Hamilton Member3"

    And I click "Add new" button
    And I enter task name "Mabel Member4"

    And I click "Ok" button
    And I wait for the Loading text to disappear

    And I double click on "Assignee Task B" task
    Then I click on "Assignees" tab in the popup window of edit task

    And I verify the following values in "<Grid Id>":
      | name          | value         |
      | Assignee Name | Mabel Member4 |
    And I verify the following values in "<Grid Id>":
      | name          | value            |
      | Assignee Name | Hamilton Member3 |
    And I verify the following values in "<Grid Id>":
      | name          | value         |
      | Assignee Name | Abbey Member2 |
    And I verify the following values in "<Grid Id>":
      | name          | value         |
      | Assignee Name | Aaron Member1 |

    And I click "Cancel" button
    And I verify list of assignees for the "<Task Name>"
      | Hamilton Member3 |
      | Aaron Member1    |
      | Mabel Member4    |
      | Abbey Member2    |

    Examples:
      | Login User   | Login full username  | Entity Name                 | Grid Id     | Task Name       |
      | DeleteAccess | Delete Access Access | Schedule Task Assignee Site | ^taskeditor | Assignee Task B |


  Scenario Outline: As a delete user i remove some assignees for a task and i verify the removed assignees in the assignees colum of the Schedule table

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Assignee Task B" task
    Then I click on "Assignees" tab in the popup window of edit task

    And I select the following assignee name and remove from the task
      | Mabel Member4 |
      | Abbey Member2 |

    And I click "Ok" button
    And I wait for the Loading text to disappear
    And I verify list of assignees for the "<Task Name>"
      | Hamilton Member3 |
      | Aaron Member1    |


    Examples:
      | Login User   | Login full username  | Entity Name                 | Task Name       |
      | DeleteAccess | Delete Access Access | Schedule Task Assignee Site | Assignee Task B |