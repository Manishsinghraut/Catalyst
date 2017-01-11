@all
Feature: Test Firm Dictionary download and upload

  Scenario: Logged in to IWMS I can download dictionary
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I navigate to admin "Manage Firm Dictionary" page
#    When I check Append Global Dictionary checkbox
    And I click the Download Current Dictionary button
#    Then IWMS downloads current dictionary


