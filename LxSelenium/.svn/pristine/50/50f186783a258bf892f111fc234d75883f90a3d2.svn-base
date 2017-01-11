@all
Feature: (Jira Ref. AUTOMATION-1420) Ability to Format numbers to red in negative value

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | 00018_PortfolioAndLocation-1420.xml |
    And I import following files:
      | 11344page_layouts-1420 .xml |
      | 11344_Contract(1)-1420.xml  |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Ability to Format numbers to red in negative value
    When I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click "build layout" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page Layout> |
    And I switch to "build layout" child window

    And I click on the '...' for the following field label "Annual Total Amount (Current Annual Calendar Total Rent)"
    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button

    And I click on the '...' for the following field label "Aggregate Total Amount (Aggregate Total Rent)"
#    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button

    And I click on the '...' for the following field label "Rate (currPaymentRate)"
    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button

    And I click on the '...' for the following field label "Aggregate Base Rent"
    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button

    And I click on the '...' for the following field label "Currency (Currency Type)"
    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button

    And I click on the '...' for the following field label "Monthly Total Rent (Current Monthly Total Rent)"
    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button


    And I click on the '...' for the following field label "Monthly Base Rent (Current Monthly Base Rent)"
    And I wait for modal window to open
    And I verify the following fields value on editable page
      | name                    | value |
      | json.FieldNegativeValue | true  |
    And I click on the "Cancel" Button

    And I close the "build layout" child window
    And I switch to main window
    And I navigate to entity type "Contracts" named "11344 Contract" through search option
    And I select "<Page Layout>" page layout from dropdown
    Then I verify the following negative values in a same row in "Financial section" within frame page
      | Annual Total Amount    | $-9,080,000.00   |
      | Annual Base Rent       | $-1,080,000.00   |
      | Monthly Total Rent     | $-90,000.00      |
      | Aggregate Total Amount | $-190,680,000.00 |
      | Aggregate Base Rent    | $-22,680,000.00  |
      | Monthly Base Rent      | $-90,000.00      |
      | Rate                   | $-13.55          |

    Examples:
      | Page Layout            | Grid ID          | Page Layout            |
      | Contract Summary 11344 | BOGridPageLayout | Contract Summary 11344 |