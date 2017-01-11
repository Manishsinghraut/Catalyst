@all
Feature: (Ref : Jira Ticket No : AUTOMATION-899) Applying a Template with a Predecessor Task from the same Template

  Scenario Outline: I import file for apply ScheduleTemplateWithPredecessor template and Parcel-Schedule with Predecessor Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/Details/Schedule/"
    And I import following file name:
      | ParcelScheduleWithPredecessor.xml   |
      | ScheduleTemplateWithPredecessor.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Applying a Template with a Predecessor Task from the same Template and verify on predecessors tab
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I verify the task "Predecessor Group" of F/A start date "01/01/2020" ,F/A end date "01/06/2020", BL start date "01/01/2020" and BL end date "01/06/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Successor Group" of F/A start date "01/08/2020" ,F/A end date "01/13/2020", BL start date "01/08/2020" and BL end date "01/13/2020" shall be reflected correctly on spreed sheet
    Then I expand gantt chart
    And I double click on "Task A Successor" task
    And I click on "Predecessors" tab
    And I verify "Task A Predecessor" should be displayed Predecessor tab
    And I verify "Task B Predecessor" should be displayed Predecessor tab
    And I verify "Task D Predecessor" should be displayed Predecessor tab
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                      |
    | DeleteAccess | Delete Access Access | Parcel-Schedule with Predecessor |


  Scenario Outline: As a delete user I Applying a Template with a Predecessor Task from the same Template and verify on task bar
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    Then I expand gantt chart
    And I verify "Task A Predecessor" should be displayed task bar
    And I verify "Task B Predecessor" should be displayed task bar
    And I verify "Task D Predecessor" should be displayed task bar
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                      |
    | DeleteAccess | Delete Access Access | Parcel-Schedule with Predecessor |
