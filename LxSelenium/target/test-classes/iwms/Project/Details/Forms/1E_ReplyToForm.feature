@all
Feature: (Jira Ref - AUTOMATION-473) I reply to form and verify them in Project> Details> Forms page

  Scenario Outline: I reply to form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"

#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header

    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I expand all form lists
    And I click " Expand All " button
    And I click "<Add Reply>" link for form "<Form Name>"
    Then I switch to default frame
    And I set following fields value on editable page
      | name    | value               |
      | Subject | <Reply Title>       |
      | Body    | <Reply Description> |
    Then I compare selected option from multiple selection box with value
      | locator | element   | value     |
      | name    | CCPersons | <Creator> |

    And I click on the "Add" button
    And I verify the following values in frame grid "issueMainDiv"
      | Title       | Due Date | Assignees | Form Type            | Creator          | # Replies |
      | <Form Name> |          |           | Selenium Form Layout | Lx Administrator | 1         |
    And I check 'Show Replies' checkbox
#    And I click submit button
    And I click " Expand All " button
    Then I verify non editable reply data in row having unique value "<Reply Title>" in form grid
      | name        | value          |
      | Reply Title | <Reply Title>  |
      | Creator     | <Created User> |
      | Date Posted | [CURRENT DATE] |

    Examples:
      | Item    | Second Level Tab | Third Level Tab | Entity Name                         | Form Name     | Creator           | Reply Title    | Reply Description | Created User         | Login User   | Login full username  |
      | Project | Details          | Forms           | Project_For_Add_Forms_To_Entity_468 | Selenium Form | Administrator, Lx | Selenium-Reply | Reply-Description | Delete Access Access | DeleteAccess | Delete Access Access |