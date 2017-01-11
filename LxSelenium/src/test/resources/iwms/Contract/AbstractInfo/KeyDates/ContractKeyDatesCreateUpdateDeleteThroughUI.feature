@all @smoke @smoke2
Feature: I create,update and delete contract Key Dates and verify them in Contract> Abstract Info> Key Dates page (Ref : Jira Ticket No : AUTOMATION-504)

  Scenario Outline: I create contract Key Dates through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I switch to default frame
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                           | value                         |
      | KeyDate_CodeKeyDateGroupID     | Lease                         |
      | KeyDate_CodeKeyDateTypeID      | Lease Term                    |
      | KeyDate_CodeKeyDateActionID    | Renew                         |
      | KeyDate_Description            | Selenium Key Date Description |
      | KeyDate_BeginDate              | 05/15/2015                    |
      | KeyDate_EndDate                | 05/15/2016                    |
      | NoticePeriod                   | 2                             |
      | KeyDate_CodeNoticePeriodUnitID | Months                        |
      | KeyDate_NoticeBeginDate        | 05/15/2015                    |
      | KeyDate_NoticeEndDate          | 05/15/2015                    |
      | ActionPeriod                   | 2                             |
      | KeyDate_ActionDate             | 05/15/2015                    |
      | KeyDate_CodeActionPeriodUnitID | Months                        |
      | KeyDate_TicklerDate            | 05/15/2015                    |
      | KeyDate_CodeFrequencyID        | Monthly                       |
      | KeyDate_Notes                  | Selenium key note             |
      | KeyDate_CodeActionPeriodUnitID | Months                        |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
#    And I click on the "<Third Level Tab>" tab
#    And I verify row from grid "<Grid ID>" having unique value "Selenium Key Date Description"
    And I verify a row from grid "<Grid ID>" having unique value "Selenium Key Date Description" under column header "Description"
      | name            | value      |
      | Key Date Group  | Lease      |
      | Key Date Type   | Lease Term |
      | Key Date Action | Renew      |
      | Description     | Selenium Key Date Description |
      | Begin Date      | 05/15/2015 |
      | End Date        | 05/15/2016 |
      | Tickler Date    | 05/15/2015 |
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
      | Abstract Info    | Key Dates       | Selenium-Contract | Contract Key Dates List | thisDiv |

  Scenario Outline: I update contract Key Dates through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
#    And I click on the row of "Selenium Key Date Description" of column "3" from grid "id" "<Grid ID>"
    And I verify a row from grid "<Grid ID>" having unique value "Selenium Key Date Description" under column header "Description"
      | name            | value      |
      | Key Date Group  | Lease      |
      | Key Date Type   | Lease Term |
      | Key Date Action | Renew      |
#      | Description     | Selenium Key Date Description |
      | Begin Date      | 05/15/2015 |
      | End Date        | 05/15/2016 |
      | Tickler Date    | 05/15/2015 |
    And I set following fields value on editable page
      | name                | value                                |
      | KeyDate_Description | Update Selenium Key Date Description |
      | KeyDate_Notes       | Update Selenium Test Note            |
    And I click on the "Save Changes" action panel button
#    And I click on the "<Third Level Tab>" tab
#    And I verify row from grid "<Grid ID>" having unique value "Update Selenium Key Date Description"
    And I verify a row from grid "<Grid ID>" having unique value "Update Selenium Key Date Description" under column header "Description"
      | name            | value      |
      | Key Date Group  | Lease      |
      | Key Date Type   | Lease Term |
      | Key Date Action | Renew      |
#      | Description     | Update Selenium Key Date Description |
      | Begin Date      | 05/15/2015 |
      | End Date        | 05/15/2016 |
      | Tickler Date    | 05/15/2015 |
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
      | Abstract Info    | Key Dates       | Selenium-Contract | Contract Key Dates List | thisDiv |

  Scenario Outline: I Delete contract Key Dates through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
#    And I click on the row of "Update Selenium Key Date Description" of column "3" from grid "id" "<Grid ID>"
#    And I switch to default frame
    And I click on row from grid "<Grid ID>" having unique value "Update Selenium Key Date Description" under column header "Description"
      | name            | value      |
      | Key Date Group  | Lease      |
      | Key Date Type   | Lease Term |
      | Key Date Action | Renew      |
#      | Description     | Update Selenium Key Date Description |
      | Begin Date      | 05/15/2015 |
      | End Date        | 05/15/2016 |
      | Tickler Date    | 05/15/2015 |
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "Update Selenium Key Date Description" not present
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
      | Abstract Info    | Key Dates       | Selenium-Contract | Contract Key Dates List | thisDiv |
