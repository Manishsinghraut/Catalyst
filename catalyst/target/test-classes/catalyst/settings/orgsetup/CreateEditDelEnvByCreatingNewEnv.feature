@All
Feature: As a super user I Create, Edit, Delete Environment by creating new Environment

  Scenario Outline: As a super user I create a organization
    Given I Login to catalyst using "<Login User>" access credentials
    And I see the catalyst "workzone"
    And I click on the Settings Link
    And I click on Organizations link in main page
    And I click on "newOrg" button
    And I enter "<Organization>" in "orgname" Edit box
    And I click on save button
    And I verify the created "<Organization>" in list

    Examples:
      | Login User | Organization |
      | superadmin | UAT_RL1      |

  Scenario Outline: As a super user I create a Chef Server
    And I click on "Config Setup" link
    And I click on "Chef Server" link
    And I click on "newConfig" button
    And I enter "<name of server>" in "configname" Edit box
    And I enter "<User Name>" in "loginname" Edit box
    And I enter "<URL>" in "url" Edit box
    And I select "<Organization>" from the select box
    And I click on user pem file browse button
    And I click on knife file browse button
    And I click on save button
    And I verify created "<name of server>" in chef server table

    Examples:

      | name of server  | User Name | URL                                           | Organization |
      | Cat_Chef_Server | mycatqa   | https://api.opscode.com/organizations/cattest | UAT_RL1      |
  Scenario Outline: As a super user I create environment by creating new Environment
    And I click on Environments link
    And I click on "newENV" button
    And I select "<Organization>" from the select box
    And I click on add chef environment button on create environment page
    And I enter  chef environment in "chefenvname" Edit box
    And I click on save button
    And I verify newly created "environment" in environments table
    And I verify "environment" with assigned "<Organization>" in the environments table
    And I verify "environment" with assigned "<Chef Server>" in the environments table
    And I select the "envName" and verify "Edit" Button is enabled in environments table
    And I select the "envName" and verify "Delete" Button is enabled in environments table

    Examples:
      |  Organization |Chef Server     |
      |  UAT_RL1      |Cat_Chef_Server |

#  Scenario Outline: As a super user I edit the created environment
#    And I select the "<Chef Server>" and click on corresponding "Edit" Button
##    And I verify select organization is disabled
##    And I verify select chef server is disabled
#    And I click on add chef environment button on create environment page
#    And I enter  chef environment in "chefenvname" Edit box
#    And I click on save button
#    And I verify created "name of environments" in environments table
#    And I verify "environments" with assigned "<Organization>" in the environments table
#    And I verify "environments" with assigned "<Chef Server>" in the environments table
#    And I select the "envName" and verify "Edit" Button is enabled in environments table
#    And I select the "envName" and verify "Delete" Button is enabled in environments table
#
#    Examples:
#      |Organization|Chef Server     |
#      |UAT_RL1     |Cat_Chef_Server |

  Scenario Outline: As A super user I delete the created environment
    And I select the "<Chef Server>" and click on corresponding "Delete" Button
    And I click on OK button
    And I verify the created environment is deleted

    Examples:
      |Chef Server    |
      |Cat_Chef_Server|

  Scenario Outline:As a super user I delete the created Chef Server
    And I click on "Chef Server" link
    And I select the "<Chef Server>" and click on corresponding "Delete" Button
    And I click on OK button

    Examples:
      |Chef Server    |
      |Cat_Chef_Server|

  Scenario Outline:As a super user I delete the created Organization

    And I click on Organizations link in the settings tree
    And I click on "<Organization>" delete button
    And I click on OK button
    Examples:
      |Organization|
      |UAT_RL1|

  Scenario: As a super user I sign out
    And I Sign Out
    And I verify login page is displayed

