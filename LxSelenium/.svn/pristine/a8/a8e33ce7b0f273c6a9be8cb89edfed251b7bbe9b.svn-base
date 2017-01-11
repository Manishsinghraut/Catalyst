@all
Feature: (Jira Ref - AUTOMATION-475) I checkout form and verify them in Project> Details> Forms page

  Scenario Outline: Check out and Update
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I expand all form lists
    And I click " Expand All " button
    And I click "<Check Out>" link for form "<Form Name>"
    And I switch to default frame
#    And I set these field values on editable page
    And I set following fields value on editable page
      | name       | value         |
      | Issue_Body | <Description> |
    And I click on the "Update" button
#    And I click on the "Close" button
    And I click "Close" button
    Then I verify I am at Form tab
    And I click " Expand All " button
    And I verify links available for form "<Form Name>" will now be "<View>, <Edit>, <Check In>, <Add Reply>"
    And I click "<View>" link for form "<Form Name>"
    And I switch to default frame
    And I verify non editable form data in modal window
      | <Description> |
    And I click on the "Close" button

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Description       | Login User | Login full username |
      | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | Added Description | EditAccess | Edit Access Access  |

  Scenario Outline: Check out and Update and Check In
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I expand all form lists
    And I click " Expand All " button
    And I click "<Edit>" link for form "<Form Name>"
    And I switch to default frame
    And I set these field values on editable page
      | name       | value         |
      | Issue_Body | <Description> |
    And I click on the "Update & Check in" button
    Then I verify I am at Form tab
#    And I expand all form lists
    And I click " Expand All " button
    And I verify links available for form "<Form Name>" will now be "<View>, <Check Out>, <Add Reply>, <Close>"
    And I click "<View>" link for form "<Form Name>"
    And I switch to default frame
    And I verify non editable form data in modal window
      | <Description> |
    And I click on the "Close" button

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Description        | Login User | Login full username |
      | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | Edited Description | EditAccess | Edit Access Access  |

