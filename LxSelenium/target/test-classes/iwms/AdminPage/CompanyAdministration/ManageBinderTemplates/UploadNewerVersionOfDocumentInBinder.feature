@all
Feature: (Jira Ref.AUTOMATION-1457) Upload newer version of Document in Binder

  Scenario Outline: As a delete user I import xmls, create document code and Create binder template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020-1457.xml |
    And I import following files:
      | Project-1457.xml |
      | Testing-1457.zip |

    And I navigate to the admin dashboard
    And I click on the "Document Content Code" link
    And I wait for "Document Content Code" modal window to open in non frame page
    Given I click "Add item..." button of non frame grid "BOGridFirmCode"
    And I wait for "Add item  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name      | value |
      | ShortName | <DC>  |
    And I click "Add" button
    And I click on the "Close" button

    And I navigate to the admin dashboard
    And I click on "Manage Binder Templates" link
    And I click "Add Binder Template..." button of non frame grid "<Grid ID>"
    And I wait for "Add Binder Template  ***Required fields in red" modal window to open in non frame page
    When I set these field values on editable page
      | name                         | value             |
      | CommitteePackageTemplateName | <Binder Template> |
    And I click on the "Add" button
    And I wait for modal window to close
    And I verify the following values in non frame grid "<Grid ID>"
      | Template Name     |
      | <Binder Template> |

    Examples:
      | Login User   | Login full username  | Binder Template | Grid ID                        | DC      |
      | DeleteAccess | Delete Access Access | UploadDoc       | BOGridCommitteePackageTemplate | DC-1457 |


  Scenario Outline: As a delete user I add binders in entity
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Binders" tab
    And I wait for the Loading text to disappear
    And I click "Add Binder..." button of frame grid "<Grid ID>"
    And I wait for "Add Binder  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value             |
      | CommitteePackageName       | V1                |
#      | FolderID                   | UploadNewVersion  |
      | CommitteePackageTemplateID | <Binder Template> |
      | BaseName                   | V1                |
    And I select the "    UploadNewVersion" option having space from select field
    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify the following values in frame grid "<Grid ID>"
      | Title | File Name | Actions                            |
      | V1    | V1.pdf    | edit \| delete \| assign documents |
    And I click on button contains text "Expand All"
    And I click "assign documents" row action in the frame grid "<Grid ID>" having the following header and cell values
      | name  | value |
      | Title | V1    |
    And I wait for "Assign Documents" modal window to open in non frame page
    And I expand the following
      | Example (1)          |
      | UploadNewVersion (1) |
    And I drag and drop the "Upload.txt" to "V1" location
    And I click on the "Finish" button
    And I wait for the Loading text to disappear
    And I click on "Generate" link
    And I click on the "Yes" button in "Include Page Numbers?" message box
    And I wait for the Loading text to disappear
    And I click on the "Binders" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    Then I verify the following rows including blank headers in frame grid "BOGridCommitteePackage"
      |  | Title | File Name |                               | Actions                            |
      |  | V1    | V1.pdf    | Binder is up to date Generate | edit \| delete \| assign documents |


    Examples:
      | Project Name     | Binder Template | Grid ID                |
      | UploadNewVersion | UploadDoc       | BOGridCommitteePackage |

  Scenario Outline: As a delete user I navigate to documents and upload newer version
    Given I navigate to entity type "Opening Projects" named "UploadNewVersion" through search option
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I expand the following
      | Example (2) |
    And I select the following
      | UploadNewVersion (2) |
    And I verify all rows count "2" in the frame grid "<Documents Grid>"
    Then I verify the following values in frame grid "resultsPane"
      | File Name  | Description | Author               | Status    | Ver | Checked Out |
      | Upload.txt |             | Delete Access Access | Available | 1   |             |
      | V1.pdf     | V1          | Delete Access Access | Available | 1   |             |

    And I right click on a document "Upload.txt" and select menu option "Upload new version"
    And I wait for the Loading text to disappear
    And I wait for "Uploading new version of Upload.txt" modal window to open in frame page
    And I upload the following document from path "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/":
      | NewVersion-1457.txt |
    And I click on the "Upload" button
    Then I verify the following values in frame grid "resultsPane"
      | File Name  | Description | Author               | Status    | Ver | Checked Out |
      | Upload.txt |             | Delete Access Access | Available | 2   |             |
      | V1.pdf     | V1          | Delete Access Access | Available | 1   |             |
    And I verify all rows count "2" in the frame grid "<Documents Grid>"

    Examples:
      | Documents Grid |
      | resultsPane    |


  Scenario Outline: As a delete user I navigate to binders and check the document version
    Given I navigate to entity type "Opening Projects" named "UploadNewVersion" through search option
    And I click on the "Binders" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    Then I verify the following rows including blank headers in frame grid "<Grid>"
      |  | Title | File Name |                                | Actions                            |
      |  | V1    | V1.pdf    | Binder is out of date Generate | edit \| delete \| assign documents |
    And I click on "Generate" link
    And I click on the "Yes" button in "Include Page Numbers?" message box
    And I wait for the Loading text to disappear
    And I click on the "Binders" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    Then I verify the following rows including blank headers in frame grid "BOGridCommitteePackage"
      |  | Title | File Name |                               | Actions                            |
      |  | V1    | V1.pdf    | Binder is up to date Generate | edit \| delete \| assign documents |
    And I click on magnify download icon
    Then I verify file name "V1(Version=2)" of type ".pdf" downloaded successfully


    Examples:
      | Grid                   |
      | BOGridCommitteePackage |

