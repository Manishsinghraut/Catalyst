@all @smoke @smoke4
Feature: To Verify the Percentage field calculation with decimals (Ref : Jira Ticket No : AUTOMATION-1063)

  Scenario Outline: I import the project entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary"
    And I import following file name:
      | PercentageFieldSummaryPage.xml |
      | PercentageFieldProject.xml     |
      | ReportForPercentageField.xml   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I To Verify the Percentage field calculation with decimals
    When I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    Then I click on the "build layout" row action of column "PercentageFieldSummaryPage" of column "1" from grid "BOGridPageLayout"
    And I switch to "Page build layout" child window
    And I verify the "Layout: PercentageFieldSummaryPage, Table: Project" page header
    And I verify "PercentageFieldSubPage" is displayed on layout page
    And I verify "Rentable Area" field is displayed on layout page
    And I verify "RAdiv7" is label is displayed on layout page
    And I close the "Page Layout" child window
    And I switch to main window
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify "PercentageFieldSubPage" is displayed on summary page
    And I verify "Rentable Area" "5,000" is displayed on summary page
    And I verify "RAdiv7" "71,428.57%" math field is displayed on summary page
    And I switch to default frame

    Examples:
      | Entity Name            | Secondary Tab | Third Level Tab |
      | PercentageFieldProject | Details       | Summary         |

  Scenario Outline: As a delete I verify Report should display correct information after successful run
    And I navigate to the reports dashboard
#    And I click on "run" row action in the grid "<Reports Grid ID>" having the following header "Report Name" and cell value "ReportForPercentageField"
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name           | value                    |
      | Report Name    | ReportForPercentageField |
      | Description    |                          |
      | Report Type    | Entity                   |
      | Saved for?     | All                      |
      | Scheduled Jobs |                          |
    #IWMS-22004
#      | Created By     | <Login full username>    |
      | Created By     | Access, Delete Access    |

    And I switch to "report" child window
    And I verify a row from reports grid "popupBody" having the following header and cell value pair
      | name          | value         |
      | Name          | <Entity Name> |
      | Rentable Area | 5,000         |
      | RA Math Field | 71,428.57%    |
    And I close the "Reports" child window
    And I switch to main window

    Examples:
      | Login full username  | Entity Name            | Reports Grid ID |
      | Delete Access Access | PercentageFieldProject | ^editBOGrid     |


