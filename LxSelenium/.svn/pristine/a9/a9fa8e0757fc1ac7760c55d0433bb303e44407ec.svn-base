@all
Feature: (Jira - Automation-1027) View Duplicate in Wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "Lucernex-Selenium" from the Program List
    Then I click on the "Next" button

    And I set following fields value on editable page
      | name                                  | value                             |
      | ProjectEntity_ProjectEntityName       | <Name Of Entity>                  |
      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area                |
      | ProjectEntity_CountryID               | United States                     |
      | ProjectEntity_IStateProvinceCountryID | TX                                |
      | ProjectEntity_RegionID                | Central(Central region - preOpen) |

    And I click on the "Next" button
    And I see the "Site Setup Wizard" modal window
    And I see "Failed to add item, an item with the exact same name may already exist. Try a different name and if problems persist, call technical support." message in the header
    And I click on "<View Duplicate Item>" link
    And I switch to "Entity" child window
    And I verify the following details in non editable summary page in non frame grid
      | name        | value                                               |
      | Name        | <Name Of Entity>                                    |
      | Region      | Central (Central region - preOpen) Frisco(Pre-Open) |
      | Market Area | Legacy Market Area                                  |

    And I close the "Entity" child window
    And I switch to main window


    Examples:
      | Item | Name Of Entity | View Duplicate Item   |
      | Site | LucernexSite   | <View Duplicate Item> |
   
