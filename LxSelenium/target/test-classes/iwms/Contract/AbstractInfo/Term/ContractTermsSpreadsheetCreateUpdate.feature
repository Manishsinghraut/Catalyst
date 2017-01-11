@all
Feature: (Jira Ref. AUTOMATION-403, AUTOMATION-1193) I create and update contract term and verify them in Contract> Abstract Info> Terms page

  Scenario Outline: I create contract term through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/"
    And I import following files:
      | Spreadsheet_Import__Contract-1193.xml |
      | TermRecIDReport-1193.xml              |
      | CreateContractTerms-1193.xlsx         |

    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value              |
      | Report Name | Term Rec ID report |
    And I switch to "Report" child window
    And I fetch Term Rec ID from report for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/UpdateTerm-1193.xlsx"
    And I set cell value in spread sheet row "6" under header "Term RecID" of column index "3"
    And I close the "Report" child window
    And I switch to main window

    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "02" under column header "Term Number"
      | name                 | value      |
      | Begin Date           | 01/01/2020 |
      | End Date             | 12/31/2020 |
      | Type                 | Original   |
      | Amendment            |            |
      | Notice Begin Date    |            |
      | Notice End Date      | 11/30/2019 |
      | Status               | Active     |
      | Include in Accruals? | No         |
    And I verify the following fields value on editable page
      | name                                          | value           |
      | ContractTerm_ClientNumber                     | 02              |
      | ContractTerm_CodeTermTypeID                   | Original        |
      | ContractTerm_CodeTermStatusID                 | Active          |
      | ContractTerm_RentableArea                     | 4,000           |
      | ContractTerm_CodeBuildingAreaUnitID           | Square Feet     |
      | _checkbox_ContractTerm_IncludeTermForAccruals | false           |
      | KeyDate_CodeKeyDateGroupID                    | Orignal Term    |
      | KeyDate_CodeKeyDateTypeID                     | Renewal         |
      | KeyDate_CodeKeyDateActionID                   | Renew           |
      | KeyDate_Description                           | Create Term 01  |
      | KeyDate_ActionDate                            | 01/01/2020      |
      | KeyDate_BeginDate                             | 01/01/2020      |
      | KeyDate_EndDate                               | 12/31/2020      |
      | _checkbox_KeyDate_NoticeSentFlag              | false           |
      | _checkbox_KeyDate_ActionComplete              | true            |
      | _checkbox_KeyDate_NoticeReceivedFlag          | true            |
      | NoticePeriod                                  | 1               |
      | KeyDate_CodeNoticePeriodUnitID                | Months          |
      | ActionPeriod                                  | 180             |
      | KeyDate_CodeActionPeriodUnitID                | Days            |
      | KeyDate_NoticeBeginDate                       |                 |
      | KeyDate_NoticeEndDate                         | 11/30/2019      |
      | KeyDate_TicklerDate                           | 06/03/2019      |
      | KeyDate_Notes                                 | Create Key Date |
      | ContractTerm_Section                          | T-001           |
      | ContractTerm_CovenantID                       | <SELECT>        |
      | ContractTerm_AmendmentID                      | [SELECT]        |
    And I verify the field "Length" is "1"in a same row in "Terms Page"

    And I click on row from grid "thisDiv" having unique value "03" under column header "Term Number"
      | name                 | value      |
      | Begin Date           | 01/01/2021 |
      | End Date             | 12/31/2021 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    |            |
      | Notice End Date      | 11/26/2020 |
      | Status               | Available  |
      | Include in Accruals? | Yes        |

    And I verify the following fields value on editable page
      | name                                          | value          |
      | ContractTerm_ClientNumber                     | 03             |
      | ContractTerm_CodeTermTypeID                   | Renewal        |
      | ContractTerm_CodeTermStatusID                 | Available      |
      | ContractTerm_RentableArea                     | 3,000          |
      | ContractTerm_CodeBuildingAreaUnitID           | Square Feet    |
      | _checkbox_ContractTerm_IncludeTermForAccruals | true           |
      | KeyDate_CodeKeyDateGroupID                    | Orignal Term   |
      | KeyDate_CodeKeyDateTypeID                     | Renewal        |
      | KeyDate_CodeKeyDateActionID                   | Renew          |
      | KeyDate_Description                           | Create Term 02 |
      | KeyDate_ActionDate                            | 01/01/2021     |
      | KeyDate_BeginDate                             | 01/01/2021     |
      | KeyDate_EndDate                               | 12/31/2021     |
      | _checkbox_KeyDate_NoticeSentFlag              | true           |
      | _checkbox_KeyDate_ActionComplete              | true           |
      | _checkbox_KeyDate_NoticeReceivedFlag          | false          |
      | NoticePeriod                                  | 5              |
      | KeyDate_CodeNoticePeriodUnitID                | Weeks          |
      | ActionPeriod                                  | 180            |
      | KeyDate_CodeActionPeriodUnitID                | Days           |
      | KeyDate_NoticeBeginDate                       |                |
      | KeyDate_NoticeEndDate                         | 11/26/2020     |
      | KeyDate_TicklerDate                           | 05/30/2020     |
      | KeyDate_Notes                                 |                |
      | ContractTerm_Section                          |                |
      | ContractTerm_CovenantID                       | <SELECT>       |
      | ContractTerm_AmendmentID                      | [SELECT]       |
    And I verify the field "Length" is "1 year"in a same row in "Terms Page"


    And I click on row from grid "thisDiv" having unique value "04" under column header "Term Number"
      | name                 | value      |
      | Begin Date           | 01/01/2022 |
      | End Date             | 12/31/2022 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    |            |
      | Notice End Date      | 12/31/2020 |
      | Status               | Available  |
      | Include in Accruals? | No         |

    And I verify the following fields value on editable page
      | name                                          | value          |
      | ContractTerm_ClientNumber                     | 04             |
      | ContractTerm_CodeTermTypeID                   | Renewal        |
      | ContractTerm_CodeTermStatusID                 | Available      |
      | ContractTerm_RentableArea                     | 2,000          |
      | ContractTerm_CodeBuildingAreaUnitID           | Square Feet    |
      | _checkbox_ContractTerm_IncludeTermForAccruals | false          |
      | KeyDate_CodeKeyDateGroupID                    | Orignal Term   |
      | KeyDate_CodeKeyDateTypeID                     | Renewal        |
      | KeyDate_CodeKeyDateActionID                   | Renew          |
      | KeyDate_Description                           | Create Term 03 |
      | KeyDate_ActionDate                            | 01/01/2022     |
      | KeyDate_BeginDate                             | 01/01/2022     |
      | KeyDate_EndDate                               | 12/31/2022     |
      | _checkbox_KeyDate_NoticeSentFlag              | false          |
      | _checkbox_KeyDate_ActionComplete              | true           |
      | _checkbox_KeyDate_NoticeReceivedFlag          | false          |
      | NoticePeriod                                  | 1              |
      | KeyDate_CodeNoticePeriodUnitID                | Years          |
      | ActionPeriod                                  | 180            |
      | KeyDate_CodeActionPeriodUnitID                | Days           |
      | KeyDate_NoticeBeginDate                       |                |
      | KeyDate_NoticeEndDate                         | 12/31/2020     |
      | KeyDate_TicklerDate                           | 07/04/2020     |
      | KeyDate_Notes                                 |                |
      | ContractTerm_Section                          |                |
      | ContractTerm_CovenantID                       | <SELECT>       |
      | ContractTerm_AmendmentID                      | [SELECT]       |
    And I verify the field "Length" is "1"in a same row in "Terms Page"

    And I click on row from grid "thisDiv" having unique value "05" under column header "Term Number"
      | name                 | value      |
      | Begin Date           | 01/01/2023 |
      | End Date             | 12/31/2023 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    | 05/31/2023 |
      | Notice End Date      | 07/31/2023 |
      | Status               | Available  |
      | Include in Accruals? | No         |

    And I verify the following fields value on editable page
      | name                                          | value          |
      | ContractTerm_ClientNumber                     | 05             |
      | ContractTerm_CodeTermTypeID                   | Renewal        |
      | ContractTerm_CodeTermStatusID                 | Available      |
      | ContractTerm_RentableArea                     | 1,000          |
      | ContractTerm_CodeBuildingAreaUnitID           | Square Feet    |
      | _checkbox_ContractTerm_IncludeTermForAccruals | false          |
      | KeyDate_CodeKeyDateGroupID                    | Lease          |
      | KeyDate_CodeKeyDateTypeID                     | Lease Term     |
      | KeyDate_CodeKeyDateActionID                   | Renew          |
      | KeyDate_Description                           | Create Term 04 |
      | KeyDate_ActionDate                            | 01/01/2023     |
      | KeyDate_BeginDate                             | 01/01/2023     |
      | KeyDate_EndDate                               | 12/31/2023     |
      | _checkbox_KeyDate_NoticeSentFlag              | false          |
      | _checkbox_KeyDate_ActionComplete              | true           |
      | _checkbox_KeyDate_NoticeReceivedFlag          | false          |
      | NoticePeriod                                  | -212           |
      | KeyDate_CodeNoticePeriodUnitID                | Days           |
      | ActionPeriod                                  | 61             |
      | KeyDate_CodeActionPeriodUnitID                | Days           |
      | KeyDate_NoticeBeginDate                       | 05/31/2023     |
      | KeyDate_NoticeEndDate                         | 07/31/2023     |
      | KeyDate_TicklerDate                           | 05/31/2023     |
      | KeyDate_Notes                                 |                |
      | ContractTerm_Section                          |                |
      | ContractTerm_CovenantID                       | <SELECT>       |
      | ContractTerm_AmendmentID                      | [SELECT]       |
    And I verify the field "Length" is "1"in a same row in "Terms Page"

    And I click on the "Key Dates" tab
    And I click on row from grid "thisDiv" having unique value "Lease" under column header "Key Date Group"
      | name            | value          |
      | Key Date Type   | Lease Term     |
      | Key Date Action | Renew          |
      | Description     | Create Term 04 |
      | Begin Date      | 01/01/2023     |
      | End Date        | 12/31/2023     |
      | Tickler Date    | 05/31/2023     |

    And I verify the following fields value on editable page
      | name                                 | value          |
      | KeyDate_CodeKeyDateGroupID           | Lease          |
      | KeyDate_CodeKeyDateTypeID            | Lease Term     |
      | KeyDate_CodeKeyDateActionID          | Renew          |
      | KeyDate_Description                  | Create Term 04 |
      | KeyDate_ActionDate                   | 01/01/2023     |
      | KeyDate_BeginDate                    | 01/01/2023     |
      | KeyDate_EndDate                      | 12/31/2023     |
      | _checkbox_KeyDate_NoticeSentFlag     | false          |
      | _checkbox_KeyDate_ActionComplete     | true           |
      | _checkbox_KeyDate_NoticeReceivedFlag | false          |
      | NoticePeriod                         | -212           |
      | KeyDate_CodeNoticePeriodUnitID       | Days           |
      | ActionPeriod                         | 61             |
      | KeyDate_CodeActionPeriodUnitID       | Days           |
      | KeyDate_NoticeBeginDate              | 05/31/2023     |
      | KeyDate_NoticeEndDate                | 07/31/2023     |
      | KeyDate_TicklerDate                  | 05/31/2023     |
      | KeyDate_Notes                        |                |
    And I verify the field "Length" is "1"in a same row in "Terms Page"

    And I click on row from grid "thisDiv" having unique value "Orignal Term" under column header "Key Date Group"
      | name            | value          |
      | Key Date Type   | Renewal        |
      | Key Date Action | Renew          |
      | Description     | Create Term 01 |
      | Begin Date      | 01/01/2020     |
      | End Date        | 12/31/2020     |
      | Tickler Date    | 06/03/2019     |
    And I verify the following fields value on editable page
      | name                                 | value           |
      | KeyDate_CodeKeyDateGroupID           | Orignal Term    |
      | KeyDate_CodeKeyDateTypeID            | Renewal         |
      | KeyDate_CodeKeyDateActionID          | Renew           |
      | KeyDate_Description                  | Create Term 01  |
      | KeyDate_ActionDate                   | 01/01/2020      |
      | KeyDate_BeginDate                    | 01/01/2020      |
      | KeyDate_EndDate                      | 12/31/2020      |
      | _checkbox_KeyDate_NoticeSentFlag     | false           |
      | _checkbox_KeyDate_ActionComplete     | true            |
      | _checkbox_KeyDate_NoticeReceivedFlag | true            |
      | NoticePeriod                         | 1               |
      | KeyDate_CodeNoticePeriodUnitID       | Months          |
      | ActionPeriod                         | 180             |
      | KeyDate_CodeActionPeriodUnitID       | Days            |
      | KeyDate_NoticeBeginDate              |                 |
      | KeyDate_NoticeEndDate                | 11/30/2019      |
      | KeyDate_TicklerDate                  | 06/03/2019      |
      | KeyDate_Notes                        | Create Key Date |

    And I verify the field "Length" is "1"in a same row in "Terms Page"

    And I click on row from grid "thisDiv" having unique value "Orignal Term" under column header "Key Date Group"
      | name            | value          |
      | Key Date Type   | Renewal        |
      | Key Date Action | Renew          |
      | Description     | Create Term 02 |
      | Begin Date      | 01/01/2021     |
      | End Date        | 12/31/2021     |
      | Tickler Date    | 05/30/2020     |
    And I verify the following fields value on editable page
      | name                                 | value          |
      | KeyDate_CodeKeyDateGroupID           | Orignal Term   |
      | KeyDate_CodeKeyDateTypeID            | Renewal        |
      | KeyDate_CodeKeyDateActionID          | Renew          |
      | KeyDate_Description                  | Create Term 02 |
      | KeyDate_ActionDate                   | 01/01/2021     |
      | KeyDate_BeginDate                    | 01/01/2021     |
      | KeyDate_EndDate                      | 12/31/2021     |
      | _checkbox_KeyDate_NoticeSentFlag     | true           |
      | _checkbox_KeyDate_ActionComplete     | true           |
      | _checkbox_KeyDate_NoticeReceivedFlag | false          |
      | NoticePeriod                         | 5              |
      | KeyDate_CodeNoticePeriodUnitID       | Weeks          |
      | ActionPeriod                         | 180            |
      | KeyDate_CodeActionPeriodUnitID       | Days           |
      | KeyDate_NoticeBeginDate              |                |
      | KeyDate_NoticeEndDate                | 11/26/2020     |
      | KeyDate_TicklerDate                  | 05/30/2020     |
      | KeyDate_Notes                        |                |
    And I verify the field "Length" is "1 year"in a same row in "Terms Page"

    And I click on row from grid "thisDiv" having unique value "Orignal Term" under column header "Key Date Group"
      | name            | value          |
      | Key Date Type   | Renewal        |
      | Key Date Action | Renew          |
      | Description     | Create Term 03 |
      | Begin Date      | 01/01/2022     |
      | End Date        | 12/31/2022     |
      | Tickler Date    | 07/04/2020     |

    And I verify the following fields value on editable page
      | name                                 | value          |
      | KeyDate_CodeKeyDateGroupID           | Orignal Term   |
      | KeyDate_CodeKeyDateTypeID            | Renewal        |
      | KeyDate_CodeKeyDateActionID          | Renew          |
      | KeyDate_Description                  | Create Term 03 |
      | KeyDate_ActionDate                   | 01/01/2022     |
      | KeyDate_BeginDate                    | 01/01/2022     |
      | KeyDate_EndDate                      | 12/31/2022     |
      | _checkbox_KeyDate_NoticeSentFlag     | false          |
      | _checkbox_KeyDate_ActionComplete     | true           |
      | _checkbox_KeyDate_NoticeReceivedFlag | false          |
      | NoticePeriod                         | 1              |
      | KeyDate_CodeNoticePeriodUnitID       | Years          |
      | ActionPeriod                         | 180            |
      | KeyDate_CodeActionPeriodUnitID       | Days           |
      | KeyDate_NoticeBeginDate              |                |
      | KeyDate_NoticeEndDate                | 12/31/2020     |
      | KeyDate_TicklerDate                  | 07/04/2020     |
      | KeyDate_Notes                        |                |
    And I verify the field "Length" is "1"in a same row in "Terms Page"


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                               | Reports Grid ID |
      | DeleteAccess | Delete Access Access | Contract | Abstract Info    | Terms           | Spreadsheet Import-Contract-Testing-15278 | ^editBOGrid     |

  Scenario Outline: I update contract term through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/"
    And I import following files:
      | UpdateTerm-1193.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "03" under column header "Term Number"
      | name                 | value      |
      | Begin Date           | 01/02/2021 |
      | End Date             | 12/30/2021 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    |            |
      | Notice End Date      | 11/26/2020 |
      | Status               | Declined   |
      | Include in Accruals? | No         |

    And I verify the following fields value on editable page
      | name                                          | value            |
      | ContractTerm_ClientNumber                     | 03               |
      | ContractTerm_CodeTermTypeID                   | Renewal          |
      | ContractTerm_CodeTermStatusID                 | Declined         |
      | ContractTerm_RentableArea                     | 4,000            |
      | ContractTerm_CodeBuildingAreaUnitID           | Square Feet      |
      | _checkbox_ContractTerm_IncludeTermForAccruals | false            |
      | KeyDate_CodeKeyDateGroupID                    | Lease            |
      | KeyDate_CodeKeyDateTypeID                     | Option           |
      | KeyDate_CodeKeyDateActionID                   | Renew            |
      | KeyDate_Description                           | Update Term 02   |
      | KeyDate_ActionDate                            | 01/01/2021       |
      | KeyDate_BeginDate                             | 01/02/2021       |
      | KeyDate_EndDate                               | 12/30/2021       |
      | _checkbox_KeyDate_NoticeSentFlag              | true             |
      | _checkbox_KeyDate_ActionComplete              | false            |
      | _checkbox_KeyDate_NoticeReceivedFlag          | true             |
      | NoticePeriod                                  | 5                |
      | KeyDate_CodeNoticePeriodUnitID                | Weeks            |
      | ActionPeriod                                  | 180              |
      | KeyDate_CodeActionPeriodUnitID                | Days             |
      | KeyDate_NoticeBeginDate                       |                  |
      | KeyDate_NoticeEndDate                         | 11/26/2020       |
      | KeyDate_TicklerDate                           | 05/30/2020       |
      | KeyDate_Notes                                 | Update Key dates |
      | ContractTerm_Section                          | T-03             |
      | ContractTerm_CovenantID                       | <SELECT>         |
      | ContractTerm_AmendmentID                      | [SELECT]         |
    And I verify the field "Length" is "11 months 29 days" in a same row in "Terms Page"
    And I click on the "Key Dates" tab
    And I click on row from grid "thisDiv" having unique value "Lease" under column header "Key Date Group"
      | name            | value          |
      | Key Date Type   | Option         |
      | Key Date Action | Renew          |
      | Description     | Update Term 02 |
      | Begin Date      | 01/02/2021     |
      | End Date        | 12/30/2021     |
      | Tickler Date    | 05/30/2020     |
    And I verify the following fields value on editable page
      | name                                 | value            |
      | KeyDate_CodeKeyDateGroupID           | Lease            |
      | KeyDate_CodeKeyDateTypeID            | Option           |
      | KeyDate_CodeKeyDateActionID          | Renew            |
      | KeyDate_Description                  | Update Term 02   |
      | KeyDate_ActionDate                   | 01/01/2021       |
      | KeyDate_BeginDate                    | 01/02/2021       |
      | KeyDate_EndDate                      | 12/30/2021       |
      | _checkbox_KeyDate_NoticeSentFlag     | true             |
      | _checkbox_KeyDate_ActionComplete     | false            |
      | _checkbox_KeyDate_NoticeReceivedFlag | true             |
      | NoticePeriod                         | 5                |
      | KeyDate_CodeNoticePeriodUnitID       | Weeks            |
      | ActionPeriod                         | 180              |
      | KeyDate_CodeActionPeriodUnitID       | Days             |
      | KeyDate_NoticeBeginDate              |                  |
      | KeyDate_NoticeEndDate                | 11/26/2020       |
      | KeyDate_TicklerDate                  | 05/30/2020       |
      | KeyDate_Notes                        | Update Key dates |

    And I verify the field "Length" is "11 months 29 days" in a same row in "Terms Page"


    Examples:
      | Login User | Login full username | Item     | Second Level Tab | Third Level Tab | Entity Name                               |
      | EditAccess | Edit Access Access  | Contract | Abstract Info    | Terms           | Spreadsheet Import-Contract-Testing-15278 |























