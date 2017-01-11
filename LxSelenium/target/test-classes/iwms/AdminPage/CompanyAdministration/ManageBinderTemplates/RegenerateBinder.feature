@all
Feature: (Jira Ref.AUTOMATION-1455) Regenerate Binder

  Scenario Outline: As a delete user I import xmls and Verify documents in the Documents tab
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/"
    And I import following file name:
      | Portfolio_00020 and Location_00020-1455.xml |
      | RegenerateBinderProject-1455.xml            |
      | FolderA-1455.zip                            |
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following "Folder documents"
      | FolderA (3) |
      | FolderA (3) |
    Then I verify the following values in frame grid "resultsPane"
      | File Name   | Description | Author               | Status    | Ver | Size     | Checked Out | Folder           |
      | UploadA.txt |             | Delete Access Access | Available | 1   | 12 bytes |             | /FolderA/FolderA |
      | UploadB.txt |             | Delete Access Access | Available | 1   | 11 bytes |             | /FolderA/FolderA |
      | UploadC.txt |             | Delete Access Access | Available | 1   | 11 bytes |             | /FolderA/FolderA |

    Examples:
      | Login User   | Login full username  | Entity Name      | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | RegenerateBinder | Details          | Documents       |

  Scenario Outline: Add Binder Template
    And I navigate to the admin dashboard
    And I click on "Manage Binder Templates" link
    And I click "Add Binder Template..." button of non frame grid "<Grid ID>"
    And I wait for "Add Binder Template  ***Required fields in red" modal window to open in non frame page
    When I set these field values on editable page
      | name                         | value             |
      | CommitteePackageTemplateName | <Binder Template> |
    And I click on the "Add" button
    And I see "Successfully added Binder Template" message in the header

    Examples:
      | Grid ID                        | Binder Template |
      | BOGridCommitteePackageTemplate | TestBinder      |

  Scenario Outline: Add Binder Documents
    Given I click "edit documents" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name          | value             |
      | Template Name | <Binder Template> |
    And I click "Add Binder Document..." button of non frame grid "BOGridLinkCommPkgTemplDocContent"
    And I wait for "Add Binder Document  ***Required fields in red" modal window to open in non frame page
    And I click on the ellipsis on the modal window
    And I wait for " " modal window to open in non frame page
    And I click on the "Add item..." button on Add Item Modal Window
    And I wait for "Add item  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name      | value    |
      | ShortName | Document |
    And I click on Add item Modal window
    And I wait for "Add Binder Document  ***Required fields in red" modal window to open in non frame page
    And I click on the "Add" button
    Then I verify grid item action message "Successfully added Binder Document"
    And I verify the following values in non frame grid "BOGridLinkCommPkgTemplDocContent"
      | Re-Order | Document Content Type | Actions        |
      |          | Document              | edit \| delete |

    Examples:
      | Grid ID                        | Binder Template |
      | BOGridCommitteePackageTemplate | TestBinder      |

  Scenario Outline: As a delete user I Add Binder
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "Add Binder..." button of non frame grid "BOGridCommitteePackage"
    And I wait for "Add Binder  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value      |
      | CommitteePackageName       | BinderA    |
      | CommitteePackageTemplateID | TestBinder |
#      | FolderID                   |     FolderA |
      | BaseName                   | FileA      |
#    And I select the "2" index from select field
    And I select the "    FolderA" option having space from select field
    And I click on the "Add" button
    And I wait for the Loading text to disappear
    Then I verify grid item action message "Successfully added Binder"
    And I click on button contains text "Expand All"
    And I click on "<Select Document>" link
    And I select the following "Folders" in the modal window
      | FolderA (3) |
      | FolderA (3) |
    And I click on "UploadB.txt" link
    Then I verify grid action message "Successfully added document assignment" on popup
    Then I verify grid item action message "Successfully added Binder"
    And I click on "Generate" link
    And I wait for pop up
    And I click on the "Yes" button in confirmation pop up
    Then I verify the following rows including blank headers in frame grid "BOGridCommitteePackage"
      |  | Title   | File Name |                               | Actions        |
      |  | BinderA | FileA.pdf | Binder is up to date Generate | edit \| delete |
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I select the following "Folder documents"
      | FolderA (4) |
      | FolderA (4) |
    Then I verify the following values in frame grid "resultsPane"
      | File Name   | Description | Author               | Status    | Ver | Size     | Checked Out | Folder           |
      | FileA.pdf   | BinderA     | Delete Access Access | Available | 1   | 35.4 KB  |             | /FolderA/FolderA |
      | UploadA.txt |             | Delete Access Access | Available | 1   | 12 bytes |             | /FolderA/FolderA |
      | UploadB.txt |             | Delete Access Access | Available | 1   | 11 bytes |             | /FolderA/FolderA |
      | UploadC.txt |             | Delete Access Access | Available | 1   | 11 bytes |             | /FolderA/FolderA |
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    And I click on "Generate" link
    And I wait for pop up
    And I click on the "Yes" button in confirmation pop up
    Then I verify the following rows including blank headers in frame grid "BOGridCommitteePackage"
      |  | Title   | File Name |                               | Actions        |
      |  | BinderA | FileA.pdf | Binder is up to date Generate | edit \| delete |

    Examples:
      | Login User   | Login full username  | Entity Name      | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | RegenerateBinder | Details          | Binders         |

    