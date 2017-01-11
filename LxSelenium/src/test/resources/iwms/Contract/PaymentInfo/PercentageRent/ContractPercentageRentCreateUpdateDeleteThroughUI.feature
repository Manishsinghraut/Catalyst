@all @smoke @smoke2
Feature: I create,update and delete contract Percentage Rent and verify them in Contract> Payment Info> Percentage Rent page

  Scenario Outline: I create contract Percentage Rent through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                    | value                     |
      | PercentageRent_CodeSalesGroupID         | Internal Sales            |
      | PercentageRent_Description              | Selenium Test Description |
      | PercentageRent_RentYearStartMonth       | January                   |
      | PercentageRent_BeginDate                | 05/15/2015                |
      | PercentageRent_EndDate                  | 05/31/2016                |
      | PercentageRent_CodeBillingFrequencyID   | Annually                  |
      | PercentageRent_PeriodPaymentDueDays     | 12                        |
      | PercentageRent_AnnualPaymentDueDays     | 12                        |
      | PercentageRent_CodeReportingFrequencyID | Annually                  |
      | PercentageRent_PeriodReportDueDays      | 12                        |
      | PercentageRent_AnnualReportDueDays      | 12                        |
      | PercentageRent_CodeExpenseGroupID       | Lease Expense             |
      | PercentageRent_CodeExpenseTypeID        | Percentage Rent           |
      | PercentageRent_CodeCurrencyTypeID       | USD                       |
      | PercentageRent_CodeCapFrequencyID       | Annually                  |
      | PercentageRent_FloorAmount              | 10                        |
      | PercentageRent_CodePercentageRentTypeID | Annual                    |

    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "<Grid ID>" having unique value "<Field>" under column header "Description"
      | name                | value                     |
      | Begin Date          | 05/15/2015                |
      | End Date            | 05/31/2016                |
      | Sales Group         | Internal Sales            |
      | Description         | Selenium Test Description |
      | Calculation Method  | Annual                    |
      | Payment Frequency   | Annually                  |
      | Reporting Frequency | Annually                  |
    And I logout

  Examples:
    | Field                     | Second Level Tab | Third Level Tab | Entity Name       | Grid title                    | Grid ID |
    | Selenium Test Description | Payment Info     | Percentage Rent | Selenium-Contract | Contract Percentage Rent List | thisDiv |

  Scenario Outline: I update contract Percentage Rent through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "3" from grid "id" "<Grid ID>"
    And I set following fields value on editable page
      | name                                | value                            |
      | PercentageRent_AnnualPaymentDueDays | 10                               |
      | PercentageRent_AnnualReportDueDays  | 10                               |
      | PercentageRent_FloorAmount          | 10                               |
      | PercentageRent_Description          | Update Selenium Test Description |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
#    And I click on the "Yes" button in message box
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                    | value  |
      | PercentageRent_CodePercentageRentTypeID | Annual |
      | PercentageRent_NaturalBreakpointFlag    | true   |
    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I set following fields value on editable page
      | name                                     | value |
      | PercentageRentBreakpoint_BreakpointRate1 | 10    |
    And I click on the "Add" button
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "3" from grid "id" "<Grid ID>"
    And I click "edit" link of the row "1" in grid "BOGridPercentageRentBreakpoint"
#    And I click "edit" link of the row "1" in grid "BOGridPercentageRentBreakpoint"
    Then I verify page title "<Grid title>" after navigation
    And I switch to default frame
    And I set following fields value on editable page
      | name                                           | value |
      | PercentageRentBreakpoint_NaturalBreakpointRate | 1000  |
    And I click on the "Update" button
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "3" from grid "id" "<Grid ID>"
    And I click "delete" link of the row "1" in grid "BOGridPercentageRentBreakpoint"
    And I click on the "Yes" button
    And I logout

  Examples:
    | Field                     | Second Level Tab | Third Level Tab | Entity Name       | Grid title                    | Grid ID |
    | Selenium Test Description | Payment Info     | Percentage Rent | Selenium-Contract | Contract Percentage Rent List | thisDiv |

  Scenario Outline: I Delete contract Percentage Rent through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "3" from grid "id" "<Grid ID>"
    And I switch to default frame
    #And I click on the "Delete item" action panel button
      And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I click on the "<Third Level Tab>" tab
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present

  Examples:
    | Field                            | Second Level Tab | Third Level Tab | Entity Name       | Grid title                    | Grid ID |
    | Update Selenium Test Description | Payment Info     | Percentage Rent | Selenium-Contract | Contract Percentage Rent List | thisDiv |