#@all
#Feature: (Jira Ref. AUTOMATION-403) I create and update contract term and verify them in Contract> Abstract Info> Terms page
#
#  Scenario Outline: I create contract term through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/"
#    And I import following file name:
#      | Create_ContractTerm.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/Create_ContractTerm.xls"
##    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name                 | value                               |
#      | Term Number          | ContractTerm.ClientNumber           |
#      | Type                 | ContractTerm.CodeTermTypeID         |
#      | Status               | ContractTerm.CodeTermStatusID       |
#      | Include in Accruals? | ContractTerm.IncludeTermForAccruals |
#      | Begin Date           | KeyDate.BeginDate                   |
#      | End Date             | KeyDate.EndDate                     |
#      | Notice Begin Date    | KeyDate.NoticeBeginDate             |
#      | Notice End Date      | KeyDate.NoticeEndDate               |
#
##    Then I verify date values in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
##      | name              | value                   |
##      | Begin Date        | KeyDate.BeginDate       |
##      | End Date          | KeyDate.EndDate         |
##      | Notice Begin Date | KeyDate.NoticeBeginDate |
##      | Notice End Date   | KeyDate.NoticeEndDate   |
#    And I logout
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row | Grid Row | Grid ID |
#      | DeleteAccess | Delete Access Access | Contract | Abstract Info    | Terms           | Selenium-Contract | 6               | 2        | thisDiv |
#
#  Scenario Outline: I update contract term through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/"
#    And I import following file name:
##      | Update_ContractTerm.xls |
#      | Update_ContractTerm(2).xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I select last row from the grid "<Grid ID>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/Update_ContractTerm(2).xls"
#    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
#      | name                 | value                               |
#      | Term Number          | ContractTerm.ClientNumber           |
#      | Type                 | ContractTerm.CodeTermTypeID         |
#      | Status               | ContractTerm.CodeTermStatusID       |
#      | Begin Date           | KeyDate.BeginDate                   |
#      | End Date             | KeyDate.EndDate                     |
#      | Notice Begin Date    | KeyDate.NoticeBeginDate             |
#      | Notice End Date      | KeyDate.NoticeEndDate               |
#      | Include in Accruals? | ContractTerm.IncludeTermForAccruals |
##
##    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
##      | name                 | value                               |
##      | Include in Accruals? | ContractTerm.IncludeTermForAccruals |
#
##    And I select last row from the grid "<Grid ID>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Terms/Update_ContractTerm(2).xls"
#    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
#      | name                                          | value                               |
#      | ContractTerm_RentableArea                     | ContractTerm.RentableArea           |
#      | _checkbox_ContractTerm_IncludeTermForAccruals | ContractTerm.IncludeTermForAccruals |
#    And I logout
#
#    Examples:
#      | Login User | Login full username | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row | Grid Row | Grid ID |
#      | EditAccess | Edit Access Access  | Contract | Abstract Info    | Terms           | Selenium-Contract | 6               | 2        | thisDiv |