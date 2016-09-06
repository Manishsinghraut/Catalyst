@All
Feature: As a super user I Create, Edit & Delete Docker template
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

  Scenario Outline: As a super user I create another organization
    And I click on "newOrg" button
    And I enter "<Organization>" in "orgname" Edit box
    And I click on save button
    And I verify the created "<Organization>" in list

    Examples:
      | Organization |
      | UAT_RL2      |

  Scenario Outline: As a super user I create Docker template
    And I click on "Gallery Setup" link
    And I click on "Templates" link
    And I click on "newTemplate" button
    And I enter "<Template Name>" in "templatename" Edit box
    And I select "Docker" from select box
    And I select "<Organization>" from the select box in create template page
    And I enter "<Docker Repo Path>" in "dockercontainers" Edit box
    And I click on save button
    And I verify "<Template Name>" is available in templates table
    And I select "<Template Name>" and verify corresponding "<Organization>" in Templates table
    And I select "<Template Name>" and verify corresponding "<Template Type>" in Templates table
    And I select the "<Template Name>" and verify "Edit" Button is enabled
    And I select the "<Template Name>" and verify "Delete" Button is enabled

    Examples:
      |Template Name|Organization|Docker Repo Path       |Template Type |
      | RL_Docker   | UAT_RL1    |relevancelab/tomcatpet |Docker       |

  Scenario Outline: As a super user I edit the created Docker Template
    And I select the "<Template Name>" and click on corresponding "Edit" Button
    And I clear the existing "templatename" in the edit box
    And I enter "<New Name Of Temp>" in "templatename" Edit box
    And I select "<Organization>" from the select box in create template page
    And I click on save button
    And I verify "<New Name Of Temp>" is available in templates table
    And I select "<New Name Of Temp>" and verify corresponding "<Organization>" in Templates table
    And I select "<New Name Of Temp>" and verify corresponding "<Template Type>" in Templates table
    And I select the "<New Name Of Temp>" and verify "Edit" Button is enabled
    And I select the "<New Name Of Temp>" and verify "Delete" Button is enabled

    Examples:
      |Template Name|New Name Of Temp|Organization|Template Type |
      | RL_Docker   |RL_DockerTemp   |UAT_RL2     |  Docker      |

  Scenario Outline: As a super user I Delete the created Docker Template
    And I select the "<Template Name>" and click on corresponding "Delete" Button
    And I click on OK button
    And I verify the "<Template Name>" is deleted from the Templates table

    Examples:
      |Template Name |
      |RL_DockerTemp |

  Scenario Outline:As a super user I Delete the created Organizations
    And I click on Organizations link in the settings tree
    And I click on "<Organization_1>" delete button
    And I click on OK button
    And I click on "<Organization_2>" delete button
    And I click on OK button
    Examples:
      |Organization_1|Organization_2|
      |  UAT_RL1     | UAT_RL2      |

  Scenario: As a super user I Sign out
    And I Sign Out
    And I verify login page is displayed