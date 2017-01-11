@all
Feature: Dashboard Chart config forms

  Scenario: Make sure Dashboard Chart config forms save and display what was saved
    Given I login to IWMS using LxAdmin credentials
      And I see the IWMS Dashboard
      And I close all the dashboard portals
      And I expand the Modules Panel
      And I drag module "Chart-Pie" onto the Dashboard
      And I populate the Pie Chart Config Form
      And I submit the Chart Config Form
      And I open the Chart Config Form
    Then I see the Pie Chart Config Form is populated
      And I reload the page
      And I see the IWMS Dashboard
      And I open the Chart Config Form
    Then I see the Pie Chart Config Form is populated

  Scenario: Make sure Dashboard Chart config forms save and display what was saved
    Given I login to IWMS using LxAdmin credentials
    And I see the IWMS Dashboard
    And I close all the dashboard portals
    And I expand the Modules Panel
    And I drag module "Chart-Line" onto the Dashboard
    And I populate the Line Chart Config Form
    And I submit the Chart Config Form
    And I open the Chart Config Form
    Then I see the Line Chart Config Form is populated
    And I reload the page
    And I see the IWMS Dashboard
    And I open the Chart Config Form
    Then I see the Line Chart Config Form is populated

    #Tests for the other two chart types
  # TODO: fix problems with stale element exceptions
    #And I close all the dashboard portals
    #And I drag module "Chart-Line" onto the Dashboard
    #And I populate the Pie Chart Config Form
    #And I submit the Pie Chart Config Form
    #And I open the Pie Chart Config Form
    #Then I see the Pie Chart Config Form is populated

    #And I close all the dashboard portals
    #And I drag module "Chart-Bar By Year" onto the Dashboard
    #And I populate the Pie Chart Config Form
    #And I submit the Pie Chart Config Form
    #And I open the Pie Chart Config Form
    #Then I see the Pie Chart Config Form is populated
