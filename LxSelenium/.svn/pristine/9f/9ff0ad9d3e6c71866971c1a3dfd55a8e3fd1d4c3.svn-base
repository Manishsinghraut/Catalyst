@all
Feature: Delete Dependencies on Task (Ref : Jira Ticket No : AUTOMATION-898)

  Scenario Outline: I import file for apply schedule template and Delete Dependencies project Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule"
    And I import following file name:
      | DeleteDependenciesEntity.xml    |
      | MultiplePredecessorTemplate.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Delete Dependency on Successor
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I drag the vertical split bar to right
    And I verify the task "Multiple Schedule Group 1" of F/A start date "01/01/2020" ,F/A end date "01/07/2020", BL start date "01/01/2020" and BL end date "01/07/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Multiple Schedule Group 2" of F/A start date "01/01/2020" ,F/A end date "01/07/2020", BL start date "01/01/2020" and BL end date "01/08/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Multiple Schedule Group 3" of F/A start date "01/01/2020" ,F/A end date "01/07/2020", BL start date "01/01/2020" and BL end date "01/07/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Multiple Schedule Group 4" of F/A start date "01/01/2020" ,F/A end date "01/08/2020", BL start date "01/01/2020" and BL end date "01/08/2020" shall be reflected correctly on spreed sheet
    Then I expand gantt chart
    And I right click on task "Mul Successor 1" and click on "Delete dependency..." then delete "Predecessor 1.1" dependency
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I right click on task "Mul Successor 1" and click on "Delete dependency..." then verify "Predecessor 1.1" dependency does not exist
#    And I double click on "Mul Successor 1" task
    And I open new task information pop up of "Mul Successor 1" task
    And I click on "Predecessors" tab
    And I verify "Predecessor 1.1" should not be displayed Predecessor tab
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                |
      | DeleteAccess | Delete Access Access | Delete Dependencies Entity |

  Scenario Outline: As a delete user I Delete Dependency on Predecessor
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I drag the vertical split bar to right
    And I verify the task "Multiple Schedule Group 1" of F/A start date "01/01/2020" ,F/A end date "01/07/2020", BL start date "01/01/2020" and BL end date "01/07/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Multiple Schedule Group 2" of F/A start date "01/01/2020" ,F/A end date "01/07/2020", BL start date "01/01/2020" and BL end date "01/08/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Multiple Schedule Group 3" of F/A start date "01/01/2020" ,F/A end date "01/07/2020", BL start date "01/01/2020" and BL end date "01/07/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Multiple Schedule Group 4" of F/A start date "01/01/2020" ,F/A end date "01/08/2020", BL start date "01/01/2020" and BL end date "01/08/2020" shall be reflected correctly on spreed sheet
    Then I expand gantt chart
    And I right click on task "Predecessor 2.1" and click on "Delete dependency..." then delete "Mul Successor 2" dependency
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I right click on task "Predecessor 2.1" and click on "Delete dependency..." then verify "Mul Successor 2" dependency does not exist
#    And I double click on "Predecessor 2.1" task
    And I open new task information pop up of "Predecessor 2.1" task
    And I click on "Predecessors" tab
    And I verify "Mul Successor 2" should not be displayed Predecessor tab
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                |
      | DeleteAccess | Delete Access Access | Delete Dependencies Entity |


  Scenario Outline: As a delete user I Delete Dependency on Independent Task
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    Then I expand gantt chart
    And I right click on task "Predecessor 1.1" and click on "Delete dependency..." then delete "Mul Successor 1" dependency
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I right click on task "Predecessor 1.1" and click on "Delete dependency..." then verify "Mul Successor 1" dependency does not exist
#    And I double click on "Predecessor 1.1" task
    And I open new task information pop up of "Predecessor 1.1" task
    And I click on "Predecessors" tab
    And I verify "Mul Successor 1" should not be displayed Predecessor tab
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                |
      | DeleteAccess | Delete Access Access | Delete Dependencies Entity |