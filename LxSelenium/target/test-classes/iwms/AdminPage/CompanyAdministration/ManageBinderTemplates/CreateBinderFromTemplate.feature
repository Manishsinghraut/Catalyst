@all
Feature: Create Binder from Template (Jira Ref.AUTOMATION-1454)
  Scenario Outline: As a delete user I import xmls and create Binder Template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/"
    And I import following file name:
      | Portfolio_00020 and Location_00020-1454.xml |
      | Project (2)-1454.xml                        |
      | Selenium Folder-1454.xml                    |
    And I navigate to the admin dashboard
    And I click on "Manage Binder Templates" link
    And I click "Add Binder Template..." button of non frame grid "<Grid ID>"
    And I wait for "Add Binder Template  ***Required fields in red" modal window to open in non frame page
    When I set these field values on editable page
      | name                         | value             |
      | CommitteePackageTemplateName | <Binder Template> |
    And I click on the "Add" button
    And I see "Successfully added Binder Template" message in the header
    And I verify the following values in non frame grid "^editBOGrid"
      | Template Name               | Actions                          |
      | Create Binder from Template | edit \| delete \| edit documents |

    Examples:
      | Login User   | Login full username  | Grid ID                        | Binder Template              |
      | DeleteAccess | Delete Access Access | BOGridCommitteePackageTemplate | Create Binder from Template  |

  Scenario Outline: Add Content code
    Given I navigate to the admin dashboard
    And I click on the "Document Content Code" link
    And I wait for "Document Content Code" modal window to open in non frame page
    And I click "Add item..." button of non frame grid "BOGridFirmCode"
    And I wait for "Add item  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name      | value           |
      | ShortName | <Document Code> |
    And I click "Add" button
    Then I verify grid item action message "Successfully added item"
    And I verify the following values in non frame grid "BOGridFirmCode"
      | Name            | Description | Actions        |
      | <Document Code> |             | edit \| delete |
    Given I click on the "Close" button

    Examples:
      | Document Code |
      | test          |

  Scenario Outline: As a delete user I Add Binder
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/"
    And I import following file name:
      | TESTING_61 (1)-1454.xml     |
      | Selenium Folder-1454.xml    |
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "Add Binder..." button of non frame grid "BOGridCommitteePackage"
    And I wait for "Add Binder  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value                        |
      | CommitteePackageName       | Binder                       |
      | CommitteePackageTemplateID | Create Binder from Template  |
      | FolderID                   | SeleniumTestRootFolder1                             |
      | BaseName                   | Binder 61                    |
    And I click on the "Add" button
    And I wait for the Loading text to disappear
    Then I verify grid item action message "Successfully added Binder"

    Examples:
      | Login User   | Login full username  | Entity Name  | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | TESTING-61   | Details          | Binders         |

  Scenario: As a delete user I Upload the Document
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I select the following "Folder documents"
      | SeleniumTestRootFolder1 |
    And I click on "Upload to SeleniumTestRootFolder1" tab
    And I see the "Uploading to folder /SeleniumTestRootFolder1" modal window
    And I set fields values on editable page
      | name               | value                |
      | description        | Used in TESTING-61   |
      | documentType       | Document             |
      | authoredByPersonID | Delete Access Access |
    And I upload the following document from path "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/":
      | Upload Document-1454.docx |
    When I click on the "Upload" button
    And I wait for modal window to close
    Then I verify the following values in frame grid "resultsPane"
      | File Name                 | Description        | Author               | Status    | Ver | Size     | Checked Out | Folder                   |
      | Upload Document-1454.docx | Used in TESTING-61 | Delete Access Access | Available | 1   | 206.7 KB |             | /SeleniumTestRootFolder1 |

  Scenario Outline: As a delete user I upload document to Binder using Drag and Drop
    And I click on the "Binders" tab
    And I wait for the Loading text to disappear
    And I click "assign documents" row action in the frame grid "<Grid ID>" having the following header and cell values
      | name  | value     |
      | Title | Binder    |
    And I wait for "Assign Documents" modal window to open in non frame page
    And I expand the following
      | SeleniumTestRootFolder1 (1) |
    And I drag and drop the "Upload Document-1454.docx" to "Binder" location
    And I click on the "Finish" button
    And I wait for the Loading text to disappear
    And I assert the following values in non frame grid "BOGridCommitteePackage"
      | Assigned Document Name    |
      | Upload Document-1454.docx |

    Examples:
      | Grid ID                |
      | BOGridCommitteePackage |

  Scenario Outline: As a delete user I Generate Binder
    And I click on "Generate" link
    And I click on the "Yes" button in "Include Page Numbers?" message box
    And I click on magnify download icon
    Then I verify file name "Binder 61(Version=1)" of type ".pdf" downloaded successfully
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    Then I verify the following rows including blank headers in frame grid "<Grid ID>"
      |  | Title     | File Name        |                               | Actions                            |
      |  | Binder    | Binder 61.pdf    | Binder is up to date Generate | edit \| delete \| assign documents |

    Examples:
      | Grid ID                |
      | BOGridCommitteePackage |