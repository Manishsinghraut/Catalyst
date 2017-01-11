@all
Feature: (Ref : Jira Ticket No : Automation-867, Automation-882 and Automation-868)
  1. Apply template in gantt and spreadsheet view
  2. Delete template in gantt and spreadsheet view
  3. Action panel button in gantt and spreadsheet view

  Scenario Outline: I import file for apply schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | ImportedLocation-868.xml             |
      | DeleteTemplateFacilityEntity-868.xml |
      | ScheduleTemplate-868.xml             |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I can able to apply schedule template

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | stopDate               | 12/31/2018 |
    And I click on the "Append Schedule Template" button
    And I expand Group on task name
    And I verify the following values in "<Grid ID>":
      | name      | value  |
      | Task Name | Task A |

    And I verify the following values in "<Grid ID>":
      | name      | value  |
      | Task Name | Task B |

    And I verify the following values in "<Grid ID>":
      | name      | value  |
      | Task Name | Task C |

    #(Ref : Jira Ticket No : Automation-882) //New added Import and export MSProject
    And I verify the following action panel buttons are in sequence
      | Save Changes      |
      | Spreadsheet       |
      | Printable View    |
      | Crash Schedule    |
      | Apply Template    |
      | Import MSProject  |
      | Export MSProject  |
      | Delete Schedule   |
      | Full Screen       |
      | Save to Documents |
      | Link              |

   #(Ref : Jira Ticket No : Automation-868)
    And I click on the "Delete Schedule" action panel button
    Then I see the "Confirm Delete" modal window
    And I click on the "Yes" button
    Then I wait for modal window to close
    And I switch to visible frame
    Then I see "No schedule information found" message in the header

    #2-Applying Schedule template on Spreadsheet view

#    And I click on the "Spread Sheet" action panel button
    And I click on the "Spreadsheet" action panel button
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | stopDate               | 12/31/2018 |
    And I click on the "Append Schedule Template" button
    And I expand Group on task name
    And I verify the following values in "<Grid ID>":
      | name      | value  |
      | Task Name | Task A |

    And I verify the following values in "<Grid ID>":
      | name      | value  |
      | Task Name | Task B |

    And I verify the following values in "<Grid ID>":
      | name      | value  |
      | Task Name | Task C |

    #(Ref : Jira Ticket No : Automation-882)
    And I verify the following action panel buttons are in sequence
      | Save Changes      |
      | Gantt             |
      | Printable View    |
      | Crash Schedule    |
      | Apply Template    |
      | Import MSProject  |
      | Export MSProject  |
      | Delete Schedule   |
      | Save to Documents |
      | Link              |

     #(Ref : Jira Ticket No : Automation-868)
    And I click on the "Delete Schedule" action panel button
    Then I see the "Confirm Delete" modal window
    And I click on the "Yes" button
    Then I wait for modal window to close
    And I switch to visible frame
    Then I see "No schedule information found" message in the header

  Examples:
    | Template              | Login User   | Login full username  | Entity Name                  | Grid ID           |
    | Schedule Template-868 | DeleteAccess | Delete Access Access | Delete Template Facility-868 | ^Lx-ui-GanttPanel |



#old

#@all
#Feature: (Ref : Jira Ticket No : Automation-867, Automation-882 and Automation-868)
#  1. Apply template in gantt and spreadsheet view
#  2. Delete template in gantt and spreadsheet view
#  3. Action panel button in gantt and spreadsheet view
#
#  Scenario Outline: I import file for apply schedule template script
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
#    And I import following file name:
#      | ApplyScheduleTemplateEntity.xml |
#      | ScheduleGroup(3).xml            |
#
#    Examples:
#      | Login User   | Login full username  |
#      | DeleteAccess | Delete Access Access |
#
#
#  Scenario Outline: As a delete user I can able to apply schedule template
#
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "Schedule" tab
#    And I click on the "Apply Template" action panel button
#    When I set following fields value on editable page
#      | name                   | value      |
#      | taskTemplateIDToAssign | <Template> |
#      | stopDate               | 12/31/2018 |
#    And I click on the "Append Schedule Template" button
#    And I expand Group on task name
#    And I verify the following values in "<Grid ID>":
#      | name      | value          |
#      | Task Name | ScheduleGroup1 |
#
#    And I verify the following values in "<Grid ID>":
#      | name      | value    |
#      | Task Name | Task 1.1 |
#
#    And I verify the following values in "<Grid ID>":
#      | name      | value    |
#      | Task Name | Task 1.2 |
#
#    #(Ref : Jira Ticket No : Automation-882)
#    And I verify the following action panel buttons are in sequence
#      | Save Changes      |
#      | Spread Sheet      |
#      | Printable View    |
#      | Crash Schedule    |
#      | Apply Template    |
#      | Delete Schedule   |
#      | Full Screen       |
#      | Save to Documents |
#      | Link              |
#
#   #(Ref : Jira Ticket No : Automation-868)
#    And I click on the "Delete Schedule" action panel button
#    Then I see the "Confirm Delete" modal window
#    And I click on the "Yes" button
#    Then I wait for modal window to close
#    And I switch to visible frame
#    Then I see "No schedule information found" message in the header
#
#    #2-Applying Schedule template on Spreadsheet view
#
#    And I click on the "Spread Sheet" action panel button
#    And I click on the "Apply Template" action panel button
#    When I set following fields value on editable page
#      | name                   | value      |
#      | taskTemplateIDToAssign | <Template> |
#      | stopDate               | 12/31/2018 |
#    And I click on the "Append Schedule Template" button
#    And I expand Group on task name
#    And I verify the following values in "<Grid ID>":
#      | name      | value          |
#      | Task Name | ScheduleGroup1 |
#
#    And I verify the following values in "<Grid ID>":
#      | name      | value    |
#      | Task Name | Task 1.1 |
#
#    And I verify the following values in "<Grid ID>":
#      | name      | value    |
#      | Task Name | Task 1.2 |
#
#    #(Ref : Jira Ticket No : Automation-882)
#    And I verify the following action panel buttons are in sequence
#      | Save Changes      |
#      | Gantt             |
#      | Printable View    |
#      | Crash Schedule    |
#      | Apply Template    |
#      | Delete Schedule   |
#      | Save to Documents |
#      | Link              |
#
#     #(Ref : Jira Ticket No : Automation-868)
#    And I click on the "Delete Schedule" action panel button
#    Then I see the "Confirm Delete" modal window
#    And I click on the "Yes" button
#    Then I wait for modal window to close
#    And I switch to visible frame
#    Then I see "No schedule information found" message in the header
#
#    Examples:
#      | Template      | Login User   | Login full username  | Entity Name                 | Grid ID           |
#      | ScheduleGroup | DeleteAccess | Delete Access Access | ApplyScheduleTemplateEntity | ^Lx-ui-GanttPanel |