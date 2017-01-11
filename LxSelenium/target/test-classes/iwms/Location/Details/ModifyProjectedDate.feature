@all
Feature: Modify Projected Date (Ref : Jira Ticket No : AUTOMATION-874)

  Scenario Outline: I import file for Projected Date Change Schedule location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details"
    And I import following file name:
      | ProjectedDateChangeSchedule.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |
#
#  Scenario: As a delete user configure Projected Dates Security
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    Then I see the Dashboard
#    And I navigate to the admin dashboard
#    And I click on the "Manage Security" link
#    And I click on the "Field Security" tab
#    When I set following fields value on editable page
#      | name      | value         |
#      | UserClass | Delete Access |
#    And I click on the Apply Changes button

  Scenario Outline: As a delete user should self populate the "forecast/actual end" date.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "PR Independent Task 1" task
    When I set following fields value on editable page
      | name               | value      |
      | ProjectedStartDate | 12/24/2020 |
      | ProjectedEndDate   | 12/24/2020 |
    And I click "Ok" button
    And I double click on "PR Independent Task 1" task
    When I verify the following fields value on editable page
      | name               | value      |
      | ProjectedStartDate | 12/24/2020 |
      | ProjectedEndDate   | 12/24/2020 |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                    |
      | DeleteAccess | Delete Access Access | Projected Date Change Schedule |

  Scenario Outline: As a delete user When Projected 'Ends' date is edited for a Predecessor task it reflects the changes on the Projected Start Date and Projected End Date of the Successor Task i.e PR Dependent Task 1
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "PR Dependent Task 1" task
    When I verify the following fields value on editable page
      | name               | value      |
      | ProjectedStartDate | 12/28/2020 |
      | ProjectedEndDate   | 12/28/2020 |
    And I click on "Predecessors" tab
    And I verify the lead lag days "3 days"
    And I click "Cancel" button
    And I double click on "PR Independent Task 2" task
    When I set following fields value on editable page
      | name               | value      |
      | ProjectedStartDate | 12/24/2020 |
      | ProjectedEndDate   | 12/24/2020 |
    And I click "Ok" button
    And I switch to default frame
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "PR Dependent Task 1" task
    Then I verify the following fields value on editable page
      | name               | value      |
      | ProjectedStartDate | 12/30/2020 |
      | ProjectedEndDate   | 12/30/2020 |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                    |
      | DeleteAccess | Delete Access Access | Projected Date Change Schedule |