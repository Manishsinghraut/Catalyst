@All
Feature: As a super user Create, Edit and Delete Team

  Scenario Outline: As a super user I create a organization
    Given I Login to catalyst using "<Login User>" access credentials
    Then I see the catalyst "workzone"
    And I click on the "SETTINGS" link
    And I click on Organizations link in main page
    And I click on "newOrg" button
    And I enter "<Organization>" in "orgname" Edit box
    And I click on save button
    And I verify the created "<Organization>" in list

    Examples:
      | Login User | Organization |
      | superadmin |     UAT_RL3   |

  Scenario Outline: As a super user I create another organization
    And I click on "newOrg" button
    And I enter "<Organization>" in "orgname" Edit box
    And I click on save button
    And I verify the created "<Organization>" in list

    Examples:
      | Organization |
      |   UAT_RL4    |

  Scenario Outline: As a super user I create a Business group
    And I click on Business Groups Link
    And I click on New BGroup button
    And I enter the "<Business Group>" name in Business Group name
    And I select "<Organization>" from the select box
    And I click on save button
    And I verify the created "<Business Group>" in Business group table

    Examples:
      | Business Group | Organization |
      | Cell           | UAT_RL3       |

  Scenario Outline: As a super user I create a Business group
    And I click on New BGroup button
    And I enter the "<Business Group>" name in Business Group name
    And I select "<Organization>" from the select box
    And I click on save button
    And I verify the created "<Business Group>" in Business group table

    Examples:
      | Business Group | Organization |
      | Cell_Dev       | UAT_RL4       |

  Scenario Outline: As a super user I create a Project
    And I click on Projects link
    And I click on "newProj" button
    And I enter "<Project name>" in "projectname" Edit box
    And I enter "<Description>" in "description" Edit box
    And I select "<Organization>" from the select box
    And I click on save button
    And I verify the created "<Project name>" in project table

    Examples:
      |Project name|Organization     |Description     |
      | Catalyst   |UAT_RL3           | Catalyst_UAT_RL|

  Scenario Outline: As a super user I create another Project
    And I click on "newProj" button
    And I enter "<Project name>" in "projectname" Edit box
    And I enter "<Description>" in "description" Edit box
    And I select "<Organization>" from the select box
    And I click on save button
    And I verify the created "<Project name>" in project table

    Examples:
      |Project name|Organization     |Description     |
      | Catalyst1  |UAT_RL4          | Catalyst_UAT   |

  Scenario Outline: As a super user I create a Team
    And I click on the "Users Setup" link
    And I click on the "Teams" link
    And I click on "newTeam" button
    And I enter "<Team Name>" in "teamname" Edit box
    And I enter "<Description>" in "description" Edit box
    And I select "<Organization>" from the select box
    And I check the "superadmin" check box
    And I check the "<Project>" check box
    And I click on save button
    And I verify created "<Team Name>" in the teams table
    And I verify created "<Team Name>" with "<Organization>" in the teams table
    And I select the "<Team Name>" and verify "Delete" Button is enabled
    And I select the "<Team Name>" and verify "Edit" Button is enabled

    Examples:
      |Team Name      |Description         |Organization|Project|
      |UAT_Team          |UAT  Automation Team|  UAT_RL3    |Catalyst|

  Scenario Outline: As a super user I edit the created Team
    And I select the "<Team Name>" and click on corresponding "Edit" Button
    And I enter "<New Team Name>" in "teamname" Edit box
    And I enter "<Description>" in "description" Edit box
    And I check the "superadmin" check box
    And I check the "<Project>" check box
    And I click on save button
    And I verify created "<New Team Name>" in the teams table
    And I verify created "<New Team Name>" with "<Organization>" in the teams table
    And I select the "<New Team Name>" and verify "Delete" Button is enabled
    And I select the "<New Team Name>" and verify "Edit" Button is enabled

    Examples:
      |Team Name      |New Team Name| Description                 |Organization |Project|
      |UAT_Team       |UAT_Team1     |UAT  Cucumber Automation Team|  UAT_RL4    |Catalyst1|

  Scenario Outline: As a super user I delete the created Team
    And I select the "<Team Name>" and click on corresponding "Delete" Button
    And I click on OK button
    And I verify created "<Team Name>" is deleted

    Examples:
      |Team Name      |
      |UAT_Team1      |

  Scenario Outline:As a super user I delete the created project
    And I click on Projects link
    And I select the "<Project name>" and click on corresponding "Delete" Button
    And I click on OK button
    And I select the "<Project name_1>" and click on corresponding "Delete" Button
    And I click on OK button

    Examples:
      |Project name|Project name_1|
      |Catalyst    |Catalyst1     |

  Scenario Outline: As a super user I delete the created Business Group
    And I click on Business Groups Link
    And I select the "<Business Group>" and click on corresponding "Delete" Button
    And I click on OK button
    And I select the "<Business Group2>" and click on corresponding "Delete" Button
    And I click on OK button

    Examples:
      |Business Group|Business Group2|
      |   Cell       |Cell_Dev       |

  Scenario Outline: As a super user I delete the created organization
    And I click on "Organizations" link
    And I select the "<Organization_1>" and click on corresponding "Delete" Button
    And I click on OK button
    And I select the "<Organization_2>" and click on corresponding "Delete" Button
    And I click on OK button

    Examples:
      |Organization_1|Organization_2|
      |UAT_RL3        |   UAT_RL4    |

  Scenario: As a super user I sign out
    And I Sign Out
    And I verify login page is displayed

