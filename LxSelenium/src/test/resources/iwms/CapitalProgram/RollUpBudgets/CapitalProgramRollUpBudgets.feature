@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1206), Capital Program Roll Up Budgets

  Scenario Outline: As a delete user I import the following xmls in the following order

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/"
    And I import following file name:
      | AColumnType-1206.xml |
    And I import following file name:
      | SeleniumBudget-1206.xml                              |
      | CapitalProgramRollupsTesting-1206.xml                |
      | Project1RollupFacility-1206.xml                      |
      | Project2Rollup-Facility-1206.xml                     |
      | Project1Rollup-CapitalProgramRollupsTesting-1206.xml |
      | Project2Rollup-CapitalProgramRollupsTesting-1206.xml |
      | BudgetSummary-1206.xml                               |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Edit Layout" child window
    And I set following fields value on editable page
      | name                             | value |
      | _checkbox_ValidForCapitalProgram | true  |
      | _checkbox_ValidForCapitalProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Page Layout Name |
      | DeleteAccess | Delete Access Access | RollUps          |

  Scenario Outline: Navigate to Manage Budget types and make sure the following column types were created.

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name              | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | A Building Cost   | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |
      | B Renovation Cost | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |
      | C Clearance Cost  | Default Status  | checked                     |                      | unchecked                                   | unchecked                                     | unchecked        | unchecked                 |
    And I Search for the "Capital Program Rollups Testing" that was created
    And Click on the name of the "Capital Program Rollups Testing" in the results pop-up
    Then I see "Capital Program Rollups Testing" name on the header
    And I click on "Summary" tab
    And I wait for the Loading text to disappear
    And I expand the following tree
      | Central Dallas     |
      |                    |
      | Legacy Market Area |
    And I verify the following values in frame grid "multiGroupEx1"
      | Name                                               | Count | Delivered By |
      | Project 1 -Rollup: Capital Program Rollups Testing | 1     |              |
      | Project 2 -Rollup: Capital Program Rollups Testing | 1     |              |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "build layout" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "build Layout" child window
    And I click edit option for the "A Building Cost" field
    And I wait for modal window to open
    And I set following fields value on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I verify the following fields value on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button
    And I wait for modal window to close

    And I click edit option for the "B Renovation Cost" field
    And I wait for modal window to open
    And I set following fields value on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I verify the following fields value on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button
    And I wait for modal window to close

    And I click edit option for the "C Clearance Cost" field
    And I wait for modal window to open
    And I set following fields value on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I verify the following fields value on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button
    And I wait for modal window to close

    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Page Layout Name |
      | DeleteAccess | Delete Access Access | RollUps          |

  Scenario Outline: Verify the values in Capital Projects

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Capital Project 1>" that was created
    And Click on the name of the "<Capital Project 1>" in the results pop-up
    Then I see "<Capital Project 1>" name on the header
    And I click on "Budget" tab
    And I select "<Page Layout Name>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name           | Description | Status         | Contractor | Total     |
      | A Building Cost #01   |             | Default Status |            | $4,000.00 |
      | B Renovation Cost #01 |             | Default Status |            | $5,000.00 |
      | C Clearance Cost #01  |             | Default Status |            | $3,000.00 |

#      | Budget Name           | Description | Status         | Contractor | Total     | Created                |
#      | A Building Cost #01   |             | Default Status |            | $4,000.00 | 04/18/2016 03:11:58 PM |
#      | B Renovation Cost #01 |             | Default Status |            | $5,000.00 | 04/18/2016 03:12:20 PM |
#      | C Clearance Cost #01  |             | Default Status |            | $3,000.00 | 04/18/2016 03:12:40 PM |

    And I Search for the "<Capital Project 2>" that was created
    And Click on the name of the "<Capital Project 2>" in the results pop-up
    Then I see "<Capital Project 2>" name on the header
    And I click on "Budget" tab
    And I select "<Page Layout Name>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name           | Description | Status         | Contractor | Total     |
      | A Building Cost #01   |             | Default Status |            | $2,000.00 |
      | B Renovation Cost #01 |             | Default Status |            | $1,000.00 |
      | C Clearance Cost #01  |             | Default Status |            | $7,000.00 |

#      | Budget Name           | Description | Status         | Contractor | Total     | Created                |
#      | A Building Cost #01   |             | Default Status |            | $2,000.00 | 04/18/2016 03:13:37 PM |
#      | B Renovation Cost #01 |             | Default Status |            | $1,000.00 | 04/18/2016 03:13:57 PM |
#      | C Clearance Cost #01  |             | Default Status |            | $7,000.00 | 04/18/2016 03:14:19 PM |

    And I navigate to entity type "Capital Program" named "Capital Program Rollups Testing" by search
    And I click on "Budget" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Page Layout Name>" page layout from dropdown
    And I verify the following values in frame grid "putTheGridHere"
      |                                                    |
      | Project 1 -Rollup: Capital Program Rollups Testing |
      | Project 2 -Rollup: Capital Program Rollups Testing |
      | Capital Program Rollups Testing Total              |

    And I verify the following values in frame grid "$normal"
      | A Building Cost | B Renovation Cost | C Clearance Cost |
      | $4,000.00       | $5,000.00         | $3,000.00        |
      | $2,000.00       | $1,000.00         | $7,000.00        |
      | $6,000.00       | $6,000.00         | $10,000.00       |


    Examples:
      | Page Layout Name | Login User   | Login full username  | Capital Project 1                                  | Capital Project 2                                  |
      | RollUps          | DeleteAccess | Delete Access Access | Project 1 -Rollup: Capital Program Rollups Testing | Project 2 -Rollup: Capital Program Rollups Testing |