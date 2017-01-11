@all
Feature: (Ref : Jira Ticket No :AUTOMATION-1195) Recoveries - Adding and updating with spreadsheet upload

  Scenario Outline: As a delete user I Import the attached xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following files:
      | Spreadsheet_Import__Contract-1195.xml |
      | CreateRecoveryItems-1195.xlsx         |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify recovery line items
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to second level tab "Payment Info" and third level "Recoveries" tab of entity "Contract"
    And I select "Contract Expense Recovery" page layout from dropdown
    And I verify page title "Contract Expense Recovery List" after navigation
    And I click on row from grid "thisDiv" having unique value "Lease" under column header "Recovery Group"
      | name            | value                        |
      | Recovery Type   | CAM                          |
      | Begin Date      | 01/01/2016                   |
      | End Date        | 12/31/2016                   |
      | Recovery Period | First                        |
      | Reported Amount | $0.00                        |
      | Percent Change  | 0.0000%                      |
      | Approved Amount | $8,300.00                    |
      | Pre-Paid Amount | $1,000.00                    |
      | Amount Due      | $7,300.00                    |
      | Comments        | This is to create recovery A |

    And I verify the following fields value on editable page
      | name                                          | value            |
      | wdd_ExpenseRecovery_CodeRecoveryGroupID       | Lease            |
      | wdd_ExpenseRecovery_CodeRecoveryTypeID        | CAM              |
      | ExpenseRecovery_BeginDate                     | 01/01/2016       |
      | ExpenseRecovery_EndDate                       | 12/31/2016       |
      | ExpenseRecovery_CodeApprovalStatusID          | Complete         |
      | _checkbox_ExpenseRecovery_ReconciledFlag      | false            |
      | ExpenseRecovery_CodeExpenseGroupID            | CAM              |
      | ExpenseRecovery_CodeExpenseTypeID             | CAM              |
      | ExpenseRecovery_CodePaymentFrequencyID        | [SELECT]         |
      | ExpenseRecovery_CodeReconciliationFrequencyID | [SELECT]         |

      | ExpenseRecovery_CodeCalculationMethodID       | Fixed Amount     |
      | ExpenseRecovery_CodeEscalationPaymentMethodID | Cash             |
      | ExpenseRecovery_CodeExpRecBasedOnID           | [SELECT]         |
      | ExpenseRecovery_RecoveryPeriodDaysNoZeroDef   |                  |
      | ExpenseRecovery_CodeProRataShareMethodID      | Gross Lease Area |
      | ExpenseRecovery_BaseYear                      | 2016             |
      | ExpenseRecovery_CodeBaseYearAmountTypeID      | [SELECT]         |
      | ExpenseRecovery_BaseYearAmount                | $1,000.00        |
      | ExpenseRecovery_RecoveryPeriod                | First            |
      | ExpenseRecovery_CodeCapTypeID                 | Pro rata share   |
      | ExpenseRecovery_RecoveryExclusions            |                  |
      | ExpenseRecovery_DateReceived                  | 12/26/2015       |
      | ExpenseRecovery_TenantDueDate                 | 01/01/2016       |
    And I verify the field "Occupancy Factor" is "100.00000%" in a same row in "Assumptions"
    And I verify the field "Number of Days In Period" is "366" in "Assumptions"

    And I verify the following recovery fields value on editable page
      | name                                                  | value |
      | vis_ExpenseRecovery_ReportedControllableExpensesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedControllableExpensesGross | $0.00 |
      | RAVarianceControllableExpensesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedControllableExpensesGross | $0.00 |
      | ABVarianceControllableExpensesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                     | value      |
      | RAVarianceCapAmountGross | -$1,000.00 |
      | ABVarianceCapAmountGross | -$1,000.00 |
    And I verify the following fields value on editable page
      | name                                       | value     |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef | $1,000.00 |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | $2,000.00 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | $3,000.00 |
    And I verify the following recovery fields value on editable page
      | name                                                     | value |
      | vis_ExpenseRecovery_ReportedNonControllableExpensesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedNonControllableExpensesGross | $0.00 |
      | RAVarianceNonControllableExpensesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedNonControllableExpensesGross | $0.00 |
      | ABVarianceNonControllableExpensesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                        | value |
      | vis_ExpenseRecovery_ReportedDeductionsGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedDeductionsGross | $0.00 |
      | RAVarianceDeductionsGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedDeductionsGross | $0.00 |
      | ABVarianceDeductionsGross                   | $0.00 |
    #IWMS-21785
    And I verify the following recovery fields value on editable page
      | name                                 | value |
      | PriorReportedSubTotal1GrossNoZeroDef | $0.00 |
      | PriorApprovedSubTotal1GrossNoZeroDef | $0.00 |
      | PriorBudgetedSubTotal1GrossNoZeroDef | $0.00 |
      | ReportedSubTotal1Gross               | $0.00 |
      | ApprovedSubTotal1Gross               | $0.00 |
      | RAVarianceSubTotal1Gross             | $0.00 |
      | BudgetedSubTotal1Gross               | $0.00 |
      | ABVarianceSubTotal1Gross             | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                              | value      |
      | RAVarianceAdminFeePercentageGross | -5.00000%  |
      | ABVarianceAdminFeePercentageGross | -10.00000% |
    And I verify the following fields value on editable page
      | name                                       | value     |
      | ExpenseRecovery_ReportedAdminFeePercentage | 5.00000%  |
      | ExpenseRecovery_ApprovedAdminFeePercentage | 10.00000% |
      | ExpenseRecovery_BudgetedAdminFeePercentage | 20.00000% |
    And I verify the following recovery fields value on editable page
      | name                                                | value |
      | PriorReportedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | PriorApprovedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | PriorBudgetedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | ReportedAdminFeePercentageAmountGross               | $0.00 |
      | ApprovedAdminFeePercentageAmountGross               | $0.00 |
      | RAVarianceAdminFeePercentageAmountGross             | $0.00 |
      | BudgetedAdminFeePercentageAmountGross               | $0.00 |
      | ABVarianceAdminFeePercentageAmountGross             | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                                | value |
      | vis_ExpenseRecovery_ReportedAdministrationFeesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedAdministrationFeesGross | $0.00 |
      | RAVarianceAdministrationFeesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedAdministrationFeesGross | $0.00 |
      | ABVarianceAdministrationFeesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                       | value     |
      | vis_ExpenseRecovery_ReportedAdditionsGross | $6,000.00 |
      | vis_ExpenseRecovery_ApprovedAdditionsGross | $6,100.00 |
      | RAVarianceAdditionsGross                   | -$100.00  |
      | vis_ExpenseRecovery_BudgetedAdditionsGross | $6,500.00 |
      | ABVarianceAdditionsGross                   | -$400.00  |
    And I verify the following recovery fields value on editable page
      | name                                   | value     |
      | PriorReportedPassThroughGrossNoZeroDef | $0.00     |
      | PriorApprovedPassThroughGrossNoZeroDef | $0.00     |
      | PriorBudgetedPassThroughGrossNoZeroDef | $0.00     |
      | ReportedPassThroughGross               | $6,000.00 |
      | ApprovedPassThroughGross               | $6,100.00 |
      | RAVariancePassThroughGross             | -$100.00  |
      | BudgetedPassThroughGross               | $6,500.00 |
      | ABVariancePassThroughGross             | -$400.00  |
    And I verify the following recovery fields value on editable page
      | name                                        | value |
      | vis_ExpenseRecovery_ReportedRecoveriesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedRecoveriesGross | $0.00 |
      | RAVarianceRecoveriesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedRecoveriesGross | $0.00 |
      | ABVarianceRecoveriesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                 | value     |
      | PriorReportedSubTotal2GrossNoZeroDef | $0.00     |
      | PriorApprovedSubTotal2GrossNoZeroDef | $0.00     |
      | PriorBudgetedSubTotal2GrossNoZeroDef | $0.00     |
      | ReportedSubTotal2Gross               | $6,000.00 |
      | ApprovedSubTotal2Gross               | $6,100.00 |
      | RAVarianceSubTotal2Gross             | -$100.00  |
      | BudgetedSubTotal2Gross               | $6,500.00 |
      | ABVarianceSubTotal2Gross             | -$400.00  |
    And I verify the following fields value on editable page
      | name                                     | value      |
      | ExpenseRecovery_ReportedGLA              |            |
      | ExpenseRecovery_ApprovedGLA              | 3,000      |
      | ExpenseRecovery_BudgetedGLA              |            |
      | ExpenseRecovery_ReportedRentableArea     |            |
      | ExpenseRecovery_ApprovedRentableArea     | 1,000      |
      | ExpenseRecovery_BudgetedRentableArea     |            |
      | ExpenseRecovery_ReportedProRataShareRate |            |
      | ExpenseRecovery_ApprovedProRataShareRate | 100.00000% |
      | ExpenseRecovery_BudgetedProRataShareRate |            |
    And I verify the following recovery fields value on editable page
      | name                            | value       |
      | RAVarianceGLAGross              | -3,000      |
      | ABVarianceGLAGross              | 3,000       |
      | RAVarianceRentableAreaGross     | -1,000      |
      | ABVarianceRentableAreaGross     | 1,000       |
      | RAVarianceProRataShareRateGross | -100.00000% |
      | ABVarianceProRataShareRateGross | 100.00000%  |
    And I verify the following fields value on editable page
      | name                                 | value                        |
      | ExpenseRecovery_CurrentEscrowPayment |                              |
      | ExpenseRecovery_EscalationPercentage |                              |
      | ExpenseRecovery_NewEscalationPayment |                              |
      | ExpenseRecovery_CatchUpPaymentAmount |                              |
      | ExpenseRecovery_Notes                | This is to create recovery A |
      | ExpenseRecovery_CovenantID           | <SELECT>                     |
      | ExpenseRecovery_Section              |                              |
      | ExpenseRecovery_AmendmentID          | [SELECT]                     |
    And I verify the following recovery fields value on editable page
      | name                                      | value      |
      | PriorReportedNetPassThroughGrossNoZeroDef | $0.00      |
      | PriorApprovedNetPassThroughGrossNoZeroDef | $0.00      |
      | PriorBudgetedNetPassThroughGrossNoZeroDef | $0.00      |
      | ReportedNetPassThroughGross               | $0.00      |
      | ApprovedNetPassThroughGross               | $6,100.00  |
      | RAVarianceNetPassThroughGross             | -$6,100.00 |
      | BudgetedNetPassThroughGross               | $0.00      |
      | ABVarianceNetPassThroughGross             | $6,100.00  |
    And I verify the following fields value on editable page
      | name                                     | value     |
      | ExpenseRecovery_ReportedPrePaidAmount    |           |
      | ExpenseRecovery_ApprovedPrePaidAmount    | $1,000.00 |
      | ExpenseRecovery_BudgetedPrePaidAmount    |           |
      | ExpenseRecovery_ReportedAdjustmentAmount |           |
      | ExpenseRecovery_ApprovedAdjustmentAmount | $1,234.56 |
    And I verify the following recovery fields value on editable page
      | name                                    | value      |
      | RAVariancePrePaidAmountGross            | -$1,000.00 |
      | ABVariancePrePaidAmountGross            | $1,000.00  |
      | PriorReportedNetAmountDueGrossNoZeroDef | $0.00      |
      | PriorApprovedNetAmountDueGrossNoZeroDef | $0.00      |
      | PriorBudgetedNetAmountDueGrossNoZeroDef | $0.00      |
      | ReportedNetAmountDueGross               | $0.00      |
      | ApprovedNetAmountDueGross               | $5,100.00  |
      | RAVarianceNetAmountDueGross             | -$5,100.00 |
      | BudgetedNetAmountDueGross               | $0.00      |
      | ABVarianceNetAmountDueGross             | $5,100.00  |
      | ReportedRevisedNetAmountDueGross        | $0.00      |
      | ApprovedRevisedNetAmountDueGross        | $6,334.56  |

    And I click on row from grid "thisDiv" having unique value "Expense" under column header "Recovery Group"
      | name            | value                        |
      | Recovery Type   | Interior                     |
      | Begin Date      | 12/31/2015                   |
      | End Date        | 12/31/2016                   |
      | Recovery Period | Second                       |
      | Reported Amount | $0.00                        |
      | Percent Change  | 0.0000%                      |
      | Approved Amount | $2,050.00                    |
      | Pre-Paid Amount | $500.00                      |
      | Amount Due      | $1,550.00                    |
      | Comments        | This is to create recovery B |

    And I verify the following fields value on editable page
      | name                                          | value            |
      | wdd_ExpenseRecovery_CodeRecoveryGroupID       | Expense          |
      | wdd_ExpenseRecovery_CodeRecoveryTypeID        | Interior         |
      | ExpenseRecovery_BeginDate                     | 12/31/2015       |
      | ExpenseRecovery_EndDate                       | 12/31/2016       |
      | ExpenseRecovery_CodeApprovalStatusID          | Review           |
      | _checkbox_ExpenseRecovery_ReconciledFlag      | false            |
      | ExpenseRecovery_CodeExpenseGroupID            | Base Rent        |
      | ExpenseRecovery_CodeExpenseTypeID             | Base Rent        |
      | ExpenseRecovery_CodePaymentFrequencyID        | [SELECT]         |
      | ExpenseRecovery_CodeReconciliationFrequencyID | [SELECT]         |

      | ExpenseRecovery_CodeCalculationMethodID       | Passthrough      |
      | ExpenseRecovery_CodeEscalationPaymentMethodID | Check            |
      | ExpenseRecovery_CodeExpRecBasedOnID           | [SELECT]         |
      | ExpenseRecovery_RecoveryPeriodDaysNoZeroDef   |                  |
      | ExpenseRecovery_CodeProRataShareMethodID      | Gross Lease Area |
      | ExpenseRecovery_BaseYear                      | 2016             |
      | ExpenseRecovery_CodeBaseYearAmountTypeID      | [SELECT]         |
      | ExpenseRecovery_BaseYearAmount                | $500.00          |
      | ExpenseRecovery_RecoveryPeriod                | Second           |
      | ExpenseRecovery_CodeCapTypeID                 | Pro rata share   |
      | ExpenseRecovery_RecoveryExclusions            |                  |
      | ExpenseRecovery_DateReceived                  | 12/20/2015       |
      | ExpenseRecovery_TenantDueDate                 | 12/31/2015       |

    And I verify the field "Occupancy Factor" is "100.00000%" in a same row in "Assumptions"
    And I verify the field "Number of Days In Period" is "367" in "Assumptions"
    And I verify the following recovery fields value on editable page
      | name                                                  | value |
      | vis_ExpenseRecovery_ReportedControllableExpensesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedControllableExpensesGross | $0.00 |
      | RAVarianceControllableExpensesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedControllableExpensesGross | $0.00 |
      | ABVarianceControllableExpensesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                     | value    |
      | RAVarianceCapAmountGross |          |
      | ABVarianceCapAmountGross | -$500.00 |
    And I verify the following fields value on editable page
      | name                                       | value     |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef |           |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | $1,000.00 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | $1,500.00 |
    And I verify the following recovery fields value on editable page
      | name                                                     | value |
      | vis_ExpenseRecovery_ReportedNonControllableExpensesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedNonControllableExpensesGross | $0.00 |
      | RAVarianceNonControllableExpensesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedNonControllableExpensesGross | $0.00 |
      | ABVarianceNonControllableExpensesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                        | value |
      | vis_ExpenseRecovery_ReportedDeductionsGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedDeductionsGross | $0.00 |
      | RAVarianceDeductionsGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedDeductionsGross | $0.00 |
      | ABVarianceDeductionsGross                   | $0.00 |
    #IWMS-21785
    And I verify the following recovery fields value on editable page
      | name                                 | value |
      | PriorReportedSubTotal1GrossNoZeroDef | $0.00 |
      | PriorApprovedSubTotal1GrossNoZeroDef | $0.00 |
      | PriorBudgetedSubTotal1GrossNoZeroDef | $0.00 |
      | ReportedSubTotal1Gross               | $0.00 |
      | ApprovedSubTotal1Gross               | $0.00 |
      | RAVarianceSubTotal1Gross             | $0.00 |
      | BudgetedSubTotal1Gross               | $0.00 |
      | ABVarianceSubTotal1Gross             | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                              | value     |
      | RAVarianceAdminFeePercentageGross | -5.00000% |
      | ABVarianceAdminFeePercentageGross | -5.00000% |
    And I verify the following fields value on editable page
      | name                                       | value     |
