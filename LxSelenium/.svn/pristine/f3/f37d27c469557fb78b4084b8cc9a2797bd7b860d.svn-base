@all
Feature: (Jira ticket Ref : AUTOMATION-1028) Welcome email for new users

  Scenario Outline: As an delete user I'm able to Add Member
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click "Add Person..." button
    And I see the "Add Person" modal window
    And I set following fields value on editable page
      | name                | value              |
      | FirstName           | AutoSelenium       |
      | LastName            | Webdriver          |
      | CodeJobFunctionID   | No Access          |
      | CodeJobTitleID      | No Access          |
      | Person_Phone        | 111-222-3333       |
      | EmployerID          | Lucernex           |
      | EMail1              | svcQA@lucernex.com |
      | LoginName           | z_Delete_1028      |
      | Password            | RegressionTest     |
      | CodeUserClassID     | Delete Access      |
      | CodeLockOutReasonID | Login enabled      |
      | SendWelcomeEmail    | true               |
    And I add following Contract type
      | Construction Manager |
    Then I click on the "Add" button
     #IWMS-22139
#    And I see "Successfully added Member" in the grid header


    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario: I verify Email should be received for members in the "Attention Email to" column
    Given I login to web mail on existing window
    And I search the mail using subject "[LxRetail] Lucernex Log-In Created"
    And I check mail body for the following contents
      | Your User Name: z_Delete_1028 |