@all
Feature: Financial Section on Contract Details Page (Jira Ref. : AUTOMATION-563)

  Scenario Outline: New Sales Tax Fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | NewSalesTaxFieldsContract.xml |
      | NewSalesTaxFieldsReport.xml   |
    And I navigate to entity type "Locations" named "Lucernex-Project" through search option
    And I click on the "Summary" tab
    And I verify the "Primary Tax/Sales/GST/HST"
#    And I verify the "Primary Tax values is set to 10%"
    And I navigate to entity type "Contracts" named "<Entity Name>" through search option
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I verify the following fields value on editable page
      | name                                 | value |
      | _checkbox_ExpenseSetup_ApplyTax1Flag | true  |
    And I switch to default frame
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                       |
      | Report Name | New Sales Tax Fields Report |

    And I switch to "report" child window
    And I Select "contains" from "Name is" filter drop-down and enter "New Sales"
    And I click on Next button from run report filter
    And I close report window
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the Aggregate Total Amount "	$2,520,000.00" under summary tab financials section
    And I verify the Aggregate Base Rent Amount "$2,520,000.00" under summary tab financials section
    And I verify the Annual Total Amount "$120,000.00" under summary tab financials section
    And I verify the Annual Base Amount "$120,000.00" under summary tab financials section
    And I switch to main window
    Examples:
      | Entity Name                   | Second Level Tab | Third Level Tab    | Grid title                  |
      | New Sales Tax Fields Contract | Payment Info     | Recurring Expenses | Contract Expense Setup List |
