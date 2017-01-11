@all
Feature: Test Decimal display for Foreign Currency on Property Tax [Jira Ref : AUTOMATION-1377]

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select EUR as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | EUR   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/PropertyTax/"
    And I import following file name:
      | VendorImport_1377.xml                 |
      | Sprint17PortfolioAndLocation_1377.xml |
      | Parcel_Sprint_17_1377.xml             |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify the currency type fields are correctly reflected on the Property tax assessment Pop up
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "Resale" under column header "Property Tax Type"
      | name               | value    |
      | Property Tax Type  | Resale   |
      | Description        |          |
      | Tax Authority      | Vendor A |
      | Tax Account Number | 32343423 |

    And I click on "edit" row action in the grid "BOGridPropertyTaxAssessment" having the following header "End Date" and cell value "12/31/2020"
      | name             | value      |
      | Effective Date   | 12/31/2000 |
      | End Date         | 12/31/2020 |
      | Description      |            |
      | Land             |            |
      | Other            |            |
      | Improvements     |            |
      | Adjustments      |            |
      | Assessment Total |            |

    And I switch to default frame

    And I verify the following fields value on editable page
      | name                                 | value     |
      | PropertyTaxAssessment_MarketValue    | €3,000.00 |
      | PropertyTaxAssessment_AppraisalValue | €2,000.00 |

    And I click on "edit" row action in the grid "BOGridPropertyTaxBill" having the following header "Tax Total Amount" and cell value "€2,000.00"
      | name             | value      |
      | Tax Begin Date   | 09/21/2016 |
      | Tax End Date     | 09/21/2016 |
      | Tax Total Amount | €2,000.00  |
      | Tax Balance Due  | €8,000.00  |
      | Processed?       |            |
      | Tax Status       | Reviewed   |

    And I verify the following fields value on editable page
      | name                           | value     |
      | PropertyTaxBill_TaxTotalAmount | €2,000.00 |
      | PropertyTaxBill_TaxNetAmount   | €4,000.00 |
      | PropertyTaxBill_TaxBalanceDue  | €8,000.00 |

    And I click on the "Cancel" btn

    And I click on the "Cancel" button
    And I wait for modal window to close

  Examples:
    | Login User   | Login full username  | Entity Name      | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Parcel Sprint 17 | Property Taxes   | Summary         |


  Scenario Outline: As a delete user I Navigate back to "manage company" and change the currency back to null post testing
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify the currency type fields are correctly reflected on the Property tax assessment Pop up
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "Resale" under column header "Property Tax Type"
      | name               | value    |
      | Property Tax Type  | Resale   |
      | Description        |          |
      | Tax Authority      | Vendor A |
      | Tax Account Number | 32343423 |

    And I click on "edit" row action in the grid "BOGridPropertyTaxAssessment" having the following header "End Date" and cell value "12/31/2020"
      | name             | value      |
      | Effective Date   | 12/31/2000 |
      | End Date         | 12/31/2020 |
      | Description      |            |
      | Land             |            |
      | Other            |            |
      | Improvements     |            |
      | Adjustments      |            |
      | Assessment Total |            |

    And I switch to default frame

    And I verify the following fields value on editable page
      | name                                 | value     |
      | PropertyTaxAssessment_MarketValue    | $3,000.00 |
      | PropertyTaxAssessment_AppraisalValue | $2,000.00 |

    And I verify a row from non frame grid "BOGridPropertyTaxBill" having unique value "$2,000.00" under column header "Tax Total Amount"
      | name             | value      |
      | Tax Begin Date   | 09/21/2016 |
      | Tax End Date     | 09/21/2016 |
      | Tax Total Amount | $2,000.00  |
      | Tax Balance Due  | $8,000.00  |
      | Processed?       |            |
      | Tax Status       | Reviewed   |

    And I click on the "Cancel" button
    And I wait for modal window to close

  Examples:
    | Login User   | Login full username  | Entity Name      | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Parcel Sprint 17 | Property Taxes   | Summary         |