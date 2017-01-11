@all
Feature: As an admin I should be verify data on the summary page

  Background:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario: when I navigate to contracts summary page I can see the data is saved correctly
    When I navigate to "Contract, Details, Summary"
    And I edit the page
    And I switch to iframe
    Then I verify these field values on editable page
      |name              |value               |
      |Group             |Lease               |
      | Type             |Option            |
      |Status            | Active             |
      |  Portfolio                |    Webdriver                |
      |  Contract ID                         |     Contract's Lucernex                        |

  # Change name from label to the name in the DOM - using Extjs to validate the values.