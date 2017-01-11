@downloadSpreadsheetTemplate @all
Feature: As an IWMS user I need to be able to download spreadsheet templates for
  specific record types.

# A background executes before each Scenario in the Feature file so sort of like
# a base class for each Scenario. Since I only have one Scenario I don't really
# need to use a Background but I just wanted to introduce it here.
  Background:
    Given I login to IWMS using LxAdmin credentials
    And I navigate to download spreadsheet page

  Scenario: I want to download a spreadsheet template
    When I enter "EMPLOYER" into the template selector
    And I click the download button
    Then IWMS downloads the specified spreadsheet template
