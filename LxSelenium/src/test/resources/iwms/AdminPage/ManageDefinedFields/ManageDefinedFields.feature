@all
Feature: Manage Defined Fields - (Jira Ref - AUTOMATION-16)

  Scenario Outline: As DeleteAccess user add a new code item
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "<code-type> Code" link
    And I see the "<code-type>" modal window
    And I click "Add <add-item-window-name>..." button
    And I set following fields on editable page
      | name           | value                                                        |
      | ShortName      | Added by <user-class>                                        |
      | ActualLongName | Cuke: Testing <user-class> security for adding a <code-type> |
    When I click on the "Add" button on Add Item Modal Window
#    IWMS-22139
#    Then I see "Successfully added <add-item-window-name>" in the grid header
    And I verify a row from non frame grid "<grid>" having unique value "Added by <user-class>" under column header "Name"
      | name        | value                                                        |
      | Name        | Added by <user-class>                                        |
      | Description | Cuke: Testing <user-class> security for adding a <code-type> |
    And I click "Close" button


  Examples:
    | user-class | code-type        | add-item-window-name | grid                |
    | Edit       | Job Function     | item                 | BOGridFirmCode      |
    | Delete     | Job Function     | item                 | BOGridFirmCode      |
    | Edit       | Job Title        | item                 | BOGridFirmCode      |
    | Delete     | Job Title        | item                 | BOGridFirmCode      |
    | Edit       | User Class       | User Class           | BOGridCodeUserClass |
    | Delete     | User Class       | User Class           | BOGridCodeUserClass |
    | Edit       | Document Content | item                 | BOGridFirmCode      |
    | Delete     | Document Content | item                 | BOGridFirmCode      |
    | Edit       | Document Type    | item                 | BOGridFirmCode      |
    | Delete     | Document Type    | item                 | BOGridFirmCode      |

  Scenario: I logout As DeleteAccess user
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I logout

  Scenario Outline: A user with edit access tries to edit a line item
    Given I Login to IWMS using "EditAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "<code-type>" link
    And I click on the "edit" row action of column "<old-name>" of column "0" from grid "<grid>"
    And I set following fields on editable page
      | name           | value             |
      | ShortName      | <new-name>        |
      | ActualLongName | <new-description> |
    And I click "Update" button
#    IWMS-22139
#    Then I see "Successfully updated <edit-item-win-name>" in the grid header
    And I see the item was successfully added with "<new-name>" and "<new-description>"
    And I click "Close" button

  Examples:
    | code-type         | old-name      | new-name | new-description            | edit-item-win-name | grid                |
    | Job Function Code | Added by Edit | Edit Me  | Edit Me description - edit | item               | BOGridFirmCode      |
    | Job Title Code    | Added by Edit | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |
    | User Class Code   | Added by Edit | Edit Me  | Edit Me description - new  | User Class         | BOGridCodeUserClass |
    | Document Content  | Added by Edit | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |
    | Document Type     | Added by Edit | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |


  Scenario: I logout As DeleteAccess user
    Given I Login to IWMS using "EditAccess" access credentials
    And I logout

  Scenario Outline: A user with delete access tries to delete a code item
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "<code-type>" link
    And I click on the "delete" row action of column "<item-name>" of column "0" from grid "<grid>"
    And I click "Yes" button
#    IWMS-22139
#    Then I see "Successfully deleted <edit-item-win-name>" in the grid header
    And I click "Close" button

  Examples:
    | code-type         | item-name       | edit-item-win-name | grid                |
    | Job Function Code | Added by Delete | item               | BOGridFirmCode      |
    | Job Title Code    | Added by Delete | item               | BOGridFirmCode      |
    #IWMS-21762
#    | User Class Code   | Added by Delete | User Class         | BOGridCodeUserClass |
    | Document Content  | Added by Delete | item               | BOGridFirmCode      |
    | Document Type     | Added by Delete | item               | BOGridFirmCode      |