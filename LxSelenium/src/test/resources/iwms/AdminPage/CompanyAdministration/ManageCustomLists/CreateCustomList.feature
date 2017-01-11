@all
Feature: (Jira Ref. AUTOMATION-521) As an IWMS user I need to be able to create custom list.

  Scenario Outline: As a delete user I create custom list
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Custom Lists" link
    And I click "Add item..." button of non frame grid "<Grid ID>"
    And I wait for "Add item  ***Required fields in red" modal window to open in non frame page
    And I set these field values on editable page
      | name                       | value              |
      | ReportGroupDataName        | <Custom List Name> |
      | CLRExtensionCodeSQLTableID | Standard           |
      | Description                | <Description>      |
    When I click on the "Add" button
    And I wait for modal window to close
    Then I see "Successfully added item" in the grid header
    Then I verify the following values in non frame grid "<Grid ID>"
      | Name               | Description   | Type     | Actions                                     |
      | <Custom List Name> | <Description> | Standard | edit \| delete \| edit fields \| add layout |

    Examples:
      | Custom List Name   | Login User   | Login full username  | Grid ID                         | Description |
      | Create Custom List | DeleteAccess | Delete Access Access | BOGridReportGroupDataCustomList | Test for CL |

  Scenario Outline: As a delete user I navigate to add cl fields report fields
    And I click "edit fields" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name | value              |
      | Name | <Custom List Name> |
    Then I wait for "Edit fields" modal window to open in non frame page

    Examples:
      | Custom List Name   | Grid ID                         |
      | Create Custom List | BOGridReportGroupDataCustomList |

  Scenario Outline: Adding CL Fields
    Given I click "Add Report/Form Field..." button of non frame grid "BOGridReportGroupAvailableField"
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to open in non frame page
    And I set fields values on editable page
      | name               | value  |
      | radioTypeSelection | Custom |
    And I set fields values on editable page
      | name                | value                    |
      | DefaultLabel        | <Field Name>             |
      | FormFieldTypeDriver | <Form Field Type Driver> |
      | AccessorName        | <Integration Name>       |
    And I click "Add" button
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to close
    Then I verify the following values in non frame grid "BOGridReportGroupAvailableField"
      | Field Name   | Default Name | Required | Form Field Type | Integration Name   | Actions        |
      | <Field Name> |              | No       | <Type>          | <Integration Name> | edit \| delete |

    Examples:
      | Field Name | Form Field Type Driver | Integration Name | Type                  |
      | CheckBox   | Check Box              | Test             | Checkbox              |
      | CCheckBox  | Confirmation Check Box | Test1            | Confirmation Checkbox |
      | Currency   | Currency               | Test2            | Currency              |
      | Date       | Date                   | Test3            | Date                  |
      | Time       | Time                   | Test4            | Time                  |
      | Num        | Number                 | Test5            | Number                |
      | Memo       | Memo                   | Test6            | Memo                  |
      | Percent    | Percent                | Test7            | Percent               |
      | Yes/No     | Yes/No                 | Test8            | Yes/No                |
      | Doc        | Document               | Test9            | Document              |


  Scenario Outline: Adding CL Math Fields
    Given I click "Add Report/Form Field..." button of non frame grid "BOGridReportGroupAvailableField"
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to open in non frame page
    And I set fields values on editable page
      | name               | value |
      | radioTypeSelection | Math  |
    And I click on the "Add Number/Currency math field" link
    And I set fields values on editable page
      | name            | value         |
      | fieldName       | <Math Number> |
      | availableFields | Num           |
      | NumericConstant | 100           |
    And I click on >> button to move selected field
    And I click on "+" Button
    And I click on >> button to move numeric constants
    Then I click "Submit" button
    Then I click "Add" button
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to close
    Then I verify the following values in non frame grid "BOGridReportGroupAvailableField"
      | Field Name    | Default Name | Required | Form Field Type | Actions        |
      | <Math Number> |              | No       | Math            | edit \| delete |

    Given I click "Add Report/Form Field..." button of non frame grid "BOGridReportGroupAvailableField"
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to open in non frame page
    And I set fields values on editable page
      | name               | value |
      | radioTypeSelection | Math  |
    And I click on the "Add Date math field" link
    And I set fields values on editable page
      | name          | value       |
      | fieldName     | <Math Date> |
      | DateFieldType | true        |
    Then I click "Submit" button
    Then I click "Add" button
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to close
    Then I verify the following values in non frame grid "BOGridReportGroupAvailableField"
      | Field Name  | Default Name | Required | Form Field Type | Actions        |
      | <Math Date> |              | No       | Date Math       | edit \| delete |

    Given I click "Add Report/Form Field..." button of non frame grid "BOGridReportGroupAvailableField"
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to open in non frame page
    And I set fields values on editable page
      | name               | value |
      | radioTypeSelection | Math  |
    And I click on the "Add Time math field" link
    And I set fields values on editable page
      | name          | value       |
      | fieldName     | <Math Time> |
      | DateFieldType | true        |
    Then I click "Submit" button
    Then I click "Add" button
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to close
    Then I verify the following values in non frame grid "BOGridReportGroupAvailableField"
      | Field Name  | Default Name | Required | Form Field Type | Actions        |
      | <Math Time> |              | No       | Time Math       | edit \| delete |


    Examples:
      | Math Number | Math Date | Math Time |
      | AddNum      | AddDate   | AddTime   |

  Scenario Outline:Adding CL Standard Fields
    Given I click "Add Report/Form Field..." button of non frame grid "BOGridReportGroupAvailableField"
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to open in non frame page
    And I set fields values on editable page
      | name   | value        |
      | RGAFID | <Field Name> |
    Then I click "Add" button
    And I wait for "Add Report/Form Field  ***Required fields in red" modal window to close
    Then I verify the following values in non frame grid "BOGridReportGroupAvailableField"
      | Field Name   | Default Name | Required | Form Field Type | Integration Name | Actions        |
      | <Field Name> | <Field Name> | No       | Field Data Type | ModifiedDate     | edit \| delete |
    And I click on the "Finished" button
    And I wait for modal window to close

    Examples:
      | Field Name    |
      | Modified Date |

  Scenario Outline:Adding CL Layouts
    Given I click "add layout" row action in the non frame grid "<CL Grid ID>" having the following header and cell values
      | name | value              |
      | Name | <Custom List Name> |
    Then I wait for "Add Layout for <Custom List Name>  ***Required fields in red" modal window to open in non frame page
    And I set fields values on editable page
      | name           | value                          |
      | PageLayoutName | <Custom List page layout name> |
      | Description    | <Custom List page layout name> |
    Then I click "Add Layout" button
    And I wait for the Loading text to disappear in grid
    And I click "layout form" action of "<Custom List page layout name>" sub row in the grid "<CL Grid ID>"
    And I switch to "build layout" child window
    And I select the following options
      | <Field1> |
      | <Field2> |
      | <Field3> |
      | <Field4> |
    And I verify the "<Field1 Name>" field is displayed on Page layout
    And I verify the "<Field2 Name>" field is displayed on Page layout
    And I verify the "<Field3 Name>" field is displayed on Page layout
    And I verify the "<Field4 Name>" field is displayed on Page layout
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Custom List Name   | Custom List page layout name  | CL Grid ID                      | Field1        | Field2       | Field3        | Field4         | Field1 Name | Field2 Name | Field3 Name | Field4 Name |
      | Create Custom List | Custom List page layout name2 | BOGridReportGroupDataCustomList | Currency(1x1) | Date(1x1)    | Doc(1x1)      | Memo(1x1)      | Currency    | Date        | Doc         | Memo        |
      | Create Custom List | Custom List page layout name3 | BOGridReportGroupDataCustomList | Num(1x1)      | Percent(1x1) | Time(1x1)     | AddDate(1x1)   | Num         | Percent     | Time        | AddDate     |
      | Create Custom List | Custom List page layout name1 | BOGridReportGroupDataCustomList | AddNum(1x1)   | AddTime(1x1) | CheckBox(1x1) | CCheckBox(1x1) | AddNum      | AddTime     | CheckBox    | CCheckBox   |


