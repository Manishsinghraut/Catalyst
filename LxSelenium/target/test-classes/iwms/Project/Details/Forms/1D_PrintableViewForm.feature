@all
Feature: (Jira Ref - AUTOMATION-476) Printable view form

  Scenario Outline: Printable view form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I expand all form lists
    And I click " Expand All " button
    And I click "<View>" link for form "<Form Name>"
    And I switch to default frame
    And I wait for modal window to open
    And I verify non editable form data in modal window
      | <Description> |
      | <Form Name>   |
      | <Creator>     |
    And I click Print Preview link
    And I wait for pop up
    And I switch to "Printable View" child window
    And I verify non editable form data in print preview window
      | <Description> |
      | <Form Name>   |
      | <Creator>     |
    And I close the "Printable preview window" child window
    And I switch to main window

    Examples:
      | Item    | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Description        | Creator          | Login User   | Login full username  |
      | Project | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | Edited Description | Lx Administrator | DeleteAccess | Delete Access Access |