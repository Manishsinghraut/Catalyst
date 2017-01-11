@all
Feature: (Ref : Jira Ticket No : Automation-640) As an Delete user I Configure Percentage Rent Schedule for 4-8 Breakpoints

  Scenario Outline: As a delete user I create new list layout from manage list layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
    And I click on the "Manage List Layouts" link
    And I click on " Add item... " button in grid
    Then I see the "Add item  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                  | value              |
      | PageLayoutName        | <List Layout Name> |
      | AllowEdit             | true               |
      | PrimaryCodeSQLTableID | <Primary Table>    |
    And I select existing layout "    <Existing Layout>"

    And I click on the "Add" button
    And I verify a row from non frame grid "BOGridPageLayout" having unique value "<List Layout Name>" under column header "Page Layout Name"
      | name | value |


    Examples:
      | Login User   | Login full username  | Primary Table              | List Layout Name                          | Existing Layout                                       |
      | DeleteAccess | Delete Access Access | Percentage Rent            | Test Contract PercentRent Page            | Contract Percentage Rent  [Global Layout]             |
      | DeleteAccess | Delete Access Access | Sales Period               | Test Percentage Rent (Multi BP) Schedule  | Percentage Rent (Multi BP) Schedule  [Global Layout]  |
      | DeleteAccess | Delete Access Access | Sales Period               | Test Percentage Rent (Single BP) Schedule | Percentage Rent (Single BP) Schedule  [Global Layout] |
      | DeleteAccess | Delete Access Access | Percentage Rent Period     | Test Percentage Rent Breakpoint Schedule  | Percentage Rent Breakpoint Schedule  [Global Layout]  |
      | DeleteAccess | Delete Access Access | Percentage Rent Breakpoint | Test Percentage Rent Breakpoint           | Percentage Rent Breakpoints  [Global Layout]          |

  Scenario Outline: As a delete user I build layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
    And I click on the "Manage List Layouts" link
    And I wait for the Loading text to disappear in grid
    When I click "build layout" link of "<List Layout Name>" page layout
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields |
      | Contract         |
      | <Folders>        |
    Then I drag and drop the following
      | Breakpoint Amount #4 |
      | Breakpoint Rate #4   |

    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Login User   | Login full username  | List Layout Name                         | Folders                     |
      | DeleteAccess | Delete Access Access | Test Percentage Rent (Multi BP) Schedule | Sales Period                |
      | DeleteAccess | Delete Access Access | Test Percentage Rent Breakpoint          | Percentage Rent Breakpoints |

  Scenario Outline: As a delete user I create new page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click on " Add item... " button in grid
    Then I see the "Add item  ***Required fields in red" modal window
    And I expand the following
      | Contract     |
      | Payment Info |
    And I select the following
      | Percentage Rent |
    And I set following fields value on editable page
      | name                  | value              |
      | PageLayoutName        | <Page Layout Name> |
      | AllowEdit             | true               |
      | PrimaryCodeSQLTableID | <Primary Table>    |
    And I select existing layout "    <Existing Layout>"
    And I click on the "Add" button
    And I verify a row from non frame grid "BOGridPageLayout" having unique value "<Page Layout Name>" under column header "Page Layout Name"
      | name     | value                                     |
      | Top Menu | Contract : Payment Info : Percentage Rent |

    Examples:
      | Login User   | Login full username  | Primary Table          | Page Layout Name                           | Existing Layout                                       |
      | DeleteAccess | Delete Access Access | Contract               | Test1 Break Point Schedule                 | Breakpoint Schedule  [Global Layout]                  |
      | DeleteAccess | Delete Access Access | Percentage Rent Period | Test1 Percentage Rent (Multi BP) Schedule  | Percentage Rent (Multi BP) Schedule  [Global Layout]  |
      | DeleteAccess | Delete Access Access | Percentage Rent Period | Test1 Percentage Rent (Single BP) Schedule | Percentage Rent (Single BP) Schedule  [Global Layout] |


  Scenario Outline: As a delete user I build layout for the following
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
    When I click "build layout" link of "<Page Layout Name>" page layout
    And I switch to "build layout" child window
    And I expand the following
      | List Layouts |
      | Contract     |

    Then I drag and drop the following
      | <Layout> |
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Page Layout Name                           | Layout                                                 |
      | DeleteAccess | Delete Access Access | Test1 Percentage Rent (Multi BP) Schedule  | List Layout: Test Percentage Rent (Multi BP) Schedule  |
      | DeleteAccess | Delete Access Access | Test1 Percentage Rent (Single BP) Schedule | List Layout: Test Percentage Rent (Single BP) Schedule |

  Scenario Outline:As a delete user I verify configured Percent rent schedule pages
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select an option "Test1 Percentage Rent (Multi BP) Schedule"
    And I verify a row from grid "BOGridVirtualSalesPeriod" having unique value "/" under column header "Period /Year"
      | name                 | value |
      | Breakpoint Amount #4 |       |
      | Breakpoint Rate #4   |       |

    And I select an option "Test1 Break Point Schedule"
    And I verify a row from grid "BOGridVirtualPercentageRentPeriod" having unique value "/" under column header "Period Begin Date"
      | name                 | value |
      | Breakpoint Amount #4 |       |
      | Breakpoint Rate #4   |       |



    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name       |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Selenium-Contract |

