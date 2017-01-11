@all
Feature: To ensure that users can add custom list to form layout (Jira Ref.AUTOMATION-531)

  Scenario Outline: As a delete user I can able to add custom list to form layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | Form_For_Custom_List.xml         |
      | Add_this_custom_list_to_form.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    Then I expand the "<Form Name>" row in grid "<Grid ID>"
    And I click "edit fields" row action for the row that has "<Form Name>" in column "Name"
    Then I see the "Edit fields for <Form Name>" modal window
    And I click on " Add Report/Form Field... " button in grid
    And I set following fields value on editable page
      | name                | value               |
      | radioTypeSelection  | Custom              |
      | DefaultLabel        | <Custom list field> |
      | FormFieldTypeDriver | Custom List >>      |
      | ClientListRGDID     | <Custom List Name>  |
      | AccessorName        | Test                |
    And I click "Add" button
    And I click "Finished" button
    And I click "add layout" row action for the row that has "<Form Name>" in column "Name"
    And I set following fields value on editable page
      | name           | value         |
      | PageLayoutName | <Page layout> |
      | AllowEdit      | true          |
    Then I click on the "Add Layout" button
    And I click "build layout" action of "<Page layout>" sub row in the grid "<Grid ID>"
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields    |
      | Forms               |
      | <Form Name>         |
      | <Custom list field> |
    Then I drag and drop the following
      | <Custom List Page Layout> |
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    Then I switch to main window
#    When I navigate to "<Item>, <Second Level Tab>"
#    And I navigate to entity "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I click "Add Item" form button
    And I click " Add Form... " button
    And I switch to default frame
    And I select form type "<Page layout>" in modal window

  Examples:
    | Custom List Name             | Custom List Page Layout | Custom list field | Form Name             | Page layout          | Login User   | Login full username  | Grid ID             | Item    | Second Level Tab | Third Level Tab | Entity Name      |
    | Add this custom list to form | Custom List Page Layout | Added Custom List | Forms for Custom List | Form for Custom List | DeleteAccess | Delete Access Access | BOGridCodeIssueType | Project | Details          | Forms           | Lucernex-Project |