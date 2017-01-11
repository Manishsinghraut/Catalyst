@all @smoke @smoke1
Feature: I create,update and delete contract amendments and verify them in Contract> Abstract Info> amendments page (Ref : Jira Ticket No : AUTOMATION-502)

  Scenario Outline: I create contract amendments through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                     | value                     |
      | ContractAmendment_CodeAmendmentGroupID   | Lease                     |
      | ContractAmendment_CodeAmendmentTypeID    | No Payment                |
      | ContractAmendment_AmendmentNumber        | 1234                      |
      | ContractAmendment_EffectiveDate          | 05/15/2015                |
      | ContractAmendment_Description            | Selenium Test Description |
      | ContractAmendment_RentableAreaChange     | 10000                     |
      | ContractAmendment_CodeBuildingAreaUnitID | Square Feet               |
      | ContractAmendment_CodeContractUseID      | Retail                    |
      | ContractAmendment_BaseAmountChange       | 10000                     |
      | ContractAmendment_CodeFrequencyID        | Monthly                   |
      | ContractAmendment_Notes                  | Selenium Test Note        |
    And I click on the "Save Changes" action panel button
    And I verify a row from grid "<Grid ID>" having unique value "Selenium Test Description" under column header "Description"
      | name           | value                     |
      | Amendment ID   | 1234                      |
      | Group          | Lease                     |
      | Type           | No Payment                |
      | Effective Date | 05/15/2015                |
      | Description    | Selenium Test Description |
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title               | Grid ID |
      | Abstract Info    | Amendments      | Selenium-Contract | Contract Amendments List | thisDiv |

  Scenario Outline: I update contract amendments through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Selenium Test Description" under column header "Description"
    And I set following fields value on editable page
      | name                          | value                            |
      | ContractAmendment_Description | Update Selenium Test Description |
      | ContractAmendment_Notes       | Update Selenium Test Note        |
    And I click on the "Save Changes" action panel button
    And I click on row from grid "<Grid ID>" having unique value "Update Selenium Test Description" under column header "Description"
      | name           | value                            |
      | Amendment ID   | 1234                             |
      | Group          | Lease                            |
      | Type           | No Payment                       |
      | Effective Date | 05/15/2015                       |
      | Description    | Update Selenium Test Description |

    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title               | Grid ID |
      | Abstract Info    | Amendments      | Selenium-Contract | Contract Amendments List | thisDiv |

  Scenario Outline: I Delete contract amendments through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "<Grid ID>" having unique value "Update Selenium Test Description" under column header "Description"
      | name           | value                            |
      | Amendment ID   | 1234                             |
      | Group          | Lease                            |
      | Type           | No Payment                       |
      | Effective Date | 05/15/2015                       |
      | Description    | Update Selenium Test Description |

    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I wait for the Loading text to disappear
    And I switch to default frame
    Then I verify row from grid "<Grid ID>" having unique value "Update Selenium Test Description" not present
    And I switch to default frame
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title               | Grid ID |
      | Abstract Info    | Amendments      | Selenium-Contract | Contract Amendments List | thisDiv |
