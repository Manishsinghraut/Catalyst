@all
Feature: Responsibilities Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1186)

  Scenario Outline: I import the  Spreadsheet Import-Contract entity and Responsibilities Rec ID Report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Spreadsheet_Import__Contract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/"
    And I import following file name:
      | ResponsibilitiesRecIDReport_1186.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I Responsibilities Spreadsheet - Create/Update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/"
    And I import following file name:
      | CreateResponsiblities_1186.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "12" under column header "Service Level"
      | name                  | value      |
      | Group                 | Electrical |
      | Type                  | Electrical |
      | Included In Rent Flag | Yes        |
      | Maintenance Category  | Electrical |
      | Repair                | Tenant     |
      | Service Level         | 12         |
    And I verify a row from grid "<grid>" having unique value "14" under column header "Service Level"
      | name                  | value       |
      | Group                 | Electrical  |
      | Type                  | Electrical  |
      | Included In Rent Flag | Yes         |
      | Maintenance Category  | Landscaping |
      | Repair                | Tenant      |
      | Service Level         | 14          |

    And I switch to default frame
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value                          |
      | Report Name | Responsibilities Rec ID Report |
    And I switch to "build layout" child window
    And I verify Name "Spreadsheet Import-Contract-Testing-15278", Maintenance Category "Landscaping" and extract Responsibilities Rec ID on report window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/UpdateResponsiblities_1186.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I switch to main window
    And I close report window
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/"
    And I import following file name:
      | UpdateResponsiblities_1186.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "12" under column header "Service Level"
      | name                  | value      |
      | Group                 | Electrical |
      | Type                  | Electrical |
      | Included In Rent Flag | Yes        |
      | Maintenance Category  | Electrical |
      | Repair                | Tenant     |
      | Service Level         | 12         |
    And I verify a row from grid "<grid>" having unique value "22" under column header "Service Level"
      | name                  | value      |
      | Group                 | Electrical |
      | Type                  | Electrical |
      | Included In Rent Flag | No         |
      | Maintenance Category  | Electrical |
      | Repair                | Developer  |
      | Service Level         | 22         |
    And I verify the following fields value on editable page
      | name                                           | value                  |
      | Responsibility_CodeResponsibilityGroupID       | Electrical             |
      | Responsibility_CodeResponsibilityTypeID        | Electrical             |
      | Responsibility_CodeAssetCategoryID             | Electrical             |
      | Responsibility_CodeMaintenanceResponsibilityID | Landlord               |
      | Responsibility_CodeExecutionResponsibilityID   | Developer              |
      | Responsibility_CodeFinancialResponsibilityID   | Tenant                 |
      | Responsibility_CodePassThroughTypeID           | Pass Through           |
      | Responsibility_CapAmount                       |                        |
      | Responsibility_CapPercent                      | 35.00000%              |
      | Responsibility_ServiceLevel                    | 22                     |
      | Responsibility_ServicePersonID                 | Edit Access Access     |
      | Responsibility_CodeResponseTimeID              | 3 Business Days        |
      | Responsibility_EffectiveDate                   | 12/31/2001             |
      | Responsibility_EndDate                         | 12/31/2019             |
      | Responsibility_ContractResponsibilityAmount    | $60,000.00             |
      | Responsibility_Notes                           | Update Responsiblities |
      | Responsibility_CovenantID                      | <SELECT>               |
      | Responsibility_Section                         | 12                     |
      | Responsibility_AmendmentID                     | [SELECT]               |
    And I switch to default frame

    Examples:
      | Entity Name                               | Secondary Tab | Third Level Tab  | grid    | Reports Grid ID |
      | Spreadsheet Import-Contract-Testing-15278 | Abstract Info | Responsibilities | thisDiv | ^editBOGrid     |

#@all
#Feature: (Jira Ref: AUTOMATION-394) I create and update Responsibilities and verify them in Contract> Abstract Info> Responsibilities page
#
#  Scenario Outline: I create Responsibilities through spreadsheet import
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/"
#    And I import following file name:
#      | Create_Responsibility.xls |
#    When I navigate to entity type "<Item>" named "<Contract>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Tertiary Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/Create_Responsibility.xls"
##    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name                 | value                                        |
#      | Group                | Responsibility.CodeResponsibilityGroupID     |
#      | Type                 | Responsibility.CodeResponsibilityTypeID      |
#      | Maintenance Category | Responsibility.CodeAssetCategoryID           |
#      | Repair               | Responsibility.CodeExecutionResponsibilityID |
#      | Service Level        | Responsibility.ServiceLevel                  |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Tertiary Tab     | Contract          | Spreadsheet Row | Grid ID | Grid Row |
#    | Contract | Abstract Info | Responsibilities | Selenium-Contract | 6               | thisDiv | 3        |
#
#  Scenario Outline: I update Responsibilities through spreadsheet import
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/"
#    And I import following file name:
#      | Update_Responsibility.xls |
#    When I navigate to entity type "<Item>" named "<Contract>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Tertiary Tab>" tab
#    And I collapse portfolio navigation tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Responsibilities/Update_Responsibility.xls"
##    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name                 | value                                        |
#      | Group                | Responsibility.CodeResponsibilityGroupID     |
#      | Type                 | Responsibility.CodeResponsibilityTypeID      |
#      | Maintenance Category | Responsibility.CodeAssetCategoryID           |
#      | Repair               | Responsibility.CodeExecutionResponsibilityID |
#      | Service Level        | Responsibility.ServiceLevel                  |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Tertiary Tab     | Contract          | Spreadsheet Row | Grid ID | Grid Row |
#    | Contract | Abstract Info | Responsibilities | Selenium-Contract | 6               | thisDiv | 3        |
