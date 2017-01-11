@all
Feature: Amendment Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1184)

  Scenario Outline: I import the  Spreadsheet Import-Contract entity and AmendmentsListLayout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Spreadsheet_Import__Contract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/"
    And I import following file name:
      | AmendmentsListLayout_1184.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Amendment Spreadsheet - Create/Update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/"
    And I import following file name:
      | ContarctAmendmentsCreateSS_1184.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "01/01/2010" under column header "Effective Date"
      | name           | value              |
      | Amendment ID   | 1201               |
      | Group          | Lease              |
      | Type           | No Payment         |
      | Effective Date | 01/01/2010         |
      | Description    | Create Description |
    And I extract Amendment RecID

    And I verify a row from grid "<grid>" having unique value "01/01/2015" under column header "Effective Date"
      | name           | value                                      |
      | Amendment ID   | 1202                                       |
      | Group          | Lease                                      |
      | Type           | Space Change                               |
      | Effective Date | 01/01/2015                                 |
      | Description    | There is going to be a change in the space |
    And I switch to default frame

    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/ContarctAmendmentsUpdateSS_1184.xlsx"
    And I set cell value in spread sheet row "6" under header "Amendment RecID" of column index "3"
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/"
    And I import following file name:
      | ContarctAmendmentsUpdateSS_1184.xlsx |


    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "01/01/2020" under column header "Effective Date"
      | name           | value              |
      | Amendment ID   | 1200               |
      | Group          | Lease              |
      | Type           | Space Change       |
      | Effective Date | 01/01/2020         |
      | Description    | Update Description |
    And I verify the following fields value on editable page
      | name                                     | value              |
      | ContractAmendment_CodeAmendmentGroupID   | Lease              |
      | ContractAmendment_CodeAmendmentTypeID    | Space Change       |
      | ContractAmendment_AmendmentNumber        | 1200               |
      | ContractAmendment_EffectiveDate          | 01/01/2020         |
      | ContractAmendment_Description            | Update Description |
      | ContractAmendment_RentableAreaChange     | 6,000              |
      | ContractAmendment_CodeBuildingAreaUnitID | Square Feet        |
      | ContractAmendment_CodeContractUseID      | apartment          |
      | ContractAmendment_BaseAmountChange       | $1,000.00          |
      | ContractAmendment_CodeFrequencyID        | Annually           |
      | ContractAmendment_Notes                  | Update Amendments  |

    And I verify a row from grid "<grid>" having unique value "01/01/2015" under column header "Effective Date"
      | name           | value                                      |
      | Amendment ID   | 1202                                       |
      | Group          | Lease                                      |
      | Type           | Space Change                               |
      | Effective Date | 01/01/2015                                 |
      | Description    | There is going to be a change in the space |
    And I switch to default frame

  Examples:
    | Entity Name                               | Secondary Tab | Third Level Tab | grid    |
    | Spreadsheet Import-Contract-Testing-15278 | Abstract Info | Amendments      | thisDiv |


#@all
#Feature: (Jira Ref: AUTOMATION-392) I create and update amendment and verify them in Contract> Abstract Info> Amendment page
#
#  Scenario Outline: I create amendments through spreadsheet import
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/"
#    And I import following file name:
#      | Create_Contract_Amendment_SS.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/Create_Contract_Amendment_SS.xls"
#    #Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name           | value                                  |
#      | Amendment ID   | ContractAmendment.AmendmentNumber      |
#      | Group          | ContractAmendment.CodeAmendmentGroupID |
#      | Type           | ContractAmendment.CodeAmendmentTypeID  |
#      | Effective Date | ContractAmendment.EffectiveDate        |
#      | Description    | ContractAmendment.Description          |
#    And I logout
#
#    Examples:
#      | Item     | Second Level Tab | Third Level Tab | Grid ID | Spreadsheet Row | Grid Row | Entity Name       |
#      | Contract | Abstract Info    | Amendments      | thisDiv | 6               | 3        | Selenium-Contract |
#
#  Scenario Outline: I update amendments through spreadsheet import
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/"
#    And I import following file name:
#      | Update_Contract_Amendment_SS.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I collapse portfolio navigation tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Amendment/Update_Contract_Amendment_SS.xls"
#    #Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name           | value                                  |
#      | Amendment ID   | ContractAmendment.AmendmentNumber      |
#      | Group          | ContractAmendment.CodeAmendmentGroupID |
#      | Type           | ContractAmendment.CodeAmendmentTypeID  |
#      | Effective Date | ContractAmendment.EffectiveDate        |
#      | Description    | ContractAmendment.Description          |
#    And I logout
#
#    Examples:
#      | Item     | Second Level Tab | Third Level Tab | Grid ID | Spreadsheet Row | Grid Row | Entity Name       |
#      | Contract | Abstract Info    | Amendments      | thisDiv | 6               | 3        | Selenium-Contract |