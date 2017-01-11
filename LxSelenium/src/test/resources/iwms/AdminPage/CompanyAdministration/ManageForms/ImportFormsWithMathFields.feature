@all
Feature: To Verify the Form with math fields xml imports correctly. (Jira - AUTOMATION-1054)

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | ImportFormWithMathFields.xml  |
      | ProjectFormWithMathFields.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As delete Access user, I verify the Import Forms with math fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    Then I expand the "<Form Layout>" row in grid "<Grid ID>"
    And I click "build layout" action of "<Form Layout>" sub row in the grid "<Grid ID>"

    And I switch to "Form build layout" child window
    And I verify the "Layout: Import Form with math fields, Table: Issue" page header
    And I verify the "Title" field is displayed on Form layout
    And I verify the "A" field is displayed on Form layout
    And I verify the "B" field is displayed on Form layout
    And I verify the "ADivB" field is displayed on Form layout
    And I verify the "AplusB" field is displayed on Form layout
    And I verify the "ADivBx10 Percentage" field is displayed on Form layout
    And I close the "Form Layout" child window
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
#    And I verify title "math test", Days Open "68",Due Date "",Assigness "",Form Type "Import Form with math fields",Creator "Delete Access Access"
    And I verify title "math test", Form Type "Import Form with math fields"
#    And I click on "<Expand All>" link
    And I click " Expand All " button
    And I click on "<Check Out>" link
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                       | value     |
      | Issue_Subject              | math test |
      | Issue_CltExtIssue__Values2 | 4         |
      | Issue_CltExtIssue__Values1 | 8         |
    And I verify "ADivB" "$0.50" is displayed
    And I verify "AplusB" "12" is displayed
    And I verify "ADivBx10 Percentage" "500.00000%" is displayed
    And I set following fields value on editable page
      | name                       | value     |
      | Issue_Subject              | math test |
      | Issue_CltExtIssue__Values2 | 24        |
      | Issue_CltExtIssue__Values1 | 12        |
    And I click "Update & Check in" button
    And I switch to visible frame
    And I click " Expand All " button
    And I click on "<View>" link
    And I switch to default frame
    And I verify "Title" "math test" is displayed
    And I verify "A" "24" is displayed
    And I verify "B" "12" is displayed
    And I verify "ADivB" "$2.00" is displayed
    And I verify "AplusB" "36" is displayed
    And I verify "ADivBx10 Percentage" "2,000.00000%" is displayed
    And I click "Close" button
    And I switch to default frame

  Examples:
    | Entity Name                   | Secondary Tab | Third Level Tab | Grid ID             | Form Layout                  |
    | Project Form with math fields | Details       | Forms           | BOGridCodeIssueType | Import Form with math fields |