@all
Feature: (Ref : Jira Ticket No : Automation-891),Deactivating assigned assignees on tasks

  Scenario Outline: I import file for Deactivating assigned assignees on tasks
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | AssignedMembers.xlsx            |
      | AssigneeDeactivationProject.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I
  1. Navigate to Assigned Deactivation Project > Schedule ,expand and ensure that schedule is displayed(Refer Screenshot 2.Schedule)
  2. Navigate to Assignee Deactivation Project > Member/Contacts and ensure that 3 members are displayed as seen in the screenshot 1.Members
  3. I add assignee to the tasks

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Members/Contacts" tab
    And I assert the following values in grid "^BOGridMember"
      | Type   | Name         | Title         |
      | Broker | Abel Abner   | Delete Access |
      | Broker | Ada Ace      | Delete Access |
      | Broker | Illiana Ines | Delete Access |
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I double click on "Assignee Task A" task name
    And I click on "Assignees" tab in schedule task pop up
    And I enter assignee name "Abel Abner"
    And I click "Ok" button
    And I double click on "Assignee Task B" task name
    And I click on "Assignees" tab in schedule task pop up
    And I enter assignee name "Illiana Ines"
    And I click "Ok" button
    And I click on the "Save Changes" action panel button

  Examples:
    | Login User   | Login full username  | Entity Name                   |
    | DeleteAccess | Delete Access Access | Assignee Deactivation Project |

  Scenario Outline: As a delete user I deactivate the user assigned to Assignee Task A

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I click on the "Activate/Deactivate" link
#Below code is commented due to application flow has changed
#    And I select inactive status for the following members
#      | Abel Abner |
#      | Ada Ace    |
#    And I click on "Update Active Status" Button
#    And I click on "Manage Members/Contacts" link

    And I search member "Abel Abner"
    And I click on "<Deactivate>" row action in the grid "<Grid>" having the following header "Name" and cell value "Abel Abner"
      | name | value      |
      | Name | Abel Abner |

    And I search member "Ada Ace"
    And I click on "<Deactivate>" row action in the grid "<Grid>" having the following header "Name" and cell value "Ada Ace"
      | name | value   |
      | Name | Ada Ace |

    And I select List Inactive radio button
    And I search member "Abel Abner"
    And I verify a row from non frame grid "<Grid>" having unique value "Abel Abner" under column header "Name"
      | name | value      |
      | Name | Abel Abner |
    And I search member "Ada Ace"
    And I verify a row from non frame grid "<Grid>" having unique value "Ada Ace" under column header "Name"
      | name | value   |
      | Name | Ada Ace |


  Examples:
    | Login User   | Login full username  | Grid        |
    | DeleteAccess | Delete Access Access | MembersGrid |

  Scenario Outline: As a delete user I verify the inactivated mebers in the assignee list
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I double click on "Assignee Task A" task name
    And I click on "Assignees" tab in schedule task pop up
    And I verify the following text in a page
      | Abel Abner |
    And I click on the "Cancel" button
    And I double click on "Assignee Task B" task name
    And I click on "Assignees" tab in schedule task pop up
    And I verify the following text in a page
      | Illiana Ines |
    And I click on the "Cancel" button
    And I click on the "Members/Contacts" tab
    And I assert the following values in grid "^BOGridMember"
      | Type   | Name         | Title         |
      | Broker | Illiana Ines | Delete Access |

  Examples:
    | Login User   | Login full username  | Entity Name                   |
    | DeleteAccess | Delete Access Access | Assignee Deactivation Project |
