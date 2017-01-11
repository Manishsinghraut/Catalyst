Feature: Option to display row numbers on the report [Jira Ref. : AUTOMATION-1421]

  Scenario Outline: As Delete user, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | 00018PortfolioAndLocation_1421.xml |
      | Contracts-15825_1421.xml           |
      | Report-15825_1421.xml              |
      | ProgramReport-15825_1421.xml       |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I verify the Option to display row numbers on the report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Name            | Expense Type         | Frequency | Apply Tax #1? | Apply Tax #2? | Apply Tax #3? |
      | ContractA-15825 | Base Rent            | Monthly   | Yes           | Yes           | Yes           |
      | ContractB-15825 | Interior             | Monthly   | No            | No            | No            |
      | ContractC-15825 | Water                | Monthly   | Yes           | Yes           | Yes           |
      | ContractD-15825 | Building Maintenance | Monthly   | No            | No            | No            |
    And I close the "report" child window
    And I switch to main window

    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window
    And I select STEP7 "View type and currency" of the report as the step to be edited
    And I set following fields value on editable page
      | name          | value |
      | showRowNumber | true  |
    And I click on Finish button

    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Row | Name            | Expense Type         | Frequency | Apply Tax #1? | Apply Tax #2? | Apply Tax #3? |
      | 1   | ContractA-15825 | Base Rent            | Monthly   | Yes           | Yes           | Yes           |
      | 2   | ContractB-15825 | Interior             | Monthly   | No            | No            | No            |
      | 3   | ContractC-15825 | Water                | Monthly   | Yes           | Yes           | Yes           |
      | 4   | ContractD-15825 | Building Maintenance | Monthly   | No            | No            | No            |

    And I close the "report" child window
    And I switch to main window

    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value               |
      | Report Name | ProgramReport-15825 |

    And I switch to "report" child window
    And I select STEP7 "View type and currency" of the report as the step to be edited

    And I verify the "checkbox" "showRowNumber" has "unchecked and" disabled

    And I click on Finish button
    And I close the "report" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Grid        | Report Name  |
    | DeleteAccess | Delete Access Access | ^editBOGrid | Report-15825 |