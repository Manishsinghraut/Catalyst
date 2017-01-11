@all
Feature: Save Binder to Documents (Ref : Jira Ticket No : AUTOMATION-1361)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | SDBinderProject_1361.xml |
      | 15712Document_1361.zip   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As DeleteAccess user add a new code item
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "<code-type> Code" link
    And I see the "<code-type>" modal window
    And I click "Add <add-item-window-name>..." button
    And I set following fields on editable page
      | name      | value        |
      | ShortName | <user-class> |
    When I click on the "Add" button on Add Item Modal Window
    Then I see "Successfully added <add-item-window-name>" in the grid header
    And I verify a row from non frame grid "<grid>" having unique value "Added by <user-class>" under column header "Name"
      | name | value        |
      | Name | <user-class> |
    And I click "Close" button

  Examples:
    | Login User   | Login full username  | user-class | code-type        | add-item-window-name | grid           |
    | DeleteAccess | Delete Access Access | 15712      | Document Content | item                 | BOGridFirmCode |
    | DeleteAccess | Delete Access Access | 15712-B    | Document Type    | item                 | BOGridFirmCode |


  Scenario Outline: As DeleteAccess user add a binder templates
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Binder Templates" link
    And I click "Add Binder Template..." button
    And I set following fields on editable page
      | name                         | value             |
      | CommitteePackageTemplateName | <Binder Template> |
    And I click "Add" button
    And I verify the following message "Successfully added Binder Template"

  Examples:
    | Login User   | Login full username  | Binder Template |
    | DeleteAccess | Delete Access Access | Ad Hoc          |


  Scenario Outline: As Delete user, I verify the Save Binder to Documents
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Add Binder..." button
    And I switch to default frame
    And I set following fields on editable page
      | name                       | value             |
      | CommitteePackageName       | Binder A          |
      | CommitteePackageTemplateID | <Binder Template> |
      | BaseName                   | 15712 Binder      |
    And I select "    a" from "FolderID" dropdown

    And I click "Add" button
    And I switch to visible frame
    And I verify the following message "Successfully added Binder"
    Then I click on the "assign documents" row action of column "Binder A" of column "1" from grid "BOGridCommitteePackage"
    And I switch to default frame
    And I expand the "example (1)" tree
    And I expand the "a (1)" tree
    And I drag and drop the "abc.txt" to "Binder A" location
    And I click "Finish" button

    And I click on the "<Third Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I select "    a" from "FolderID" dropdown
    And I set following fields value on editable page
      | name     | value      |
      | BaseName | <Document> |

    And I click on "Save" Button
    And I switch to main window

    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | example (2) |
    And I select the following
      | a (2) |

    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I verify a row from non frame grid "BOGridCommitteePackage" having unique value "Binder A" under column header "Title"
      | name      | value            |
      | Title     | Binder A         |
      | File Name | 15712 Binder.pdf |
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name     | Second Level Tab | Third Level Tab | Document       | Binder Template |
    | DeleteAccess | Delete Access Access | SDBinderProject | Details          | Binders         | BinderCopyFile | Ad Hoc          |

