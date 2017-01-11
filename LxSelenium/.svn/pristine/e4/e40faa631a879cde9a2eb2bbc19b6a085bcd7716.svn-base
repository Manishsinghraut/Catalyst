@all
Feature: (Jira Ref: AUTOMATION-404)I create/update members and contacts through spreadsheet import

  Background:
    #Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: I create/update members and contacts through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | Create_Member_SS.xls |
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I verify newly created member "<Member Name>"
    And I import following file name:
      | Update_Member_SS.xls |
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" button of the member "<Edited Member Name>"
    And I set following fields value on editable page
      | name               | value |
      | UseEmployerAddress | false |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Update_Member_SS.xls"
    Then I verify these field values on editable page comparing with "<Spreadsheet Row>" th row of spreadsheet
      | name                       | value                              |
      | FirstName                  | Member.FirstName                   |
      | MobileNumber               | Member.MobileNumber                |
      | Fax                        | Member.Fax                         |
      | Person_Phone               | Member.Phone                       |
      | Description                | Member.Description                 |
      | EmployerID                 | Member.EmployerID                  |
      | Title                      | Member.Title                       |
      | CodeUserClassID            | Member.CodeUserClassID             |
      | StreetAddress1             | Member.StreetAddress1              |
      | StreetAddress2             | Member.StreetAddress2              |
      | City                       | Member.City                        |
      | RecurringApprovalMinAmount | $Member.RecurringApprovalMinAmount |
      | RecurringApprovalMaxAmount | $Member.RecurringApprovalMaxAmount |
      | PaymentApprovalMinAmount   | $Member.PaymentApprovalMinAmount   |
      | PaymentApprovalMaxAmount   | $Member.PaymentApprovalMaxAmount   |
      #| CodeContactTypeIDList      | Person.CodeContactTypeIDList       |

    Examples:
      | Member Name   | Edited Member Name  | Spreadsheet Row |
      | Member Test B | EditedMember Test B | 6               |
