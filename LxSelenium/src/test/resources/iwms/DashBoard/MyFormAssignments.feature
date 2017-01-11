Feature: Dashboard - My Form Assignments (Jira Ref : AUTOMATION-1114)

  Scenario Outline: Import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Dashboard/"
    And I import following file name:
      | AssigneeForm.xml             |
      | Form_AssignmentsProject2.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I create new tab on dashboard
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to dashboard page
    And I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I wait for the Loading text to disappear
#    And I click on the "<Expand All>" link
    And I click " Expand All " button
    And I click on the "<Check Out>" link
    And I switch to default frame
    And I add following members
      | Access, Delete Access |
    And I click on the "Update & Check in" button
    And I switch to visible frame
    And I verify the following message "assignee item successfully updated, email successfully sent"
  Examples:
    | Login User   | Login full username  | Entity Name      | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Form Assignments | Details          | Forms           |


  Scenario Outline: As Delete user, I verify that the dashboard object has Delete Access Access under column Who Assigned
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I click on "<tab>" tab
    And I expand portfolio navigation tab
    And I Drag and Drop module "My Form Assignments" on dashboard "<tab>" in X coordinate 200 and Y coordinate 400 order
#    And I verify the "My Form Assignments" should be displayed
    And I verify the module item "My Form Assignments" displayed on the created dashboard
#    And I stretch the module window so all the columns can be displayed
    And I wait for the loading text to be disappear
    And I verify that the dashboard object has "Delete Access Access" under column "Who Assigned"
    And I click on the "06/01/2016" link "Title"
    And I click on "Check Out" Button
    And I verify "Assignee(s)" "Access, Delete Access" is displayed
    And I click "Close" button

  Examples:
    | Login User   | Login full username  | tab       |
    | DeleteAccess | Delete Access Access | Dashboard |
