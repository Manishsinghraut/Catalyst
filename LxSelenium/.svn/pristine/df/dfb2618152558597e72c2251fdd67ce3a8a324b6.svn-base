@all @smoke @smoke5Dot1
Feature: (Jira - AUTOMATION-351 )As an admin I should be able to create Portfolio Wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    Then I select "<Item>" from the list
    And I click on the "Next" button
    Then I see the "<Grid Header>" modal window
    And I set these field values on editable page
      | name                            | value              |
      | Program_ProgramName             | <Entity Name>      |
      | Program_City                    | Dallas             |
      | Program_StreetAddress1          | This Road          |
      | Program_PostalCode              | 75034              |
      | Program_Description             | selenium Portfolio |
      | _ManagerIDList_MemberID_add     | Administrator, Lx  |
      | Program_FiscalYearEnd           | 02/28/2014         |
      | Program_IStateProvinceCountryID | TX                 |
    And I click on the "Next" button
    And I set fields values on editable page
      | name           | value                             |
      | orgTypeRequest | duplicate                         |
      | srcProgramID   | Selenium Webdriver CapitalProgram |
#      | srcProgramID   | Lucernex-Selenium |
    And I click on the "Next" button
    And I verify success message after importing org chart
      | Status:Finished |
      | Execution time: |
    And I close org chart window
    And I set fields values on editable page
      | name             | value             |
      | entityTemplateID | <Folder Template> |
    And I click on the "Next" button
    And I click on Assign Members button
    And I add following members
      | Access, Delete |
      | Access, Edit   |
    And I click on "Update  members to <Entity Name>" Button
    And I click on the "Finish Assigning Members" button
    Then I see the "Portfolio Setup Wizard -> <Entity Name> -> Assign Members" modal window
    And I click on the "Finish" button
    Then I see that I am on the entity "Portfolio: <Entity Name>"

    Examples:
      | Item      | Grid Header            | Entity Name                  | Folder Template          |
      | Portfolio | Portfolio Setup Wizard | Selenium-Webdriver-Portfolio | Selenium Folder Template |

  Scenario Outline: I want to verify the created new IWMS portfolio fields on non-editable page
    When I navigate to "<Item>, Details" entity
    And I verify pair of values on non editable summary page
      | name            | value         |
      | Name            | <Entity Name> |
      | City            | Dallas        |
      | Address         | This Road     |
      | PostalCode      | 75034         |
      | Fiscal year end | 02/28/2014    |
    And I verify values on non editable summary page
      | name        | value              |
      | Description | selenium Portfolio |
    And I verify management members "Lx Administrator"
    And I verify management member link "Lx Administrator"

    Examples:
      | Item      | Entity Name                  |
      | Portfolio | Selenium-Webdriver-Portfolio |

  Scenario Outline: I want to verify members added in  Members/Contacts tab
    When I navigate to "<Item>, Details" entity
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
      | Broker      | Delete Access    |
      | Broker      | Edit Access      |

    Examples:
      | Item      |
      | Portfolio |

  Scenario Outline: I want to verify folder list
    When I navigate to "<Item>, Details" entity
    And I click on the "Documents" tab
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |

    Examples:
      | Item      |
      | Portfolio |

  Scenario Outline: I want to verify organization chart
    When I navigate to "<Item>, Details" entity
    When I navigate to "Org Chart"
#    And I verify organization chart "Central (Central region - preOpen) Frisco(Pre-Open)"
#    And I verify organization chart "Selenium-Webdriver-Portfolio"
    Examples:
      | Item      | Entity Name                  |
      | Portfolio | Selenium-Webdriver-Portfolio |


#@all
#Feature: (Ref: JIRA ticket AUTOMATION-351) As an admin I should be able to create Portfolio Wizard
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
#    When I navigate to "Tools,Setup Wizards"
#    Then I see the "Setup Wizard" modal window
#    Then I select "<Item>" from the list
#    And I click on the "Next" button
#    Then I see the "<Grid Header>" modal window
#    And I set these field values on editable page
#      | name                            | value              |
#      | Program_ProgramName             | <Entity Name>      |
#      | Program_City                    | Dallas             |
#      | Program_StreetAddress1          | This Road          |
#      | Program_PostalCode              | 75034              |
#      | Program_Description             | selenium Portfolio |
#      | _ManagerIDList_MemberID_add     | Administrator, Lx  |
#      | Program_FiscalYearEnd           | 02/28/2014         |
#      | Program_IStateProvinceCountryID | TX                 |
#    And I click on the "Next" button
#    And I select portfolio "Lucernex-Selenium" from Create Organization Chart by duplicating Organization Chart list
#    And I click on the "Next" button
#    And I handle pop up window
#    And I select an option "<Folder Template>" from folder template list
#    And I click on the "Next" button
#    And I click on Assign Members button
#    And I add following members
#      | Access, Delete |
#      | Access, Edit   |
#    And I click on "Update  members to <Entity Name>" Button
#    And I click on the "Finish Assigning Members" button
#    Then I see the "Portfolio Setup Wizard -> <Entity Name> -> Assign Members" modal window
#    And I click on the "Finish" button
#    Then I see that I am on the entity "Portfolio: <Entity Name>"
#
#    And I verify pair of values on non editable summary page
#      | name            | value         |
#      | Name            | <Entity Name> |
#      | City            | Dallas        |
#      | Address         | This Road     |
#      | PostalCode      | 75034         |
#      | Fiscal year end | 02/28/2014    |
#    And I verify values on non editable summary page
#      | name        | value              |
#      | Description | selenium Portfolio |
#    And I verify management members "Lx Administrator"
#    And I verify management member link "Lx Administrator"
#
#    And I click on the "Members/Contacts" tab
#    And I verify the Members/Contacts tab
#      | type        | name             |
#      | Team Member | Lx Administrator |
#      | Broker      | Delete Access    |
#      | Broker      | Edit Access      |
#
#    And I click on the "Documents" tab
#    And I verify the list of folders Document
#      | SeleniumTestRootFolder1 |
#
#    When I navigate to "<Item>, Org Chart" entity
#    And I verify organization chart "Central (Central region - preOpen) Frisco(Pre-Open)"
#
#    Examples:
#      | Item      | Grid Header            | Entity Name                  | Folder Template          |
#      | Portfolio | Portfolio Setup Wizard | Selenium-Webdriver-Portfolio | Selenium Folder Template |