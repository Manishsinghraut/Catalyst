@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1353), Export Budget/Folder/Schedule Template from one Firm to another

  Scenario Outline: As a delete user I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/ExportConfiguration/target/DownloadFiles/" for export configuration
    And I import the following files:
      | templates.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Verify that folder, Schedule and budget template created successfully
    When I navigate to the admin dashboard
    And I click on "Manage Budget Templates" link
    Then I verify the following values in non frame grid "BOGridBudgetTemplate"
      | Budget Template Name | Description |
      | <Budget Template>    |             |

    When I navigate to the admin dashboard
    And I click on "Manage Folder Templates" link
    Then I verify the following values in non frame grid "BOGridFolderTemplate"
      | Folder Template Name | Description |
      | <Folder Template>    |             |

    When I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    Then I verify the following values in non frame grid "BOGridTaskTemplate"
      | Template Name       | Description |
      | <Schedule Template> |             |

    Examples:
      | Schedule Template      | Folder Template      | Budget Template      |
      | 9924 Schedule Template | 9924 Folder Template | 9924 Budget Template |