@all
Feature: Form checked out by User A then User B cannot update that form instance - [Jira Ref. : AUTOMATION-1390]

  Scenario Outline: As Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | ProjectEntityforFormReport_1390.xml |
      | FormsForTesting10811_1390.xml       |
      | FormReport_1390.xml                 |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete user, I verify the form is added successfully and all the data is successfully saved
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name                       | value      |
      | Issue_CltExtIssue__Values3 | 02/17/2016 |
      | Issue_CltExtIssue__Values4 | 1          |
      | Issue_CltExtIssue__Values2 | 100        |
      | Issue_CltExtIssue__Values1 | 150        |
      | Issue_DueDate              | 02/22/2016 |

    And I verify Total is "15,000"
    And I click on the "Add" button
    And I wait for modal window to close
    And I switch to visible frame
    And I click on the "<Check Out>" link
    And I switch to default frame

    And I verify these field values on editable page
      | name                       | value      |
      | Issue_CltExtIssue__Values3 | 02/17/2016 |
      | Issue_CltExtIssue__Values4 | 1          |
      | Issue_CltExtIssue__Values2 | 100        |
      | Issue_CltExtIssue__Values1 | $150.00    |
      | Issue_DueDate              | 02/22/2016 |
    And I click on the "Update" button
    And I click on the "Close" button

    And I logout

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab | Form Type         |
    | DeleteAccess | Delete Access Access | ProjectEntityforFormReport | Forms           | Form layout-10811 |


  Scenario Outline: As Edit user, I verify the Error Pop-up should be displayed
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    Then I navigate to the reports dashboard
#    And I click on the "run" row action of column "<Report Name>" of column "0" from grid "<Grid>"
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Date       | Item Name | Quantity | Price   | Total  | Due Date   | Checked Out By       |
      | 02/17/2016 | 1         | 100      | $150.00 | 15,000 | 02/22/2016 | Delete Access Access |


    And I click the field "$150.00" under column "Date" of Entity "02/17/2016" on the report
    And I set following fields value on editable page
      | name                       | value   |
      | Issue_CltExtIssue__Values1 | $160.00 |
    And I click on the green check-mark
#    And I wait for modal window to close
    And I verify the error message "Issue '[CURRENTDATE]' in Project 'ProjectEntityforFormReport' is checked out to member 'Delete Access Access'"
    And I click "OK" button
    And I click on the red cross-mark

    And I close the "Report" child window
    And I switch to main window
    And I logout

  Examples:
    | Login User | Login full username | Report Name | Grid        |
    | EditAccess | Edit Access Access  | FormReport  | pageContent |
