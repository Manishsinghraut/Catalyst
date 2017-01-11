@datamart
Feature: Datamart Mapping Execution
  As a datamart user I want to be able to define a mapping from an IWMS
  account to a target SQLServer database. Once this mapping is defined
  I want to execute it immediately to test it.

  Scenario: I specify a mapping with valid info
    Given I navigate to Datamart at "${datamart.url}"
      And I see the Toolbar
      And I see the Dashboard
      And I click the "Create Mapping" toolbar button
      And I enter these field values into the Create Mapping form
          | name             | lxUrl             | lxUserID             | lxPassWD             | lxFirm             | dbHost             | dbName             | dbUserID             | dbPassWD             |
          | ${datamart.name} | ${datamart.lxUrl} | ${datamart.lxUserID} | ${datamart.lxPassWD} | ${datamart.lxFirm} | ${datamart.dbHost} | ${datamart.dbName} | ${datamart.dbUserID} | ${datamart.dbPassWD} |
      And I click the Edit button to see the Execution Schedule dialog
      And I click the "Cancel" button on the Execution Schedule dialog
      And I click on the Create button on the Create Mapping form
      And I see the Dashboard with a new mapping named "${datamart.name}"
     When I click the "Start execution" action on mapping named "${datamart.name}"
     Then I see the mapping "${datamart.name}" finish execution
      And I click the "Remove mapping and all execution artifacts" action on mapping named "${datamart.name}"
