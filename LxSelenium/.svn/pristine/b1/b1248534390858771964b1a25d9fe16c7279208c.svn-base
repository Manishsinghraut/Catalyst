@all
Feature:(JIRA Ref. : AUTOMATION-528) Parts in Custom Lists

  Scenario Outline: As a delete user I import the attached xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | Portfolio_for_Collapsible_Option.xml  |
      | Create_Project_Collapsible_Option.xls |
      | Parts_CL_Form.xml                     |
      | Parts_Import.xlsx                     |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I add form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Forms" tab
    Then I verify user is directed to "Forms" tab
    And I wait for the Loading text to disappear
#    And I click " Add Form... " form button
#    And I click " Add Form... " button
    And I switch to visible frame
    And I click " Add Form... " button
    And I switch to default frame
    And I see a modal window
    And I select form type "<Form Layout>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name          | value         |
      | Issue_Subject | Parts CL Test |
   #row 1
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Part     | Cost Per Part | Part Quantity |
      | <Part 1> |               | 10            |
    And I assert row values in grid "<GRID>" by the following values
      | Part     | Cost Per Part | Part Quantity |
      | <Part 1> | 999           | 10            |
    And I click "Update" button
    And I view a unique row in grid "<GRID>" having unique value "<Part 1>" under column header "Part"
      | name          | value   |
      | Part Quantity | 10      |
      | Cost Per Part | $999.00 |

   #row 2
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Part     | Cost Per Part | Part Quantity |
      | <Part 2> |               | 20            |
    And I assert row values in grid "<GRID>" by the following values
      | Part     | Cost Per Part | Part Quantity |
      | <Part 2> | 1000          | 20            |
    And I click "Update" button
    And I view a unique row in grid "<GRID>" having unique value "<Part 2>" under column header "Part"
      | name          | value     |
      | Part Quantity | 20        |
      | Cost Per Part | $1,000.00 |

    #row 3
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Part     | Cost Per Part | Part Quantity |
      | <Part 3> |               | 30            |
    And I assert row values in grid "<GRID>" by the following values
      | Part     | Cost Per Part | Part Quantity |
      | <Part 3> | 1001          | 30            |
    And I click "Update" button
    And I view a unique row in grid "<GRID>" having unique value "<Part 3>" under column header "Part"
      | name          | value     |
      | Part Quantity | 30        |
      | Cost Per Part | $1,001.00 |

    And I click 'Add' button to add line items
    And I switch to visible frame
#    And I verify message "Parts Custom List Form item successfully added"
#    And I verify a row from reports grid "issueMainDiv" having the following header and cell value pair
#      | name      | value                 |
#      | Form Type | <Form Layout>         |
#      | Creator   | <Login full username> |
##      | Title     | Today's Date          |
#      | Days Open | 0                     |
#      | # Replies | 0                     |

#    And I expand all form lists
    And I click " Expand All " button
    And I click "<View>" link for form layout "<Form Layout>"
    And I switch to default frame
    And I view a unique row in grid "<GRID>" having unique value "<Part 1>" under column header "Part"
      | name          | value   |
      | Part Quantity | 10      |
      | Cost Per Part | $999.00 |
    And I view a unique row in grid "<GRID>" having unique value "<Part 2>" under column header "Part"
      | name          | value     |
      | Part Quantity | 20        |
      | Cost Per Part | $1,000.00 |
    And I view a unique row in grid "<GRID>" having unique value "<Part 3>" under column header "Part"
      | name          | value     |
      | Part Quantity | 30        |
      | Cost Per Part | $1,001.00 |


  Examples:
    | Item     | Entity Name                    | Form Layout   | Login User   | Login full username  | GRID            | Part 3    | Part 1     | Part 2     |
    | Facility | Project for Collapsible Option | Parts CL Form | DeleteAccess | Delete Access Access | ^customListGrid | HVAC Unit | Lawn Mower | Weed Eater |