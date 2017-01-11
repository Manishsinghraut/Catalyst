@all
Feature: Gantt view should load as collapsed. (Jira ref : AUTOMATION-886)

  Scenario Outline: I import file for apply schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | s007.xml                     |
      | NovemberScheduleTemplate.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to apply schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/01/2020 |
    And I click on the "Append Schedule Template" button
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I see the following tasks invisible in collapsed mode in grid "<Grid ID>":
      | Submit required forms |
      | Find contractor       |
      | Prepare proposal      |
      | Submit draft          |

    And I verify the following values in "<Grid ID>":
      | name      | value      |
      | Task Name | Get permit |

    And I verify the following values in "<Grid ID>":
      | name      | value              |
      | Task Name | Start construction |

    And I verify the following values in "<Grid ID>":
      | name      | value           |
      | Task Name | Submit proposal |


    Examples:
      | Template          | Login User   | Login full username  | Entity Name | Grid ID           |
      | November Schedule | DeleteAccess | Delete Access Access | s007        | ^Lx-ui-GanttPanel |
