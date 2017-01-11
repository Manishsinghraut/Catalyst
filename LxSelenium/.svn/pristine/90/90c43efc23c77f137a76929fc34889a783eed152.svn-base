@all
Feature: (Jira Ref - AUTOMATION-1178) Forms Spreadsheet

  Scenario Outline: As a delete user I import forms
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Forms/"
    And I import following files:
      | Forms-1178.xml               |
      | Form_Project_Import-1178.xml |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab

    And I wait for the Loading text to disappear
#    And I click on "<Expand All>" link
    And I click " Expand All " button
#    And I click "<Check Out>" link for form "<<NO TITLE>>"
    And I click on the "<Check Out>" link
    And I wait for "" modal window to open in non frame page
    And I fetch entity ID from form
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Project/Forms/ImportingFormValues-1178.xlsx"
   # And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I set cell value in spread sheet row "6" under header "Form RecID" of column index "17"
    And I verify the following fields value on editable page
      | name                        | value      |
      | Issue_Subject               |            |
      | Issue_CodeMethodOfContactID |            |
      | Issue_CodeMethodOfContactID |            |
      | Issue_Body                  |            |
      | Issue_DueDate               | 06/22/2016 |
      | Issue_CltExtIssue__Values1  | false      |
      | Issue_CltExtIssue__Values1  | false      |
    And I verify Method Of Contact field "1" values on Form page is ""
    And I verify Method Of Contact field "0" values on Form page is ""
    And I verify exist issue field "1" values on Form page is "false"
    And I verify exist issue field "0" values on Form page is "false"

    And I click on the "Update & Check in" button

    When I used data files from "Data/ImportDataFiles/iwms/Project/Forms/"
    And I import following file name:
      | ImportingFormValues-1178.xlsx |

    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
#    And I click on "<Expand All>" link
    And I click " Expand All " button
    And I click on "<Check In>" link
    And I click " Expand All " button
#    And I click "<Check Out>" link for form "Form Imports"
    And I click on the "<Check Out>" link
    And I wait for "" modal window to open in non frame page
    And I verify all fields values on editable page comparing with "6" th row of spreadsheet
      | name                        | value                                 |
      | Issue_Subject               | FRM_TestForm123.Subject               |
      | Issue_CodeMethodOfContactID | FRM_TestForm123.CodeMethodOfContactID |
      | Issue_CodeMethodOfContactID | FRM_TestForm123.CodeMethodOfContactID |
      | Issue_Body                  | FRM_TestForm123.Body                  |

    And I verify the following fields value on editable page
      | name          | value      |
      | Issue_DueDate | 12/31/2035 |

    And I verify Method Of Contact field "1" values on Form page is "e-Mail"
    And I verify Method Of Contact field "0" values on Form page is "e-Mail"
    And I verify exist issue field "1" values on Form page is "true"
    And I verify exist issue field "0" values on Form page is "false"

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name           | Login full username  | Login User   |
      | Details          | Forms           | Form Project Import 1 | Delete Access Access | DeleteAccess |