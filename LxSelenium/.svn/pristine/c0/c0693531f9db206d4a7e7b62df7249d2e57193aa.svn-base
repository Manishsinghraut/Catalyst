@all
Feature: (Jira Ref: AUTOMATION-397, AUTOMATION-1189) I create and update insurance and verify them in Contract> Abstract Info> Insurance page

  Scenario Outline: I create insurance through spreadsheet import
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/"
    And I import following files:
      | Spreadsheet_Import__Contract-1189.xml |
      | InsuranceLL-1189.xml                  |
      | Member- Dwight-1189.xlsx              |
      | CreateInsurance-1189.xlsx             |
    When I navigate to entity type "<Item>" named "<Contract>"
    Then I navigate to "Abstract Info"
    And I click on the "Insurance" tab
    And I verify the following values in frame grid "thisDiv"
      | Insurance Group | Insurance Type | Insurance Category | Begin Date | End Date   | Certificate Required Flag | Request Date | Received Date |
      | Flood           | Renters        | Liability          | 03/01/2016 | 08/31/2016 | No                        | 03/02/2016   | 03/05/2016    |
      | Main Policy     | Building       | Full Coverage      | 01/01/2016 | 12/31/2016 | Yes                       | 01/02/2016   | 01/05/2016    |
    And I click on row from grid "thisDiv" having unique value "Flood" under column header "Insurance Group"
      | name | value |

    And I verify the following fields value on editable page
      | name                                             | value                         |
      | Insurance_CodeInsuranceGroupID                   | Flood                         |
      | Insurance_CodeInsuranceTypeID                    | Renters                       |
      | Insurance_CodeInsuranceCategoryID                | Liability                     |
      | Insurance_PolicyNumber                           | FC-002                        |
      | Insurance_BeginDate                              | 03/01/2016                    |
      | Insurance_EndDate                                | 08/31/2016                    |
      | _checkbox_Insurance_PolicyRequiredFlag           | false                         |
      | _checkbox_Insurance_LandlordAlsoNamedInsuredFlag | false                         |
      | _checkbox_Insurance_AgentAlsoNamedInsuredFlag    | false                         |
      | _checkbox_Insurance_SelfInsuredFlag              | false                         |
      | _checkbox_Insurance_CertificateRequiredFlag      | false                         |
      | Insurance_CertificateRequestDate                 | 03/02/2016                    |
      | Insurance_CertificateReceivedDate                | 03/05/2016                    |
      | Insurance_CoverageAmount                         | $5,000.00                     |
      | Insurance_SingleOccuranceAmount                  | $200.00                       |
      | Insurance_CodeCurrencyTypeID                     | USD                           |
      | Insurance_Notes                                  | This is to create Insurance B |
      | Insurance_Section                                | Section-B                     |


    And I fetch Insurance ID
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/UpdateInsurance-1189.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    Examples:
      | Item     | Contract                                  |
      | Contract | Spreadsheet Import-Contract-Testing-15278 |

  Scenario Outline: I update insurance through spreadsheet import
    Given I Login to IWMS using "EditAccess" access credentials
    And I check previous user login "Edit Access Access" and continue if user "EditAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/"
    And I import following files:
      | UpdateInsurance-1189.xlsx |
    When I navigate to entity type "<Item>" named "<Contract>"
    Then I navigate to "Abstract Info"
    And I click on the "Insurance" tab

    And I verify the following values in frame grid "thisDiv"
      | Insurance Group | Insurance Type | Insurance Category | Begin Date | End Date   | Certificate Required Flag | Request Date | Received Date |
      | Main Policy     | Building       | Full Coverage      | 01/01/2016 | 12/31/2016 | Yes                       | 01/02/2016   | 01/05/2016    |
      | Regular         | Renters        | Full Coverage      | 01/01/2015 | 08/31/2015 | Yes                       | 03/02/2015   | 03/05/2015    |

    And I click on row from grid "thisDiv" having unique value "Regular" under column header "Insurance Group"
      | name | value |

    And I verify the following fields value on editable page
      | name                                             | value                         |
      | Insurance_CodeInsuranceGroupID                   | Regular                       |
      | Insurance_CodeInsuranceTypeID                    | Renters                       |
      | Insurance_CodeInsuranceCategoryID                | Full Coverage                 |
      | Insurance_PolicyNumber                           | FC-002- Updated               |
      | Insurance_BeginDate                              | 01/01/2015                    |
      | Insurance_EndDate                                | 08/31/2015                    |
      | _checkbox_Insurance_PolicyRequiredFlag           | true                          |
      | _checkbox_Insurance_LandlordAlsoNamedInsuredFlag | true                          |
      | _checkbox_Insurance_AgentAlsoNamedInsuredFlag    | true                          |
      | _checkbox_Insurance_SelfInsuredFlag              | true                          |
      | _checkbox_Insurance_CertificateRequiredFlag      | true                          |
      | Insurance_CertificateRequestDate                 | 03/02/2015                    |
      | Insurance_CertificateReceivedDate                | 03/05/2015                    |
      | Insurance_CoverageAmount                         | $10,000.00                    |
      | Insurance_SingleOccuranceAmount                  | $1,000.00                     |
      | Insurance_CodeCurrencyTypeID                     | USD                           |
      | Insurance_Notes                                  | This is to update Insurance B |
      | Insurance_Section                                | Section- Updated              |


    Examples:
      | Item     | Contract                                  |
      | Contract | Spreadsheet Import-Contract-Testing-15278 |


#@all
#Feature: (Jira Ref: AUTOMATION-397, AUTOMATION-1189) I create and update insurance and verify them in Contract> Abstract Info> Insurance page
#
#  Scenario Outline: I create insurance through spreadsheet import
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/"
#    And I import following file name:
#      | Create_Insurance.xls |
#    When I navigate to entity type "<Item>" named "<Contract>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Tertiary Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/Create_Insurance.xls"
#
##    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name               | value                             |
#      | Insurance Group    | Insurance.CodeInsuranceGroupID    |
#      | Insurance Type     | Insurance.CodeInsuranceTypeID     |
#      | Insurance Category | Insurance.CodeInsuranceCategoryID |
#
#
#    Then I verify date values in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name          | value                             |
#      | Begin Date    | Insurance.BeginDate               |
#      | End Date      | Insurance.EndDate                 |
#      | Request Date  | Insurance.CertificateRequestDate  |
#      | Received Date | Insurance.CertificateReceivedDate |
#    And I logout
#    Examples:
#      | Item     | Secondary Tab | Tertiary Tab | Contract          | Spreadsheet Row | Grid ID | Grid Row |
#      | Contract | Abstract Info | Insurance    | Selenium-Contract | 6               | thisDiv | 3        |
#
#  Scenario Outline: I update insurance through spreadsheet import
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/"
#    And I import following file name:
#      | Update_Insurance.xls |
#    When I navigate to entity type "<Item>" named "<Contract>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Tertiary Tab>" tab
#    And I collapse portfolio navigation tab
#
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Insurance/Update_Insurance.xls"
#
#    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
#      | name                            | value                           |
#      | Insurance_SingleOccuranceAmount | Insurance.SingleOccuranceAmount |
#      | Insurance_Notes                 | Insurance.Notes                 |
#    And I logout
#
#    Examples:
#      | Item     | Secondary Tab | Tertiary Tab | Contract          | Spreadsheet Row |
#      | Contract | Abstract Info | Insurance    | Selenium-Contract | 6               |
