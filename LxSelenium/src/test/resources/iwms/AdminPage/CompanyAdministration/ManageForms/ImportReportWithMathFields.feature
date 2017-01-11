@all
Feature: To ensure that users can report on forms with math fields. (Jira - AUTOMATION-1055)

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | ImportMathFieldsLocation.xml |
      | MathReportForm.xml           |
      | MathFReport.xml              |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As delete Access user, I verify the Import Forms with math fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I click "Add Item" form button
    And I click " Add Form... " button
    And I switch to default frame
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I click on "Add" button of pluse icon
    And I enter "first number" field the value of "6", and "second number" field the value of "3"
    And I click on Update button
    And I verify "first number" field value of "6","second number" field value of "3","Sum" field value of "9","Product" field value of "18" and "Division" field value "2"
    And I click on "Add" button on modal window popup
    And I wait for modal window to close
    And I switch to default frame

  Examples:
    | Entity Name              | Secondary Tab | Third Level Tab | Form Type      |
    | ImportMathFieldsLocation | Details       | Forms           | MathReportForm |


  Scenario Outline: As a delete I verify Import Report with math Fields
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    Then I navigate to "Reports"
    And I navigate to the reports dashboard
#    And I click on "run" row action in the grid "BOGridPageLayout" having the following header "Report Name" and cell value "<Report Name>"
#      | name           | value                 |
#      | Description    |                       |
#      | Report Type    | Entity                |
#      | Saved for?     | All                   |
#      | Scheduled Jobs |                       |
#      | Created By     | <Login full username> |
    And I click "List All Reports" button
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name           | value                 |
      | Report Name    | <Report Name>         |
      | Description    |                       |
      | Report Type    | Entity                |
      | Saved for?     | All                   |
      | Scheduled Jobs |                       |
      | Created By     | Access, Delete Access |

    And I switch to "report" child window
    And I verify the entity "<Entity Name>","first number" field value of "6","second number" field value of "3","Sum" field value of "9","Product" field value of "18" and "Division" field value "2" on report
    And I close the "reports" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name              | Report Name  |
    | DeleteAccess | Delete Access Access | ImportMathFieldsLocation | MathFReports |