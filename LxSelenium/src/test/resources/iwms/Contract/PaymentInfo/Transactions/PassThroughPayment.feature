@all
Feature: Verify Ability to create pass through payments

  Scenario: Import contract xml data file from import data folder with no error
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to import page
    When I used data files from "Data/ImportDataFiles/"
    And I import following file name:
      | 36 PassThroughPayments.xml                  |

  Scenario: Navigation to Contract/Payment Info/Transactions and navigate to "PassThroughPaymentMaster" contract
    Given I login to IWMS using LxAdmin credentials
    When I navigate to entity type "Contract" named "PassThroughPaymentMaster"
    Then I see that I am on the "Contract" entity tab
    When I navigate to "Contract, Payment Info"
    And I click on the "Transactions" tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Transactions"
#    Then I click on the "Pass-through Payments" action panel button
#
#
#  Scenario Outline: Validate that when I click on 'Pass-through Payment' button new popup window will open with
#  related contract records in the grid,select contract record by clicking on record checkbox and then click on 'Create Pass-through Payments' button
#
#  Then I verify in grid "GeneratePassThroughPaymentsDiv" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
#  Examples:
#    |rowNumber  |headerName                   |cellValue                         |
#    |1          |Contract Name                |PassThroughPaymentRelated1        |
#    |2          |Contract Name                |PassThroughPaymentRelated2        |
#    |3          |Contract Name                |PassThroughPaymentRelated3        |
#    |1          |Pro Rata Share Rate          |                                  |
#    |2          |Pro Rata Share Rate          |50.00000%                         |
#    |3          |Pro Rata Share Rate          |25.00000%                         |