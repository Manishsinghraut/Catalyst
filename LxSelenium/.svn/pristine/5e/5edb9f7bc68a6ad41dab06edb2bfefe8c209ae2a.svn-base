@all
Feature: Apply Multiple Schedule Offsets (Ref : Jira Ticket No : Automation-653)

  Scenario Outline: I import file for Scheduled Offset Scenario 6 entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffSets/"
    And I import following file name:
      | SchedulesOffsetsScenario6.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Apply Multiple Schedule Offsets
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Scheduled Offset List" after navigation
    And I select a row from grid "thisDiv" having unique value "Vendor C" under column header "Vendor"
      | name       | value      |
      | Begin Date | 01/01/2010 |
    And I switch to default frame
    And I click on the "Apply Offsets" action panel button
    And I set following fields value on editable page
      | name      | value        |
      | beginDate | <Begin Date> |
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "5 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    Then I verify page title "Scheduled Offset List" after navigation
    And I select a row from grid "thisDiv" having unique value "$5,000.00" under column header "Total Amount"
      | name       | value      |
      | Begin Date | 01/01/2010 |

    And I switch to default frame
    And I verify Remaining Balance should be "$3,000.00"
    And I select a row from grid "thisDiv" having unique value "Vendor C" under column header "Vendor"
      | name       | value      |
      | Begin Date | 01/01/2010 |
    And I switch to default frame
    And I verify Remaining Balance should be "$900.00"
    And I switch to default frame
    And I click on the "Transactions" tab
    #And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffSets/ApplyMultipleScheduleOffsets.xlsx"
    #Changed Effective date to 02/01/2010 from 01/01/2010 in spread sheet IWMS-20866,
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffSets/ApplyMultipleScheduleOffsets.xls"
    And I verify the grid "thisDiv" values with the corresponding values in the "ApplyMultipleScheduleOffsets" excel 0
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                | Second Level Tab | Third Level Tab   | Begin Date | End Date   | Posting Date | Batch Date |
      | DeleteAccess | Delete Access Access | Contract | SchedulesOffsetsScenario 6 | Payment Info     | Scheduled Offsets | 01/01/2010 | 03/31/2014 | 02/06/2014   | 02/06/2014 |