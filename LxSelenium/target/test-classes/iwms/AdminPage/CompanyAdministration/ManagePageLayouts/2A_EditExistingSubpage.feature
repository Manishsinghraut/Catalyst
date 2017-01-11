@all
Feature: As an Edit user I need to be able to edit existing sub page layouts.(Jira Ref. AUTOMATION-466)

  Scenario Outline: I import file for edit sub page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | PL-For-Edit-Sub-Page-Layout.xml |
      | PortfolioUsingInManagePL.xml    |
      | ProjectUsingInManagePL.xls      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to edit sub page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    Given I click on the "Manage Sub-pages" link
    And I wait for the Loading text to disappear in grid
    Then I click "build layout" link of "<Sub Page layout>" page layout
    And I switch to "build layout" child window
    And I click on + button to add new fields
    And I select the following
      | Label Field |

    And I set fields values on editable page
      | name      | value         |
      | fieldText | Sub New Label |
      | underline | true          |
      | bold      | true          |
    Then I select "Size 12" from the list

    And I click on "Save" Button
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I switch to main window
    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I select an option "<Sub Page layout>"
    Then I verify the City, State fields are not editable
    And I verify text value in a page
      | value   |
      | <Label> |

    Examples:
      | Entity Name                       | Item    | Second Level Tab | Label         | Sub Page layout      | Login User | Login full username |
  #    | Lucernex-Project | Project | Details          | Sub New Label | Edit-Sub-Page-Layout | EditAccess | Edit Access Access  |
      | Project –UsingIn ManagePageLayout | Project | Details          | Sub New Label | Edit-Sub-Page-Layout | EditAccess | Edit Access Access  |