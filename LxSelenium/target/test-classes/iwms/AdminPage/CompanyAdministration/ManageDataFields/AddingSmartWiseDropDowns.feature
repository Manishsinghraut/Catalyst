@all
Feature: Adding SmartWise Drop Downs (Jira Ref. AUTOMATION-1342)

  Scenario Outline: As a delete user I Import the following  files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | Portfolio__Sprint_16_1342.xml            |
      | ProjectLayoutWithSmartDropDowns_1342.xml |
      | Entity_1342.xml                          |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify The Message displayed "Successfully updated Custom Drop Down"
    And I navigate to the admin dashboard
    And I click on the "Client Drop Downs" link
    And I click on the "edit" row action of column "TestParentDD" of column "0" from grid "<Grid>"
    And I set following fields value on editable page
      | name                                     | value                   |
      | _CustomCodeField_CustomCodeFieldName_add | TestParent1             |
      | _CustomCodeField_Description_add         | TestParent1 Description |
    And I click "add" link "from Edit Custom Drop Down popup window"

    And I set following fields value on editable page
      | name                                     | value                   |
      | _CustomCodeField_CustomCodeFieldName_add | TestParent2             |
      | _CustomCodeField_Description_add         | TestParent2 Description |
    And I click "add" link "from Edit Custom Drop Down popup window"

    And I click "Update" button
    And I verify the following message "Successfully updated Custom Drop Down"

    And I click on the "edit" row action of column "TestChildDD" of column "0" from grid "<Grid>"
    And I set following fields value on editable page
      | name                    | value        |
      | ParentCustomCodeTableID | TestParentDD |
    And I click "Update" button

    And I click on the "edit" row action of column "TestChildDD" of column "0" from grid "<Grid>"
    And I set following fields value on editable page
      | name                                         | value                  |
      | _CustomCodeField_CustomCodeFieldName_add     | TestChild1             |
      | _CustomCodeField_Description_add             | TestChild1 Description |
      | _CustomCodeField_ParentCustomCodeFieldID_add | TestParent1            |

    And I click "add" link "from Edit Custom Drop Down popup window"

    And I set following fields value on editable page
      | name                                         | value                  |
      | _CustomCodeField_CustomCodeFieldName_add     | TestChild2             |
      | _CustomCodeField_Description_add             | TestChild2 Description |
      | _CustomCodeField_ParentCustomCodeFieldID_add | TestParent2            |

    And I click "add" link "from Edit Custom Drop Down popup window"

    And I click "Update" button
    And I verify the following message "Successfully updated Custom Drop Down"

    And I verify a row from non frame grid "<Grid>" having unique value "TestChildDD" under column header "Custom Drop Down Name"
      | name                        | value        |
      | Custom Drop Down Name       | TestChildDD  |
      | Description                 | TestChildDD  |
      | Smart List Parent Drop Down | TestParentDD |

  Examples:
    | Grid                  |
    | BOGridCustomCodeTable |

  Scenario Outline: As a delete user I verify The Smart wise drops should displays correct value
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I select "Project Layout with Smart Drop downs" from Page dropdown
    And I switch to visible frame
    And I verify the text "TestParentDD" on "bottom of the summary page"
    And I verify the text "TestChildDD" on "bottom of the summary page"
    And I switch to default frame
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                       | value       |
      | ProjectEntity_TestParentDD | TestParent1 |
      | ProjectEntity_TestChildDD  | TestChild1  |

    And I set following fields value on editable page
      | name                       | value       |
      | ProjectEntity_TestParentDD | TestParent2 |
      | ProjectEntity_TestChildDD  | TestChild2  |

    And I switch to default frame

  Examples:
    | Entity Name              | Second Level Tab |
    | Smart Drop downs Project | Details          |