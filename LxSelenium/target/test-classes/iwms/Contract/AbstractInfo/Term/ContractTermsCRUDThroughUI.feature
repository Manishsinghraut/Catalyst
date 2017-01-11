@all @smoke @smoke2
Feature: (Jira Ref. AUTOMATION-501) To ensure that users can add, edit, delete a contract term.

  Scenario Outline: I can add a contract term.
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    Then I verify page title "Contract Terms List" after navigation
    And I set fields values on editable page
      | name                                          | value                            |
      | ContractTerm_ClientNumber                     | 40                               |
      | ContractTerm_RentableArea                     | 4000                             |
      | _checkbox_ContractTerm_IncludeTermForAccruals | true                             |
      | KeyDate_Description                           | Description added                |
      | KeyDate_ActionDate                            | 12/31/2015                       |
      | KeyDate_BeginDate                             | 01/01/2014                       |
      | KeyDate_EndDate                               | 12/31/2016                       |
      | _checkbox_KeyDate_ActionComplete              | true                             |
      | _checkbox_KeyDate_NoticeReceivedFlag          | true                             |
      | _checkbox_KeyDate_NoticeSentFlag              | true                             |
      | NoticePeriod                                  | 2                                |
      | KeyDate_CodeNoticePeriodUnitID                | Months                           |
      | KeyDate_NoticeBeginDate                       | 12/31/2015                       |
      | KeyDate_NoticeEndDate                         | 04/15/2016                       |
      | ActionPeriod                                  | 1                                |
      | KeyDate_CodeActionPeriodUnitID                | Days                             |
      | KeyDate_TicklerDate                           | 12/31/2015                       |
      | KeyDate_Notes                                 | Contract Term Created through UI |

    And I set list fields values on editable page
      | name                                | value       |
      | ContractTerm_CodeTermTypeID         | Renewal     |
      | ContractTerm_CodeTermStatusID       | Available   |
      | ContractTerm_CodeBuildingAreaUnitID | Square Feet |
      | KeyDate_CodeKeyDateGroupID          | Lease       |
      | KeyDate_CodeKeyDateTypeID           | Lease Term  |

    And I click on the "Save Changes" action panel button
    And I verify a row from grid "<Grid ID>" having unique value "40" under column header "Term Number"
      | name                 | value      |
      | Term Number          | 40         |
      | Begin Date           | 01/01/2014 |
      | End Date             | 12/31/2016 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    | 12/31/2015 |
      | Notice End Date      | 04/15/2016 |
      | Status               | Available  |
      | Include in Accruals? | Yes        |
    And I logout

  Examples:
    | Second Level Tab | Third Level Tab | Entity Name       | Grid ID |
    | Abstract Info    | Terms           | Selenium-Contract | thisDiv |

  Scenario Outline: I can edit a contract term.
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
#    And I click row from grid "<Grid ID>" having unique value "40" under column header "Term Number"
    And I click on row from grid "<Grid ID>" having unique value "40" under column header "Term Number"
      | name                 | value      |
      | Term Number          | 40         |
      | Begin Date           | 01/01/2014 |
      | End Date             | 12/31/2016 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    | 12/31/2015 |
      | Notice End Date      | 04/15/2016 |
      | Status               | Available  |
      | Include in Accruals? | Yes        |

    And I set fields values on editable page
      | name                    | value                            |
      | KeyDate_Description     | Description updated              |
      | KeyDate_Notes           | Contract Term updated through UI |
      | KeyDate_NoticeBeginDate | 12/31/2015                       |
      | KeyDate_NoticeEndDate   | 04/15/2016                       |

    And I click on the "Save Changes" action panel button
    #Then I verify "Successfully updated Contract Term" message appear in top left corner of page
    And I click on row from grid "<Grid ID>" having unique value "40" under column header "Term Number"
      | name                 | value      |
      | Term Number          | 40         |
      | Begin Date           | 01/01/2014 |
      | End Date             | 12/31/2016 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    | 12/31/2015 |
      | Notice End Date      | 04/15/2016 |
      | Status               | Available  |
      | Include in Accruals? | Yes        |
    Then I verify the following fields value on editable page
      | name                | value                            |
      | KeyDate_Description | Description updated              |
      | KeyDate_Notes       | Contract Term updated through UI |
    And I logout

  Examples:
    | Second Level Tab | Third Level Tab | Entity Name       | Grid ID |
    | Abstract Info    | Terms           | Selenium-Contract | thisDiv |

  Scenario Outline: I can delete a contract term.
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Terms List" after navigation
#    And I click row from grid "<Grid ID>" having unique value "40" under column header "Term Number"
    And I click on row from grid "<Grid ID>" having unique value "40" under column header "Term Number"
      | name                 | value      |
      | Term Number          | 40         |
      | Begin Date           | 01/01/2014 |
      | End Date             | 12/31/2016 |
      | Type                 | Renewal    |
      | Amendment            |            |
      | Notice Begin Date    | 12/31/2015 |
      | Notice End Date      | 04/15/2016 |
      | Status               | Available  |
      | Include in Accruals? | Yes        |
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I wait for the Loading text to disappear
    #Then I verify "Successfully deleted Contract Term" message appear in top left corner of page
    Then I verify row from grid "<Grid ID>" having unique value "40" not present
    And I logout

  Examples:
    | Second Level Tab | Third Level Tab | Entity Name       | Grid ID |
    | Abstract Info    | Terms           | Selenium-Contract | thisDiv |