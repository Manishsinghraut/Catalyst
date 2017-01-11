@all
Feature:(Jira Ref:AUTOMATION-1379) Test Decimal display for Foreign Currency on Custom list on Summary pages

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCompany/FinancialSettings/ForeignCurrenciesDecimalPlaceValueTesting/"
    And I import following file name:
      | Sprint 17-PortfolioAndLocation-1379.xml |
    And I import following file name:
      | PageLayouts-1379.xml |
      | PageLayouts-1379.xml |
    And I import following file and returns error message "Project Value of field ProjectEntityID [Testing 13626 Project Entity] is not an integer! as defined on row/line 5":
      | EntityWithoutIDs(3)-1379.xml |

    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JOD   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on "Summary" tab
    And I select "Currency Test Case" page layout from dropdown
    Then I verify the following values in frame grid "^customListGrid"
      | Currency A | Currency B | Currency Total |
      | $100.000   | $200.000   | $300.000       |


    Examples:
      | Login User   | Login full username  | Entity Name                  |
      | DeleteAccess | Delete Access Access | Testing 13626 Project Entity |