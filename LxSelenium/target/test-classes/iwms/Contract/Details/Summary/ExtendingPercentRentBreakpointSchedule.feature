@all
Feature: (Ref : Jira Ticket No : AUTOMATION-839) Extending Percent Rent Breakpoint schedule

  Scenario Outline: I create a contract by importing the following file
    Given I Login to IWMS using "<Login User>" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    Then I import following file name:
      | PR with BP.xml |
    And I Search for the "<ContractName>" that was created
    And Click on the name of the "<ContractName>" in the results pop-up
    Then I see "<ContractName>" name on the header
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name            | value |
      | Month to Month? | Yes   |
    And I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I verify a row from grid "thisDiv" having unique value "12/31/2020" under column header "End Date"
      | name                | value           |
      | Begin Date          | 01/01/2014      |
      | End Date            | 12/31/2020      |
      | Sales Group         | Sales           |
      | Description         | PR None         |
      | Calculation Method  | Annual Gross-up |
      | Payment Frequency   | Monthly         |
      | Reporting Frequency | None            |

    And I verify the following fields value on editable page
      | name                                   | value |
      | _checkbox_PercentageRent_IsPartialTerm | false |

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "12/31/2020" under column header "End Date"
      | name                  | value      |
      | Begin Date            | 01/01/2000 |
      | End Date              | 12/31/2020 |
      | Sales Group           | Sales      |
      | Portioned Sales Group |            |
      | Natural Rate          |            |
      | Breakpoint Amount #1  |            |
      | Breakpoint Rate #1    | 10.00000%  |
      | Breakpoint Amount #2  |            |
      | Breakpoint Rate #2    |            |
      | Breakpoint Amount #3  |            |
      | Breakpoint Rate #3    |            |
      | Notes                 |            |
      | Actions               | edit       |


    Examples:
      | Login User   | Login full username  | ContractName |
      | DeleteAccess | Delete Access Access | PR with BP   |


  Scenario Outline: When Partial Term on the PR Schedule is unchecked
    Given I Login to IWMS using "<Login User>" access credentials
    And I Search for the "<ContractName>" that was created
    And Click on the name of the "<ContractName>" in the results pop-up
    Then I see "<ContractName>" name on the header
    And I navigate to "Details"
    And I click on the "Summary" tab
    When I click on the "Extend Contracts" action panel button
#    Then I see the "Extend Month-to-Month Contracts" modal window
    Then I see the "Extend Contracts" modal window

    And I set following fields value on editable page
      | name           | value            |
      | expirationDate | <expirationDate> |
      | dateToExtend   | <datetoextend>   |
    And I click on the "<Apply>" row action of column "<ContractName>" of column "0" from grid "entitySelect"
    And I click on "Extend Leases" Button
    # Feature improvement  IWMS-20632
#    And I click on "Extend Month to Month Leases" Button
    Then I verify success message appear in top left corner of page
      | Finished processing                                                                                                            |
      | Total Entities Modified: 1                                                                                                     |
      | Details:                                                                                                                       |
      | Extending Dates for '<ContractName>' contract from <expirationDate> to <datetoextend>                                          |
#      issue exist iwms - 20402
      | Created New Partial Term Percentage Rent Record with Start Date <Start Date> and End Date <datetoextend> - Sales Group (Sales) |
      | Updated Breakpoint End Date - Sales Group (Sales)                                                                              |
      | Updated Payment End Date for '<ContractName>' (PR-1) contract                                                                  |

    And I click on "Done" Button
    And I wait for the Loading text to disappear in grid

    Examples:
      | Apply   | Login User   | Login full username  | Item     | expirationDate | datetoextend | ContractName | Start Date |
      | <Apply> | DeleteAccess | Delete Access Access | Contract | 12/31/2020     | 01/31/2030   | PR with BP   | 01/01/2021 |

  Scenario Outline: When Partial Term on the PR Schedule is unchecked
    Given I Login to IWMS using "<Login User>" access credentials
    And I Search for the "<ContractName>" that was created
    And Click on the name of the "<ContractName>" in the results pop-up
    Then I see "<ContractName>" name on the header
    And I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I verify a row from grid "thisDiv" having unique value "12/31/2020" under column header "End Date"
      | name                | value           |
      | Begin Date          | 01/01/2014      |
      | End Date            | 12/31/2020      |
      | Sales Group         | Sales           |
      | Description         | PR None         |
      | Calculation Method  | Annual Gross-up |
      | Payment Frequency   | Monthly         |
      | Reporting Frequency | None            |

    And I verify a row from grid "thisDiv" having unique value "<datetoextend>" under column header "End Date"
      | name                | value           |
      | Begin Date          | 01/01/2021      |
      | End Date            | 01/31/2030      |
      | Sales Group         | Sales           |
      | Description         | PR None         |
      | Calculation Method  | Annual Gross-up |
      | Payment Frequency   | Monthly         |
      | Reporting Frequency | None            |

    And I verify the following fields value on editable page
      | name                                   | value |
      | _checkbox_PercentageRent_IsPartialTerm | true  |

    Then I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "<datetoextend>" under column header "End Date"
      | name                  | value      |
      | Begin Date            | 01/01/2000 |
      | End Date              | 01/31/2030 |
      | Sales Group           | Sales      |
      | Portioned Sales Group |            |
      | Natural Rate          |            |
      | Breakpoint Amount #1  |            |
      | Breakpoint Rate #1    | 10.00000%  |
      | Breakpoint Amount #2  |            |
      | Breakpoint Rate #2    |            |
      | Breakpoint Amount #3  |            |
      | Breakpoint Rate #3    |            |
      | Notes                 |            |
      | Actions               | edit       |


    Examples:
      | Login User   | Login full username  | datetoextend | ContractName |
      | DeleteAccess | Delete Access Access | 01/31/2030   | PR with BP   |