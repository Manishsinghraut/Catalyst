@all
Feature: (Jira Ref: AUTOMATION-605) I Migrating Org Chart to Different Regions (Negative Test)

#  Background:
    #Given I login to IWMS using LxAdmin credentials
#    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | Migrate Selenium Entity.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: (Jira Ref: AUTOMATION-446) I Migrating Org Chart to Different Regions (Negative Test)
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to "<Item>, <Second Level Tab>" entity
    And I navigate to entity "<Migrate Project Regions>"
    And I click on the "Migrate Org Chart" action panel button
    And I switch to visible frame
    And I verify the following message "Org Chart Migration Page for Portfolio '<Migrate Project Regions>'"
    And I switch to visible frame
    And I set fields values on editable page
      | name          | value         |
      | destProgramID | <Entity Name> |
    And I click on "Start Processing" Button
    And I wait for the Loading text to disappear in grid
    And I wait for the Loading text to disappear
    And I switch to visible frame
#    And I switch to frame having the following element
#      | locator | element                                                                                                                                                        |
#      | xpath   | //*[contains(text(),"Failed Site: 'Lucernex Site', unable to find Region 'Central (Central region - preOpen) Frisco(Pre-Open)' in Portfolio '<Entity Name>'")] |
#    And I verify the following message "Failed"
#    And I verify the following message "unable to find Region"
#    And I verify the following message "in Portfolio '<Entity Name>'"
    And I verify the error message


    Examples:
      | Item      | Second Level Tab | Entity Name             | Migrate Project Regions | Login User   | Login full username  |
      | Portfolio | Org Chart        | Migrate Selenium Entity | Lucernex-Selenium       | DeleteAccess | Delete Access Access |

  Scenario Outline: I migrate org chart to restore original org chart
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to "<Item>" entity
    And I navigate to "<Second Level Tab>"
    Then I navigate to entity "<Portfolio with empty org chart>"
    And I navigate to "<Second Level Tab>"
    And I click on the "Migrate Org Chart" action panel button
    And I switch to visible frame
    And I click on "Reset" Button
    And I switch to visible frame
#    And I set fields values on editable page
#      | name           | value |
#      | autoAddRegions | true  |
#
#    And I select the following radio fields
#      | restore |
#    And I click on "Start Processing" Button
    Then I wait for the Loading text to disappear

    Examples:
      | Item      | Second Level Tab | Portfolio with empty org chart | Login User   | Login full username  |
      | Portfolio | Org Chart        | Lucernex-Selenium              | DeleteAccess | Delete Access Access |