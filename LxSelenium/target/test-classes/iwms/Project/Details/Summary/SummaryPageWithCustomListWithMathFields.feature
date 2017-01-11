@all
Feature: Summary page with Custom List (Custom list with math Fields) (Ref : Jira Ticket No : AUTOMATION-1056)

  Scenario Outline: I import the project entity
    Given I Login to IWMS using "<User>" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary"
    And I import following file name:
      | Pagelayout.xml        |
      | ProjectCustomList.xml |

    Examples:
      | User         |
      | DeleteAccess |

  Scenario Outline: As delete user, I verify the Import Summary Page with math Fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value               |
      | Page Layout Name | Project Custom List |
#    Then I click on the "build layout" row action of column "Project Custom List" of column "1" from grid "BOGridPageLayout"
    And I switch to "Page build layout" child window
    And I verify the "Layout: Project Custom List, Table: Project" page header
    And I verify the "mathcustomfield" field is displayed
    And I close the "Page Layout" child window
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Project Custom List" page layout from dropdown
    And I switch to visible frame
    And I verify "mathcustomfield" field is displayed on summary page
    And I switch to default frame

    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I click on "Add" button of pluse icon
    And I enter "Title" field the value of "Custom List","NumberX" field the value of "2" and "NumberY" field the value of "4"
    And I click on Update button
    And I verify "Title" field value of "Custom List","NumberX" field value of "2","NumberY" field value of "4","AddXandY" field value of "6","xdivy" field value of "1","Multiplyxy" field value of "8" and "Percentage" field value "250.00000%"
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Title" field value of "Custom List","NumberX" field value of "2","NumberY" field value of "4","AddXandY" field value of "6","xdivy" field value of "1","Multiplyxy" field value of "8" and "Percentage" field value "250.00000%"
    And I switch to default frame

    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I click on existing "Custom List" to edit the line item
    And I enter "Title" field the value of "Custom List","NumberX" field the value of "3" and "NumberY" field the value of "9"
    And I click on Update button
    And I verify "Title" field value of "Custom List","NumberX" field value of "3","NumberY" field value of "9","AddXandY" field value of "12","xdivy" field value of "0","Multiplyxy" field value of "27" and "Percentage" field value "111.11111%"
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Title" field value of "Custom List","NumberX" field value of "3","NumberY" field value of "9","AddXandY" field value of "12","xdivy" field value of "0","Multiplyxy" field value of "27" and "Percentage" field value "111.11111%"
    And I switch to default frame

    Examples:
      | Entity Name         | Secondary Tab | Third Level Tab |
      | Project Custom List | Details       | Summary         |

