@all
Feature: (Jira - AUTOMATION-469) As an IWMS user I need to be able to create new form layouts.

  Scenario Outline: I want to create new form layout from manage forms
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I wait for the Loading text to disappear in grid
    And I click on " Add Form Type... " button in grid
    Then I see the "Add Form Type  ***Required fields in red" modal window
    And I set these field values on editable page
      | name           | value                     |
      | ShortName      | <Form Layout>             |
      | ActualLongName | Selenium Test Description |
    And I select field set type default radio button on modal window
    And I select Allow Reply Yes radio button on modal window
    And I select following entities checkbox from model window
      | locator | element          |
      | name    | Portfolio        |
      | name    | Prototype        |
      | name    | Parcel           |
      | name    | OpenProject      |
      | name    | CapProject       |
      | name    | CapProgram       |
      | name    | Location         |
      | name    | PotentialProject |
      | name    | Facility         |
      | name    | Contract         |
    When I click on the "Add" button
#    IWMS-22139
#    Then I see "Successfully added Form Type" in the grid header
    Then I verify success message "Successfully added Form Type" in non frame page
    Then I see these grid columns:
      | Name        |
      | Description |
      | Actions     |
    Then I see some rows with data in the grid
    Then I see page "1" in the grid's pagination controls
    Then I see the number of pages in the grid's pagination controls
    And I wait for the Loading text to disappear in grid
    When I click on the "add layout" row action of column "<Form Layout>" of column "1" from grid "id" "BOGridCodeIssueType"
    Then I set these field values on editable page
      | name           | value                     |
      | PageLayoutName | <Layout Name>             |
      | ActualLongName | <Layout Name> Description |
    And I select Allow edit Yes radio button on add layout modal window
    And I select Allow users to create this form Yes radio button on add layout modal window
    When I click on the "Add Layout" button
    And I click "build layout" action of "<Layout Name>" sub row in the grid "<Grid ID>"
    And I switch to "Form layout" child window
    And I expand the following
      | Related Fields |
      | Location       |
      | Address Info   |
    Then I drag and drop the following
      | City |

    And I expand the following
      | Available Fields |
      | Forms            |
      | ALL              |
    Then I drag and drop the following
      | Creator      |
      | Created Date |
      | Description  |
      | Photos       |
      | Title        |
    And I click on the save layout button on page layout
    And I click on the "Yes" button in confirmation pop up
    And I click on the close button on page layout
    And I switch to main window

    Examples:
      | Form Layout   | Login User   | Login full username  | Layout Name | Grid ID             |
      #This layout will using in other scripts
      | Add Form Type | DeleteAccess | Delete Access Access | Form Layout | BOGridCodeIssueType |
    #this layout will be deleted in the other scenarios
    #| Delete Form Type       | DeleteAccess | Delete Access Access |

  Scenario Outline: As an IWMS user I need to be able to view form layouts
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | View-Form-Layout.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As an IWMS view user I need to be able to view form layouts
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I wait for the Loading text to disappear in grid
    Then I expand the "<Form Layout>" row in grid "<Grid ID>"
    And I click "build layout" action of "<Form Layout>" sub row in the grid "<Grid ID>"
    And I switch to "Form layout" child window
    And I verify the following added Fields on the Page Layout pop window
      | Title        |
      | Creator      |
      | Created Date |
      | Description  |
      | Photos       |
     # | City         |
    And I click on the close button on page layout
    And I switch to main window

    Examples:
      | Form Layout      | Login User | Login full username | Grid ID             |
      | View form layout | ViewAccess | View Access Access  | BOGridCodeIssueType |
