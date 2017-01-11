@all
Feature: Adding Pro Rata Share info (Jira Ref : AUTOMATION-722)

  Scenario Outline: I import file for Recoveries Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
#      | RecoveriesContractWithProRate.xml |
#      | RecoveriesContractSetup.xml |
      | RecoveriesContractSetup-722.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Adding Pro Rata Share info
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "" under column header "Recovery Type"
    And I verify the following fields value on editable page
      | name                                     | value     |
      | ExpenseRecovery_ReportedGLA              | 15,000    |
      | ExpenseRecovery_ReportedRentableArea     | 5,000     |
      | ExpenseRecovery_ReportedProRataShareRate | 33.00000% |
      | ExpenseRecovery_ApprovedGLA              | 15,000    |
      | ExpenseRecovery_ApprovedRentableArea     | 5,000     |
      | ExpenseRecovery_ApprovedProRataShareRate | 33.00000% |
      | ExpenseRecovery_BudgetedGLA              | 15,000    |
      | ExpenseRecovery_BudgetedRentableArea     | 5,000     |
      | ExpenseRecovery_BudgetedProRataShareRate | 33.00000% |
    And I switch to default frame
    And I verify row from grid "thisDiv" having unique value "$74,250.00" under column header "Reported Amount"
      | name            | value      |
      | Recovery Group  | CAM        |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $74,250.00 |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $77,055.00 |
      | Pre-Paid Amount | $6,000.00  |
      | Amount Due      | $71,055.00 |

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-722 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |