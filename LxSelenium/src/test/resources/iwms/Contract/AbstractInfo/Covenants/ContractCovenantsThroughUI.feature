@all @smoke
Feature: (JIRA Ref: AUTOMATION-503) I create,update and delete contract Covenants and verify them in Contract> Abstract Info> Covenants page

  Scenario Outline: I create contract Covenants through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                             | value                     |
      | Covenant_CodeCovenantGroupID     | Lease                     |
      | Covenant_CodeCovenantTypeID      | Payments                  |
      | Covenant_CodeCovenantStatusID    | Review                    |
      | Covenant_CodeCovenantCategoryID  | Option                    |
      | Covenant_CovenantDate            | 05/15/2015                |
      | Covenant_AmendmentID             | 1234                      |
      | Covenant_Notes                   | Selenium Test note        |
      | Covenant_SectionNumber           | 4                         |
      | Covenant_StandardLanguageVersion | 777                       |
      | Covenant_CovenantArea            | 10000                     |
      | Covenant_CodeBuildingAreaUnitID  | Square Feet               |
      | Covenant_CovenantAmount          | $10000                    |
      | KeyDate_CodeKeyDateGroupID       | Lease                     |
      | KeyDate_CodeKeyDateTypeID        | Lease Term                |
      | KeyDate_CodeKeyDateActionID      | Renew                     |
      | KeyDate_Description              | Selenium Test Description |
      | KeyDate_BeginDate                | 05/15/2015                |
      | KeyDate_EndDate                  | 05/15/2016                |
      | NoticePeriod                     | 2                         |
      | KeyDate_CodeNoticePeriodUnitID   | Months                    |
      | KeyDate_NoticeBeginDate          | 05/15/2015                |
      | KeyDate_NoticeEndDate            | 05/15/2015                |
      | ActionPeriod                     | 2                         |
      | KeyDate_ActionDate               | 05/15/2015                |
      | KeyDate_CodeActionPeriodUnitID   | Months                    |
      | KeyDate_TicklerDate              | 05/15/2015                |
      | KeyDate_CodeFrequencyID          | Monthly                   |
      | KeyDate_Notes                    | Selenium key note         |
      | KeyDate_CodeActionPeriodUnitID   | Months                    |
      | KeyDate_TicklerDate              | 05/15/2015                |
      | KeyDate_CodeFrequencyID          | Monthly                   |
      | Covenant_PageNumber              | 2                         |
      | Covenant_ParagraphNumber         | 20                        |
      | Covenant_LineNumber              | 200                       |
      | Covenant_StandardLanguageVersion | 777                       |
      | Covenant_StandardLanguageVersion | 777                       |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
#    And I verify row from grid "<Grid ID>" having unique value "<Field>" under column header "Form/Version#"
    And I verify a row from grid "<Grid ID>" having unique value "<Field>" under column header "Form/Version#"
      | name               | value    |
      | Group              | Lease    |
      | Type               | Payments |
      | Category           | Option   |
      | Covenant Exists?   | No       |
      | Status             | Review   |
      | Standard Language? | No       |
      | Page               | 2        |
      | Section            | 4        |
    And I switch to default frame

  Examples:
    | Item     | Field | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
    | Contract | 777   | Abstract Info    | Covenants       | Selenium-Contract | Contract Covenants List | thisDiv |


  Scenario Outline: I apply folder template to contract entity
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to "Apply Folder Template" frame
    And I click "Apply Folder Template" button
    And I apply folder template from select field
      | name                   | value                    |
      | assignFolderTemplateID | Selenium Folder Template |
    And I click on the "Assign Folder Template"
#    And I see the assign template folder structure "SeleniumTestTemplateRootFolder1"
    And I switch to default frame

  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name       |
    | Contract | Details          | Documents       | Selenium-Contract |


  Scenario Outline: I ensure that the documents field is working correctly on the entity pages.
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "<Grid ID>" having unique value "<Field>" under column header "Form/Version#"
      | name               | value    |
      | Group              | Lease    |
      | Type               | Payments |
      | Category           | Option   |
      | Covenant Exists?   | No       |
      | Status             | Review   |
      | Standard Language? | No       |
      | Page               | 2        |
      | Section            | 4        |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/"
    And I attach following document files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/Covenants/":
      | Create_Covenant.xls |
    And I click on "Create_Covenant.xls" link
#    And I switch to default frame
#    And I logout


  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name       | Field | Grid ID |
    | Contract | Abstract Info    | Covenants       | Selenium-Contract | 777   | thisDiv |


  Scenario Outline: I update contract Covenants through UI
    Given I Login to IWMS using "EditAccess" access credentials
    Then I check previous user login "Edit Access Access" and continue if user "EditAccess" same or logout and login if not
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
#    And I click on the row of "<Field>" of column "6" from grid "id" "<Grid ID>"
    And I click on row from grid "<Grid ID>" having unique value "<Field>" under column header "Form/Version#"
      | name               | value    |
      | Group              | Lease    |
      | Type               | Payments |
      | Category           | Option   |
      | Covenant Exists?   | No       |
      | Status             | Review   |
      | Standard Language? | No       |
      | Page               | 2        |
      | Section            | 4        |
    And I set following fields value on editable page
      | name                | value                            |
      | KeyDate_Description | Update Selenium Test Description |
      | KeyDate_Notes       | Update Selenium key note         |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I logout

  Examples:
    | Item     | Field | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
    | Contract | 777   | Abstract Info    | Covenants       | Selenium-Contract | Contract Covenants List | thisDiv |

#  Scenario Outline: I save changes contract Covenants through UI
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I see the Dashboard
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    Then I verify page title "<Grid title>" after navigation
#    And I verify "Save Changes" button should be disabled initially on the action panel
##    And I click on the row of "<Field>" of column "6" from grid "id" "<Grid ID>"
#    And I click on row from grid "<Grid ID>" having unique value "<Field>" under column header "Form/Version#"
#      | name               | value    |
#      | Group              | Lease    |
#      | Type               | Payments |
#      | Category           | Option   |
#      | Covenant Exists?   | No       |
#      | Status             | Review   |
#      | Standard Language? | No       |
#      | Page               | 2        |
#      | Section            | 4        |
#    And I set following fields value on editable page
#      | name                          | value                                  |
#      | ContractAmendment_Description | Save Changes Selenium Test Description |
#      | ContractAmendment_Notes       | Save Changes Selenium Test Note        |
#    And I switch to default frame
#    And I click on the "<Third Level Tab>" tab
#    Then I verify page title "<Grid title>" after navigation
#    And I click on the "Ok" button from dailog
##    And I switch to default frame
##    And I logout
#
#    Examples:
#      | Field | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
#      | 777   | Abstract Info    | Covenants       | Selenium-Contract | Contract Covenants List | thisDiv |


  Scenario Outline: I delete contract Covenants through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
#    And I click on the row of "<Field>" of column "6" from grid "id" "<Grid ID>"
    And I click on row from grid "<Grid ID>" having unique value "<Field>" under column header "Form/Version#"
      | name               | value    |
      | Group              | Lease    |
      | Type               | Payments |
      | Category           | Option   |
      | Covenant Exists?   | No       |
      | Status             | Review   |
      | Standard Language? | No       |
      | Page               | 2        |
      | Section            | 4        |
    #And I click on the "Delete item" action panel button
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
#    And I logout

  Examples:
    | Item     | Field | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
    | Contract | 777   | Abstract Info    | Covenants       | Selenium-Contract | Contract Covenants List | thisDiv |
