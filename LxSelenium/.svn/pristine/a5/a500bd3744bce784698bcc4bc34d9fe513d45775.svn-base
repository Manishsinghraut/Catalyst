Feature: List Layout on Location and Facility Summary page to display all associated contracts (Jira ticket ref.:AUTOMATION-982)

  Scenario Outline: Import the contract entities
    Given I Login to IWMS using "<Delete Access>" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | MasterFacility.xml        |
      | MasterContract.xml        |
      | RelatedContractA.xml      |
      | RelatedContractB.xml      |
      | RelatedContractReport.xml |

  Examples:
    | Delete Access |
    | DeleteAccess  |

  Scenario Outline: Master Contract shall display all the related contracts
#    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab

    And I verify row from grid "<Grid ID>" having unique value "Related Contract A" under column header "Name"
      | name            | value              |
      | Name            | Related Contract A |
      | Contract Number | 767689             |
      | Group           |                    |
      | Contract Type   |                    |
      | Category        |                    |
      | Expire Date     | 12/31/2020         |
      | Use             |                    |
      | Options         |                    |
      | Contract Status |                    |

    And I verify row from grid "<Grid ID>" having unique value "Related Contract B" under column header "Name"
      | name            | value              |
      | Name            | Related Contract B |
      | Contract Number | 45435435           |
      | Group           |                    |
      | Contract Type   |                    |
      | Category        |                    |
      | Expire Date     | 12/31/2020         |
      | Use             |                    |
      | Options         |                    |
      | Contract Status |                    |

  Examples:
    | Entity Name     | Grid ID        | Second Level Tab | Third Level Tab |
    | Master Contract | BOGridContract | Details          | Summary         |

  Scenario Outline: Related Contract A shall display master contract
#    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify row from grid "<Grid ID>" having unique value "Master Contract" under column header "Name"
      | name            | value           |
      | Name            | Master Contract |
      | Contract Number | 221321          |
      | Group           |                 |
      | Contract Type   |                 |
      | Category        |                 |
      | Expire Date     | 12/31/2020      |
      | Use             |                 |
      | Options         |                 |
      | Contract Status |                 |

  Examples:
    | Entity Name        | Grid ID        | Second Level Tab | Third Level Tab |
    | Related Contract A | BOGridContract | Details          | Summary         |

  Scenario Outline: Related Contract B shall display master contract
