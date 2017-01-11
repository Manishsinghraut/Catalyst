@all
Feature: Initialize specific entities

  Background:
    Given I login to IWMS using LxAdmin credentials

  Scenario: Navigate to specific Contract entity
    And I navigate to entity type "Contract" named "PRPExample6"
    And I navigate to "Contract, Details, Summary"

  Scenario: Navigate to specific Facility entity
    And I navigate to entity type "Facility" named "MoveFacilityAssetFrom"
    And I navigate to "Facility, Details, Summary"

  Scenario: Navigate to specific Project entity
    And I navigate to entity type "Project" named "Demo Project 17"
    And I navigate to "Project, Details, Summary"




