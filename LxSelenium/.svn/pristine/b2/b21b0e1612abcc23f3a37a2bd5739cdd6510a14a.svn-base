@all
Feature: Verify that total offset link brings payment transactions correctly

  Scenario: Login and initialize Contract entity
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to import page
    When I used data files from "Data/ImportDataFiles/"
    And I import following file name:
      | 35 PRPVariousFixedOffsets.xml           |

  Scenario: Navigate to Contract, Payment Info, Percentage Rent
    When I navigate to entity type "Contract" named "PRPVariousFixedOffsets"
    And I navigate to "Contract, Payment Info"
    And I click on the "Percentage Rent" tab
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Percentage Rent"

  Scenario: Navigate to Percentage Rent (Single BP) Schedule and select October 2014 schedule
    When I navigate to "Percentage Rent (Single BP) Schedule" fourth level menu
    And I select "November" month and "2014" year on PRP schedule page
    And I click on the "€3,000.00" offset amount link

  Scenario Outline: Test Offset Payments grid
    Then I verify in grid "Grid_" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
    Examples:
    |rowNumber  |headerName            |cellValue          |
    |1          |Effective Date        |09/01/2014         |
    |1          |Total Amount          |€1,500.00          |
    |2          |Total Amount          |€1,747.50          |
