@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1123), Save Forms to documents for Site and Capital project

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | BudgetTemplate(9)-1123.xml    |
      | BudgetTypeCL-1123.xml         |
      | STDForms(2)-1123.xml          |
      | SaveFormsEntities(1)-1123.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Save Forms to documents for Site and Capital project
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
#    And I click "06/01/2016" action of "0001" sub row in the grid "issueMainDiv"
    And I click on the "06/01/2016" row action of column "0001" of column "1" from grid "BOGridLX_Grid_Issue"

#    And I click on "<Expand All>" link
    And I wait for the Loading text to disappear
#    And I click on "<Check Out>" link
    And I click on the "<Check Out>" link
    And I wait for " " modal window to open in non frame page

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget | Budget Cost | Item Name | Quantity | Unit Cost |
      | Carpet | 1500        | Item 1    | 10       | 1500      |
    And I click "Update" button
    And I click on 'Update' button while adding customlist line items
    And I verify the following values in non frame grid "^customListGrid"
      | Budget | Budget Cost | Item Name | Quantity | Unit Cost | Math Total |
      | Carpet | $1,500.00   | Item 1    | 10       | $1,500.00 | 15,000     |
#    And I verify Budget "Carpet", Budget Cost "$1,500.00", Item Name "Item 1", Quantity "10", Unit Cost "$1,500.00", Math Total "15,000" on html page

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget     | Budget Cost | Item Name | Quantity | Unit Cost |
      | Playground | 2000        | Item 2    | 15       | 2000      |
#    And I click "Update" button
    And I click on 'Update' button while adding customlist line items
    And I verify the following values in non frame grid "^customListGrid"
      | Budget     | Budget Cost | Item Name | Quantity | Unit Cost | Math Total |
      | Playground | $2,000.00   | Item 2    | 15       | $2,000.00 | 30,000     |
#    And I verify Budget "Playground", Budget Cost "$2,000.00", Item Name "Item 2", Quantity "15", Unit Cost "$2,000.00", Math Total "30,000" on html page

    And  I click on the "Update & Check in" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
#    And I verify message "STD Forms item successfully updated"

#    And I click on "<View>" link
    And I click on the "<View>" link
    And I wait for " " modal window to open in non frame page
    And I click on "Save To Documents" link
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name        | value           |
      | FolderID    | <Folder ID>     |
      | BaseName    | <Document Name> |
      | mailMembers | true            |
    And I add following members
      | Access, Delete Access |
    And I click on "Save" Button
    And I switch to main window
    And I wait for second child window to close

    Given I login to web mail on existing window
    And I search for the mail using subject "[LxRetail] <Entity Name> LxRetail document upload"
    Then I check mail body for the following contents
      | Document Name: <Document Name>.html    |
      | URL for <Entity Type> "<Entity Name>": |
    And I verify subject in the body "[LxRetail] <Entity Name> LxRetail document upload"

    And I click application link within the mail body
    And I switch to "Documents" child window
#    And I switch to "Documents" third child window
#    And I close the "Mail" child window
    And I wait for the Loading text to disappear

    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame
    And I close the "Documents" child window
    And I switch to main window
    And I wait for second child window to close

    Given I open latest downloaded file
    And I verify the following text in a page
      | Custom List-Budget |
#    And I verify the following values in non frame grid "^customListGrid~"
#      | Budget     | Budget Cost | Item Name | Quantity | Unit Cost | Math Total |
#      | Playground | $2,000.00   | Item 2    | 15       | $2,000.00 | 30,000     |
    And I verify Budget "Playground", Budget Cost "$2,000.00", Item Name "Item 2", Quantity "15", Unit Cost "$2,000.00", Math Total "30,000" on html page
    And I close the "HTML window" child window
    And I switch to main window
    And I wait for second child window to close

    Examples:
      | Login User   | Login full username  | Entity Name   | Document Name    | Folder      | Folder ID | Entity Type     |
      | DeleteAccess | Delete Access Access | SaveFormsToCP | CP Budget Form   | STDCP (1)   | STDCP     | Capital Project |
      | DeleteAccess | Delete Access Access | SaveFormsSite | Site Budget Form | STDSite (1) | STDSite   | Site            |