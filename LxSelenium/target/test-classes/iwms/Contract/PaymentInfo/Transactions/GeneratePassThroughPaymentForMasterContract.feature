@all
Feature: (Ref : Jira Ticket No : Automation-627), As a delete user I can able to Generating Passthrough Payment Transactions for master contract

  Scenario Outline: I import file for Generating Passthrough Payment Transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | Master_Transaction_Contract.xml |
      | Master_Transaction_Contract.xml |
      | Sub_Lease_A.xml                 |
      | Sub_Lease_A.xml                 |
      | Sub_Lease_B.xml                 |
      | Sub_Lease_B.xml                 |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify two related contracts i.e Sub Lease A and Sub Lease B
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I verify a row from grid "BOGridContract" having unique value "Sub Lease A" under column header "Name"
      | name  | value |
      | Group | Store |
    And I verify a row from grid "BOGridContract" having unique value "Sub Lease B" under column header "Name"
      | name  | value |
      | Group | Store |


    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 |
      | DeleteAccess | Delete Access Access | Contract | Master Transaction Contract |

  Scenario Outline: As a delete user I verify Master Contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I verify the summary fields value on non-editable contract summary tab
      | name            | value                       |
      | Master Contract | Master Transaction Contract |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease A |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease B |


  Scenario Outline: As a delete user I verify there is an line item for Recurring Expenses
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name         | value     |
      #| Type | Base Rent |
      | Expense Type | Base Rent |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab    |
      | DeleteAccess | Delete Access Access | Contract | Master Transaction Contract | Payment Info     | Recurring Expenses |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease A                 | Payment Info     | Recurring Expenses |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease B                 | Payment Info     | Recurring Expenses |

  Scenario Outline: As a delete user I can able to Generate a Pass- through payment from a contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "04/01/2015" under column header "Effective Date"
      | name  | value     |
      | Group | Rent      |
      | Type  | Base Rent |

    And I switch to default frame
    And I click on the "Pass-through Payments" action panel button
    Then I wait for modal window to open
    And I see the "Create Pass-through Payments" modal window
    And I see "Select the desired Contract Records for which Pass-through Payments will be made." message in the grid
    And I check the following contracts
      | Sub Lease A |
      | Sub Lease B |
    And I click on the "Create Pass-through Payments" button
    And I see "Pass Through Payments were successfully created for following contracts:" message in the grid
    And I see "Sub Lease A" message in the grid
    And I see "Sub Lease B" message in the grid
    And I click on the "Close" button

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Contract | Master Transaction Contract | Payment Info     | Transactions    |

  Scenario Outline: As a delete user I verify there is an line item in transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "04/01/2015" under column header "Effective Date"
      | name        | value         |
      | Group       | Rent          |
      | Type        | Base Rent     |
      | Category    | Rent          |
      | Vendor      | <Vendor>      |
      | Primary Tax | <Primary Tax> |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name | Second Level Tab | Third Level Tab | Vendor   | Primary Tax |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease A | Payment Info     | Transactions    | A Vendor | $10.00      |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease B | Payment Info     | Transactions    | B Vendor | $20.00      |

  Scenario Outline: As a delete user I verify vendors
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "<Vendor Name>" under column header "Vendor"
      | name    | value |
      | Vendor# |       |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab    | Vendor Name |
      | DeleteAccess | Delete Access Access | Contract | Master Transaction Contract | Payment Info     | Recurring Expenses | C Vendor    |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease A                 | Payment Info     | Recurring Expenses | A Vendor    |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease B                 | Payment Info     | Recurring Expenses | B Vendor    |