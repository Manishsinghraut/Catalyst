@all
Feature: Edit a Code item (Jira Ref - AUTOMATION-18,AUTOMATION-20,AUTOMATION-22,AUTOMATION-24,AUTOMATION-26)

  Scenario Outline: A user with edit access tries to edit a line item
    Given I Login to IWMS using "EditAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "<code-type>" link
    And I click on the "edit" row action of column "<old-name>" of column "0" from grid "<grid>"
    And I set these field values on editable page
      | name           | value             |
      | ShortName      | <new-name>        |
      | ActualLongName | <new-description> |
    And I click "Update" button
    Then I see "Successfully updated <edit-item-win-name>" in the grid header
    And I see the item was successfully added with "<new-name>" and "<new-description>"

  Examples:
    | code-type         | old-name      | new-name | new-description            | edit-item-win-name | grid                |
    | Job Function Code | Added by Edit | Edit Me  | Edit Me description - edit | item               | BOGridFirmCode      |
    | Job Title Code    | Added by Edit | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |
    | User Class Code   | Added by Edit | Edit Me  | Edit Me description - new  | User Class         | BOGridCodeUserClass |
    | Document Content  | Added by Edit | Edit Me  | Edit Me description - new  | item   | BOGridFirmCode      |
    | Document Type     | Added by Edit | Edit Me  | Edit Me description - new  | item      | BOGridFirmCode      |

  Scenario: User Class Code should not have any actions available for Default Security
    Given I login to IWMS using LxAdmin credentials
    And I navigate to the admin dashboard
    When I click on the "User Class Code" link
    Then I see the following row actions for the row that has "Default Security" in the column "Name":
      | none |