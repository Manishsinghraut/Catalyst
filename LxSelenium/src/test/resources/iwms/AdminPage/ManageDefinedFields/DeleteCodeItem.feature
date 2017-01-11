@all
Feature: Delete a Code item (Jira Ref - AUTOMATION-18,AUTOMATION-20,AUTOMATION-22,AUTOMATION-24,AUTOMATION-26)

  Scenario Outline: A user with delete access tries to delete a code item
    Given I login to IWMS using LxAdmin credentials
    And I navigate to the admin dashboard
    And I click on the "<code-type>" link
    And I click on the "delete" row action of column "<item-name>" of column "0" from grid "<grid>"
    And I click "Yes" button
    Then I see "Successfully deleted <edit-item-win-name>" in the grid header
    And I verify row "<item-name>" of column "Name" does not exist from grid "<grid>"

  Examples:
    | code-type         | item-name       | new-name | new-description            | edit-item-win-name | grid                |
    | Job Function Code | Added by Delete | Edit Me  | Edit Me description - edit | item               | BOGridFirmCode      |
    | Job Title Code    | Added by Delete | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |
    | User Class Code   | Added by Delete | Edit Me  | Edit Me description - new  | User Class         | BOGridCodeUserClass |
    | Document Content  | Added by Delete | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |
    | Document Type     | Added by Delete | Edit Me  | Edit Me description - new  | item               | BOGridFirmCode      |

#  Scenario Outline: A user without 'Delete' access tries to delete a Code item
#     Given I Login to IWMS using "delete" access credentials
#     When I navigate to the admin dashboard
#     And I click on the "<code-item>" link
#     Then I see the "delete" action links are "not-visible"
#
#  Examples:
#    | user-class | code-item    |
#    | View       | Job Function |
#    | View       | Job Title    |
#    | View       | User Class   |
#    | Edit       | Job Function |
#    | Edit       | Job Title    |
#    | Edit       | User Class   |



  Scenario Outline: I try to delete the Code items "Lx Administrator" but I should not be allowed to.
    Given I login to IWMS using LxAdmin credentials
    And I navigate to the admin dashboard
    And I click on the "<code-type>" link
    When I click "delete" row action for the row that has "Lx Administrator" in column "Name"
    And I click "Yes" button on "Delete item" confirmation dialog
    Then I see the message "Unable to delete, you do not have sufficient security access." in the popup window

  Examples:
    | code-type    |
    | Job Function |
    | Job Title    |