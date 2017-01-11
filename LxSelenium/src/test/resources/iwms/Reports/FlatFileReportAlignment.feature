@all
Feature: (Jira Ref. : AUTOMATION-1104) Flat File Report Alignment

  Scenario Outline: Flat File Report Alignment
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | FlatFile_Project.xml |
      | FlatFileReport.xml   |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I verify the Location fields value on project entity non-editable summary tab
      | name             | value             |
      | Street Address   | 5601 Democracy Dr |
      | City             | Plano             |
      | State / Province | TX                |
      | Country          | United States     |
    And I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Edit Report" child window
    And I edit report step "Step 4 - Field List and Details"
    And I verify the following values in non frame grid "BOGridCustomObjectDel"
      | Field Name On Report | Lx Default Name                              | Data Type | Criteria             |
      | City, State          | City, State (General Summary Information)    | Text      |                      |
      | Name                 | Name (General Summary Information)           | Text      | = Flat file-Project, |
      | Street Address       | Street Address (General Summary Information) | Text      |                      |
    And I close the "Edit Report" child window
    And I switch to main window
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Run Report" child window
    And I wait for the Loading text to disappear in grid
    And I verify the following text in a page
      | Flat file-Project,5601 Democracy Dr,Plano TX United States, |
    And I close the "Run Report" child window
    And I switch to main window


    Examples:
      | Login User   | Login full username  | Report Name      | Entity Name        |
      | DeleteAccess | Delete Access Access | Flat File Report | Flat file-Project, |