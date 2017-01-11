@all
Feature:(Jira Ref. : AUTOMATION-530) Custom List & Collapsible Option

  Scenario Outline: As a delete user I import the attached xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | Portfolio_for_Collapsible_Option.xml  |
      | Create_Project_Collapsible_Option.xls |
      | SubpageWithCL.xml                     |
      | SummaryPageWithCL.xml                 |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user  1. Custom List should be able to Collapse and expand
  2. Custom List should be able to edit and save properly

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I select "Project Details with CL" page layout from dropdown
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Comment   |
      | <Comment> |
    And I click "Update" button
    And I view a unique row in grid "<GRID>" having unique value "<Comment>" under column header "Comment"
      | name          | value |
      | Modified By   |       |
      | Modified Date |       |

    And I hide the "Collapsible Subpage" section
    And I verify the grid "<GRID>" is invisible
    And I collapse the "Collapsible Subpage" section
    And I view a unique row in grid "<GRID>" having unique value "<Comment>" under column header "Comment"
      | name          | value |
      | Modified By   |       |
      | Modified Date |       |

    And I click on the "Save Changes" action panel button

    And I switch to visible frame
    And I view a unique row in grid "<GRID>" having unique value "<Comment>" under column header "Comment"
      | name          | value                 |
      | Modified By   | <Login full username> |
      | Modified Date | Today's Date          |

    And I hide the "Collapsible Subpage" section
    And I verify the grid "<GRID>" is invisible

    Examples:
      | Entity Name                    | Login User   | Login full username  | GRID            | Comment                            |
      | Project for Collapsible Option | DeleteAccess | Delete Access Access | ^customListGrid | Testing Collapsible option feature |

  Scenario Outline: (JIRA Ref. : AUTOMATION-527) As a delete I verify Report should display correct information after successful run
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/Reports/"
    And I import following file name:
      | SubpageWithCL.xml     |
      | SummaryPageWithCL.xml |
      | CLReport.xml          |
#    Then I navigate to "Reports"
    Then I navigate to the reports dashboard
    And I click on "run" row action in the grid "^editBOGrid" having the following header "Report Name" and cell value "<Report Name>"
      | name           | value                 |
      | Description    |                       |
      | Report Type    | Entity                |
      | Saved for?     | All                   |
      | Scheduled Jobs |                       |
#      | Created By     | <Login full username> |

    And I switch to "report" child window
    And I expand "<Entity Name>" entity report
    And I verify a custom list "<Entity Name>" on reports grid "popupBody" having the following header and cell value pair
      | name          | value                 |
      | Comment       | <Comment>             |
      | Modified By   | <Login full username> |
      | Modified Date | Today's Date          |
    And I close the "reports" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name                    | Report Name               | Comment                            |
      | DeleteAccess | Delete Access Access | Project for Collapsible Option | Custom List Values Report | Testing Collapsible option feature |



