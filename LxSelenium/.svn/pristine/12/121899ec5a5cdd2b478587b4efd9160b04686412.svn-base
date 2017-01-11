@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1353), Export Budget/Folder/Schedule Template from one Firm to another

  Scenario Outline: As a delete user I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/ExportConfiguration/"
    And I import following files:
      | 9924_Templates_1353.xml |

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


  Scenario Outline: As a delete user I export configurations
    When I navigate to the admin dashboard
    And I click on "Export Configuration" link
    And I click on "Templates" link
    And I export the following
      | <Schedule Template> |
      | <Folder Template>   |
      | <Budget Template>   |
    And I click "Export Selected" button of non frame grid "ExportGrid"
#    And I wait for "Data Export - Templates" modal window to open in non frame page
    And I click on the "Save XML File" button
    Then I wait for "Data Export - Templates" modal window to close
    Then I verify file name "templates" of type ".xml" downloaded successfully


    Examples:
      | Schedule Template      | Folder Template      | Budget Template      |
      | 9924 Schedule Template | 9924 Folder Template | 9924 Budget Template |