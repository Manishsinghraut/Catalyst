@all
Feature: (Jira Ref. AUTOMATION-526) To ensure that users can add line items

  Scenario Outline: Import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following files:
      | CLProject-1594-526.xml |
      | 1594-Form-526.xml      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Add line items
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of non frame grid "<Grid ID>"
    And I switch to default frame
    And I select form type "Form-1594" in modal window
    And I click on the "OK" button
    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Modified By | Modified Date | Note   |
      |             |               | Test 1 |
    And I click on the "Update" button "on pop window"

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Modified By | Modified Date | Note   |
      |             |               | Test 2 |
    And I click on the "Update" button "on pop window"

    And I click 'Add' button to add line items
    And I wait for modal window to close
    Then I verify the following values in frame grid "<Grid ID>"
      | Title          | Days Open | Due Date | Assignees | Form Type | Creator              | Last Reply | # Replies |
      | [Today's Date] | 0         |          |           | Form-1594 | Delete Access Access |            | 0         |
    And I verify message "1594-Form item successfully added"

    And I click on "<Check Out>" link
    And I switch to default frame
    Then I verify all rows count "2" in non frame grid "^customListGrid"
    And I verify the following values in non frame grid "^customListGrid"
      | Modified By          | Modified Date                  | Note   |
      | Delete Access Access | [Today's Date with Hour AM/PM] | Test 1 |
      | Delete Access Access | [Today's Date with Hour AM/PM] | Test 2 |

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Modified By | Modified Date | Note   |
      |             |               | Test 3 |
    And I click on the "Cancel" button "on pop window"
    Then I verify all rows count "2" in non frame grid "^customListGrid"
    And I verify the following values in non frame grid not exist "^customListGrid"
      | Modified By          | Modified Date                  | Note   |
      | Delete Access Access | [Today's Date with Hour AM/PM] | Test 1 |
      | Delete Access Access | [Today's Date with Hour AM/PM] | Test 2 |
      | Delete Access Access | [Today's Date with Hour AM/PM] | Test 3 |
    And I click "Close" button

    Examples:
      | Project Name   | Grid ID             |
      | CLProject-1594 | BOGridLX_Grid_Issue |


#@all
#Feature: To ensure that users can add line items (Jira Ref. AUTOMATION-526)
#
#  Scenario Outline: Import xml
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
#    And I import following file name:
#      | Add_line_items.xml |
#
#  Examples:
#    | Login User   | Login full username  |
#    | DeleteAccess | Delete Access Access |
#
#  Scenario Outline: Add line items
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "<Item>"
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    And I click on the "<Third Level Tab>" tab
#    Then I verify I am at Form tab
##    And I click " Add Form... " form button
#    And I click " Add Form... " button
#    And I switch to default frame
#    And I select form type "<Page layout>" in modal window
#    And I click on the "OK" button
#    And I set following fields value on editable page
#      | name          | value   |
#      | Issue_Subject | <Title> |
#
#    And I click '+ Add' button to add line items
#    And I enter "<Row Name1>" label name
#    And I click "Update" button
#
#    And I click '+ Add' button to add line items
#    And I enter "<Row Name2>" label name
#    And I click "Update" button
#    And I click 'Add' button to add line items
#    And I wait for the Loading text to disappear
#
#  Examples:
#    | Row Name1 | Row Name2 | Title     | Page layout    | Login User   | Login full username  | Item    | Third Level Tab | Entity Name      |
#    | add line1 | add line2 | Title Add | Add line items | DeleteAccess | Delete Access Access | Project | Forms           | Lucernex-Project |
#
#  Scenario Outline: Verify line items
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "<Item>"
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    And I click on the "<Third Level Tab>" tab
#    Then I verify I am at Form tab
##    And I expand all form lists
#    And I click " Expand All " button
##    And I switch to visible frame
#    And I click "<View>" link for form "<Title>"
#    And I switch to default frame
#    And I verify row from grid "^customListGrid" having unique value "<Row Name1>" under column header "Label Name" in modal window
#      | name       | value       |
#      | Label Name | <Row Name1> |
#
#    And I verify row from grid "^customListGrid" having unique value "<Row Name2>" under column header "Label Name" in modal window
#      | name       | value       |
#      | Label Name | <Row Name2> |
#    And I click "Close" button
#
#  Examples:
#    | Page layout    | Row Name1 | Row Name2 | Title     | Login User   | Login full username  | Item    | Third Level Tab | Entity Name      |
#    | Add line items | add line1 | add line2 | Title Add | DeleteAccess | Delete Access Access | Project | Forms           | Lucernex-Project |
#
#
#  Scenario Outline: Cancel adding line items and ensure line item not present
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "<Item>"
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    And I click on the "<Third Level Tab>" tab
#    Then I verify I am at Form tab
##    And I expand all form lists
#    And I click " Expand All " button
##    And I switch to visible frame
#    And I click "<Check Out>" link for form "<Title>"
#    And I switch to default frame
#    And I click '+ Add' button to add line items
#    And I enter "<Row Name3>" label name
#    And I click "Cancel" button
#    And I click on the "Update & Check in" button
#    Then I verify I am at Form tab
##    And I expand all form lists
#    And I click " Expand All " button
##    And I switch to visible frame
#    And I click "<View>" link for form "<Title>"
#    And I switch to default frame
#    Then I verify row from grid "^customListGrid" having unique value "Row Name3" not present in modal window
#    And I click "Close" button
#
#  Examples:
#    | Row Name3 | Title     | Login User   | Login full username  | Item    | Third Level Tab | Entity Name      |
#    | add line3 | Title Add | DeleteAccess | Delete Access Access | Project | Forms           | Lucernex-Project |
