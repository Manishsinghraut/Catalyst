@all @smoke @smoke4Dot1
Feature: Import Summary Page with math Fields (Ref : Jira Ticket No : AUTOMATION-1052)

  Scenario Outline: I import the project entity
    Given I Login to IWMS using "<User>" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary"
    And I import following file name:
      | ProjectPageLayoutWithMathFields.xml |
      | EntityWithMathFields.xml            |

  Examples:
    | User         |
    | DeleteAccess |

  Scenario Outline: As delete user, I verify the Import Summary Page with math Fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    Then I click on the "build layout" row action of column "Project Page Layout with Math Fields" of column "1" from grid "BOGridPageLayout"
    And I switch to "Page build layout" child window
    And I verify the "Layout: Project Page Layout with Math Fields, Table: Project" page header
    And I verify the "Rentable Areadiv100" field is displayed
    And I verify the "RAplusGAMathfields" field is displayed
    And I verify the "Gross Area" field is displayed
    And I verify the "GrossAreaplus2000" field is displayed
    And I verify the "Total" field is displayed
    And I close the "Page Layout" child window
    And I switch to main window
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify "Rentable Areadiv100" "$10.00" is displayed
    And I verify "RAplusGAMathfields" "$2,210.00" is displayed
    And I verify "Total" "6,010" is displayed
    And I verify "Gross Area" "200" is displayed
    And I verify "GrossAreaplus2000" "2,200" is displayed
    And I switch to default frame
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                       | value |
      | ProjectEntity_RentableArea | 2000  |
      | ProjectEntity_Frontage     | 20    |
      | ProjectEntity_GrossArea    | 200   |
      | ProjectEntity_UsableArea   | 1000  |
      | ProjectEntity_Depth        | 6000  |
    And I switch to default frame
    And I click on the "Save Changes" action panel button

    And I switch to visible frame
    And I verify "Rentable Areadiv100" "$20.00" is displayed
    And I verify "RAplusGAMathfields" "$2,220.00" is displayed
    And I verify "Total" "8,020" is displayed
    And I switch to default frame

  Examples:
    | Entity Name             | Secondary Tab | Third Level Tab |
    | Entity with math fields | Details       | Summary         |



