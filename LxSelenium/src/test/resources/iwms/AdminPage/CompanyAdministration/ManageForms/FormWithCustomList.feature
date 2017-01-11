@all
Feature: (Jira - AUTOMATION-1057) Forms with Custom List (Custom list with math Fields)

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | FormwithMathfieldsonCL1057.xml   |
      | SiteWithMathFieldsOnForm1057.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As delete Access user, I verify the Import Forms with cosutom fields
    When I navigate to the admin dashboard
    And I click on the "Manage Forms" link

    Then I expand the "<Form Layout>" row in grid "<Grid ID>"
    And I click "build layout" action of "<Form Type>" sub row in the grid "<Grid ID>"

    And I switch to "Form build layout" child window
    And I verify the "Layout: <Form Type>, Table: Issue" page header
    And I verify the "Date" field is displayed on Form layout
    And I verify the "Item name" field is displayed on Form layout
    And I verify the "Quantity" field is displayed on Form layout
    And I verify the "Price" field is displayed on Form layout
    And I verify the "Total" field is displayed on Form layout
    And I verify the "DeliveryDate" field is displayed on Form layout
    And I verify the "Delivered" field is displayed on Form layout
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Form Layout            | Grid ID             | Form Type                    |
      | FormwithMathfieldsonCL | BOGridCodeIssueType | FormwithMathfieldsonCLLayout |

  Scenario Outline: As delete Access user, I ad custom list fields
    When I Search for the "<Entity Name>" that was created
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
      | Date       | Item name   | Quantity | Price | Total | DeliveryDate |
      | 03/03/2016 | Diane James | 20       | 13    |       |              |
    And I select following custom list "^customListGrid" radio by label
      | No |
    And I click "Update" button

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Date       | Item name    | Quantity | Price | Total | DeliveryDate |
      | 02/28/2016 | Paper Whites | 50       | 15    |       |              |
    And I select following custom list "^customListGrid" radio by label
      | Yes |
    And I click "Update" button

    And I verify the following values in non frame grid "^customListGrid"
      | Date       | Item name    | Quantity | Price  | Total   | DeliveryDate | Delivered |
      | 03/03/2016 | Diane James  | 20       | $13.00 | $260.00 | 03/05/2016   | No        |
      | 02/28/2016 | Paper Whites | 50       | $15.00 | $750.00 | 03/01/2016   | Yes       |
    And I click on the "Update & Check in" button
    And I wait for modal window to close

    Then I verify I am at Form tab
#    IWMS-22139
#    And I verify message "<Form Layout> item successfully updated"
    And I verify success message "<Form Layout> item successfully updated"
    And I verify the following values in frame grid "issueMainDiv"
      | Title      | Due Date | Assignees | Form Type   | Creator              | Last Reply | # Replies |
      | 03/03/2016 |          |           | <Form Type> | Delete Access Access |            | 0         |


    Examples:
      | Entity Name              | Form Layout            | Form Type                    |
      | SiteWithMathFieldsOnForm | FormwithMathfieldsonCL | FormwithMathfieldsonCLLayout |