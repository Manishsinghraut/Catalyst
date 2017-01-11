@all
Feature: I verify the Percentage Rent Breakpoint Page (Jira Ref : AUTOMATION-637)

  Scenario Outline: I verify the Percentage Rent Breakpoint Page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
#      | PRCalculationMethods.xml |
#      | PR_Calculation_Methods.xml |
      | PercentageRentBreakpointPage-637.xml |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I verify row from grid "<Grid ID>" having unique value "02/01/2011" under column header "Period Begin Date"
      | name                 | value         |
      | Period Begin Date    | 02/01/2011    |
      | Period End Date      | 01/31/2012    |
      | Breakpoint Amount #1 | $500,000.00   |
      | Breakpoint Rate #1   | 5.00000%      |
      | Breakpoint Amount #2 | $750,000.00   |
      | Breakpoint Rate #2   | 4.00000%      |
      | Breakpoint Amount #3 | $1,000,000.00 |
      | Breakpoint Rate #3   | 3.00000%      |
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                         | Percentage Rent page | Grid ID                           |
#      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Breakpoint Schedule  | BOGridVirtualPercentageRentPeriod |
      | Contract | Payment Info     | Percentage Rent | Percentage Rent Breakpoint Page-637 | Breakpoint Schedule  | BOGridVirtualPercentageRentPeriod |
