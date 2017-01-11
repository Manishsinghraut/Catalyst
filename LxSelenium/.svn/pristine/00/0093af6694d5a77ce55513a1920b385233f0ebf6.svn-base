@all
Feature: FM Dashboard config

  Background:
    Given I login to IWMS using LxAdmin credentials

  Scenario: Load FM Dashboard data model/forms
    When I navigate to import page
    And I used data files from "Data/ImportSchemaFiles/"
    And I import following file with continue option name:
      | WorkFlowForms.xml           |

  Scenario: Load FM Dashboard data model workflow template
    When I navigate to import page
    And I used data files from "Data/ImportSchemaFiles/"
    And I import following file with continue option name:
      | WorkFlowTemplate.xml           |


  Scenario: Make sure FM Dashboard config display and load the data
    And I see the IWMS Dashboard
    And I close all the dashboard portals
    And I expand the Modules Panel
    And I drag module "FM Workbench" onto the Dashboard
    And And I hide the Modules Panel
    And I resize FM Module
    And I see that fmWorkbench is populated
    And Radio option to hide columns populated
    And I hide "Facility" columns
    And I hide "Services" columns
    And I show "Facility" columns