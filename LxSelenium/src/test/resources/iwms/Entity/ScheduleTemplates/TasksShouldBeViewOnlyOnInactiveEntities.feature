@all
Feature: (Ref : Jira Ticket No : Automation-890),Tasks should be view only on inactive entities

  Scenario Outline: I import file for Deactivating assigned assignees on tasks
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | InactiveThisFacilityEntity.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I inactivate facility and try to edit task

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Facilities" link

    And I click on the "<Change to Inactive>" row action of column "<Entity Name>" of column "1" from grid "<Grid ID>"
#    And I click "<Change to Inactive>" link in the non-frame grid "<Grid ID>" having the following header and cell values
#      | name | value         |
#      | Type | Facility      |
#      | Name | <Entity Name> |
#    And I verify a unique row in grid "<Grid ID>" having unique value "<Entity Name>" under column header "Name"
#      | name           | value             |
#      | Type           | Facility          |
#      | Planned Status | Inactive <Cancel> |

    And I click on "Apply Changes" Button
    Then I verify success message appear after inactivating the facility
      | Finished processing        |
      | Total Entities Modified: 1 |
    And I click on "Reset" Button
    And I click on list inactive radio

    And I click "<Entity Name>" link in the non-frame grid "<Grid ID>" having the following header and cell values
      | name | value    |
      | Type | Facility |

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Assignee Task A" task
#    And I set following spin button fields values on editable page
#      | name           | value |
#      | ActualDuration | 2     |
#    And I click "Ok" button
#
#    And I open new task information pop up of "Assignee Task A" task
    And I verify the following fields value on editable page
      | name           | value  |
      | ActualDuration | 5 days |

#    And I click on "Successors" tab
#    And I click "Add new" button
#    And I enter task name "Assignee Task B"
#    And I click "Ok" button

    And I add the following task on "Successors" tab to the "Assignee Task A" task
      | Assignee Task B              |


    And I verify "Changes cannot be made to inactive portfolio items." message in Inactive Schedule pop up

    Examples:
      | Login User   | Login full username  | Entity Name                   | Change to Inactive   | Grid ID      | Cancel   |
      | DeleteAccess | Delete Access Access | Inactive this Facility Entity | <Change to Inactive> | entitySelect | <Cancel> |