@all
Feature: (Jira - AUTOMATION-1058) Form Report with Custom List (Custom list with math Fields)

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | ReportFormwithCL1058.xml           |
      | FormForCLFormReport1058.xml        |
      | ProjectEntityforFormReport1058.xml |
      #Data is not importing, hence importing twice

      | FormForCLFormReport1058.xml        |
      | ReportFormwithCL1058.xml           |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As delete Access user, I verify the Import Forms with custom fields
    When I navigate to the admin dashboard
    And I click on the "Manage Forms" link

    Then I expand the "<Form Layout>" row in grid "<Grid ID>"
    And I click "build layout" action of "<Form Type>" sub row in the grid "<Grid ID>"

    And I switch to "Form build layout" child window
    And I verify the "FormReportCL" page header
    And I verify the "Open Date" field is displayed on Form layout
    And I verify the "Store" field is displayed on Form layout
    And I verify the "Number of Months" field is displayed on Form layout
    And I verify the "Rent" field is displayed on Form layout
    And I verify the "Charges" field is displayed on Form layout
    And I verify the "Allowances" field is displayed on Form layout
    And I verify the "Total Rent" field is displayed on Form layout
    And I verify the "5PercentofAllowance" field is displayed on Form layout
    And I verify the "ChargesinPercentage" field is displayed on Form layout
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Form Layout         | Grid ID             | Form Type          |
      | FormforCLFormReport | BOGridCodeIssueType | CLFormReportLayout |

  Scenario Outline: As delete Access user, I anvigate to entity and verify entity update message is successfully displayed
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Forms" tab
    And I verify the following values in frame grid "issueMainDiv"
      | Title      | Due Date | Assignees | Form Type   | Creator              | Last Reply | # Replies |
      | 03/03/2016 |          |           | <Form Type> | Delete Access Access |            | 0         |

    And I click " Expand All " button
    And I click on "<Check Out>" link
    And I wait for "" modal window to open in non frame page

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Open Date  | Store | Number of Months | Rent  | Charges | Total Rent | Allowances | 5PercentofAllowance | ChargesinPercentage |
      | 03/03/2016 | 1001  | 12               | 50000 | 100     |            | 2500       |                     |                     |
    And I click "Update" button

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Open Date  | Store | Number of Months | Rent  | Charges | Total Rent | Allowances | 5PercentofAllowance | ChargesinPercentage |
      | 04/01/2016 | 1002  | 12               | 15000 | 50      |            | 1000       |                     |                     |
    And I click "Update" button


    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Open Date  | Store | Number of Months | Rent  | Charges | Total Rent | Allowances | 5PercentofAllowance | ChargesinPercentage |
      | 05/01/2016 | 1003  | 12               | 25000 | 10000   |            | 10000      |                     |                     |
    And I click "Update" button

    And I verify the following values in non frame grid "^customListGrid"
      | Open Date  | Store | Number of Months | Rent       | Charges    | Total Rent  | Allowances | 5PercentofAllowance | ChargesinPercentage |
      | 03/03/2016 | 1001  | 12               | $50,000.00 | $100.00    | $600,100.00 | $2,500.00  | $125.00             | 10,000.00000%       |
      | 04/01/2016 | 1002  | 12               | $15,000.00 | $50.00     | $180,050.00 | $1,000.00  | $50.00              | 5,000.00000%        |
      | 05/01/2016 | 1003  | 12               | $25,000.00 | $10,000.00 | $310,000.00 | $10,000.00 | $500.00             | 1,000,000.00000%    |

    And I click on the "Update & Check in" button
    And I wait for modal window to close

    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value            |
      | Report Name | ReportFormwithCL |
    And I switch to "report" child window
    And I click on Expand sign of row "ProjectEntityforFormReport" on report
    And I verify the following report values in non frame grid
      | Open Date  | Store | Number of Months | Rent       | Charges    | Total Rent  | Allowances | 5PercentofAllowance | ChargesinPercentage |
      | 03/03/2016 | 1001  | 12               | $50,000.00 | $100.00    | $600,100.00 | $2,500.00  | $125.00             | 10,000.00000%       |
      | 04/01/2016 | 1002  | 12               | $15,000.00 | $50.00     | $180,050.00 | $1,000.00  | $50.00              | 5,000.00000%        |
      | 05/01/2016 | 1003  | 12               | $25,000.00 | $10,000.00 | $310,000.00 | $10,000.00 | $500.00             | 1,000,000.00000%    |

    And I close the "run report" child window
    And I switch to main window


    Examples:
      | Entity Name                | Form Type          |
      | ProjectEntityforFormReport | CLFormReportLayout |