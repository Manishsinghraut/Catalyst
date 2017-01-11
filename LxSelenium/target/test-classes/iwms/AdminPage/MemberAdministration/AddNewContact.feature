@all
Feature: (Jira Ref: AUTOMATION-1309) ContactsCreateUpdate.feature

  Scenario: I create/update contacts through spreadsheet import
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not

    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "Add Person..." button
    And I wait for "Add Person  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value             |
      | Title                      |                   |
      | FirstName                  | AI                |
      | MiddleName                 |                   |
      | LastName                   | Jefferson         |
      | Suffix                     |                   |
      | CodeJobFunctionID          | No Access         |
      | CodeJobTitleID             | No Access         |
      | Person_Phone               | 111-111-1111      |
      | PhoneExtension             |                   |
      | EmployerID                 | Selenium-Employer |
      | EMail1                     | no@no.com         |
      | WirelessEMail              |                   |
      | Person_BillRate1           |                   |
      | Person_BillRate2           |                   |
      | UseEmployerAddress         | true              |
      | MobileNumber               |                   |
      | Fax                        |                   |
      | EMail2                     |                   |
      | WebSite                    |                   |
      | RecurringApprovalMinAmount |                   |
      | RecurringApprovalMaxAmount |                   |
      | PaymentApprovalMinAmount   |                   |
      | PaymentApprovalMaxAmount   |                   |
      | ConvertToMember            | false             |
      | Description                |                   |
      | availCodeContactTypeIDList | Broker            |
    And I click on ">>" Button

    And I verify following fields are hidden on editable page
      | name                      |
      | LoginName                 |
      | Password                  |
      | SupervisorID              |
      | Language                  |
      | CodeUserClassID           |
      | AnySiteLoginName          |
      | AnySitePassword           |
      | CodeLockOutReasonID       |
      | IsViewPrivateIssueAllowed |
      | SendWelcomeEmail          |
      | DatePattern               |
      | NumberPattern             |
      | TimeZone                  |

    And I click on the "Add" button
     #IWMS-22139
#    Then I see "Successfully added Contact" in the grid header
    And I select contract radio button grid
    Then I verify the following values in non frame grid "BOGridBOListExtGridPerson"
      | Name         | Member? | Job Title | Job Function | Email     | Employer          | User Class | Last Login |
      | AI Jefferson | No      | No Access | No Access    | no@no.com | Selenium-Employer |            |            |
