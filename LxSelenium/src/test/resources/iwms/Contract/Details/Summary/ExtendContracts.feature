@all
Feature:(Ref : Jira Ticket No : AUTOMATION-862) Extending a Contract

  Scenario Outline: I create contracts by importing following files

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    Then I import following file name:
      | PortfoliSummaryPage.xml |
      | ImportedLocation.xml    |
      | ExtendingContract.xml   |
      | NewContract.xml         |
    Then I navigate to entity type "<Item>" named "<contractNameA>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Month to Month?   | Yes        |
      | Payments End Date | 12/31/2018 |

    Then I navigate to entity type "<Item>" named "<contractNameB>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Month to Month?   | Yes        |
      | Payments End Date | 12/31/2018 |

    Examples:
      | Login User   | Login full username  | Item     | contractNameA       | contractNameB |
      | DeleteAccess | Delete Access Access | Contract | Extending ContractA | New Contract  |


  Scenario Outline: I extend the contracts and verify the Payment End date

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to entity type "<Item>" named "<contractNameA>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    When I click on the "Extend Contracts" action panel button
    And I set following fields value on editable page
      | name           | value            |
      | expirationDate | <expirationDate> |
      | dateToExtend   | <datetoextend>   |

    And I click on the "<Apply>" row action of column "<contractNameA>" of column "0" from grid "entitySelect"
    And I click on the "<Apply>" row action of column "<contractNameB>" of column "0" from grid "entitySelect"

    # Feature improvement  IWMS-20632
    And I click on "Extend Leases" Button

#    And I click on "Extend Month to Month Leases" Button
    Then I verify success message appear in top left corner of page
      | Finished processing                                                                    |
      | Total Entities Modified: 2                                                             |
      | Details:                                                                               |
      | Extending Dates for '<contractNameA>' contract from <expirationDate> to <datetoextend> |
      | Updated Payment End Date for '<contractNameA>' (Extending ContractA) contract          |
      | Extending Dates for '<contractNameB>' contract from <expirationDate> to <datetoextend> |


    And I click on "Done" Button

    Then I navigate to entity type "<Item>" named "<contractNameA>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Payments End Date | 12/31/2020 |

    Then I navigate to entity type "<Item>" named "<contractNameB>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Payments End Date | 12/31/2020 |


    Examples:
      | Apply   | Login User   | Login full username  | Item     | contractNameA       | contractNameB | expirationDate | datetoextend |
      | <Apply> | DeleteAccess | Delete Access Access | Contract | Extending ContractA | New Contract  | 12/31/2018     | 12/31/2020   |