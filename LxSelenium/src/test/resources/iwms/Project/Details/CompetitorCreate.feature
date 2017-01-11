@all
Feature: I create and verify the Competitor records on project details page

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: I create/update allowances through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details"
    And I import following file name:
      | Competitor.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"

    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Project/Details/Competitor.xlsx"
    Then I verify in grid "BOGridCompetitor" in row "2" by reading data from spread sheet row "5"
      | name                   | value            |
      | Name                   | Competitor Name  |
      | Type                   | Competitor Type  |
      | Distance               | Distance         |
      | Anchor?                | Is Anchor Store? |
      | Last Year Annual Sales | Last Year Sales  |

  Examples:
    | Item    | Secondary Tab | Entity Name      |
    | Project | Details       | Lucernex-Project |
