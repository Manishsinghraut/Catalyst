@all
Feature: Schedule dates should be updated when using schedule import spreadsheet (Ref : Jira Ticket No : AUTOMATION-1325)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | TESTING_10948_Entity_1325.xml              |
      | ZZMultiplePredecessorRelationship_1325.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "A Multiple Predecessor Relationship" Template to Testing 10948 Location entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                               |
      | taskTemplateIDToAssign | ZZMultiple Predecessor Relationship |
      | startDate              | [CURRENT DATE]                      |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name                            |
    | TESTING-10948 Entity, DE United States |

  Scenario Outline: As a delete user I verify All the task should be in Not begun status
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I drag the vertical split bar to right
    And I verify the task name "ZMultiple Group 1", status "Not begun"
    And I verify the task name "zMultiple Predecessor 1.1", status "Not begun"
    And I verify the task name "zMultiple Predecessor 1.2", status "Not begun"
    And I verify the task name "zMultiple Successor 1", status "Not begun"


    And I verify the task name "zMultiple Group 2", status "Not begun"
    And I verify the task name "zMultiple Predecessor 2.1", status "Not begun"
    And I verify the task name "zMultiple Predecessor 2.2", status "Not begun"
    And I verify the task name "zMultiple Successor 2", status "Not begun"


    And I verify the task name "zMultiple Group 3", status "Not begun"
    And I verify the task name "zMultiple Predecessor 3.1", status "Not begun"
    And I verify the task name "zMultiple Predecessor 3.2", status "Not begun"
    And I verify the task name "zMultiple Successor 3", status "Not begun"

    And I verify the task name "zMultiple Group 4", status "Not begun"
    And I verify the task name "zMultiple Predecessor 4.1", status "Not begun"
    And I verify the task name "zMultiple Predecessor 4.2", status "Not begun"
    And I verify the task name "zMultiple Successor 4", status "Not begun"

    And I switch to default frame

  Examples:
    | Entity Name                            |
    | TESTING-10948 Entity, DE United States |


  Scenario Outline: I import the following files and verify All the task should be in completed status
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | ScheduleImportCompletedStatus_1325.xlsx |

    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I drag the vertical split bar to right
    And I verify the task name "ZMultiple Group 1", status "Completed"
    And I verify the task name "zMultiple Predecessor 1.1", status "Completed"
    And I verify the task name "zMultiple Predecessor 1.2", status "Completed"
    And I verify the task name "zMultiple Successor 1", status "Completed"


    And I verify the task name "zMultiple Group 2", status "Completed"
    And I verify the task name "zMultiple Predecessor 2.1", status "Completed"
    And I verify the task name "zMultiple Predecessor 2.2", status "Completed"
    And I verify the task name "zMultiple Successor 2", status "Completed"


    And I verify the task name "zMultiple Group 3", status "Completed"
    And I verify the task name "zMultiple Predecessor 3.1", status "Completed"
    And I verify the task name "zMultiple Predecessor 3.2", status "Completed"
    And I verify the task name "zMultiple Successor 3", status "Completed"

    And I verify the task name "zMultiple Group 4", status "Completed"
    And I verify the task name "zMultiple Predecessor 4.1", status "Completed"
    And I verify the task name "zMultiple Predecessor 4.2", status "Completed"
    And I verify the task name "zMultiple Successor 4", status "Completed"

  Examples:
    | Entity Name                            |
    | TESTING-10948 Entity, DE United States |