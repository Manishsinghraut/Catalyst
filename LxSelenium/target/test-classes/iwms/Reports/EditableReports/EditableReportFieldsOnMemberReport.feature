@all
Feature: Editable Report - Fields on Member Report - [Jira Ref. : AUTOMATION-1392]

  Scenario Outline: As Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | AssignedMembers_1392.xlsx |
      | MemberReport_1392.xml     |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete user, I verify the A pop up will display with data populated on members related to the firm. All fields will be populated.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    Then I navigate to the reports dashboard
#    And I click on the "run" row action of column "<Report Name>" of column "0" from grid "<Grid>"

    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Code Job Function | Code Job Title | Designations | Email #1         | Employer          | Employer Inactive? | First Name | Is Administrator? | Language | Last Name | Login Name | Member Login Status |
      | Delete Access     | Delete Access  |              | QA1@lucernex.com | Selenium-Employer | No                 | Abel       | No                | English  | Abner     | Abel       | Login enabled       |

    And I click the field "English" under column "Language" of field "Abel" under column of "First Name" on the report
    And I set following fields value on editable page
      | name            | value  |
      | Member_Language | French |
    And I click on the green check-mark

    And I verify the following values in non frame grid
      | Code Job Function | Code Job Title | Designations | Email #1         | Employer          | Employer Inactive? | First Name | Is Administrator? | Language | Last Name | Login Name | Member Login Status |
      | Delete Access     | Delete Access  |              | QA1@lucernex.com | Selenium-Employer | No                 | Abel       | No                | French   | Abner     | Abel       | Login enabled       |


    And I click the field "QA1@lucernex.com" under column "Email #1" of a field "Abel" under column of "First Name" on the report
    And I set following fields value on editable page
      | name          | value               |
      | Member_EMail1 | noemail@noemail.com |
    And I click on the green check-mark

    And I verify the following values in non frame grid
      | Code Job Function | Code Job Title | Designations | Email #1            | Employer          | Employer Inactive? | First Name | Is Administrator? | Language | Last Name | Login Name | Member Login Status |
      | Delete Access     | Delete Access  |              | noemail@noemail.com | Selenium-Employer | No                 | Abel       | No                | French   | Abner     | Abel       | Login enabled       |


    And I click on the "Rerun Report" link
    And I verify the following values in non frame grid
      | Code Job Function | Code Job Title | Designations | Email #1            | Employer          | Employer Inactive? | First Name | Is Administrator? | Language | Last Name | Login Name | Member Login Status |
      | Delete Access     | Delete Access  |              | noemail@noemail.com | Selenium-Employer | No                 | Abel       | No                | French   | Abner     | Abel       | Login enabled       |

    And I close the "Report" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Report Name   | Grid        |
    | DeleteAccess | Delete Access Access | Member Report | pageContent |


  Scenario Outline: As Delete user, I Navigate to Admin > Manage Members and Contacts and verify the Email address should be "noemail@noemail.com" and language should be "French"
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid

    And I search by "Name" "Abel Abner"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value      |
      | Name | Abel Abner |

    And I verify the following fields value on editable page
      | name     | value               |
      | EMail1   | noemail@noemail.com |
      | Language | French              |
    And I click "Cancel" button

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |
