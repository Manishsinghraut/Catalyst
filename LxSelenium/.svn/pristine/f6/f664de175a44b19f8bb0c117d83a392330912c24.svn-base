@all
Feature: Budget Math Fields - Page Layout (JIRA Ref. : AUTOMATION-1064)

  Scenario Outline: I import the BudgetMathFieldsProjectEntity entity and BudgetMathTemplate and I verify the Manage Budget Types
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CostManagement/"
    And I import following files:
      | BudgetMathTemplate.xml            |
      | BudgetMathFieldsProjectEntity.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    Then I verify the following values in non frame grid "<Grid>"
      | Name               | Selected Status |
      | Building Cost      | Default Status  |
      | Installation       | Default Status  |
      | Investment factors | Default Status  |

    Examples:
      | Login User   | Login full username  | Grid                   |
      | DeleteAccess | Delete Access Access | BOGridBudgetColumnType |

  Scenario Outline: As a delete user I apply Budget Template
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    Then I navigate to second level tab "<Secondary Tab>" and third level "<Third Level Tab>" tab of entity "Project"
    And I set following fields value on editable frame page
      | name                     | value       |
      | budgetTemplateIDToAssign | Budget math |
    And I click on Assign Budget Template
    Then I see "Successfully assigned Budget Template" message in the header

    Examples:
      | Entity Name        | Secondary Tab | Third Level Tab |
      | Budget Math fields | Details       | Budget          |

  Scenario Outline: As a delete user I Manage Budget Summary Page
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I wait for the Loading text to disappear in grid
    And I wait for "Page Layout Name" is visible
    And I verify the "Page Layout Name" "on Manage Budget Summary Page"
    And I click on "Add" Button
    And I switch to "Page Layout" child window
    And I set following fields value on editable page
      | name                               | value            |
      | PageLayoutName                     | <Summary Page>   |
      | Description                        | Test Math Budget |
      | _checkbox_ValidForPotentialProject | true             |
      | _checkbox_ValidForProject          | true             |
      | _checkbox_ValidForFacility         | true             |
      | _checkbox_ValidForPrototype        | true             |
      | _checkbox_ValidForProgram          | true             |
      | _checkbox_ValidForCapitalProgram   | true             |
      | _checkbox_ValidForCapitalProject   | true             |
      | _checkbox_ValidForLocation         | true             |
      | _checkbox_ValidForParcel           | true             |
    And I click on "Add" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    And I see "Successfully added item" message in the grid

    Examples:
      | Summary Page |
      | Math Budget  |


  Scenario Outline: As a delete user I create math fields
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "build layout" action of "<Summary Page>" sub row in the grid "<Grid>"
    And I switch to "Page Layout" child window
    And I expand the following
      | Available Fields |
      | Budget Types     |
    Then I drag and drop the following
      | Building Cost      |
      | Installation       |
      | Investment factors |

    And I click on new cell pluse mark and then click on "Math Field" option to create field
    And I set following fields value on editable page
      | name              | value                          |
#      | defaultLabel      | Math Budget  |
      | defaultLabel      | Installation Div Building Cost |
      | formFieldType     | Currency                       |
      | reportGroupDataID | Budget Types                   |
      | codeSQLTableID    | Budget Column Type             |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I select "Installation" field to move in current operation field
    And I click on "/" operator button
    And I select "Building Cost" field to move in current operation field
    And I wait for the Loading text to disappear in grid
    And I click on "Submit" Button
    And I wait for pop up "Mathematical Operations Builder" to be disappear
    And I verify "Installation Div Building Cost" field added sucessfully

    And I click on new cell pluse mark and then click on "Math Field" option to create field
    And I set following fields value on editable page
      | name              | value                              |
      | defaultLabel      | Building Cost x Investment factors |
      | formFieldType     | Number                             |
      | reportGroupDataID | Budget Types                       |
      | codeSQLTableID    | Budget Column Type                 |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I select "Building Cost" field to move in current operation field
    And I click on "x" operator button
    And I select "Investment factors" field to move in current operation field
    And I click on "+" operator button
    And I set following fields value on editable page
      | name            | value |
      | NumericConstant | 10    |
    And I click on Numberic Constant ">>" button
    And I click on "Submit" Button
    And I wait for pop up "Mathematical Operations Builder" to be disappear
    And I verify "Building Cost x Investment factors" field added sucessfully

    And I click on new cell pluse mark and then click on "Math Field" option to create field
    And I set following fields value on editable page
      | name              | value                |
      | defaultLabel      | Installation Percent |
      | formFieldType     | Percentage           |
      | reportGroupDataID | Budget Types         |
      | codeSQLTableID    | Budget Column Type   |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I select "Installation" field to move in current operation field
    And I click on "/" operator button
    And I set following fields value on editable page
      | name            | value |
      | NumericConstant | 10    |
    And I click on Numberic Constant ">>" button
    And I click on "Submit" Button
    And I verify "Installation Percent" field added sucessfully

    And I click on new cell pluse mark and then click on "Math Field" option to create field
    And I set following fields value on editable page
      | name              | value              |
      | defaultLabel      | Total All          |
      | formFieldType     | Total              |
      | reportGroupDataID | Budget Types       |
      | codeSQLTableID    | Budget Column Type |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I select "Installation" field to move in current operation field
    And I click on "+" operator button
    And I select "Investment factors" field to move in current operation field
    And I click on "+" operator button
    And I select "Building Cost" field to move in current operation field
    And I click on "Submit" Button
    And I verify "Total All" field added sucessfully
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Grid | Summary Page |
      | main | Math Budget  |


  Scenario Outline: As a delete user I Budget Creation
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    Then I navigate to second level tab "<Secondary Tab>" and third level "<Third Level Tab>" tab of entity "Project"
    And I click on the "Budget Creation" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on "Add" Button
    And I switch to default frame
    And I set following fields value on editable page
      | name         | value         |
      | PageLayoutID | Building Cost |
    And I click on "Submit" Button
    And I click on the "Add" button
    And I switch to visible frame

    And I click on "Add" Button
    And I switch to default frame
    And I set following fields value on editable page
      | name         | value              |
      | PageLayoutID | Investment factors |
    And I click on "Submit" Button
    And I click on the "Add" button

    And I switch to visible frame
    And I click on "Add" Button
    And I switch to default frame
    And I set following fields value on editable page
      | name         | value        |
      | PageLayoutID | Installation |
    And I click on "Submit" Button
    And I click on the "Add" button

    And I switch to visible frame
    And I verify budget name "Building Cost #01" on template
    And I verify budget name "Installation #01" on template
    And I verify budget name "Investment factors #01" on template

    Examples:
      | Entity Name        | Secondary Tab | Third Level Tab | Summary Page |
      | Budget Math fields | Details       | Budget          | Math Budget  |


  Scenario Outline: As a delete user I upload
    Given I click on the "Budget Creation" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on "upload" Button
    And I switch to default frame
    And I switch to "upload" child window
    And I set following fields value on editable page
      | name               | value         |
      | BudgetColumnTypeID | Building Cost |
