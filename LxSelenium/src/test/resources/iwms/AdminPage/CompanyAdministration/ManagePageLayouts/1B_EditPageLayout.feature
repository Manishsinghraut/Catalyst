@all
Feature: As an Edit user I need to be able to edit existing page layouts. (Jira Ref. AUTOMATION-463)

  Scenario Outline: I import file for edit page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | Edit-Page-Layout.xml         |
      | PortfolioUsingInManagePL.xml |
      | ProjectUsingInManagePL.xls   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to edit page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
    Given I click "build layout" link of "<Page Layout>" page layout
    And I switch to "build layout" child window
    And I click on + button to add new fields
    And I select the following
      | Label Field |

    And I set fields values on editable page
      | name      | value     |
      | fieldText | New Label |
      | underline | true      |
      | bold      | true      |
    Then I select "Size 10" from the list

    And I click on "Save" Button
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I switch to main window
    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I select an option "<Page Layout>"
    And I verify pair of values on non editable summary page
      | name    | value |
      | <Label> |       |

    Examples:
      | Page Layout      | Entity Name                       | Item    | Second Level Tab | Label     | Login User | Login full username |
#      | Edit-Page-Layout | Lucernex-Project | Project | Details          | New Label | EditAccess | Edit Access Access  |
      | Edit-Page-Layout | Project –UsingIn ManagePageLayout | Project | Details          | New Label | EditAccess | Edit Access Access  |