@all @smoke5Dot1
Feature: (Jira Ref: AUTOMATION-1458) Re-order documents in Ad Hoc Binder

  Scenario Outline: Naviagate to Document Content code page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Document Content Code" link
    And I wait for "Document Content Code" modal window to open in non frame page

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Add Content code
    Given I click "Add item..." button of non frame grid "BOGridFirmCode"
    And I wait for "Add item  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name      | value           |
      | ShortName | <Document Code> |
    And I click "Add" button
    Then I verify grid item action message "Successfully added item"
    And I verify the following values in non frame grid "BOGridFirmCode"
      | Name            | Description | Actions        |
      | <Document Code> |             | edit \| delete |

    Examples:
      | Document Code |
      | DC1           |
      | DC2           |
      | DC3           |
      | DC4           |

  Scenario Outline: Add binder template
    Given I click on the "Close" button
    And I navigate to the admin dashboard
    And I click on "Manage Binder Templates" link
    And I click "Add Binder Template..." button of non frame grid "<Grid ID>"
    And I wait for "Add Binder Template  ***Required fields in red" modal window to open in non frame page
    When I set these field values on editable page
      | name                         | value             |
      | CommitteePackageTemplateName | <Binder Template> |
    And I click on the "Add" button
    And I see "Successfully added Binder Template" message in the header
    And I click "edit documents" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name          | value             |
      | Template Name | <Binder Template> |

    Examples:
      | Binder Template | Grid ID                        |
      | Reorder         | BOGridCommitteePackageTemplate |

  Scenario Outline: Add Binder Documents
    Given I click "Add Binder Document..." button of non frame grid "BOGridLinkCommPkgTemplDocContent"
    And I wait for "Add Binder Document  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                  | value           |
      | CodeDocumentContentID | <Document Code> |
    And I click on the "Add" button
    Then I verify grid item action message "Successfully added Binder Document"
    And I verify the following values in non frame grid "BOGridLinkCommPkgTemplDocContent"
      | Re-Order | Document Content Type | Actions        |
      |          | <Document Code>       | edit \| delete |

    Examples:
      | Document Code |
      | DC1           |
      | DC2           |
      | DC3           |
      | DC4           |

  Scenario: Reorder and verify the document
    Given I click "down" arrow of the document "DC1"
    And I verify grid item action message "Successfully moved item"
    Then I assert the following values in non frame grid "BOGridLinkCommPkgTemplDocContent"
      | Re-Order | Document Content Type | Actions        |
      |          | DC2                   | edit \| delete |
      |          | DC1                   | edit \| delete |
      |          | DC3                   | edit \| delete |
      |          | DC4                   | edit \| delete |
    And I click "up" arrow of the document "DC4"
    Then I verify grid item action message "Successfully moved item"
    And I assert the following values in non frame grid "BOGridLinkCommPkgTemplDocContent"
      | Re-Order | Document Content Type | Actions        |
      |          | DC2                   | edit \| delete |
      |          | DC1                   | edit \| delete |
      |          | DC4                   | edit \| delete |
      |          | DC3                   | edit \| delete |

