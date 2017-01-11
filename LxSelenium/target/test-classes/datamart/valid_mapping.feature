@datamart
Feature: Datamart Mapping Execution
  As a datamart user I want to be able to define a mapping from an IWMS
  account to a target SQLServer database. Once this mapping is defined
  I want to execute it immediately to test it.

  Scenario: I specify a mapping with valid info
    Given I navigate to Datamart at "http://127.0.0.1:9090"
      And I see the Toolbar
      And I see the Dashboard
      And I click the "Create Mapping" toolbar button
      And I enter these field values into the Create Mapping form
          | name             | lxUrl             | lxUserID             | lxPassWD             | lxFirm             | dbHost             | dbName             | dbUserID             | dbPassWD             |
          | 2338 | http://appdm151.lxops.in | rootDev | DES:M/Ac8cUOQcoaz01kiBIEY+YrsGsMQs35 | AAP | 192.168.1.69 | datamart_test | DEV_SQL | DES:FpjoTRlk1yXCALyj6PPsnyW7EABfZV73 |
      And I click the Edit button to see the Execution Schedule dialog
      And I click the "Cancel" button on the Execution Schedule dialog
      And I click on the Create button on the Create Mapping form
      And I see the Dashboard with a new mapping named "2338"
     When I click the "Start execution" action on mapping named "2338"
     Then I see the mapping "2338" finish execution
      And I click the "Remove mapping and all execution artifacts" action on mapping named "2338"
