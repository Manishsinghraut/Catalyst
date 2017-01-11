@all
Feature: (Jira Ref - AUTOMATION-472) I reopen form and verify them in Project> Details> Forms page

  Scenario Outline: I reopen form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And  I sort form list with status type "Closed Items"
#    And I expand all form lists
    And I click " Expand All " button
    And I click on the "<Reopen>" link
    And I switch to "Reopen form window" child window
    And I click on "Confirm" Button
    And I switch to main window
    And I wait for the Loading text to disappear
#    Then I verify message "Successfully reopened issue"
    And I verify the text "Successfully reopened issue" on "grid"
    And  I sort form list with status type "Open/Closed Items"
#    And I verify form "<Form Name>" is displayed in form list
    And I verify the following values in frame grid "<Grid ID>"
      | Title       |
      | <Form Name> |
    And  I sort form list with status type "Closed Items"
    Then I verify grid "<Grid ID>" is empty with the following message "No rows to display"
    And  I sort form list with status type "Open Items"
#    And I verify form "<Form Name>" is displayed in form list
#    And I expand all form lists
    And I verify the following values in frame grid "<Grid ID>"
      | Title       |
      | <Form Name> |
    And I click " Expand All " button
    Then I verify links available for form "<Form Name>" will now be "<View>, <Close>, <Check Out>, <Add Reply>"


    Examples:
      | Grid ID      | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Login User   | Login full username  |
      | issueMainDiv | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | DeleteAccess | Delete Access Access |



#@all
#Feature: I reopen form and verify them in Project> Details> Forms page
#
#  Scenario Outline: I reopen form
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    When I navigate to entity type "<Item>" named "<Entity Name>"
#
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    Then I verify I am at Form tab
#    And  I sort form list with status type "Closed Items"
#    And I expand all form lists
#    And I Reopen form "<Form Name>"
#    Then I verify I am at Form tab
#    Then I verify message "Successfully reopened issue"
#    And  I sort form list with status type "Open/Closed Items"
#    And I verify form "<Form Name>" is displayed in form list
#    And  I sort form list with status type "Open Items"
#    And I verify form "<Form Name>" is displayed in form list
#    And I expand all form lists
#    Then I verify links available for form "<Form Name>" will now be "<View>, <Close>, <Check Out>, <Add Reply>"
#
#
#    Examples:
#      | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Login User   | Login full username  |
#      | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | DeleteAccess | Delete Access Access |
