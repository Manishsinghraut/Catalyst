@all
Feature: (Ref : Jira Ticket No : Automation-699) Create Single Sales Exclusion

  Scenario Outline: I import file for Create Single Sales Exclusion
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/"
    And I import following file name:
      | CreateSalesExclusion.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Create Single Sales Exclusion

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    And I click on row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name | value |
    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                     | value      |
      | SalesExclusion_BeginDate | 01/01/2000 |
      | SalesExclusion_EndDate   | 12/31/2020 |
      | SalesExclusion_CapAmount | 100        |

    And I set list fields values on editable page
      | name                              | value        |
      | SalesExclusion_CodeSalesGroupID   | Sales        |
      | SalesExclusion_CodeCurrencyTypeID | USD          |
      | SalesExclusion_CodeSalesTypeID    | Retail Sales |


    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Sales" under column header "Sales Group"
      | name        | value        |
      | Sales Type  | Retail Sales |
      | Begin Date  | 01/01/2000   |
      | End Date    | 12/31/2020   |
      | Cap Percent |              |
      | Cap Amount  | $100.00      |
      | Notes       |              |


    Examples:
      | Login User   | Login full username  | Item     | Entity Name            |
      | DeleteAccess | Delete Access Access | Contract | Create Sales Exclusion |