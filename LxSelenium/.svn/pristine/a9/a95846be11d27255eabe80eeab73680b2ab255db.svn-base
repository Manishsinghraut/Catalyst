@all
Feature: (Jira Ref - AUTOMATION-478) I view form in Project> Details> Forms page

  Scenario Outline: View form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"    And I Search for the "<Entity Name>" that was created
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
    And I verify non editable form data in modal window
      | <Description> |
      | <Form Name>   |
      | <Creator>     |
    And I click on the "Close" button

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Description | Creator          | Login User | Login full username |
      | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | Description | Lx Administrator | ViewAccess | View Access Access  |