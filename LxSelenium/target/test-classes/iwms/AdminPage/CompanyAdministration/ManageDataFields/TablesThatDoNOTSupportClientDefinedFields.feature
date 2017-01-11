@all
Feature: (Automation - AUTOMATION-1340) Tables that do NOT support Client Defined Fields

  Scenario Outline: Tables that do NOT support Client Defined Fields
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Tables that do NOT support Client Defined Fields
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

    And I set following fields value on editable page
      | name                | value               |
      | DefaultLabel        | Field A-1963        |
      | CodeSQLTableID      | <Table Association> |
      | GlobalFormFieldType | sTYPE_TEXT          |
      | AccessorName        | FieldA              |
    And I click on "Add" Button
    Then I see "Table Association " message in the header
    Then I see "<Message>" message in the header
    Then I see "does not support client-defined fields." message in the header
    And I close the "Add Field" child window
    And I switch to main window
    Then I wait for browser windows count to be equal to "1"
    And I collapse the the following data fields group
      | Location |

    Examples:
      | Table Association | Message                |
      | Committee Package | Binder                 |
      | Comparison Item   | Comparison Report Item |
      | Comparison Report | Comparison Report      |