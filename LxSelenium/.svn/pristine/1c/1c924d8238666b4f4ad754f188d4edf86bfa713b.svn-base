@all
Feature: Covenants Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1190)

  Scenario Outline: I import the  Spreadsheet Import-Contract entity and Covenants Rec ID Report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Spreadsheet_Import__Contract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/"
    And I import following file name:
      | CovenantsRecIDReport_1190.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I Covenants Spreadsheet - Create/Update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/"
    And I import following file name:
      | CreateCovenants_1190.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Notices" under column header "Type"
      | name               | value   |
      | Group              | Lease   |
      | Type               | Notices |
      | Category           | Lease   |
      | Covenant Exists?   | Yes     |
      | Status             | Review  |
      | Standard Language? | Yes     |
      | Form/Version#      | 111     |
      | Page               | 45      |
      | Section            | 33      |
    And I verify the following fields value on editable page
      | name                                    | value                      |
      | Covenant_CodeCovenantGroupID            | Lease                      |
      | Covenant_CodeCovenantTypeID             | Notices                    |
      | Covenant_CodeCovenantStatusID           | Review                     |
      | Covenant_CodeCovenantCategoryID         | Lease                      |
      | Covenant_CovenantDate                   | 12/12/2012                 |
      | Covenant_AmendmentID                    | [SELECT]                   |
      | Covenant_Notes                          |                            |
      | Covenant_SectionNumber                  | 33                         |
      | _checkbox_Covenant_StandardLanguageFlag | true                       |
      | Covenant_StandardLanguageVersion        | 111                        |
      | Covenant_CovenantArea                   | 40,000                     |
      | Covenant_CodeBuildingAreaUnitID         | Square Feet                |
      | Covenant_CovenantAmount                 | $200.00                    |
      | KeyDate_CodeKeyDateGroupID              | [SELECT]                   |
      | KeyDate_CodeKeyDateTypeID               | [SELECT]                   |
      | KeyDate_CodeKeyDateActionID             | Renew                      |
      | KeyDate_Description                     | Create Line Item           |
      | KeyDate_ActionDate                      | 01/01/2000                 |
      | KeyDate_BeginDate                       | 01/01/2001                 |
      | KeyDate_EndDate                         | 12/31/2035                 |
      | _checkbox_KeyDate_ActionComplete        | false                      |
      | NoticePeriod                            | -7,305                     |
      | KeyDate_CodeNoticePeriodUnitID          | Days                       |
      | KeyDate_NoticeBeginDate                 | 10/10/2012                 |
      | KeyDate_NoticeEndDate                   | 12/31/2020                 |
      | ActionPeriod                            | 333                        |
      | KeyDate_CodeActionPeriodUnitID          | Days                       |
      | KeyDate_TicklerDate                     | 02/02/2020                 |
      | KeyDate_CodeFrequencyID                 | Monthly                    |
      | KeyDate_Notes                           | Create Notes for Key dates |
      | _checkbox_KeyDate_NoticeSentFlag        | false                      |
      | _checkbox_KeyDate_NoticeReceivedFlag    | true                       |
      | Covenant_PageNumber                     | 45                         |
      | Covenant_ParagraphNumber                | 2                          |
      | Covenant_LineNumber                     | 5                          |

    And I verify a row from grid "<grid>" having unique value "Payments" under column header "Type"
      | name               | value    |
      | Group              | Lease    |
      | Type               | Payments |
      | Category           | Option   |
      | Covenant Exists?   | Yes      |
      | Status             | Review   |
      | Standard Language? | Yes      |
      | Form/Version#      | 222      |
      | Page               | 49       |
      | Section            | 45       |
    And I verify the following fields value on editable page
      | name                                    | value                      |
      | Covenant_CodeCovenantGroupID            | Lease                      |
      | Covenant_CodeCovenantTypeID             | Payments                   |
      | Covenant_CodeCovenantStatusID           | Review                     |
      | Covenant_CodeCovenantCategoryID         | Option                     |
      | Covenant_CovenantDate                   | 11/11/2019                 |
      | Covenant_AmendmentID                    | [SELECT]                   |
      | _checkbox_Covenant_ExistsFlag           | true                       |
      | Covenant_Notes                          |                            |
      | Covenant_SectionNumber                  | 45                         |
      | _checkbox_Covenant_StandardLanguageFlag | true                       |
      | Covenant_StandardLanguageVersion        | 222                        |
      | Covenant_CovenantArea                   | 50,000                     |
      | Covenant_CodeBuildingAreaUnitID         | Square Feet                |
      | Covenant_CovenantAmount                 | $300.00                    |
      | KeyDate_CodeKeyDateGroupID              | [SELECT]                   |
      | KeyDate_CodeKeyDateTypeID               | [SELECT]                   |
      | KeyDate_CodeKeyDateActionID             | Renew                      |
      | KeyDate_Description                     | Create Line Item           |
      | KeyDate_ActionDate                      | 12/31/2001                 |
      | KeyDate_BeginDate                       | 01/01/2002                 |
      | KeyDate_EndDate                         | 12/31/2020                 |
      | _checkbox_KeyDate_ActionComplete        | false                      |
      | NoticePeriod                            | -1,513                     |
      | KeyDate_CodeNoticePeriodUnitID          | Weeks                      |
      | KeyDate_NoticeBeginDate                 | 11/11/2011                 |
      | KeyDate_NoticeEndDate                   | 12/31/2030                 |
      | ActionPeriod                            | 1,614                      |
      | KeyDate_CodeActionPeriodUnitID          | Days                       |
      | KeyDate_TicklerDate                     | 07/31/2026                 |
      | KeyDate_CodeFrequencyID                 | Semi-Annually              |
      | KeyDate_Notes                           | Create Notes for Key dates |
      | _checkbox_KeyDate_NoticeSentFlag        | false                      |
      | _checkbox_KeyDate_NoticeReceivedFlag    | true                       |
      | Covenant_PageNumber                     | 49                         |
      | Covenant_ParagraphNumber                | 4                          |
      | Covenant_LineNumber                     | 6                          |

    And I switch to default frame
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/"
    And I import following file name:
      | CovenantsRecIDReport_1190.xml |
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value                   |
      | Report Name | Covenants Rec ID Report |
    And I switch to "build layout" child window
    And I verify Name "Spreadsheet Import-Contract-Testing-15278", 	Covenant Category "Option" and extract Covenant RecID on report window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/UpdateCovenants_1190.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I switch to main window
    And I close report window
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/"
    And I import following file name:
      | UpdateCovenants_1190.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Payments" under column header "Type"
      | name               | value    |
      | Group              | Lease    |
      | Type               | Payments |
      | Category           | Lease    |
      | Covenant Exists?   | No       |
      | Status             | Review   |
      | Standard Language? | No       |
      | Form/Version#      | 221      |
      | Page               | 50       |
      | Section            | 46       |
    And I verify the following fields value on editable page
      | name                                    | value                      |
      | Covenant_CodeCovenantGroupID            | Lease                      |
      | Covenant_CodeCovenantTypeID             | Payments                   |
      | Covenant_CodeCovenantStatusID           | Review                     |
      | Covenant_CodeCovenantCategoryID         | Lease                      |
      | Covenant_CovenantDate                   | 11/11/2019                 |
      | Covenant_AmendmentID                    | [SELECT]                   |
      | _checkbox_Covenant_ExistsFlag           | false                      |
      | Covenant_Notes                          |                            |
      | Covenant_SectionNumber                  | 46                         |
      | _checkbox_Covenant_StandardLanguageFlag | false                      |
      | Covenant_StandardLanguageVersion        | 221                        |
      | Covenant_CovenantArea                   | 70,000                     |
      | Covenant_CodeBuildingAreaUnitID         | Square Feet                |
      | Covenant_CovenantAmount                 | $800.00                    |
      | KeyDate_CodeKeyDateGroupID              | [SELECT]                   |
      | KeyDate_CodeKeyDateTypeID               | [SELECT]                   |
      | KeyDate_CodeKeyDateActionID             | Renew                      |
      | KeyDate_Description                     | Create Line Item           |
      | KeyDate_ActionDate                      | 12/31/2001                 |
      | KeyDate_BeginDate                       | 01/01/2002                 |
      | KeyDate_EndDate                         | 12/31/2020                 |
      | _checkbox_KeyDate_ActionComplete        | false                      |
      | NoticePeriod                            | -1,513                     |
      | KeyDate_CodeNoticePeriodUnitID          | Weeks                      |
      | KeyDate_NoticeBeginDate                 | 11/11/2011                 |
      | KeyDate_NoticeEndDate                   | 12/31/2030                 |
      | ActionPeriod                            | 1,614                      |
      | KeyDate_CodeActionPeriodUnitID          | Days                       |
      | KeyDate_TicklerDate                     | 07/31/2026                 |
      | KeyDate_CodeFrequencyID                 | Semi-Annually              |
      | KeyDate_Notes                           | Create Notes for Key dates |
      | _checkbox_KeyDate_NoticeSentFlag        | false                      |
      | _checkbox_KeyDate_NoticeReceivedFlag    | true                       |
      | Covenant_PageNumber                     | 50                         |
      | Covenant_ParagraphNumber                | 5                          |
      | Covenant_LineNumber                     | 6                          |
    And I switch to default frame

    Examples:
      | Entity Name                               | Secondary Tab | Third Level Tab | grid    | Reports Grid ID |
      | Spreadsheet Import-Contract-Testing-15278 | Abstract Info | Covenants       | thisDiv | ^editBOGrid     |
