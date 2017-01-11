@all
Feature: Modify Baseline Dates (Ref : Jira Ticket No : AUTOMATION-872)

  Scenario Outline: As a delete user I import xml for Baseline Date Change Schedule entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Facility/Detals/Schedule/"
    And I import following file name:
      | BaselineDateChangeSchedule.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user baseline 'Start' date is edited for a Non dependent task it doses not self populates the 'ends' date
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
#    And I switch to visible frame
    And I expand gantt chart
    And I open new task information pop up of "Independent Task1" task
#    And I double click on "Independent Task1" task
    When I set following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 12/24/2020 |
      | OriginalEndDate   | 12/25/2020 |
    And I click on "Predecessors" tab
    And I click "Ok" button
#    And I switch to default frame
    And I click on the "Spread Sheet" action panel button
#    And I switch to visible frame
    And I expand gantt chart
    And I verify the Baseline Start Date "12/24/2020" and End "12/25/2020" for task "Independent Task1" should be modified successfully
    And I switch to default frame
    And I click on the "Gantt" action panel button

    Examples:
      | Login User   | Login full username  | Entity Name                   | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Baseline Date Change Schedule | Details          | Schedule        |


  Scenario Outline: As a delete user Baseline 'Ends' date is edited for a Predecessor task it reflects the changes on the Baseline Start Date and End
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I expand gantt chart
#    And I double click on "Dependent Task1" task
    And I open new task information pop up of "Dependent Task1" task
    When I verify the following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 12/30/2020 |
      | OriginalEndDate   | 12/31/2020 |
    And I click on "Predecessors" tab
    And I verify the lead lag days "3 days"
    And I click "Cancel" button
#    And I double click on "Independent Task2" task
    And I open new task information pop up of "Independent Task2" task
    When I set following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 12/24/2020 |
      | OriginalEndDate   | 12/25/2020 |
    And I click on "Predecessors" tab
    And I click "Ok" button
    And I open new task information pop up of "Dependent Task1" task
    When I verify the following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 12/31/2020 |
      | OriginalEndDate   | 01/01/2021 |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                   | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Baseline Date Change Schedule | Details          | Schedule        |

  Scenario Outline: As a delete user I import xml for TaskBarViewDependentTaskProject entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Facility/Detals/Schedule/"
    And I import following file name:
      | BaselineDateChangeSchedule.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