#      | ExpenseRecovery_ReportedAdminFeePercentage | 0         |
      | ExpenseRecovery_ReportedAdminFeePercentage |           |
      | ExpenseRecovery_ApprovedAdminFeePercentage | 5.00000%  |
      | ExpenseRecovery_BudgetedAdminFeePercentage | 10.00000% |
    And I verify the following recovery fields value on editable page
      | name                                                | value |
      | PriorReportedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | PriorApprovedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | PriorBudgetedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | ReportedAdminFeePercentageAmountGross               | $0.00 |
      | ApprovedAdminFeePercentageAmountGross               | $0.00 |
      | RAVarianceAdminFeePercentageAmountGross             | $0.00 |
      | BudgetedAdminFeePercentageAmountGross               | $0.00 |
      | ABVarianceAdminFeePercentageAmountGross             | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                                | value |
      | vis_ExpenseRecovery_ReportedAdministrationFeesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedAdministrationFeesGross | $0.00 |
      | RAVarianceAdministrationFeesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedAdministrationFeesGross | $0.00 |
      | ABVarianceAdministrationFeesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                       | value     |
      | vis_ExpenseRecovery_ReportedAdditionsGross | $3,000.00 |
      | vis_ExpenseRecovery_ApprovedAdditionsGross | $3,050.00 |
      | RAVarianceAdditionsGross                   | -$50.00   |
      | vis_ExpenseRecovery_BudgetedAdditionsGross | $3,450.00 |
      | ABVarianceAdditionsGross                   | -$400.00  |
    And I verify the following recovery fields value on editable page
      | name                                   | value     |
      | PriorReportedPassThroughGrossNoZeroDef | $0.00     |
      | PriorApprovedPassThroughGrossNoZeroDef | $0.00     |
      | PriorBudgetedPassThroughGrossNoZeroDef | $0.00     |
      | ReportedPassThroughGross               | $3,000.00 |
      | ApprovedPassThroughGross               | $3,050.00 |
      | RAVariancePassThroughGross             | -$50.00   |
      | BudgetedPassThroughGross               | $3,450.00 |
      | ABVariancePassThroughGross             | -$400.00  |
    And I verify the following recovery fields value on editable page
      | name                                        | value |
      | vis_ExpenseRecovery_ReportedRecoveriesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedRecoveriesGross | $0.00 |
      | RAVarianceRecoveriesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedRecoveriesGross | $0.00 |
      | ABVarianceRecoveriesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                 | value     |
      | PriorReportedSubTotal2GrossNoZeroDef | $0.00     |
      | PriorApprovedSubTotal2GrossNoZeroDef | $0.00     |
      | PriorBudgetedSubTotal2GrossNoZeroDef | $0.00     |
      | ReportedSubTotal2Gross               | $3,000.00 |
      | ApprovedSubTotal2Gross               | $3,050.00 |
      | RAVarianceSubTotal2Gross             | -$50.00   |
      | BudgetedSubTotal2Gross               | $3,450.00 |
      | ABVarianceSubTotal2Gross             | -$400.00  |
    And I verify the following fields value on editable page
      | name                                     | value     |
      | ExpenseRecovery_ReportedGLA              |           |
      | ExpenseRecovery_ApprovedGLA              | 1,500     |
      | ExpenseRecovery_BudgetedGLA              |           |
      | ExpenseRecovery_ReportedRentableArea     |           |
      | ExpenseRecovery_ApprovedRentableArea     | 500       |
      | ExpenseRecovery_BudgetedRentableArea     |           |
      | ExpenseRecovery_ReportedProRataShareRate |           |
      | ExpenseRecovery_ApprovedProRataShareRate | 50.00000% |
      | ExpenseRecovery_BudgetedProRataShareRate |           |
    And I verify the following recovery fields value on editable page
      | name                            | value      |
      | RAVarianceGLAGross              | -1,500     |
      | ABVarianceGLAGross              | 1,500      |
      | RAVarianceRentableAreaGross     | -500       |
      | ABVarianceRentableAreaGross     | 500        |
      | RAVarianceProRataShareRateGross | -50.00000% |
      | ABVarianceProRataShareRateGross | 50.00000%  |
    And I verify the following fields value on editable page
      | name                                 | value                        |
      | ExpenseRecovery_CurrentEscrowPayment |                              |
      | ExpenseRecovery_EscalationPercentage |                              |
      | ExpenseRecovery_NewEscalationPayment |                              |
      | ExpenseRecovery_CatchUpPaymentAmount |                              |
      | ExpenseRecovery_Notes                | This is to create recovery B |
      | ExpenseRecovery_CovenantID           | <SELECT>                     |
      | ExpenseRecovery_Section              |                              |
      | ExpenseRecovery_AmendmentID          | [SELECT]                     |
    And I verify the following recovery fields value on editable page
      | name                                      | value      |
      | PriorReportedNetPassThroughGrossNoZeroDef | $0.00      |
      | PriorApprovedNetPassThroughGrossNoZeroDef | $0.00      |
      | PriorBudgetedNetPassThroughGrossNoZeroDef | $0.00      |
      | ReportedNetPassThroughGross               | $0.00      |
      | ApprovedNetPassThroughGross               | $1,525.00  |
      | RAVarianceNetPassThroughGross             | -$1,525.00 |
      | BudgetedNetPassThroughGross               | $0.00      |
      | ABVarianceNetPassThroughGross             | $1,525.00  |
    And I verify the following fields value on editable page
      | name                                     | value   |
      | ExpenseRecovery_ReportedPrePaidAmount    |         |
      | ExpenseRecovery_ApprovedPrePaidAmount    | $500.00 |
      | ExpenseRecovery_BudgetedPrePaidAmount    |         |
      | ExpenseRecovery_ReportedAdjustmentAmount |         |
      | ExpenseRecovery_ApprovedAdjustmentAmount | $600.00 |
    And I verify the following recovery fields value on editable page
      | name                                    | value      |
      | RAVariancePrePaidAmountGross            | -$500.00   |
      | ABVariancePrePaidAmountGross            | $500.00    |
      | PriorReportedNetAmountDueGrossNoZeroDef | $0.00      |
      | PriorApprovedNetAmountDueGrossNoZeroDef | $0.00      |
      | PriorBudgetedNetAmountDueGrossNoZeroDef | $0.00      |
      | ReportedNetAmountDueGross               | $0.00      |
      | ApprovedNetAmountDueGross               | $1,025.00  |
      | RAVarianceNetAmountDueGross             | -$1,025.00 |
      | BudgetedNetAmountDueGross               | $0.00      |
      | ABVarianceNetAmountDueGross             | $1,025.00  |
      | ReportedRevisedNetAmountDueGross        | $0.00      |
      | ApprovedRevisedNetAmountDueGross        | $1,625.00  |

    And I click on row from grid "thisDiv" having unique value "Lease" under column header "Recovery Group"
      | name            | value                        |
      | Recovery Type   | CAM                          |
      | Begin Date      | 01/01/2016                   |
      | End Date        | 12/31/2016                   |
      | Recovery Period | First                        |
      | Reported Amount | $0.00                        |
      | Percent Change  | 0.0000%                      |
      | Approved Amount | $8,300.00                    |
      | Pre-Paid Amount | $1,000.00                    |
      | Amount Due      | $7,300.00                    |
      | Comments        | This is to create recovery A |
    And I click on Recoveries Addition Reported link in Contract Expense Recovery page
    And I wait for "Expense Recovery Item List : Additions" modal window to open in non frame page
    And I verify the following values in non frame grid "BOGridExpenseRecoveryItem"
      | Recovery Item Group | Recovery Item Type | Status   | Prior Reported Amount | Reported Amount | Variance Percent | Prior Approved Amount | Computed Cap | Approved Amount | Computed Admin Fee | Computed Total Amount | Variance Percent | Prior Budgeted Amount | Budgeted Amount | Notes                    |
      | Grouped Expenses    | Other Expenses     | Approved |                       | $6,000.00       | 0.00000%         |                       | $0.00        | $6,000.00       | $100.00            | $6,100.00             | 0.00000%         |                       | $6,500.00       | Creating Recovery Item A |
    And I click on the "Finish" button

    And I click on row from grid "thisDiv" having unique value "Expense" under column header "Recovery Group"
      | name            | value                        |
      | Recovery Type   | Interior                     |
      | Begin Date      | 12/31/2015                   |
      | End Date        | 12/31/2016                   |
      | Recovery Period | Second                       |
      | Reported Amount | $0.00                        |
      | Percent Change  | 0.0000%                      |
      | Approved Amount | $2,050.00                    |
      | Pre-Paid Amount | $500.00                      |
      | Amount Due      | $1,550.00                    |
      | Comments        | This is to create recovery B |
    And I click on Recoveries Addition Reported link in Contract Expense Recovery page
    And I wait for "Expense Recovery Item List : Additions" modal window to open in non frame page
    And I verify the following values in non frame grid "BOGridExpenseRecoveryItem"
      | Recovery Item Group | Recovery Item Type | Status | Prior Reported Amount | Reported Amount | Variance Percent | Prior Approved Amount | Computed Cap | Approved Amount | Computed Admin Fee | Computed Total Amount | Variance Percent | Prior Budgeted Amount | Budgeted Amount | Notes                    |
      | CAM                 | Other Expenses     | Review |                       | $3,000.00       | 0.00000%         |                       | $0.00        | $3,000.00       | $50.00             | $3,050.00             | 0.00000%         |                       | $3,450.00       | Creating Recovery Item B |


    Examples:
      | Login User   | Login full username  | Entity Name                               |
      | DeleteAccess | Delete Access Access | Spreadsheet Import-Contract-Testing-15278 |

  Scenario Outline: As a delete user I update recovery line items
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following files:
      | UpdateRecoveryItems-1195.xlsx |

    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to second level tab "Payment Info" and third level "Recoveries" tab of entity "Contract"
    And I select "Contract Expense Recovery" page layout from dropdown
    And I verify page title "Contract Expense Recovery List" after navigation
    And I click on row from grid "thisDiv" having unique value "New Lease" under column header "Recovery Group"
      | name            | value                        |
      | Recovery Type   | Lease Type                   |
      | Begin Date      | 01/01/2016                   |
      | End Date        | 12/31/2016                   |
      | Recovery Period | First                        |
      | Reported Amount | $0.00                        |
      | Percent Change  | 0.0000%                      |
      | Approved Amount | $3,940.00                    |
      | Pre-Paid Amount | $500.00                      |
      | Amount Due      | $3,440.00                    |
      | Comments        | This is to update recovery A |

    And I verify the following fields value on editable page
      | name                                          | value             |
      | wdd_ExpenseRecovery_CodeRecoveryGroupID       | New Lease         |
      | wdd_ExpenseRecovery_CodeRecoveryTypeID        | Lease Type        |
      | ExpenseRecovery_BeginDate                     | 01/01/2016        |
      | ExpenseRecovery_EndDate                       | 12/31/2016        |
      | ExpenseRecovery_CodeApprovalStatusID          | In progress       |
      | _checkbox_ExpenseRecovery_ReconciledFlag      | false             |
      | ExpenseRecovery_CodeExpenseGroupID            | CAM               |
      | ExpenseRecovery_CodeExpenseTypeID             | Interior          |
      | ExpenseRecovery_CodePaymentFrequencyID        | [SELECT]          |
      | ExpenseRecovery_CodeReconciliationFrequencyID | [SELECT]          |

      | ExpenseRecovery_CodeCalculationMethodID       | CPI               |
      | ExpenseRecovery_CodeEscalationPaymentMethodID | Cash              |
      | ExpenseRecovery_CodeExpRecBasedOnID           | [SELECT]          |
      | ExpenseRecovery_RecoveryPeriodDaysNoZeroDef   |                   |
      | ExpenseRecovery_CodeProRataShareMethodID      | Square feet usage |
      | ExpenseRecovery_BaseYear                      | 2016              |
      | ExpenseRecovery_CodeBaseYearAmountTypeID      | [SELECT]          |
      | ExpenseRecovery_BaseYearAmount                | $750.00           |
      | ExpenseRecovery_RecoveryPeriod                | First             |
      | ExpenseRecovery_CodeCapTypeID                 | Pro rata share    |
      | ExpenseRecovery_RecoveryExclusions            |                   |
      | ExpenseRecovery_DateReceived                  | 12/26/2015        |
      | ExpenseRecovery_TenantDueDate                 | 01/01/2016        |
    And I verify the field "Occupancy Factor" is "100.00000%" in a same row in "Assumptions"
    And I verify the field "Number of Days In Period" is "366" in "Assumptions"

    And I verify the following recovery fields value on editable page
      | name                                                  | value |
      | vis_ExpenseRecovery_ReportedControllableExpensesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedControllableExpensesGross | $0.00 |
      | RAVarianceControllableExpensesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedControllableExpensesGross | $0.00 |
      | ABVarianceControllableExpensesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                     | value      |
      | RAVarianceCapAmountGross | -$3,250.00 |
      | ABVarianceCapAmountGross | $0.00      |
    And I verify the following fields value on editable page
      | name                                       | value     |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef | $750.00   |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | $4,000.00 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | $4,000.00 |
    And I verify the following recovery fields value on editable page
      | name                                                     | value |
      | vis_ExpenseRecovery_ReportedNonControllableExpensesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedNonControllableExpensesGross | $0.00 |
      | RAVarianceNonControllableExpensesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedNonControllableExpensesGross | $0.00 |
      | ABVarianceNonControllableExpensesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                        | value |
      | vis_ExpenseRecovery_ReportedDeductionsGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedDeductionsGross | $0.00 |
      | RAVarianceDeductionsGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedDeductionsGross | $0.00 |
      | ABVarianceDeductionsGross                   | $0.00 |
