@all
Feature: Manage Fiscal Calendar (Ref : Jira Ticket No : AUTOMATION-795)

  Scenario Outline: Manage Fiscal Calendar
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Fiscal Calendar" link
    And I enter "Multi-Period Add (equal period length):" of "Year" "2015" and "TotalPeriods" "12"
    And I enter Multi-Period Add by weeks of "Year" "2015" and "weeksInQuarter" "4-4-5"
    And I enter year "2015", Fiscal Year Start "01/04/2015", Weeks each period "4","4","5","4","4","5","5","5","4","4","4","4"
    And I click on "Create Periods for Year"
    And I verify the following message "Successfully added fiscal periods for year 2015"
    And I verify a row from non frame grid "<Grid>" having unique value "2015" under column header "Year"
#    And I verify a row in grid "<Grid>" having unique value "2015" under column header "Year"
      | name              | value                              |
      | Year              | 2015                               |
      | Begin Date        | 01/04/2015                         |
      | End Date          | 01/02/2016                         |
      | Number of Periods | 12                                 |
      | Type              | 4 or 5 week periods in fiscal year |
    And I verify a row from non frame grid "periodGrid" having unique value "01/04/2015" under column header "Begin Date"
      | name       | value      |
      | Year       | 2015       |
      | Quarter    | 1          |
      | Period     | 1          |
      | Begin Date | 01/04/2015 |
      | End Date   | 01/31/2015 |
      | Days       | 28         |
      | Weeks      | 4.00       |


  Examples:
    | Login User   | Login full username  | Grid     |
    | DeleteAccess | Delete Access Access | yearGrid |
