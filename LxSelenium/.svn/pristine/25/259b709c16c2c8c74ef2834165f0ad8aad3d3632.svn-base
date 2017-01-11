@all
Feature: Selecting a specific Budget View on the report (Jira Ref. : AUTOMATION-1368)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1368.xml     |
      | 13550Template_1368.xml                    |
      | others_1368.xml                           |
      | page_layouts-7994259492224433514_1368.xml |
      | Project_13550_1368.xml                    |
      | Report_1368.xml                           |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Import the following test data files and verify the Budget Template
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I verify a row from non frame grid "<Grid>" having unique value "13550 Template" under column header "Budget Template Name"
      | name                 | value          |
      | Budget Template Name | 13550 Template |

    Examples:
      | Grid               |
      | mainwrappernoframe |


  Scenario Outline: Import the following test data files and verify  it shall create 3 budget columns successfully
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify a row from non frame grid "<Grid>" having unique value "Green Building" under column header "Name"
      | name            | value          |
      | Name            | Green Building |
      | Selected Status | Default Status |
    And I verify a row from non frame grid "<Grid>" having unique value "Sustainable Cost" under column header "Name"
      | name            | value            |
      | Name            | Sustainable Cost |
      | Selected Status | Default Status   |
    And I verify a row from non frame grid "<Grid>" having unique value "View Applied" under column header "Name"
      | name            | value          |
      | Name            | View Applied   |
      | Selected Status | Default Status |

    Examples:
      | Grid                   |
      | BOGridBudgetColumnType |

  Scenario Outline: I verify the Manage Budget Summary Page
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Budget Summary Page>" sub row in the grid "<Grid>"
    And I switch to "Budget Summary Edit" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on the update button
    And I close the "Budget Summary Edit" child window
    And I switch to main window

    Examples:
      | Grid | Budget Summary Page |
      | main | 13550               |

  Scenario Outline: I verify the Manage Budget Views
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Views" link
    And I click "Add Budget Template View..." button
    And I set following fields value on editable page
      | name           | value                       |
      | BudgetViewName | <Budget Template View Name> |
    And I click "Add" button
    And I click "build view" row action in the non frame grid "<Grid>" having the following header and cell values
      | name                      | value                       |
      | Budget Template View Name | <Budget Template View Name> |
    And I select the template line items "Runners" under "Fabrication"
    And I select the template line items "Metal Joist" under "Fabrication"
    And I click "Update View" button

    Examples:
      | Grid             | Budget Template View Name |
      | BOGridBudgetView | View 13550                |

  Scenario Outline: I verify the Manage Budget Types
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name | value        |
      | Name | View Applied |
    And I set following fields value on editable page
      | name         | value      |
      | BudgetViewID | View 13550 |
    And I click "Update" button
    And I verify a row from non frame grid "<Grid>" having unique value "View 13550" under column header "Use this Budget View"
      | name            | value          |
      | Name            | View Applied   |
      | Selected Status | Default Status |

    Examples:
      | Grid                   |
      | BOGridBudgetColumnType |

  Scenario Outline: I verify the navigate to Project 13550> Budget tab>Budget Summary.
    Given I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Budget Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on the "<Expand All>" link
    And I verify the following values in non frame grid
      | Name  <Collapse All>  <Hide Empty> | Green Building | Sustainable Cost | View Applied |
      | Fabrication                        | $4,500.00      | $1,800.00        | $500.00      |
      | Runners                            | $200.00        | $500.00          | $200.00      |
      | I channels casting                 | $300.00        | $600.00          |              |
      | Metal Joist                        | $4,000.00      | $700.00          | $300.00      |
      | Total                              | $4,500.00      | $1,800.00        | $500.00      |

    Examples:
      | Entity Name   | Third Level Tab | Budget Summary Page |
      | Project 13550 | Budget          | 13550               |


  Scenario Outline: I verify the Run report titled '13550 Budget Line Item Report with View applied'
    Given I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I verify the following values in non frame grid
      | Name          | Green Building | Sustainable Cost | View Applied | Budget Line Item Name | Budget Line Item RecID | Description     |
      | Project 13550 |                |                  |              | Fabrication           | Fabrication            | Fabricate       |
      | Project 13550 | $200.00        | $500.00          | $200.00      | Runners               | Runners                | Runner sections |
      | Project 13550 | $300.00        | $600.00          |              | I channels casting    | I channels casting     | I Channels      |
      | Project 13550 | $4,000.00      | $700.00          | $300.00      | Metal Joist           | Metal Joist            | Joist           |
    And I close the "Report" child window
    And I switch to main window

    Examples:
      | Report Name                                     |
      | 13550 Budget Line Item Report with View applied |