#    IWMS-21785
    And I verify the following recovery fields value on editable page
      | name                                 | value |
      | PriorReportedSubTotal1GrossNoZeroDef | $0.00 |
      | PriorApprovedSubTotal1GrossNoZeroDef | $0.00 |
      | PriorBudgetedSubTotal1GrossNoZeroDef | $0.00 |
      | ReportedSubTotal1Gross               | $0.00 |
      | ApprovedSubTotal1Gross               | $0.00 |
      | RAVarianceSubTotal1Gross             | $0.00 |
      | BudgetedSubTotal1Gross               | $0.00 |
      | ABVarianceSubTotal1Gross             | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                              | value      |
      | RAVarianceAdminFeePercentageGross | -10.00000% |
      | ABVarianceAdminFeePercentageGross | -10.00000% |
    And I verify the following fields value on editable page
      | name                                       | value     |
      | ExpenseRecovery_ReportedAdminFeePercentage | 10.00000% |
      | ExpenseRecovery_ApprovedAdminFeePercentage | 20.00000% |
      | ExpenseRecovery_BudgetedAdminFeePercentage | 30.00000% |
    And I verify the following recovery fields value on editable page
      | name                                                | value |
      | PriorReportedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | PriorApprovedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | PriorBudgetedAdminFeePercentageAmountGrossNoZeroDef | $0.00 |
      | ReportedAdminFeePercentageAmountGross               | $0.00 |
      | ApprovedAdminFeePercentageAmountGross               | $0.00 |
      | RAVarianceAdminFeePercentageAmountGross             | $0.00 |
      | BudgetedAdminFeePercentageAmountGross               | $0.00 |
      | ABVarianceAdminFeePercentageAmountGross             | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                                | value |
      | vis_ExpenseRecovery_ReportedAdministrationFeesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedAdministrationFeesGross | $0.00 |
      | RAVarianceAdministrationFeesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedAdministrationFeesGross | $0.00 |
      | ABVarianceAdministrationFeesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                       | value     |
      | vis_ExpenseRecovery_ReportedAdditionsGross | $3,000.00 |
      | vis_ExpenseRecovery_ApprovedAdditionsGross | $3,080.00 |
      | RAVarianceAdditionsGross                   | -$80.00   |
      | vis_ExpenseRecovery_BudgetedAdditionsGross | $3,250.00 |
      | ABVarianceAdditionsGross                   | -$170.00  |
    And I verify the following recovery fields value on editable page
      | name                                   | value     |
      | PriorReportedPassThroughGrossNoZeroDef | $0.00     |
      | PriorApprovedPassThroughGrossNoZeroDef | $0.00     |
      | PriorBudgetedPassThroughGrossNoZeroDef | $0.00     |
      | ReportedPassThroughGross               | $3,000.00 |
      | ApprovedPassThroughGross               | $3,080.00 |
      | RAVariancePassThroughGross             | -$80.00   |
      | BudgetedPassThroughGross               | $3,250.00 |
      | ABVariancePassThroughGross             | -$170.00  |
    And I verify the following recovery fields value on editable page
      | name                                        | value |
      | vis_ExpenseRecovery_ReportedRecoveriesGross | $0.00 |
      | vis_ExpenseRecovery_ApprovedRecoveriesGross | $0.00 |
      | RAVarianceRecoveriesGross                   | $0.00 |
      | vis_ExpenseRecovery_BudgetedRecoveriesGross | $0.00 |
      | ABVarianceRecoveriesGross                   | $0.00 |
    And I verify the following recovery fields value on editable page
      | name                                 | value     |
      | PriorReportedSubTotal2GrossNoZeroDef | $0.00     |
      | PriorApprovedSubTotal2GrossNoZeroDef | $0.00     |
      | PriorBudgetedSubTotal2GrossNoZeroDef | $0.00     |
      | ReportedSubTotal2Gross               | $3,000.00 |
      | ApprovedSubTotal2Gross               | $3,080.00 |
      | RAVarianceSubTotal2Gross             | -$80.00   |
      | BudgetedSubTotal2Gross               | $3,250.00 |
      | ABVarianceSubTotal2Gross             | -$170.00  |
    And I verify the following fields value on editable page
      | name                                     | value     |
      | ExpenseRecovery_ReportedGLA              |           |
      | ExpenseRecovery_ApprovedGLA              | 1,500     |
      | ExpenseRecovery_BudgetedGLA              |           |
      | ExpenseRecovery_ReportedRentableArea     |           |
      | ExpenseRecovery_ApprovedRentableArea     | 700       |
      | ExpenseRecovery_BudgetedRentableArea     |           |
      | ExpenseRecovery_ReportedProRataShareRate |           |
      | ExpenseRecovery_ApprovedProRataShareRate | 50.00000% |
      | ExpenseRecovery_BudgetedProRataShareRate |           |
    And I verify the following recovery fields value on editable page
      | name                            | value      |
      | RAVarianceGLAGross              | -1,500     |
      | ABVarianceGLAGross              | 1,500      |
      | RAVarianceRentableAreaGross     | -700       |
      | ABVarianceRentableAreaGross     | 700        |
      | RAVarianceProRataShareRateGross | -50.00000% |
      | ABVarianceProRataShareRateGross | 50.00000%  |
    And I verify the following fields value on editable page
      | name                                 | value                        |
      | ExpenseRecovery_CurrentEscrowPayment |                              |
      | ExpenseRecovery_EscalationPercentage |                              |
      | ExpenseRecovery_NewEscalationPayment |                              |
      | ExpenseRecovery_CatchUpPaymentAmount |                              |
      | ExpenseRecovery_Notes                | This is to update recovery A |
      | ExpenseRecovery_CovenantID           | <SELECT>                     |
      | ExpenseRecovery_Section              |                              |
      | ExpenseRecovery_AmendmentID          | [SELECT]                     |
    And I verify the following recovery fields value on editable page
      | name                                      | value      |
      | PriorReportedNetPassThroughGrossNoZeroDef | $0.00      |
      | PriorApprovedNetPassThroughGrossNoZeroDef | $0.00      |
      | PriorBudgetedNetPassThroughGrossNoZeroDef | $0.00      |
      | ReportedNetPassThroughGross               | $0.00      |
      | ApprovedNetPassThroughGross               | $1,540.00  |
      | RAVarianceNetPassThroughGross             | -$1,540.00 |
      | BudgetedNetPassThroughGross               | $0.00      |
      | ABVarianceNetPassThroughGross             | $1,540.00  |
    And I verify the following fields value on editable page
      | name                                     | value     |
      | ExpenseRecovery_ReportedPrePaidAmount    |           |
      | ExpenseRecovery_ApprovedPrePaidAmount    | $500.00   |
      | ExpenseRecovery_BudgetedPrePaidAmount    |           |
      | ExpenseRecovery_ReportedAdjustmentAmount |           |
      | ExpenseRecovery_ApprovedAdjustmentAmount | $1,000.00 |
    And I verify the following recovery fields value on editable page
      | name                                    | value      |
      | RAVariancePrePaidAmountGross            | -$500.00   |
      | ABVariancePrePaidAmountGross            | $500.00    |
      | PriorReportedNetAmountDueGrossNoZeroDef | $0.00      |
      | PriorApprovedNetAmountDueGrossNoZeroDef | $0.00      |
      | PriorBudgetedNetAmountDueGrossNoZeroDef | $0.00      |
      | ReportedNetAmountDueGross               | $0.00      |
      | ApprovedNetAmountDueGross               | $1,040.00  |
      | RAVarianceNetAmountDueGross             | -$1,040.00 |
      | BudgetedNetAmountDueGross               | $0.00      |
      | ABVarianceNetAmountDueGross             | $1,040.00  |
      | ReportedRevisedNetAmountDueGross        | $0.00      |
      | ApprovedRevisedNetAmountDueGross        | $2,040.00  |

    And I click on Recoveries Addition Reported link in Contract Expense Recovery page
    And I wait for "Expense Recovery Item List : Additions" modal window to open in non frame page
    And I verify the following values in non frame grid "BOGridExpenseRecoveryItem"
      | Recovery Item Group | Recovery Item Type | Status      | Prior Reported Amount | Reported Amount | Variance Percent | Prior Approved Amount | Computed Cap | Approved Amount | Computed Admin Fee | Computed Total Amount | Variance Percent | Prior Budgeted Amount | Budgeted Amount | Notes                    |
      | Grouped Expenses    | Other Expenses     | In progress |                       | $3,000.00       | 0.00000%         |                       | $0.00        | $3,000.00       | $80.00             | $3,080.00             | 0.00000%         |                       | $3,250.00       | Updating Recovery Item A |


    Examples:
      | Login User | Login full username | Entity Name                               |
      | EditAccess | Edit Access Access  | Spreadsheet Import-Contract-Testing-15278 |
