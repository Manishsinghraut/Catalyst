@all @smoke
Feature: I create,update and delete contract Insurance and verify them in Contract> Abstract Info> Insurance page (Jira Ref. AUTOMATION-506)

  Scenario Outline: I create contract Insurance through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I switch to default frame
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                        | value             |
      | Insurance_CodeInsuranceGroupID              | Main Policy       |
      | Insurance_CodeInsuranceTypeID               | Building          |
      | Insurance_CodeInsuranceCategoryID           | Full Coverage     |
      | Insurance_PolicyNumber                      | 1234567890        |
      | Insurance_BeginDate                         | 05/15/2015        |
      | Insurance_EndDate                           | 12/31/2016        |
      | Insurance_PolicyRequiredFlag                | true              |
      | Insurance_LandlordAlsoNamedInsuredFlag      | true              |
      | Insurance_AgentAlsoNamedInsuredFlag         | true              |
      | Insurance_SelfInsuredFlag                   | true              |
      | Insurance_CertificateRequestDate            | 05/15/2015        |
      | Insurance_CertificateReceivedDate           | 05/15/2016        |
      | Insurance_CoverageAmount                    | 100000            |
      | Insurance_SingleOccuranceAmount             | 300000            |
      | Insurance_CodeCurrencyTypeID                | USD               |
      | Insurance_Notes                             | Selenium key note |
      | Insurance_ContactID                         | Delete Access     |
      | Insurance_CovenantID                        | Lease:Payments    |
      | Insurance_Section                           | Selenium section  |
      | Insurance_AmendmentID                       | 1234              |
      | _checkbox_Insurance_CertificateRequiredFlag | true              |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    And I verify row from grid "<Grid ID>" having unique value "<Field>" under column header "End Date"
      | name                      | value         |
      | Insurance Group           | Main Policy   |
      | Insurance Type            | Building      |
      | Insurance Category        | Full Coverage |
      | Begin Date                | 05/15/2015    |
      | End Date                  | 12/31/2016    |
      | Certificate Required Flag | Yes           |
      | Request Date              | 05/15/2015    |
      | Received Date             | 05/15/2016    |
    And I logout

  Examples:
    | Field      | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
    | 12/31/2016 | Abstract Info    | Insurance       | Selenium-Contract | Contract Insurance List | thisDiv |

  Scenario Outline: I update contract Insurance through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "4" from grid "id" "<Grid ID>"
    And I set following fields value on editable page
      | name                            | value                     |
      | Insurance_SingleOccuranceAmount | 400000                    |
      | Insurance_Notes                 | Update Selenium Test Note |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I logout

  Examples:
    | Field      | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
    | 12/31/2016 | Abstract Info    | Insurance       | Selenium-Contract | Contract Insurance List | thisDiv |

  Scenario Outline: I Delete contract Insurance through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "4" from grid "id" "<Grid ID>"
    And I switch to default frame
    #And I click on the "Delete item" action panel button
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present
#    And I logout

  Examples:
    | Field      | Second Level Tab | Third Level Tab | Entity Name       | Grid title              | Grid ID |
    | 12/31/2016 | Abstract Info    | Insurance       | Selenium-Contract | Contract Insurance List | thisDiv |
