@all
Feature: Apply a Schedule template with Multiple Predecessor on Entity (Ref : Jira Ticket No : AUTOMATION-881)

  Scenario Outline: I import file for apply a Schedule template with Multiple Predecessor on Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | ApplyMultiplePredecessorEntity.xml |
      | MultiplePredecessorTemplate.xml    |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify the Multiple predecessor Template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Multiple Predecessor Template" from Schedule Template dropdown list
    And I click on "Predecessor 1.1" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 1.1 |
    And I click on the "Close" button
    And I click on "Predecessor 1.2" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 1.2 |
    And I click on the "Close" button
    And I click on "Mul Successor 1" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Mul Successor 1 |
    And I click on the "Close" button
    And I click on "Predecessor 2.1" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 2.1 |
    And I click on the "Close" button
    And I click on "Predecessor 2.2" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 2.2 |
    And I click on the "Close" button
    And I click on "Mul Successor 2" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Mul Successor 2 |
    And I click on the "Close" button
    And I click on "Predecessor 3.1" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 3.1 |
    And I click on the "Close" button
    And I click on "Predecessor 3.2" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 3.2 |
    And I click on the "Close" button
    And I click on "Mul Successor 3" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Mul Successor 3 |
    And I click on the "Close" button
    And I click on "Predecessor 4.1" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 4.1 |
    And I click on the "Close" button

    And I click on "Predecessor 4.2" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Predecessor 4.2 |
    And I click on the "Close" button
    And I click on "Mul Successor 4" link
    Then I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Mul Successor 4 |
    And I click on the "Close" button
    And I navigate to the admin dashboard
    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user applying a Multiple Predecessor Template to ApplyMultiplePredecessorEntity entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                         |
      | taskTemplateIDToAssign | Multiple Predecessor Template |
      | startDate              | 01/01/2020                    |
    And I click on the "Append Schedule Template" button

    Examples:
      | Login User   | Login full username  | Entity Name                    |
      | DeleteAccess | Delete Access Access | ApplyMultiplePredecessorEntity |

  Scenario Outline: As a delete user Applying a Template with a Predecessor Task from the Diffrent Template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I wait for the Loading text to disappear
