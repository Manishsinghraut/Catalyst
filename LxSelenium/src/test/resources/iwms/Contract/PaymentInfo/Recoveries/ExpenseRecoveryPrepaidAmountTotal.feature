@contract @all
Feature: Test expense recovery prepaid amount total calculation
  1) Login with administrator access rights
  2) Navigate to Contract->PaymentInfo->Recoveries
  3) Click on magnifying glass to open popup
  4) Check All checkbox items
  5) Click Set Pre-paid Amount
  6) Verify that Prepaid Amount field on the form is set to Total value

  Scenario:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to "Contract, Payment Info, Recoveries"
    And I click on the PrepaidAmountTotal button
    And I check All Checkbox
    And I click on the "Set Pre-paid Amount" button
    Then I see Prepaid Amount Total updated