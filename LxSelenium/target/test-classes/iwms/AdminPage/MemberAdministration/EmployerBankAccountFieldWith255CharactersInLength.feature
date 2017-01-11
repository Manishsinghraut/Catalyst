@all
Feature: (Jira Ref: AUTOMATION-1405)  Employer Bank Account field with 255 Characters in length

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following files:
      | Testing_11406_EMP-1405.xlsx |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user i update employers bank account
    Given I navigate to the admin dashboard
    And I click on "Manage Employers" link
    Then I verify the following values in non frame grid "<Grid ID>"
      | Company Type | Name         | Address | City  | State | Vendor# |
      | Vendor       | <Employer A> | 100     | Plano | TX    | 100     |
      | Other        | <Employer B> | 200     | Plano | TX    |         |
    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name | value        |
      | Name | <Employer A> |
    And I wait for "Edit Employer  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name                       | value                                                                                                           |
      | Employer_BankAccountNumber | BA Number 12345678910111213141516171819202122232425262728293031323334353637383940414243444546474849505152535455 |
    And I click on the "Cancel" button
    And I wait for modal window to close

    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name | value        |
      | Name | <Employer B> |
    And I wait for "Edit Employer  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value                                                                                                                    |
      | Employer_BankAccountNumber | 10022001 BA Number 12345678910111213141516171819202122232425262728293031323334353637383940414243444546474849505152535456 |
    And I click on the "Update" button
    And I wait for modal window to close
    Then I see "Successfully updated Employer" message in the header

    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name | value        |
      | Name | <Employer B> |
    And I wait for "Edit Employer  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name                       | value                                                                                                                    |
      | Employer_BankAccountNumber | 10022001 BA Number 12345678910111213141516171819202122232425262728293031323334353637383940414243444546474849505152535456 |
    And I click on the "Cancel" button
    And I wait for modal window to close


    Examples:
      | Grid ID                | Employer A          | Employer B          |
      | BOGridLX_Grid_Employer | Testing_11406 EMP A | Testing_11406 EMP B |

