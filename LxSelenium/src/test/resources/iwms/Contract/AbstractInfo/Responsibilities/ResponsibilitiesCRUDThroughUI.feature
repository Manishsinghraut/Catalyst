@all @smoke @smoke2
Feature:(Jira Ref: AUTOMATION-505) To ensure that users can add, edit, and delete(CRUD) a Contract Responsibility

  Scenario Outline: To ensure that users can add a Contract Responsibility
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Responsibilities List" after navigation
    And I click on the "Add item" action panel button
    Then I verify page title "Contract Responsibilities List" after navigation
    And I set fields values on editable page
      | name                                        | value                                    |
      | Responsibility_CapAmount                    | 10000                                    |
      | Responsibility_EffectiveDate                | 01/01/2014                               |
      | Responsibility_EndDate                      | 12/31/2016                               |
      | Responsibility_ContractResponsibilityAmount | 10000                                    |
      | Responsibility_ServiceLevel                 | Unique                                   |
      | _checkbox_Responsibility_IncludedInRentFlag | true                                     |
      | Responsibility_Notes                        | Responsibilities Term Created through UI |

    And I set list fields values on editable page
      | name                                           | value                |
      | Responsibility_CodeResponsibilityGroupID       | Electrical           |
      | Responsibility_CodeResponsibilityTypeID        | Electrical           |
      | Responsibility_CodeAssetCategoryID             | Electrical           |
      | Responsibility_CodeMaintenanceResponsibilityID | Developer            |
      | Responsibility_CodeExecutionResponsibilityID   | Landlord             |
      | Responsibility_CodeFinancialResponsibilityID   | Landlord             |
      | Responsibility_ServicePersonID                 | Delete Access Access |
      | Responsibility_CodePassThroughTypeID           | Pass Through         |
      | Responsibility_CodeResponseTimeID              | 5 Days               |

    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully added Responsibility"
    #Page is freezing so adding page refresh
    And I click on the "<Third Level Tab>" tab
    Then I verify a row from grid "<Grid ID>" having unique value "Unique" under column header "Service Level"
      | name                  | value      |
      | Group                 | Electrical |
      | Type                  | Electrical |
      | Included In Rent Flag | Yes        |
      | Maintenance Category  | Electrical |
      | Repair                | Landlord   |
      | Service Level         | Unique     |
    And I logout

  Examples:
    | Second Level Tab | Third Level Tab  | Entity Name       | Grid ID |
    | Abstract Info    | Responsibilities | Selenium-Contract | thisDiv |

  Scenario Outline: To ensure that users edit a Contract Responsibility
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Responsibilities List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Unique" under column header "Service Level"
    And I set fields values on editable page
      | name                 | value                                    |
      | Responsibility_Notes | Responsibilities Term updated through UI |
    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully updated Responsibility"
    #Page is freezing so adding page refresh
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Unique" under column header "Service Level"
    Then I verify the following fields value on editable page
      | name                 | value                                    |
      | Responsibility_Notes | Responsibilities Term updated through UI |
    And I logout

  Examples:
    | Second Level Tab | Third Level Tab  | Entity Name       | Grid ID |
    | Abstract Info    | Responsibilities | Selenium-Contract | thisDiv |

  Scenario Outline: To ensure that users delete a Contract Responsibility
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Responsibilities List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Unique" under column header "Service Level"
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I verify success message "Successfully deleted Responsibility"
    #Page is freezing so adding page refresh
    And I click on the "<Third Level Tab>" tab
  #Then I verify "Successfully deleted Responsibilities" message appear in top left corner of page
    Then I verify row from grid "<Grid ID>" having unique value "Unique" not present
    And I logout

  Examples:
    | Second Level Tab | Third Level Tab  | Entity Name       | Grid ID |
    | Abstract Info    | Responsibilities | Selenium-Contract | thisDiv |