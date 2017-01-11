@all @smoke @smoke3Dot111
Feature: Test Expense Recovery Item CRUD operations. Logged in as Lx Administrator

  Background:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario: Navigation to the Recoveries tab, then add/edit/delete
    Given I click on the "Contract" entity tab
    And I see that I am on the "Contract" entity tab
    When I click on the second level tab "Payment Info"
    Then I see that I am on the second level tab "Payment Info"
    When I click on the third level tab "Recoveries"
    Then I see that I am on the third level tab "Recoveries"
    When I click on the "Add Item" action panel button
    And I switch to iframe titled "Recoveries"
    Then I see I am on the Recoveries page
    #And zI enter these field values
    #  | name                   |value                  |
    #  | Recovery Group         |Lease                  |
    #  | Recovery Type          |CAM                    |




