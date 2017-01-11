@all
Feature: Replace and Unassign files from Binder(Jira Ref.AUTOMATION-1456)

  Scenario Outline: As a delete user I import xmls and Verify documents in the Documents tab
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/"
    And I import following file name:
      | Portfolio_00020 and Location_00020-1456.xml |
      | Replace Unassign Doc-Testing 63-1456.xml    |
      | Testing-63 Folder A-1456.zip                |
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following "Folder Documents"
      | Testing-63 Folder A (3)      |
      | Testing-63 Folder Upload (3) |
    Then I verify the following values in frame grid "resultsPane"
      | File Name    | Description | Author               | Status    | Ver | Size     | Checked Out | Folder                                        |
      | UploadA1.txt |             | Delete Access Access | Available | 1   | 51 bytes |             | /Testing-63 Folder A/Testing-63 Folder Upload |
      | UploadB1.txt |             | Delete Access Access | Available | 1   | 50 bytes |             | /Testing-63 Folder A/Testing-63 Folder Upload |
      | UploadC1.txt |             | Delete Access Access | Available | 1   | 52 bytes |             | /Testing-63 Folder A/Testing-63 Folder Upload |

    Examples:
      | Login User   | Login full username  | Entity Name                     | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Replace Unassign Doc-Testing 63 | Details          | Documents       |

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
      | Grid ID                        | Binder Template    |
      | BOGridCommitteePackageTemplate | Testing -63 Binder |

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
      | name      | value          |
      | ShortName | Testing-63 Doc |
    And I click on Add item Modal window
    And I wait for "Add Binder Document  ***Required fields in red" modal window to open in non frame page
    And I click on the "Add" button
    Then I verify grid item action message "Successfully added Binder Document"
    And I assert the following values in non frame grid "BOGridLinkCommPkgTemplDocContent"
      | Re-Order | Document Content Type | Actions        |
      |          | Testing-63 Doc        | edit \| delete |

    Examples:
      | Grid ID                        | Binder Template    |
      | BOGridCommitteePackageTemplate | Testing -63 Binder |

  Scenario Outline: As a delete user I Add Binder, Regenerate and Unassign
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
      | name                       | value                |
      | CommitteePackageName       | Replace And Unassign |
      | CommitteePackageTemplateID | Testing -63 Binder   |
      | BaseName                   | R1                   |
    And I select the "    Testing-63 Folder Upload" option having space from select field
    And I click on the "Add" button
    And I wait for the Loading text to disappear
    Then I verify grid item action message "Successfully added Binder"
    And I click " Expand All " button
    And I click on "<Select Document>" link
    And I select the following "Folders" in the modal window
      | Testing-63 Folder A(3)      |
      | Testing-63 Folder Upload(3) |
    And I click on "UploadA1.txt" link
    Then I verify grid action message "Successfully added document assignment" on popup
    Then I verify grid item action message "Successfully added Binder"
    And I assert the following values in non frame grid "BOGridCommitteePackage"
      | Document Description | Assigned Document Name | Assign Document      |
      | Testing-63 Doc       | UploadA1.txt           | <Replace> <Unassign> |
    And I click on "<Replace>" link
    And I select the following "Folders" in the modal window
      | Testing-63 Folder A(3)      |
      | Testing-63 Folder Upload(3) |
    And I click on "UploadB1.txt" link
    Then I verify grid action message "Successfully updated document assignment" on popup
    And I assert the following values in non frame grid "BOGridCommitteePackage"
      | Document Description | Assigned Document Name | Assign Document      |
      | Testing-63 Doc       | UploadB1.txt           | <Replace> <Unassign> |
    And I click on "<Unassign>" link
    And I assert the following values in non frame grid "BOGridCommitteePackage"
      | Document Description | Assigned Document Name | Assign Document   |
      | Testing-63 Doc       | <Unassigned>           | <Select Document> |

    Examples:
      | Login User   | Login full username  | Entity Name                     | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Replace Unassign Doc-Testing 63 | Details          | Binders         |

