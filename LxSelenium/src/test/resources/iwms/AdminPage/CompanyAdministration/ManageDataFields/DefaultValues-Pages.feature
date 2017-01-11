@all
Feature: (Automation - AUTOMATION-1336) Default Values - Pages

  Scenario Outline: As a delete user I import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | PortfolioSprint16-1336.xml |
      | LocationSprint16-1336.xml  |
      | Project2517-1336.xml       |
      | PageLayout2517-1336.xml    |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Verify NumberA data field will appear.
    Given I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I click on the "Firm Fields" link
    And I expand the the following data fields group
      | Summary Information         |
      | General Summary Information |
      | In-bound Email              |
    Then I verify the following values in non frame grid
      | Field Name   |
      | <Field Name> |

    Examples:
      | Field Name |
      | NumberA    |


  Scenario Outline: Verify Number A field will be pre-populated with number '100'
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I select "<Page layout>" page layout from dropdown
    And I wait for the Loading text to disappear
    Then I verify the field "NumberA" is "100" in "Summary Tab"
    And I click on the "Edit" action panel button
    And I wait for the Loading text to disappear
    Then I verify the following fields value on editable page
      | name                  | value |
      | ProjectEntity_NumberA | 100   |

    Examples:
      | Entity Name  | Page layout  |
      | Project 2517 | Testing 2517 |

  Scenario Outline: Update field value to 50
    When I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I click on the "Firm Fields" link
    And I expand the the following data fields group
      | Summary Information         |
      | General Summary Information |
    And I click "edit" for the "<Field Name>" Group
    And I switch to "Edit Field" child window
    Then I verify the following fields value on editable page
      | name         | value |
      | DefaultValue | 100   |
    And I set following fields value on editable page
      | name         | value |
      | DefaultValue | 50    |
    And I click on "Update" Button
    And I switch to main window
    Then I verify grid item action message "Successfully updated Report/Form Field"

    Examples:
      | Field Name |
      | NumberA    |

  Scenario Outline: Set Default Values - Pages to 100
    Given I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page layout> |
    And I switch to "build layout" child window
    And I click edit option for the "<Field Name>" field
    Then I wait for modal window to open
    And I set following fields value on editable page
      | name                      | value |
      | json.EditModeDefaultValue | 100   |
    And I click on "Set Options" Button
    Then I wait for modal window to close
    And I click on "Save Layout" Button
    And I see the "Save Changes?" modal window
    And I click on the "Yes" button
    And I click on "Close" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Page layout  | Field Name |
      | Testing 2517 | NumberA    |

  Scenario Outline: Verify Number A field will be pre-populated with number '100'
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I select "<Page layout>" page layout from dropdown
    And I wait for the Loading text to disappear
    Then I verify the field "NumberA" is "50" in "Summary Tab"
    And I click on the "Edit" action panel button
    And I wait for the Loading text to disappear
    Then I verify the following fields value on editable page
      | name                  | value |
      | ProjectEntity_NumberA | 100   |

    Examples:
      | Entity Name  | Page layout  |
      | Project 2517 | Testing 2517 |