#    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify row from grid "<Grid ID>" having unique value "Master Contract" under column header "Name"
      | name            | value           |
      | Name            | Master Contract |
      | Contract Number | 221321          |
      | Group           |                 |
      | Contract Type   |                 |
      | Category        |                 |
      | Expire Date     | 12/31/2020      |
      | Use             |                 |
      | Options         |                 |
      | Contract Status |                 |

  Examples:
    | Entity Name        | Grid ID        | Second Level Tab | Third Level Tab |
    | Related Contract B | BOGridContract | Details          | Summary         |


  Scenario Outline: Contracts to be displayed on Facility Summary page
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the field "Center Name" is "Stonebriar"
    And I verify the field "Cross Street 1" is "Alameda"
    And I verify the field "Street Address" is "5601 Democracy Dr"
    And I verify the field "City" is "Plano"
    And I verify the field "Zip / Postal Cd" is "75024"
    And I verify row from grid "<Grid ID>" having unique value "Master Contract" under column header "Name"
      | name            | value           |
      | Name            | Master Contract |
      | Contract Number | 221321          |
      | Group           |                 |
      | Contract Type   |                 |
      | Category        |                 |
      | Expire Date     | 12/31/2020      |
      | Use             |                 |
      | Options         |                 |
      | Contract Status |                 |

    And I verify row from grid "<Grid ID>" having unique value "Related Contract A" under column header "Name"
      | name            | value              |
      | Name            | Related Contract A |
      | Contract Number | 767689             |
      | Group           |                    |
      | Contract Type   |                    |
      | Category        |                    |
      | Expire Date     | 12/31/2020         |
      | Use             |                    |
      | Options         |                    |
      | Contract Status |                    |

    And I verify row from grid "<Grid ID>" having unique value "Related Contract B" under column header "Name"
      | name            | value              |
      | Name            | Related Contract B |
      | Contract Number | 45435435           |
      | Group           |                    |
      | Contract Type   |                    |
      | Category        |                    |
      | Expire Date     | 12/31/2020         |
      | Use             |                    |
      | Options         |                    |
      | Contract Status |                    |
    And I switch to default frame

  Examples:
    | Entity Name     | Grid ID        | Second Level Tab | Third Level Tab |
    | Master Facility | BOGridContract | Details          | Summary         |


  Scenario Outline:Contracts to be displayed on Location Summary page
    Given I Login to IWMS using "DeleteAccess" access credentials
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
    When I navigate to entity type "Location" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row from grid "<Grid ID>" having unique value "Master Contract" under column header "Name"
      | name            | value           |
      | Name            | Master Contract |
      | Contract Number | 221321          |
      | Group           |                 |
      | Contract Type   |                 |
      | Category        |                 |
      | Expire Date     | 12/31/2020      |
      | Use             |                 |
      | Options         |                 |
      | Contract Status |                 |
    And I switch to default frame
    And I switch to visible frame
    And I verify row from grid "<Grid ID>" having unique value "Related Contract A" under column header "Name"
      | name            | value              |
      | Name            | Related Contract A |
      | Contract Number | 767689             |
      | Group           |                    |
      | Contract Type   |                    |
      | Category        |                    |
      | Expire Date     | 12/31/2020         |
      | Use             |                    |
      | Options         |                    |
      | Contract Status |                    |

    And I verify row from grid "<Grid ID>" having unique value "Related Contract B" under column header "Name"
      | name            | value              |
      | Name            | Related Contract B |
      | Contract Number | 45435435           |
      | Group           |                    |
      | Contract Type   |                    |
      | Category        |                    |
      | Expire Date     | 12/31/2020         |
      | Use             |                    |
      | Options         |                    |
      | Contract Status |                    |
    And I switch to default frame

  Examples:
    | Entity Name      | Grid ID        | Second Level Tab | Third Level Tab |
    | Lucernex-Project | BOGridContract | Details          | Summary         |


  Scenario Outline: Pass through payments Pop up shall list all related contracts
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I click on the "Pass-through Payments" action panel button
    Then I see the "Create Pass-through Payments" modal window
    And I verify Pop-up window grid row "<Grid ID>" having unique value "Related Contract A" under column header "Contract Name"
      | name                | value              |
      | Contract Name       | Related Contract A |
      | Contract Number     | 767689             |
      | Contract Group      |                    |
      | Contract Category   |                    |
      | Expire Date         | 12/31/2020         |
      | Pro Rata Share Rate |                    |
      | Contract Status     |                    |
    And I verify Pop-up window grid row "<Grid ID>" having unique value "Related Contract B" under column header "Contract Name"
      | name                | value              |
      | Contract Name       | Related Contract B |
      | Contract Number     | 45435435           |
      | Contract Group      |                    |
      | Contract Category   |                    |
      | Expire Date         | 12/31/2020         |
      | Pro Rata Share Rate |                    |
      | Contract Status     |                    |
    And I click on the "Close" button

  Examples:
    | Entity Name     | Grid ID                        | Second Level Tab | Third Level Tab |
    | Master Contract | GeneratePassThroughPaymentsDiv | Payment Info     | Transactions    |


  Scenario Outline: Run Report should display all contracts related to the specific location or facility
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                 |
      | Report Name | Related Contracts all |
    And I switch to "report" child window
    And I click edit next to "Step 4 - Field List and Details"

    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name                 | value    |
      | Field Name On Report | Facility |
    And I select "Master Facility" from "Facility" available fields
    And I click on " >> " button to move field
    And I click on the "Update" button

    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name                 | value    |
      | Field Name On Report | Location |
    And I select "Lucernex-Project" from "Location" available fields
    And I click on " >> " button to move field
    And I click on the "Update" button
    And I click on Finish button
    And I Save and Run Report successfully
    And I verify report shall display all the contracts related to the specific location and facility successfully
      | Location         | ContractName       | Facility        |
      | Lucernex-Project | Master Contract    | Master Facility |
      | Lucernex-Project | Related Contract A | Master Facility |
      | Lucernex-Project | Related Contract B | Master Facility |

    And I close the "Report" child window
    And I switch to default frame

  Examples:
    | Grid ID               |
    | BOGridCustomObjectDel |