#    And I verify the task "Predecessor 1.1" of Status "Not begun" , Done "0" , F/A start date "01/01/2020" ,F/A end date "01/01/2020", F/A Duration "1 day", BL start date "01/01/2020" and BL end date "01/01/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Predecessor 1.2" of Status "Not begun" , Done "0" , F/A start date "01/03/2020" ,F/A end date "01/03/2020", F/A Duration "1 day", BL start date "01/03/2020" and BL end date "01/03/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Mul Successor 1" of Status "Not begun" , Done "0" , F/A start date "01/07/2020" ,F/A end date "01/07/2020", F/A Duration "1 day", BL start date "01/07/2020" and BL end date "01/07/2020" shall be reflected correctly on spreed sheet
#
#    And I verify the task "Predecessor 2.1" of Status "Not begun" , Done "0" , F/A start date "01/01/2020" ,F/A end date "01/01/2020", F/A Duration "1 day", BL start date "01/01/2020" and BL end date "01/01/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Predecessor 2.2" of Status "Not begun" , Done "0" , F/A start date "01/03/2020" ,F/A end date "01/06/2020", F/A Duration "2 days", BL start date "01/03/2020" and BL end date "01/06/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Mul Successor 2" of Status "Not begun" , Done "0" , F/A start date "01/07/2020" ,F/A end date "01/07/2020", F/A Duration "1 day", BL start date "01/08/2020" and BL end date "01/08/2020" shall be reflected correctly on spreed sheet
#
#    And I verify the task "Predecessor 3.1" of Status "Not begun" , Done "0" , F/A start date "01/01/2020" ,F/A end date "01/02/2020", F/A Duration "2 days", BL start date "01/01/2020" and BL end date "01/02/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Predecessor 3.2" of Status "Not begun" , Done "0" , F/A start date "01/03/2020" ,F/A end date "01/06/2020", F/A Duration "2 days", BL start date "01/03/2020" and BL end date "01/06/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Mul Successor 3" of Status "Not begun" , Done "0" , F/A start date "01/07/2020" ,F/A end date "01/07/2020", F/A Duration "1 day", BL start date "01/07/2020" and BL end date "01/07/2020" shall be reflected correctly on spreed sheet
#
#    And I verify the task "Predecessor 4.1" of Status "Not begun" , Done "0" , F/A start date "01/01/2020" ,F/A end date "01/01/2020", F/A Duration "1 day", BL start date "01/01/2020" and BL end date "01/01/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Predecessor 4.2" of Status "Not begun" , Done "0" , F/A start date "01/03/2020" ,F/A end date "01/06/2020", F/A Duration "2 days", BL start date "01/03/2020" and BL end date "01/06/2020" shall be reflected correctly on spreed sheet
#    And I verify the task "Mul Successor 4" of Status "Not begun" , Done "0" , F/A start date "01/08/2020" ,F/A end date "01/08/2020", F/A Duration "1 day", BL start date "01/08/2020" and BL end date "01/08/2020" shall be reflected correctly on spreed sheet

    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name       | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | BL Start   | BL End     |
      | Predecessor 1.1 |           | Not begun | 0      | 01/01/2020 | 01/01/2020 | 1 day        | 01/01/2020 | 01/01/2020 |
      | Predecessor 1.2 |           | Not begun | 0      | 01/03/2020 | 01/03/2020 | 1 day        | 01/03/2020 | 01/03/2020 |
      | Mul Successor 1 |           | Not begun | 0      | 01/07/2020 | 01/07/2020 | 1 day        | 01/07/2020 | 01/07/2020 |

      | Predecessor 2.1 |           | Not begun | 0      | 01/01/2020 | 01/01/2020 | 1 day        | 01/01/2020 | 01/01/2020 |
      | Predecessor 2.2 |           | Not begun | 0      | 01/03/2020 | 01/06/2020 | 2 days       | 01/03/2020 | 01/06/2020 |
      | Mul Successor 2 |           | Not begun | 0      | 01/07/2020 | 01/07/2020 | 1 day        | 01/08/2020 | 01/08/2020 |

      | Predecessor 3.1 |           | Not begun | 0      | 01/01/2020 | 01/02/2020 | 2 days       | 01/01/2020 | 01/02/2020 |
      | Predecessor 3.2 |           | Not begun | 0      | 01/03/2020 | 01/06/2020 | 2 days       | 01/03/2020 | 01/06/2020 |
      | Mul Successor 3 |           | Not begun | 0      | 01/07/2020 | 01/07/2020 | 1 day        | 01/07/2020 | 01/07/2020 |

      | Predecessor 4.1 |           | Not begun | 0      | 01/01/2020 | 01/01/2020 | 1 day        | 01/01/2020 | 01/01/2020 |
      | Predecessor 4.2 |           | Not begun | 0      | 01/03/2020 | 01/06/2020 | 2 days       | 01/03/2020 | 01/06/2020 |
      | Mul Successor 4 |           | Not begun | 0      | 01/08/2020 | 01/08/2020 | 1 day        | 01/08/2020 | 01/08/2020 |

    And I double click on "Mul Successor 1" task
    And I click on "Predecessors" tab
    And I verify "Predecessor 1.1" should be displayed Predecessor tab
    And I verify "Predecessor 1.2" should be displayed Predecessor tab
    And I click "Cancel" button

    And I double click on "Predecessor 2.1" task
    And I click on "Successors" tab
    And I verify "Mul Successor 2" should be displayed Successors tab
    And I click "Cancel" button

    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                    |
      | DeleteAccess | Delete Access Access | ApplyMultiplePredecessorEntity |