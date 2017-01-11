@all
Feature: Schedule Fields on Forms and Page Layouts (Ref : Jira Ticket No : AUTOMATION-893)

  Scenario Outline: I import files for generating test data
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | TaskAssigneeScheduleTemplate.xml      |
      | ScheduleFieldsonSummaryPage.xml       |
      | ScheduleFieldsonEntitySummaryPage.xml |
      | ScheduleFieldsOnForms.xml             |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user i verify
  1. Schedule is present for the entity
  2. Schedule task date on Summary page

#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name      | value          |
      | Task Name | Assignee Group |

    And I verify the following values in "<Grid ID>":
      | name      | value           |
      | Task Name | Assignee Task A |

    And I verify the following values in "<Grid ID>":
      | name      | value           |
      | Task Name | Assignee Task B |
    And I switch to visible frame
    And I click on the "Summary" tab
    And I select "Schedule Fileds on Summary Page" page layout from dropdown
    And I verify header and value pair on non editable summary page
      | name                                         | value      |
      | Assignee Task A - Forecast/Actual Start Date | 01/01/2020 |
      | Assignee Task A - Forecast/Actual End Date   | 01/02/2020 |
      | Assignee Task B - Baseline Start Date        | 01/02/2020 |
      | Assignee Task B - Baseline End Date          | 01/03/2020 |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                            | Grid ID           |
      | DeleteAccess | Delete Access Access | Schedule Fields on Entity Summary Page | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user I add a form to the entity and verify the same
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click on the "Add Form..." link
    And I wait for "" modal window to open in non frame page
    And I select "ScheduleTaskFields" from SelectFrom dropdown
    And I click "OK" button
    And I verify the following text in a page
      | Assignee Group - Forecast/Actual Start Date |
      | 01/01/2020                                  |
      | Assignee Group - Forecast/Actual Duration   |
      | 3                                           |
      | Assignee Task A - Baseline Start Date       |
      | 01/01/2020                                  |
      | Assignee Task A - Baseline Duration         |
      | 2                                           |
      | Assignee Task B - Is Task Group             |
      | No                                          |
      | Assignee Task B - Forecast/Actual End Date  |
      | 01/03/2020                                  |
    And I click "Add" button
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click " Expand All " button
    And I click on "<View>" link
    And I switch to default frame
    And I verify the following text in a page
      | Assignee Group - Forecast/Actual Start Date |
      | 01/01/2020                                  |
      | Assignee Group - Forecast/Actual Duration   |
      | 3                                           |
      | Assignee Task A - Baseline Start Date       |
      | 01/01/2020                                  |
      | Assignee Task A - Baseline Duration         |
      | 2                                           |
      | Assignee Task B - Is Task Group             |
      | No                                          |
      | Assignee Task B - Forecast/Actual End Date  |
      | 01/03/2020                                  |
    And I click "Close" button

    Examples:
      | Login User   | Login full username  | Entity Name                            |
      | DeleteAccess | Delete Access Access | Schedule Fields on Entity Summary Page |