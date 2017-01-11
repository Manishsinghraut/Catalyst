@all @smoke @smoke1
Feature: (JIRA Ref: AUTOMATION-507) I create,update and delete contract Co-Tenancy and verify them in Contract> Abstract Info> Co-Tenancy page

  Scenario Outline: I create contract Co-Tenancy through UI
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
      | name                             | value              |
      #      | CoTenancy_CodeCoTenancyGroupID   |                    |
      #      | CoTenancy_CodeCoTenancyTypeID    |                    |
      | CoTenancy_RentAccount            | 1234567890         |
      | CoTenancy_BeginDate              | 05/15/2015         |
      | CoTenancy_EndDate                | 05/15/2016         |
      | CoTenancy_RemodelDate            | 05/15/2016         |
      | CoTenancy_CoTenancyName          | <Field>            |
      | CoTenancy_EffectiveDate          | 05/15/2015         |
      | CoTenancy_CoTenancyArea          | 2000               |
      | CoTenancy_CodeBuildingAreaUnitID | 2                  |
      | CoTenancy_OccupancyPercentage    | 20                 |
      | CoTenancy_Sales                  | 1000               |
      | CoTenancy_CodeCurrencyTypeID     | USD                |
      | CoTenancy_CoTenancyAmount        | 3000               |
      | CoTenancy_RentReductionAmount    | 2000               |
      | CoTenancy_RentReductionPercent   | 10                 |
      | CoTenancy_HasRightToTerminate    | true               |
      | CoTenancy_Notes                  | Selenium Test Note |
      | CoTenancy_CovenantID             | Lease:Notices      |
      | CoTenancy_Section                | Test Section       |
      | CoTenancy_AmendmentID            | 1234               |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    And I verify row from grid "<Grid ID>" having unique value "<Field>"
      | name                 | value      |
      | Group                |            |
      | Type                 |            |
      | Name                 | <Field>    |
      | Begin Date           | 05/15/2015 |
      | End Date             | 05/15/2016 |
      | Occupancy Percentage | 20         |
      | Effective Date       | 05/15/2015 |
    #      | Has Right To Terminate? | Yes        |
    And I logout

    Examples:
      | Field              | Second Level Tab | Third Level Tab | Entity Name       | Grid title               | Grid ID |
      | Selenium Test Name | Abstract Info    | Co-Tenancy      | Selenium-Contract | Contract Co-Tenancy List | thisDiv |

  Scenario Outline: I update contract Co-Tenancy through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "2" from grid "id" "<Grid ID>"
    And I set following fields value on editable page
      | name                      | value                     |
      | CoTenancy_CoTenancyAmount | 3500                      |
      | KeyDate_Notes             | Update Selenium Test Note |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I logout

    Examples:
      | Field              | Second Level Tab | Third Level Tab | Entity Name       | Grid title               | Grid ID |
      | Selenium Test Name | Abstract Info    | Co-Tenancy      | Selenium-Contract | Contract Co-Tenancy List | thisDiv |

  Scenario Outline: I Delete contract Co-Tenancy through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "Selenium Test Name" of column "2" from grid "id" "<Grid ID>"
    And I switch to default frame
    #And I click on the "Delete item" action panel button
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title               | Grid ID | Field              |
      | Abstract Info    | Co-Tenancy      | Selenium-Contract | Contract Co-Tenancy List | thisDiv | Selenium Test Name |
