@all
Feature: Save Parcel - Parcel Access and Property Taxes pages to documents (Ref : Jira Ticket No : AUTOMATION-1358)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | 8456_Parcel_1358.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user, I verify Parcel Access
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |
    And I click on "Save" Button
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name | Second Level Tab | Document             |
    | DeleteAccess | Delete Access Access | 8456 Parcel | Parcel Access    | 8456ParcelAccessFile |

  Scenario Outline: As a delete user, I verify saved document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I verify a row from non frame grid "thisDiv" having unique value "Lease" under column header "Parcel Access Group"
      | name                   | value      |
      | Parcel Access Group    | Lease      |
      | Parcel Access Type     | Option     |
      | Parcel Access Category | Category   |
      | Effective Date         | 11/03/2016 |
      | Expire Date            | 11/03/2016 |
      | Tickler Date           | 04/07/2011 |

    And I verify the field "Group" values is "Lease"
    And I verify the field "Type" values is "Option"
    And I verify the field "Category" values is "Category"
    And I verify the field "Effective Date" values is "11/03/2016"
    And I verify the field "Expire Date" values is "11/03/2016"
    And I verify the field "Tickler Date" values is "04/07/2011"
    And I verify the field "Does it Exist?" values is "Yes"
#    And I verify text value in a page
#      | The public information contained herein is furnished as a public service by Dutchess County Real Property Tax Service Agency.           |
#      | The Real Property Tax Service Agency makes no warranties, expressed or implied, concerning the accuracy, completeness, reliability, or  |
#      | suitability for the use of this information. Furthermore, the Real Property Tax Service Agency assumes no liability associated with the |
#      | use or misuse of such information.Notes                                                                                                 |


    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name | Second Level Tab | Document             |
    | DeleteAccess | Delete Access Access | 8456 Parcel | Parcel Access    | 8456ParcelAccessFile |


  Scenario Outline: As a delete user, I verify Property Taxes
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |
    And I click on "Save" Button
    And I switch to main window
  Examples:
    | Login User   | Login full username  | Entity Name | Second Level Tab | Document              |
    | DeleteAccess | Delete Access Access | 8456 Parcel | Property Taxes   | 8456PropertyTaxesFile |

  Scenario Outline: As a delete user, I verify saved document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (2) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I verify a row from non frame grid "thisDiv" having unique value "Resale tax" under column header "Property Tax Type"
      | name               | value                   |
      | Property Tax Type  | Resale tax              |
      | Description        | taxes save to documents |
      | Tax Authority      | Selenium-Employer       |
      | Tax Account Number | 34234324                |

    And I verify the field "Property Tax Type" values is "Resale tax"
    And I verify the field "Description" values is "taxes save to documents"
    And I verify the field "Billing Frequency" values is "Annually"
    And I verify the field "Payment Frequency" values is "Annually"
    And I verify the field "Tickler Date" values is "12/31/2020"
    And I verify the field "Tax Authority" values is "Selenium-Employer"
    And I verify the field "Expense Group" values is "CAM"
    And I verify the field "Expense Type" values is "CAM"
    And I verify the field "Tax Account Number" values is "34234324"
    And I verify the field "Recovery Group" values is "CAM"
    And I verify the field "Recovery Type" values is "Interior"

#    And I verify text value in a page
#      | Here you can pay your property taxes online, inquire about a parcel of land, or view maps and plat books. Please use the links below or in the navigation bar above to proceed.                                                              |
#      | Pay Property Taxes Online                                                                                                                                                                                                                    |
#      | Parcel Inquiry                                                                                                                                                                                                                               |
#      | Maps                                                                                                                                                                                                                                         |
#      | Plat Books                                                                                                                                                                                                                                   |
#      | Plat books are $35 per copy (cash or check only). Plat books can be bought in Administrative Services, #103. To obtain a plat book via mail, please send in a check for $41.45 ($35 for the plat book and $6.45 for shipping & handling) to: |

    And I verify a row from non frame grid "BOGridPropertyTaxAssessment" having unique value "01/01/2020" under column header "Effective Date"
      | name             | value         |
      | Effective Date   | 01/01/2020    |
      | End Date         | 12/31/2030    |
      | Description      | Adding values |
      | Land             | $120,000.00   |
      | Other            | $30,000.00    |
      | Improvements     | $1,200.00     |
      | Adjustments      | $4,000.00     |
      | Assessment Total | $180,000.00   |

    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name | Second Level Tab | Document              |
    | DeleteAccess | Delete Access Access | 8456 Parcel | Property Taxes   | 8456PropertyTaxesFile |
