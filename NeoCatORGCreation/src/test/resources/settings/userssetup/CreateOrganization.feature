@One
Feature: As a super user Create Organization
  Scenario Outline: As a super user I create a organization
    Given I Login to catalyst using "Login User" access credentials
    Then I see the catalyst "workzone"
    And I click on the "SETTINGS" link
    And I move the cursor on "Menu"
    And I click on the "Org Configuration" link
    And I click on the "Organizations" link
    And I click on "newOrg" button
    And I enter "organization" in "orgname" Edit box
    And I enter "domain" in "domainname" Edit box
    And I click on save button
    Then I verify the created "organization" in organization table
    Then I verify "Domain Name" with "Organization" in the organization table
    Then I verify "Active" status with "Organization" in the organization table

Examples:
    | Login User  |
    | Superadmin  |