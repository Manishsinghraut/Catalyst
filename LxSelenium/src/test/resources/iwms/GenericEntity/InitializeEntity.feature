@all
Feature: Initialize specific entities

  Scenario: Login and initialize Contract, Facility, Project, and Location entities.
    Given I login to IWMS using LxAdmin credentials
    Then I initialize these entities:
      | type         | name                       | deleteFirst | failOnWarning | xmlFilePathAndName                      |
      | Contract     | PRPExample6                | true        | true          | Data/entities/PRPExample6 Contract.xml  |
      | Facility     | MoveFacilityAssetFrom      | true        | true          | Data/ImportDataFiles/33 MoveAsset.xml   |
      | Facility     | ImportWorkFlowData         | true        | true          | Data/ImportDataFiles/WorkFlow.xml       |
      | Project      | Demo Project 17            | true        | true          | Data/entities/Demo17 Project.xml        |
      | Location     | AK 777 [Project-Location]  | true        | true          | Data/entities/Example7 Location.xml     |





