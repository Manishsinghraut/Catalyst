@all
Feature: (Ref : Jira Ticket No : Automation-690) Negative - Changing Status for All Contracts and specifying SL Schedule type

  Scenario Outline: I import file for Calculate a Straight Line Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | NegativeChangingStatus.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: (Ref : Jira Ticket No : Automation-690) Negative - Changing Status for All Contracts and specifying SL Schedule type
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "Contract" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I click on row from grid "thisDiv" having unique value "<Schedule>" under column header "Name"
      | name             | value       |
      | Begin Date       | 01/01/2010  |
      | End Date         | 12/31/2020  |
      | Term Length      | 132.00      |
      | Balance Forward  | $0.00       |
      | Total Commitment | $132,000.00 |

    And I click on the "Change Status" action panel button
    And I see the "Change Status" modal window
    And I set following fields value on editable page
      | name             | value         |
      | desiredStatus    | Posted        |
      | minDate          | 01/01/2010    |
      | maxDate          | 05/05/2015    |
      | CodeSLScheduleID | <Schedule>    |
      | desiredEntity    | All Contracts |
    And I click on the "Update" button
    And I see "You must select a single Contract to update a particular Schedule or don't select a Schedule to update All Contracts" message in the header
    And I click on the "Close" button

    Examples:
      | Schedule                | Login User | Login full username | Entity Name              |
#      | Create Base Rent SL-690 | DeleteAccess | Delete Access Access | Negative Changing Status |
      | Create Base Rent SL-690 | LxSelenium | Selenium Tester     | Negative Changing Status |



#  @all
#  Feature: (Ref : Jira Ticket No : Automation-690) Negative - Changing Status for All Contracts and specifying SL Schedule type
#
#  Scenario Outline: I import file for Calculate a Straight Line Schedule
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
#    And I import following file name:
#      | CalculateStraightLineSchedule.xml |
#
#    Examples:
#      | Login User   | Login full username  |
#      | DeleteAccess | Delete Access Access |
#
#
#  Scenario Outline: (Ref : Jira Ticket No : Automation-690) Negative - Changing Status for All Contracts and specifying SL Schedule type
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    When I navigate to entity type "Contract" named "<Entity Name>"
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
#    And I click on row from grid "thisDiv" having unique value "Create Base Rent SL" under column header "Name"
#      | name             | value       |
#      | Begin Date       | 01/01/2010  |
#      | End Date         | 12/31/2020  |
#      | Term Length      | 132.00      |
#      | Balance Forward  | $0.00       |
#      | Total Commitment | $132,000.00 |
#
#    And I click on the "Change Status" action panel button
#    And I see the "Change Status" modal window
#    And I set following fields value on editable page
#      | name             | value         |
#      | desiredStatus    | Posted        |
#      | minDate          | 01/01/2010    |
#      | maxDate          | 05/05/2015    |
#      | CodeSLScheduleID | <Schedule>    |
#      | desiredEntity    | All Contracts |
#    And I click on the "Update" button
#    And I see "You must select a single Contract to update a particular Schedule or don't select a Schedule to update All Contracts" message in the header
#    And I click on the "Close" button
#
#    Examples:
#      | Schedule            | Login User   | Login full username  | Entity Name                      |
#      | Create Base Rent SL | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule |
##      | Create Base Rent SL | LxSelenium | Selenium Tester     | Calculate Straight Line Schedule |

