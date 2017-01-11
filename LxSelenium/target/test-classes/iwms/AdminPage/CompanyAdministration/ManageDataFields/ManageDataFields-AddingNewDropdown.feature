@all
Feature: (Automation - AUTOMATION-1339) Manage Data Fields - Adding New Dropdown

  Scenario Outline: Login as Delete user
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Manage Data Fields - Adding New Dropdown
    When I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I click on the "Firm Fields" link
    And I expand the the following data fields group
      | Location |
    And I click on Add Field for the "Address Info" Group
    And I switch to "Add Field" child window
    And I verify the following fields value on editable page
      | name              | value        |
      | ReportGroupDataID | Address Info |
    And I select following radio by label
      | name                  |
      | Choose Drop Down Type |
    And I set following fields value on editable page
      | name                 | value               |
      | DefaultLabel         | <Field Name>        |
      | CodeSQLTableID       | <Table Association> |
      | AccessorName         | Testing1595         |
      | GlobalFormFieldType  | sTYPE_TEXT          |
      | MasterCodeDataTypeID | Custom Drop downs   |
#    And I click on the '...' of field "slaveDotDotDot"
    And I click on the '...' of field "CodeDataTypeID"

#    And I switch to "Manage Custom Drop Down" third child window
#    And I click "Add Custom Drop Down..." button of non frame grid "BOGridCustomCodeTable"
    And I click "Add Custom Drop Down..." button of non frame grid "^editBOGrid"
    Then I wait for "Add Custom Drop Down  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                                     | value              |
      | CustomCodeTableName                      | <Custom Drop Down> |
      | _CustomCodeField_CustomCodeFieldName_add | Custom A           |
    And I click on "add" link
    And I set following fields value on editable page
      | name                                     | value    |
      | _CustomCodeField_CustomCodeFieldName_add | Custom B |
    And I click on "add" link
    And I set following fields value on editable page
      | name                                     | value    |
      | _CustomCodeField_CustomCodeFieldName_add | Custom C |
    And I click on "add" link
    And I click on the "Add" button
    And I wait for modal window to close
#    Then I verify grid item action message "Successfully added Custom Drop Down"

#    And I close the "Manage Custom Drop Down" third child window
#    And I switch to "Add Field" child window
    When I click on "Add" Button
#    And I set following fields value on editable page
#      | name                 | value              |
#      | MasterCodeDataTypeID | Custom Drop downs  |
#      | CodeDataTypeID       | <Custom Drop Down> |
#    And I click on "Add" Button

    And I switch to main window
    And I wait for browser windows count to be equal to "1"
    And I click on the "Firm Fields" link
    And I expand the the following data fields group
      | Location     |
      | Address Info |
    Then I verify the following values in non frame grid
      | Group Name/Field Label  <Expand All> | Field Name  | Reqd? | Read Only? | Table Association |
      | <Field Name>                         | Testing1595 | No    | No         | Employer          |


    Examples:
      | Table Association | Custom Drop Down | Field Name            |
      | Employer          | Custom Drop Down | Custom Drop down 1595 |