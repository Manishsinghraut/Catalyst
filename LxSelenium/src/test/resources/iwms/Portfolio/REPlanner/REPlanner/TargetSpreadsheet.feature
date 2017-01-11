@all @smoke @smoke4
Feature:  (Jira Ref :AUTOMATION-417, AUTOMATION-1171) Target Spreadsheet

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: I create targets through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/REPlanner/REPlanner/"
    And I import following files:
      | Target_Portfolio-1171.xml |
      | TargetNew SS-1171.xlsx    |
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the following fields value on editable page
      | name           | value                  |
      | viewBy         | Region/Market          |
      | show           | Targets/Sites/Projects |
      | CodeSlotTypeID | <SELECT>               |
#      | startYear      | 2016                   |
#      | endYear        | 2016                   |
    And I set following fields value on editable page
      | name      | value        |
      | viewBy    | <View By>    |
      | startYear | <Start Year> |
      | endYear   | <End Year>   |
    And I click on "Refresh" Button
    Then I verify unique link text on non editable page "Create Target 1"
    Then I verify unique link text on non editable page "Create Target 2"
    Then I verify text value in a page
      | name   | value                      |
      | Region | Region: Frisco             |
      | Market | Market: Legacy Market Area |


    Examples:
      | Second Level Tab | Third Level Tab | Entity Name                | View By       | Start Year | End Year |
      | RE Planner       | RE Planner      | Target Portfolio-auto-1117 | Region/Market | 2015       | 2016     |


#@all @smoke @smoke4
#Feature:  (Jira Ref :AUTOMATION-417, AUTOMATION-1171) Target Spreadsheet
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: I create targets through spreadsheet import
#    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/REPlanner/REPlanner/"
#    And I import following file name:
#      | Create_Target.xls |
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "<Second Level Tab>" tab
#    And I click on the "<Third Level Tab>" tab
#    And I switch to visible frame
#    And I set following fields value on editable page
#      | name           | value         |
#      | viewBy         | <View By>     |
#      | startYear      | <Start Year>  |
#      | endYear        | <End Year>    |
#      | CodeSlotTypeID | <Target Type> |
#    And I click on "Refresh" Button
#    Then I verify unique link text on non editable page "<Target>"
#    Then I verify text value in a page
#      | name   | value                      |
#      | Region | Region: Central            |
#      | Market | Market: Legacy Market Area |
#
#
#  Examples:
#    | Second Level Tab | Third Level Tab | Entity Name       | Target          | View By       | Start Year | End Year | Target Type |
#    | RE Planner       | RE Planner      | Lucernex-Selenium | Imported Target | Region/Market | 2015       | 2015     | Franchise   |
