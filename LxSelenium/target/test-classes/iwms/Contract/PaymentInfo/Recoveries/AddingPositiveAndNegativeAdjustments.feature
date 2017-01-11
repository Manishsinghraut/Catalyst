Feature: Adding Positive and Negative Adjustments (Jira Ref : AUTOMATION-724)

  Scenario Outline: I import file for Recoveries_Adjustment Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
#      | RecoveriesContractAdjustment.xml |
      | RecoveriesContractAdjustment-724.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I Added Positive Adjustment
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I set following fields value on editable page
      | name                                     | value |
      | ExpenseRecovery_ReportedAdjustmentAmount | 50    |
      | ExpenseRecovery_ApprovedAdjustmentAmount | 50    |
    And I click on the "Save Changes" action panel button
    And I verify page title "<Grid title>" after navigation
    And I verify the following fields value on editable page
      | name                                     | value  |
      | ExpenseRecovery_ReportedAdjustmentAmount | $50.00 |
      | ExpenseRecovery_ApprovedAdjustmentAmount | $50.00 |
    And I verify the Revised Amount Due "$74,300.00" should be calculated according to "50" Adjustment Amount under reported
    And I verify the Revised Amount Due "$71,105.00" should be calculated according to "50" Adjustment Amount under approved
    And I switch to default frame

    Examples:
      | Entity Name                    | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries_Adjustment Contract | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |


  Scenario Outline: I Added Negative Adjustment
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I set following fields value on editable page
      | name                                     | value |
      | ExpenseRecovery_ReportedAdjustmentAmount | -50   |
      | ExpenseRecovery_ApprovedAdjustmentAmount | -50   |
    And I click on the "Save Changes" action panel button
    And I verify page title "<Grid title>" after navigation
    And I verify the following fields value on editable page
      | name                                     | value   |
      | ExpenseRecovery_ReportedAdjustmentAmount | -$50.00 |
      | ExpenseRecovery_ApprovedAdjustmentAmount | -$50.00 |
    And I verify the Revised Amount Due "$74,200.00" should be calculated according to "-50" Adjustment Amount under reported
    And I verify the Revised Amount Due "$71,005.00" should be calculated according to "-50" Adjustment Amount under approved
    And I switch to default frame

    Examples:
      | Entity Name                    | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries_Adjustment Contract | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |