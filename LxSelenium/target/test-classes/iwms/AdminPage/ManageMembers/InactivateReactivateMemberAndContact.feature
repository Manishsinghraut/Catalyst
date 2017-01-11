@all
Feature: Inactivate Reactivate Member And Contact - (Jira ticket Ref : AUTOMATION-1036)

  Scenario: As an delete user I'm able to Inactivate/Reactivate Member and Contact - (Jira ticket Ref : AUTOMATION-1036)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click on "Activate/Deactivate" tab
    And I select a member "Selenium Webdriver" to inactivate
    And I click on Update Active Status button
    And I verify a member "Selenium Webdriver" has inactivate
    And I select a member "Selenium Webdriver" to activate
    And I click on Update Active Status button
    And I verify a member "Selenium Webdriver" has active
