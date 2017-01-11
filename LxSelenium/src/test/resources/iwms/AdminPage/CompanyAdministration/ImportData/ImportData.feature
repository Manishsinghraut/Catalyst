@all
Feature: purpose of the scenario is to import the data via admin import data page

  Scenario Outline: purpose of the scenario is to import the data via admin import data page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
    And I import following files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/":
      | Create_Covenant.xls |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |