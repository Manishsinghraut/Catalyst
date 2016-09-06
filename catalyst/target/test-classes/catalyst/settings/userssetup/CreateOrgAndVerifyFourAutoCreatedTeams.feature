@All
Feature: As a super user Create a Organization and Verify Four automatically created teams

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

    Examples:
      | Login User | Organization |Domain Name   |
      | superadmin |     aaron   |www.Aaron.com |

  Scenario Outline: As a super user I navigate to Teams page and verify the auto created Teams
    And I click on the "Users Setup" link
    And I click on the "Teams" link
    And I verify created "<Admin Team>" in the teams table
    And I verify created "<Admin Team>" with "<Organization>" in the teams table
    And I select the "<Admin Team>" and verify "Delete" Button is enabled
    And I select the "<Admin Team>" and verify "Edit" Button is enabled
    And I verify created "<Dev Team>" in the teams table
    And I verify created "<Dev Team>" with "<Organization>" in the teams table
    And I select the "<Dev Team>" and verify "Delete" Button is enabled
    And I select the "<Dev Team>" and verify "Edit" Button is enabled
    And I verify created "<DevOps Team>" in the teams table
    And I verify created "<DevOps Team>" with "<Organization>" in the teams table
    And I select the "<DevOps Team>" and verify "Delete" Button is enabled
    And I select the "<DevOps Team>" and verify "Edit" Button is enabled
    And I verify created "<QA Team>" in the teams table
    And I verify created "<QA Team>" with "<Organization>" in the teams table
    And I select the "<QA Team>" and verify "Delete" Button is enabled
    And I select the "<QA Team>" and verify "Edit" Button is enabled

    Examples:
      |Admin Team        |Dev Team     |DevOps Team     |QA Team       |Organization|
      |Aaron_Admins      | Aaron_DEV   |  Aaron_DevOps  |Aaron_QA      |Aaron       |

  Scenario Outline: As a super user I delete the created organization
    And I click on Organizations link in the settings tree
    And I select the "<Organization>" and click on corresponding "Delete" Button
    And I click on OK button
    And I verify the "<Organization>" is deleted

    Examples:
      | Organization |
      | Aaron        |

  Scenario: As a super user I Sign out
    And I Sign Out
    And I verify login page is displayed

