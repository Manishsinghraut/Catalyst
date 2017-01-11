@all
Feature: (Ref : Jira Ticket No : Automation-698) Should not allow Alias group to reference another Alias

  Scenario Outline: I import file for Should not allow Alias group to reference another Alias
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/"
    And I import following file name:
      | ShouldNotAllowAliasGroupToReferenceAnotherAlias.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I ensure I Should not allow Alias group to reference another Alias

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I check for complete frame 'loading...'
    And I click on the '...' of the type field "Sales_CodeSalesTypeID"
    And I see modal window
    And I click on "Add Sales Type..." button in grid
    And I see the "Add Sales Type  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                              | value             |
      | ShortName                         | <Sales Type>      |
      | ActualLongName                    | Create Sales Type |
      | ParentCodeSalesGroupID            | Sales             |
      | _checkbox_OmitFromSalesGroupTotal | true              |

    And I click on the "Add" button
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name                  | value        |
      | Sales_CodeSalesTypeID | <Sales Type> |

    And I click on the "Save Changes" action panel button
    And I check for complete frame 'loading...'
    And I click on the '...' of the type field "Sales_CodeSalesTypeID"
    And I see modal window
    And I click on "Add Sales Type..." button in grid
    And I set following fields value on editable page
      | name                              | value             |
      | ShortName                         | <Sales Type>      |
      | ActualLongName                    | Create Sales Type |
      | ParentCodeSalesGroupID            | Sales             |
      | _checkbox_OmitFromSalesGroupTotal | true              |

    And I click on the "Add" button
    And I see "Failed to add item, an item with the exact same name may already exist. Try a different name and if problems persist, call technical support." message in the header


    Examples:
      | Login User   | Login full username  | Item     | Entity Name                                            | Sales Type      |
      | DeleteAccess | Delete Access Access | Contract | Should Not Allow AliasGroup To Reference Another Alias | Duplicate Alias |