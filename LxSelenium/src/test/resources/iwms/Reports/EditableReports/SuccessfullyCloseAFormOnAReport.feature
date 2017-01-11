@all
Feature: Successfully close a form on a report - [Jira Ref. : AUTOMATION-1389]

  Scenario Outline: As Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | FormLocation_1389.xml |
      | Form1_1389.xml        |
      | FormsReport_1389.xml  |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete user, I verify the Form will be successfully added to the forms tab of the entity
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
      | name          | value        |
      | Issue_Subject | <Form Title> |
    And I click on the "Add" button
    And I wait for modal window to close

    Then I navigate to the reports dashboard
#    And I click on the "run" row action of column "<Report Name>" of column "0" from grid "<Grid>"
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Name         | Title  | Is Closed? | Ad Hoc WF Assignee |
      | FormLocation | Report | No         |                    |

    And I click the field "<Form Title>" under column "Title" of Entity "<Entity Name>" on the report
    And I set following fields value on editable page
      | name          | value |
      | Issue_Subject | Form  |
    And I click on the green check-mark

    And I click the field "No" under column "Is Closed?" of Entity "<Entity Name>" on the report
    And I set following fields value on editable page
      | name     | value |
      | IsClosed | true  |
    And I click on the green check-mark

    And I close the "Report" child window
    And I switch to main window


    Then I navigate to the reports dashboard
#    And I click on the "run" row action of column "<Report Name>" of column "0" from grid "<Grid>"
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Name         | Title | Is Closed? | Ad Hoc WF Assignee |
      | FormLocation | Form  | Yes        |                    |

    And I close the "Report" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Third Level Tab | Form Type      | Form Title | Report Name | Grid        |
    | DeleteAccess | Delete Access Access | FormLocation | Forms           | Add line items | Report     | Form report | pageContent |


  Scenario Outline: As Delete user, I verify the User can successfully view the closed form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I switch to visible frame
    And I set following fields value on editable page
      | name       | value        |
      | statusType | Closed Items |

    And I verify the following values in frame grid "<Grid ID>"
      | Title        | Days Open | Due Date | Assignees | Form Type   | Creator              | Last Reply | # Replies |
      | <Form Title> | 0         |          |           | <Form Type> | Delete Access Access |            | 0         |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name  | Third Level Tab | Form Type      | Form Title | Grid ID      |
    | DeleteAccess | Delete Access Access | FormLocation | Forms           | Add line items | Form       | issueMainDiv |