#    And I Upload the following Budget template from path "Data/ImportDataFiles/iwms/AdminPage/CostManagement/BuildingCost.xls"
    And I upload the following document from path "Data/ImportDataFiles/iwms/AdminPage/CostManagement/":
      | BuildingCost.xls |
    And I click on "Upload Budget" Button
    And I switch to main window
    And I switch to visible frame
    And I verify budget name "Building Cost #02" and Total "$1,000.00" on template

    And I click on "upload" Button
    And I switch to default frame
    And I switch to "upload" child window
    And I set following fields value on editable page
      | name               | value              |
      | BudgetColumnTypeID | Investment factors |
    And I upload the following document from path "Data/ImportDataFiles/iwms/AdminPage/CostManagement/":
      | InvestmentFactor.xls |
    And I click on "Upload Budget" Button
    And I switch to main window

    And I switch to visible frame
    And I verify budget name "Investment factors #02" and Total "$3,000.00" on template

    And I click on "values" of budget name "Installation #01"
    And I double click on "Item 1" of line and add value "2000"
    And I click on Update button
    And I switch to default frame
    And I click on the "Budget Creation" action panel button
    And I switch to visible frame
    And I verify budget name "Building Cost #01" and Total "$0.00" on template
    And I verify budget name "Building Cost #02" and Total "$1,000.00" on template
    And I verify budget name "Installation #01" and Total "$2,000.00" on template
    And I verify budget name "Investment factors #01" and Total "$0.00" on template
    And I verify budget name "Investment factors #02" and Total "$3,000.00" on template
    And I switch to default frame

    Examples:
      | Summary Page |
      | Math Budget  |


  Scenario Outline: As a delete user I view Budget Summary
    Given I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on "<Expand All>" link
#    And I verify Budget name "Investment" of "Item 1" of  Building Cost "$1,000.00" , Installation "$2,000.00" , Investment factors "$0.00", Math Budget "$2.00", Building Cost x Investment factors "$10.00",Installation Percent "201,000.00%" and Total All "$3,000.00"
#    And I verify Budget name "Investment" of "Item 1" of  Building Cost "$0.00" , Installation "$0.00" , Investment factors "$3,000.00", Math Budget "$0.00", Building Cost x Investment factors "$10.00",Installation Percent "1,000.00%" and Total All "$3,000.00"
#    And I verify Total of Building Cost "$1,000.00" , Installation "$2,000.00" , Investment factors "$3,000.00", Math Budget "$2.00", Building Cost x Investment factors "$3,000,010.00",Installation Percent "201,000.00%" and Total All "$6,000.00"
    And I verify Budget name "Investment" of "Item 1" of  Building Cost "$1,000.00" , Installation "$2,000.00" , Investment factors "$0.00", Installation Div Building Cost "$2.00", Building Cost x Investment factors "$10.00",Installation Percent "20,000.00%" and Total All "$3,000.00"
    And I verify Budget name "Investment" of "Item 2" of  Building Cost "$0.00" , Installation "$0.00" , Investment factors "$3,000.00", Installation Div Building Cost "$0.00", Building Cost x Investment factors "$10.00",Installation Percent "0.00%" and Total All "$3,000.00"
    And I verify Total of Building Cost "$1,000.00" , Installation "$2,000.00" , Investment factors "$3,000.00", Installation Div Building Cost "$2.00", Building Cost x Investment factors "$3,000,010.00",Installation Percent "20,000.00%" and Total All "$6,000.00"
    And I switch to default frame

    Examples:
      | Summary Page |
      | Math Budget  |