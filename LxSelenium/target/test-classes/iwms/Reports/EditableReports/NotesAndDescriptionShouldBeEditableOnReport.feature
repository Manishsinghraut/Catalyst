@all
Feature: Notes and Description should be editable on Report - [Jira Ref. : AUTOMATION-1391]

  Scenario Outline: As Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | TestEditableFieldsEntity_1391.xml |
      | Pagelayout_1391.xml               |
      | Report_1391.xml                   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete user, I verify the The Report shall run successfully and user can view the notes and description as on the entity page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify the field "Description" is "<Description>"
    And I verify the field "Notes" has "<Notes>"
    And I switch to default frame

    Then I navigate to the reports dashboard
#    And I click on the "run" row action of column "<Report Name>" of column "0" from grid "<Grid>"

    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Name                 | Description   | Notes   |
      | Test Editable fields | <Description> | <Notes> |

    And I click the field "Description fields need to be editable" under column "Description" of Entity "Test Editable fields" on the report
    And I set following fields value on editable page
      | name                             | value                   |
      | ProjectEntity_ProjectDescription | Edited-ZZ <Description> |
    And I click on the green check-mark

    And I verify the following values in non frame grid
      | Name                 | Description             | Notes   |
      | Test Editable fields | Edited-ZZ <Description> | <Notes> |


    And I click the field "<Notes>" under column "	Notes" of Entity "Test Editable fields" on the report
    And I set following fields value on editable page
      | name                | value                      |
      | ProjectEntity_Notes | Editable Notes ZZZ-<Notes> |
    And I click on the green check-mark

    And I click on the "Rerun Report" link
    And I verify the following values in non frame grid
      | Name                 | Description             | Notes                      |
      | Test Editable fields | Edited-ZZ <Description> | Editable Notes ZZZ-<Notes> |

    And I close the "Report" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name          | Third Level Tab | Description                            | Notes                            | Report Name                           | Grid        |
    | DeleteAccess | Delete Access Access | Test Editable fields | Summary         | Description fields need to be editable | Notes fields need to be editable | Editable notes and description fields | pageContent |


  Scenario Outline: As Delete user, I verify Both the fields on the Entity Summary page should reflect the updated values as updated on the report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify the field "Description" is "Edited-ZZ <Description>"
    And I verify the field "Notes" has "Editable Notes ZZZ-<Notes>"
    And I switch to default frame


  Examples:
    | Login User   | Login full username  | Entity Name          | Third Level Tab | Description                            | Notes                            |
    | DeleteAccess | Delete Access Access | Test Editable fields | Summary         | Description fields need to be editable | Notes fields need to be editable |

