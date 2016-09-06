@All
Feature: As a super user Create, Edit and Delete Organization

  Scenario Outline: As a super user I create a organization
    Given I Login to catalyst using "<Login User>" access credentials
    And I see the catalyst "workzone"
    And I click on the "SETTINGS" link
    And I click on Organizations link in main page
    And I click on "newOrg" button
    And I enter "<Organization>" in "orgname" Edit box
    And I enter "<Domain Name>" in "domainname" Edit box
    And I click on save button
    And I verify the created "<Organization>" in list
    And I verify "<Domain Name>" with "<Organization>" in the organization list
    And I verify "Active" status with "<Organization>" in the organization list
    And I select the "<Organization>" and verify "Delete" Button is enabled
    And I select the "<Organization>" and verify "Edit" Button is enabled

    Examples:
      | Login User | Organization |Domain Name   |
      | superadmin |     UAT_RL   |www.uat_rl.com|

  Scenario Outline: As a super user I edit the created organization
    And I select the "<Organization>" and click on corresponding "Edit" Button
    And I clear the existing "orgname" in the edit box
    And I enter the "<Edited Organization>" name to be changed
    And I clear the existing "domainname" in the edit box
    And I enter "<Domain Name>" in "domainname" Edit box
    And I click on save button
    And I verify the edited "<Edited Organization>" in list
    And I verify "<Domain Name>" with "<Edited Organization>" in the organization list
    And I verify "Active" status with "<Edited Organization>" in the organization list
    And I select the "<Edited Organization>" and verify "Delete" Button is enabled
    And I select the "<Edited Organization>" and verify "Edit" Button is enabled
    Examples:
      | Organization | Edited Organization |Domain Name|
      | UAT_RL       |  Relevance_Lab      |www.uat_relevancelab.com|

  Scenario Outline: As a super user I delete the created organization
    And I select the "<New_Organization>" and click on corresponding "Delete" Button
    And I click on OK button
    And I verify the "<New_Organization>" is deleted

    Examples:
      | New_Organization |
      | Relevance_Lab    |

  Scenario: As a super user I Sign out
    And I Sign Out
    And I verify login page is displayed
