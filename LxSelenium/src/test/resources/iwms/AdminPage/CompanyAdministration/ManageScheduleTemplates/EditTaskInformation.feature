@all
Feature: (Ref : Jira Ticket No : AUTOMATION-799) As an edit user I can able to edit schedule template task

  Scenario Outline: I import file for edit schedule template task
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | s007.xml                     |
      | NovemberScheduleTemplate.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to apply Schedule Template to entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startStopWhenRadio     | start      |
      | startDate              | 07/06/2020 |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I double click on "Submit required forms" task
    And I set following spin button fields values on editable page
      | name           | value |
      | ActualDuration | 2     |
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name          | value      |
      | ActualEndDate | 07/08/2020 |
    And I click "Ok" button
    And I click on the "Save Changes" action panel button


    Examples:
      | Login User   | Login full username  | Item     | Entity Name | Third Level Tab | Template          |
      | DeleteAccess | Delete Access Access | Location | s007        | Schedule        | November Schedule |