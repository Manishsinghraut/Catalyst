@all
Feature: Formatting Style to display correctly in View and edit mode on the form layout. [Jira Ref - AUTOMATION-1408]

  Scenario Outline: As a delete user I import following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Forms/"
    And I import the following files:
      | 00018_PortfolioAndLocation_1408.xml |
      | 13810Form_1408.xml                  |
      | 13180Project_1408.xml               |

  Examples:
    | Login full username  | Login User   |
    | Delete Access Access | DeleteAccess |

  Scenario Outline: As a delete user, I Navigate to Manage forms >Expand all> Click on build layout for form 13810 form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I click " Expand All " button
    And I click "build layout" action of "13810 Form" sub row in the grid "BOGridCodeIssueType"
    And I switch to "build layout" child window

    And I click on the '...' of corresponding to field label "Math Total"
    And I verify the following fields value on editable page
      | name                | value                                                                                      |
      | json.JsonFieldStyle | color:#800080;font-weight:bold;font-style:italic;text-decoration:underline;font-size:14px; |
    And I click on "Cancel" Button
    And I wait for modal window to close

    And I close the "build layout" child window
    And I switch to main window

    And I click "build layout" action of "13810 Form" sub row in the grid "BOGridCodeIssueType"
    And I switch to "build layout" child window

    And I click on the '...' of corresponding to field label "Percent"
    And I verify the following fields value on editable page
      | name                | value                                                      |
      | json.JsonFieldStyle | color:#008000;font-style:italic;text-decoration:underline; |
    And I click on "Cancel" Button
    And I wait for modal window to close

    And I close the "build layout" child window
    And I switch to main window

    And I click "build layout" action of "13810 Form" sub row in the grid "BOGridCodeIssueType"
    And I switch to "build layout" child window
    And I click on the '...' of corresponding to field label "Math Diffrence"
    And I verify the following fields value on editable page
      | name                | value                                          |
      | json.JsonFieldStyle | color:#0000FF;font-weight:bold;font-size:14px; |
    And I click on "Cancel" Button
    And I wait for modal window to close

    And I close the "build layout" child window
    And I switch to main window

  Examples:
    | Form Layout | Login User   | Login full username  |
    | Delete form | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I verify the All the total fields shall reflect color font or italic as selected when form layout was build
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I click " Expand All " button
    And I click on the "<Check Out>" link
    And I wait for "" modal window to open in non frame page
    And I switch to default frame

    And I set following fields value on editable page
      | name     | value |
      | Issue_a1 | 65000 |
      | Issue_a2 | 32000 |
    And I verify the field "Math Total" has "97,000"
    And I verify the field "Percent" has "203.12500%"
    And I verify the field "Math Diffrence" has "33,000"
#    And I verify the "Math Total" field value "97,000" and style "color:#800080;font-weight:bold;font-style:italic;text-decoration:underline;font-size:14px;"
#    And I verify the "Percent" field value "203.12500%" and style "color:#008000;font-style:italic;text-decoration:underline;"
#    And I verify the "Math Diffrence" field value "33,000" and style "color:#0000FF;font-weight:bold;font-size:14px;"
    And I click on the "Update & Check in" button

    And I switch to visible frame
    And I click on the "<View>" link
    And I wait for "" modal window to open in non frame page
    And I switch to default frame
    And I verify the "Math Total" field value "97,000" and style "color:#800080;font-weight:bold;font-style:italic;text-decoration:underline;font-size:14px;"
    And I verify the "Percent" field value "203.12500%" and style "color:#008000;font-style:italic;text-decoration:underline;"
    And I verify the "Math Diffrence" field value "33,000" and style "color:#0000FF;font-weight:bold;font-size:14px;"
    And I click "Close" button

  Examples:
    | Second Level Tab | Third Level Tab | Entity Name | Login full username  | Login User   |
    | Details          | Forms           | 13180       | Delete Access Access | DeleteAccess |