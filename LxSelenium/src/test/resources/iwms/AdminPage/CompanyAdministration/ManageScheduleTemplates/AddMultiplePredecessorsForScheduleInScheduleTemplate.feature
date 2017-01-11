@all
Feature: As a Delete user I Add multiple predecessors for Schedule in Schedule template (Ref : Jira Ticket No : Automation-584)

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | AddMultiplePredecessorsForScheduleInScheduleTemplate.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline:I Add multiple predecessors for Schedule in Schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template>" from the list
    And I click on "<Task Name>" link
    Then I set following fields value on editable page
      | name                   | value |
      | RadioPredecessorTaskID | true  |
      | OriginalDuration       | 100   |
    And I click on the "Add" button
    Then I set following fields value on editable page
      | name                                    | value                         |
      | TaskPredecessor_PredecessorTaskIDOrName | A/E Contracts for Real Estate |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Finish-To-Start               |
    And I Enter the "2" Lead/Lag Days
    And I click "Update" button
    And I click on the "Add" button
    Then I set following fields value on editable page
      | name                                    | value            |
      | TaskPredecessor_PredecessorTaskIDOrName | Select Architect |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Start-To-Start   |
    And I Enter the "3" Lead/Lag Days
    And I click "Update" button
    And I click on the "Update" button
    And I wait for modal window to close
    And I verify Group and Task Should be added as predecessors for the task
      | name                                              | value                                                    |
      | Pre-Planning Review & Assignments (Kick-off Mtg.) | 3 day(s) after 'Select Architect' starts                 |
      | Pre-Planning Review & Assignments (Kick-off Mtg.) | 2 day(s) after 'A/E Contracts for Real Estate' completes |

  Examples:
    | Login User   | Login full username  | Task Name                                         | Template                   |
    | DeleteAccess | Delete Access Access | Pre-Planning Review & Assignments (Kick-off Mtg.) | Selenium Schedule Template |


  Scenario Outline:I Add another multiple predecessors for Schedule in Schedule template with negative Lead/Lag days
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template>" from the list
    And I click on "<Task Name>" link
    And I click on "Select Architect" link
    Then I set following fields value on editable page
      | name                   | value |
      | RadioPredecessorTaskID | true  |
      | OriginalDuration       | 100   |
    And I click on the "Add" button
    Then I set following fields value on editable page
      | name                                    | value           |
      | TaskPredecessor_PredecessorTaskIDOrName | STAFFING        |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Finish-To-Start |
    And I Enter the "-4" Lead/Lag Days
    And I click "Update" button
    And I click on the "Add" button
    Then I set following fields value on editable page
      | name                                    | value                       |
      | TaskPredecessor_PredecessorTaskIDOrName | CAC / Project Approval Task |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Start-To-Start              |
    And I Enter the "-3" Lead/Lag Days
    And I click "Update" button
#    And I click on the "Add" button
#    Then I set following fields value on editable page
#      | name                                    | value            |
#      | TaskPredecessor_PredecessorTaskIDOrName | Architect |
#      | TaskPredecessor_CodeTaskLeadLagTypeID   | Finish-To-Start               |
#    And I Enter the "2" Lead/Lag Days
#    And I click "Update" button
#    And I click on the "Update" button
    And I click on the "Update" button
    And I wait for modal window to close
    And I verify Group and Task Should be added as predecessors for the task
      | name             | value                                                |
      | Select Architect | -4 day(s) after 'STAFFING' completes                  |
      | Select Architect | -3 day(s) after 'CAC / Project Approval Task' starts |

  Examples:
    | Login User   | Login full username  | Task Name        | Template                   |
    | DeleteAccess | Delete Access Access | Select Architect | Selenium Schedule Template |

  Scenario Outline:I Adding Predecessor name from another template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template>" from the list
    And I click on "<Task Name>" link
    Then I set following fields value on editable page
      | name                   | value |
      | RadioPredecessorTaskID | true  |
      | OriginalDuration       | 100   |
    And I click on the "Add" button
    Then I set following fields value on editable page
      | name                                    | value             |
      | TaskPredecessor_PredecessorTaskIDOrName | Dalgram Developed |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Finish-To-Start   |
    And I Enter the "-3" Lead/Lag Days
    And I click "Update" button
    And I click on the "Add" button
    Then I set following fields value on editable page
      | name                                    | value           |
      | TaskPredecessor_PredecessorTaskIDOrName | STAFFING        |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Finish-To-Start |
    And I Enter the "2" Lead/Lag Days
    And I click "Update" button
    And I click on the "Update" button
    And I wait for modal window to close
    And I verify Group and Task Should be added as predecessors for the task
      | name             | value                                         |
      | Project Approval | -3 day(s) after 'Dalgram Developed' completes |
#      | Project Approval | |


  Examples:
    | Login User   | Login full username  | Task Name        | Template |
    | DeleteAccess | Delete Access Access | Project Approval | Site     |