@all
Feature: (AUTOMATION-1040 ) Search a member using login id

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: I create/update contacts through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | Testing13225.xls |
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I search member "<Login Name>"
    And I verify following values in non frame grid "BOGridBOListExtGridPerson"
      | Name          | Member? | Job Title     | Job Function         | Email              | Employer          | User Class    | Last Login |
      | Testing 13225 | Yes     | Delete Access | System Administrator | svcQA@lucernex.com | Selenium-Employer | Delete Access |            |

    And I click on "edit" row action in the grid "BOGridBOListExtGridPerson" having the following header "Name" and cell value "Testing 13225"
      | name    | value |
      | Member? | Yes   |

    And I set following fields value on editable page
      | name      | value                    |
      | FirstName | Edited                   |
      | EMail1    | EditedsvcQA@lucernex.com |
    And I verify the following fields value on editable page
      | name      | value        |
      | LoginName | Testing13225 |

    And I click on the "Update" button
    #Search a member using login id
#    And I see "Successfully updated Member" in the grid header
    Then I verify success message "Successfully updated Member" in non frame page

    And I verify following values in non frame grid "BOGridBOListExtGridPerson"
      | Name         | Member? | Job Title     | Job Function         | Email                    | Employer          | User Class    | Last Login |
      | Edited 13225 | Yes     | Delete Access | System Administrator | EditedsvcQA@lucernex.com | Selenium-Employer | Delete Access |            |

    And I click on "edit" row action in the grid "BOGridBOListExtGridPerson" having the following header "Name" and cell value "Edited 13225"
      | name    | value |
      | Member? | Yes   |
    And I verify the following fields value on editable page
      | name      | value        |
      | LoginName | Testing13225 |


    Examples:
      | Login Name   |
      | Testing13225 |
