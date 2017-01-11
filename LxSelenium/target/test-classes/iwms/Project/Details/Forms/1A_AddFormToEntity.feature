@all
Feature: (Jira Ref - AUTOMATION-477) I add form to project and verify them in Project> Details> Forms page

  Scenario Outline: As a delete user I can able to add custom list to form layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Forms/"
    And I import following file name:
      | Selenium Add Form Type.xml              |
      | Project_For_Add_Forms_To_Entity_468.xml |


    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I add form
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
      | name                      | value         |
      | Issue_Subject             | <Form Name>   |
      | Issue_InitiatedByMemberID | <Creator>     |
      | Issue_Body                | <Description> |
    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify I am at Form tab
    #IWMS-22139
    And I verify success message "Successfully added Form"
#    And I verify message "Selenium Add Form Type item successfully added"
    And I click " Expand All " button
    And I click "<View>" link for form "<Form Name>"
    And I see a modal window
    And I verify non editable form data in modal window
      | <Description>    |
      | <Form Name>      |
      | Lx Administrator |
    And I click on the "Close" button
    And I wait for modal window to close
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click " Expand All " button
    And I click "<Check Out>" link for form "<Form Name>"
    And I switch to default frame
    And I verify the following fields value on editable page
      | name          | value         |
      | Issue_Subject | <Form Name>   |
      | Issue_Body    | <Description> |
    And I click on the "Update & Check in" button
    Then I verify I am at Form tab
    And I verify the following values in frame grid "issueMainDiv"
      | Title       | Due Date | Assignees | Form Type   | Creator          | Last Reply | # Replies |
      | <Form Name> |          |           | <Form Type> | Lx Administrator |            | 0         |


    Examples:
      | Item    | Third Level Tab | Entity Name                         | Form Name     | Form Type            | Creator           | Description | Login User   | Login full username  |
      | Project | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | Selenium Form Layout | Administrator, Lx | Description | DeleteAccess | Delete Access Access |

