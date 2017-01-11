@all
Feature: As a Delete user I Append Schedule Template to entity (Ref : Jira Ticket No : Automation-602)

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | AppendMultipleScheduleTemplateOnEntity.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline:I Append Schedule Template to entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startStopWhenRadio     | start      |
      | startDate              | 12/25/2015 |
    And I click on the "Append Schedule Template" button
    And I verify the project schedule
      | name               | value      |
      | Project start date | 12/25      |

  Examples:
    | Login User   | Login full username  | Item   | Entity Name     | Third Level Tab | Template            |
    | DeleteAccess | Delete Access Access | Parcel | Lucernex-Parcel | Schedule        | Selenium Schedule A |