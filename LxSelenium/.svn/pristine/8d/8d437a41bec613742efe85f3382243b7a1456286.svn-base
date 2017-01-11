@all
Feature: (Automation - AUTOMATION-1337) Default Values - Forms

  Scenario Outline: As a delete user I import the following xmls and data field
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | Portfolio_Sprint_16-1337.xml |

    When I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I click on the "Firm Fields" link
    And I click on "ImportDataFields" Button
    And I switch to "Import Field" child window
    And I import following Data field Values "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/":
      | DataFields_2518-1337.xls |
    And I verify the following text in a page
      | Field Import Summary:  |
      | Fields Processed - 1   |
      | Fields Updated - 0     |
      | Fields Created - 1     |
      | Fields Deleted - 0     |
      | Group Import Summary:  |
      | Groups Processed - 279 |
      | Groups Updated - 0     |
      | Groups Created - 0     |
      | Groups Deleted - 0     |
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    And I import following file name:
      | Form-2518-1337.xml           |


    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Default Values - Forms
    When I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I click on the "Firm Fields" link
    And I expand the the following data fields group
      | Summary Information         |
      | General Summary Information |
    And I click "edit" for the "FormField-2518" Group
    And I switch to "Edit Field" child window
    And I verify the following fields value on editable page
      | name         | value |
      | DefaultValue | Test  |
    And I close the "Edit Field" child window
    And I switch to main window
    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click " Add Form... " button of frame grid "issueMainDiv"
    And I see a modal window
    And I select form type "<Form Name>" in modal window
    And I click on the "OK" button
    And I verify the following fields value on editable page
      | name              | value |
      | Project_FormField | Test  |
    And I click on the "Add" button
    And I wait for modal window to close
    And I verify the following values in frame grid "issueMainDiv"
      | Title          | Form Type | Creator              |
      | [Today's Date] | FL-2518   | Delete Access Access |

    Examples:
      | Entity Name     | Form Name |
      | FormEntity-2518 | FL-2518   |

  Scenario Outline: Set Default Values - Pages to Test-Updated
    Given I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    Then I expand the "<Form Layout>" row in grid "BOGridCodeIssueType"
    And I click "build layout" action of "<Form Name>" sub row in the grid "BOGridCodeIssueType"
    And I switch to "build layout" child window
    And I click edit option for the "FormField-2518" field
    Then I wait for modal window to open
    And I set following fields value on editable page
      | name                      | value        |
      | json.EditModeDefaultValue | Test-Updated |
    And I click on "Set Options" Button
    Then I wait for modal window to close
    And I click on "Save Layout" Button
    And I see the "Save Changes?" modal window
    And I click on the "Yes" button
    And I click on "Close" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window

    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Forms" tab
    Then I verify I am at Form tab
    And I click " Expand All " button
    And I click on "<Check Out>" link
    And I switch to default frame
    And I verify the following fields value on editable page
      | name              | value        |
      | Project_FormField | Test-Updated |


    Examples:
      | Form Layout | Form Name | Entity Name     |
      | Form-2518   | FL-2518   | FormEntity-2518 |


