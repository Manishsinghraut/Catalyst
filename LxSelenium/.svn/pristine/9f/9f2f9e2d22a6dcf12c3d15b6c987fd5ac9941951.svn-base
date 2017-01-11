@all @smoke @smoke4Dot1
Feature: Equipment Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1160)

  Scenario Outline: I import the Facility entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
    And I import following file name:
      | VendorBImport-1160.xml             |
      | VendorA-1160.xlsx                  |
      | FacilityEquipment-1160.xml         |
      | EquipmentAssetRecIdReport-1160.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I create Equipments
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
    And I import following file name:
      | CreateEquipment-1160.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Assets & Equipment" from Page dropdown
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Equipment One" under column header "Name"
      | name                 | value                 |
      | Asset Group          | HVAC                  |
      | Asset Type           | Air Conditioning Unit |
      | Name                 | Equipment One         |
      | Maintenance Category | Electrical            |
      | Repair               | Landlord              |
      | Maintain             | Developer             |
      | Replace              |                       |
      | Operational Status   | Operating             |
    And I verify the following fields value on editable page
      | Name                                 | value                 |
      | Asset_CodeAssetCategoryID            | Electrical            |
      | Asset_CodeAssetGroupID               | HVAC                  |
      | Asset_CodeAssetTypeID                | Air Conditioning Unit |
      | Asset_AssetName                      | Equipment One         |
      | Asset_CodeAssetOperationStatusID     | Operating             |
      | Asset_AssetSerialNumber              | 23456                 |
      | Asset_ClientNumber                   | 5656                  |
      | Asset_AssetBarcodeNumber             | awe1234               |
      | Asset_CodeAssetDepartmentID          | Electrical Department |
      | Asset_Floor                          | 3                     |
      | Asset_LocationDetails                |                       |
      | Asset_ResponsibilityID               | [SELECT]              |
      | Asset_CodeMaintenancePartyID         | Developer             |
      | Asset_MaintenanceResponsiblePersonID | [SELECT]              |
      | Asset_CodeMaintenanceRemedyID        | Fixed                 |
      | Asset_MaintenanceMaximumRemedyDays   | 3.00                  |
      | Asset_CodeRepairPartyID              | Landlord              |
      | Asset_RepairResponsiblePersonID      | [SELECT]              |
      | Asset_CodeRepairRemedyID             | [SELECT]              |

      | Asset_CodeReplacementPartyID         | [SELECT]              |
      | Asset_ReplacementResponsiblePersonID | [SELECT]              |
      | Asset_CodeReplacementRemedyID        | Fixed                 |
      | Asset_ReplacementMaximumRemedyDays   | 2.00                  |

      | Asset_PrimaryVendorID                | [SELECT]              |
      | Asset_SecondaryVendorID              | [SELECT]              |
      | Asset_AlternateVendorID              | Vendor A              |
      | Asset_CodeAssetProductTypeID         | [SELECT]              |
      | Asset_Make                           | New                   |
      | Asset_ManufacturerVendorID           | Vendor A              |
      | Asset_ModelNumber                    | 333                   |
      | Asset_Height                         |                       |
      | Asset_CodeDimensionUnitID            | [SELECT]              |
      | Asset_Color                          | RED                   |
      | Asset_Weight                         | 20.00                 |
      | Asset_CodeWeightUnitID               | [SELECT]              |
      | Asset_PMPeriod                       | 5                     |
      | Asset_CodePMFrequencyUnitID          | Months                |
      | Asset_LOAMonths                      | 10                    |
      | Asset_ExpectedLife                   |                       |
      | Asset_SupplierVendorID               | [SELECT]              |
      | Asset_PurchaseOrderNumber            | Decription one        |
      | Asset_PurchaseOrderReference         |                       |
      | Asset_PurchaseDate                   | 01/01/2015            |
      | Asset_PurchasePrice                  | $250.00               |
      | Asset_ReplacementCost                | $9,999.00             |
      | Asset_PurchaseOrderDescrption        |                       |
      | Asset_InstallerVendorID              | [SELECT]              |
      | Asset_InstallationDate               | 12/31/2015            |
      | Asset_InServiceDate                  |                       |
      | Asset_WarrantyVendorID               | Selenium-Employer     |
      | Asset_WarrantyBeginDate              | 01/01/2015            |
      | Asset_WarrantyEndDate                | 12/31/2020            |
      | Asset_WarrantyComments               | Warranty c1           |
      | Asset_WarrantyNumber                 | 98765                 |
      | Asset_Description                    |                       |

    And I verify a row from grid "<grid>" having unique value "Equipment Two" under column header "Name"
      | name                 | value                 |
      | Asset Group          | HVAC                  |
      | Asset Type           | Air Conditioning Unit |
      | Name                 | Equipment Two         |
      | Maintenance Category | Landscaping           |
      | Repair               | Landlord              |
      | Maintain             | Landlord              |
      | Replace              |                       |
      | Operational Status   | Operating             |

    And I verify the following fields value on editable page
      | Name                                 | value                 |
      | Asset_CodeAssetCategoryID            | Landscaping           |
      | Asset_CodeAssetGroupID               | HVAC                  |
      | Asset_CodeAssetTypeID                | Air Conditioning Unit |
      | Asset_AssetName                      | Equipment Two         |
      | Asset_CodeAssetOperationStatusID     | Operating             |
      | Asset_AssetSerialNumber              | 12345                 |
      | Asset_ClientNumber                   | 7676                  |
      | Asset_AssetBarcodeNumber             | fer456                |
      | Asset_CodeAssetDepartmentID          | Electrical Department |
      | Asset_Floor                          | 4                     |
      | Asset_LocationDetails                |                       |
      | Asset_ResponsibilityID               | [SELECT]              |

      | Asset_CodeMaintenancePartyID         | Landlord              |
      | Asset_MaintenanceResponsiblePersonID | [SELECT]              |
      | Asset_CodeMaintenanceRemedyID        | Fixed                 |
      | Asset_MaintenanceMaximumRemedyDays   | 4.00                  |

      | Asset_CodeRepairPartyID              | Landlord              |
      | Asset_RepairResponsiblePersonID      | [SELECT]              |
      | Asset_CodeRepairRemedyID             | [SELECT]              |
      | Asset_RepairMaximumRemedyDays        |                       |

      | Asset_CodeReplacementPartyID         | [SELECT]              |
      | Asset_ReplacementResponsiblePersonID | [SELECT]              |
      | Asset_CodeReplacementRemedyID        | Fixed                 |
      | Asset_ReplacementMaximumRemedyDays   | 3.00                  |

      | Asset_PrimaryVendorID                | [SELECT]              |
      | Asset_SecondaryVendorID              | [SELECT]              |
      | Asset_AlternateVendorID              | Selenium-Employer     |

      | Asset_CodeAssetProductTypeID         | [SELECT]              |
      | Asset_Make                           | Old                   |
      | Asset_ManufacturerVendorID           | Vendor A              |
      | Asset_ModelNumber                    | 444                   |
      | Asset_Height                         |                       |
      | Asset_CodeDimensionUnitID            | [SELECT]              |
      | Asset_Color                          | CBLUE                 |
      | Asset_Weight                         | 15.00                 |
      | Asset_CodeWeightUnitID               | [SELECT]              |
      | Asset_PMPeriod                       | 6                     |
      | Asset_CodePMFrequencyUnitID          | Hours                 |
      | Asset_LOAMonths                      | 12                    |
      | Asset_ExpectedLife                   |                       |
      | Asset_SupplierVendorID               | [SELECT]              |
      | Asset_PurchaseOrderNumber            | Decription two        |
      | Asset_PurchaseOrderReference         |                       |
      | Asset_PurchaseDate                   | 01/01/2016            |
      | Asset_PurchasePrice                  | $350.00               |
      | Asset_ReplacementCost                | $8,888.00             |
      | Asset_PurchaseOrderDescrption        |                       |
      | Asset_InstallerVendorID              | [SELECT]              |
      | Asset_InstallationDate               | 12/31/2016            |
      | Asset_InServiceDate                  |                       |
      | Asset_WarrantyVendorID               | Vendor A              |
      | Asset_WarrantyBeginDate              | 12/01/2015            |
      | Asset_WarrantyEndDate                | 12/31/2021            |
      | Asset_WarrantyComments               | Warranty c2           |
      | Asset_WarrantyNumber                 | 56789                 |
      | Asset_Description                    |                       |
    And I switch to default frame
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value                  |
      | Report Name | Equipment Asset Rec ID |
    And I switch to "build layout" child window
    And I verify Name "Facility Equipment", Maintenance Category "Landscaping" and extract Asset RecID on report window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment/UpdateEquipment-1160.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I switch to main window
    And I close report window
    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
    And I import following file name:
      | UpdateEquipment-1160.xlsx |


    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Assets & Equipment" from Page dropdown
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Equipment Two Updated" under column header "Name"
      | name                 | value                 |
      | Asset Group          | HVAC                  |
      | Asset Type           | Air Conditioning Unit |
      | Name                 | Equipment Two Updated |
      | Maintenance Category | Landscaping           |
      | Repair               | Landlord              |
      | Maintain             | Developer             |
      | Replace              |                       |
      | Operational Status   | Operating             |

    And I verify the following fields value on editable page
      | Name                                 | value                  |
      | Asset_CodeAssetCategoryID            | Landscaping            |
      | Asset_CodeAssetGroupID               | HVAC                   |
      | Asset_CodeAssetTypeID                | Air Conditioning Unit  |
      | Asset_AssetName                      | Equipment Two Updated  |
      | Asset_CodeAssetOperationStatusID     | Operating              |
      | Asset_AssetSerialNumber              | 54321                  |
      | Asset_ClientNumber                   | 7676                   |
      | Asset_AssetBarcodeNumber             | fer45689               |
      | Asset_CodeAssetDepartmentID          | Electrical Department  |
      | Asset_Floor                          | 7                      |
      | Asset_LocationDetails                |                        |
      | Asset_ResponsibilityID               | [SELECT]               |

      | Asset_CodeMaintenancePartyID         | Developer              |
      | Asset_MaintenanceResponsiblePersonID | [SELECT]               |
      | Asset_CodeMaintenanceRemedyID        | Fixed                  |
      | Asset_MaintenanceMaximumRemedyDays   | 4.00                   |

      | Asset_CodeRepairPartyID              | Landlord               |
      | Asset_RepairResponsiblePersonID      | [SELECT]               |
      | Asset_CodeRepairRemedyID             | [SELECT]               |
      | Asset_RepairMaximumRemedyDays        |                        |

      | Asset_CodeReplacementPartyID         | [SELECT]               |
      | Asset_ReplacementResponsiblePersonID | [SELECT]               |
      | Asset_CodeReplacementRemedyID        | Fixed                  |
      | Asset_ReplacementMaximumRemedyDays   | 5.00                   |

      | Asset_PrimaryVendorID                | [SELECT]               |
      | Asset_SecondaryVendorID              | [SELECT]               |
      | Asset_AlternateVendorID              | Selenium-Employer      |

      | Asset_CodeAssetProductTypeID         | [SELECT]               |
      | Asset_Make                           | New                    |
      | Asset_ManufacturerVendorID           | Vendor B               |
      | Asset_ModelNumber                    | 444                    |
      | Asset_Height                         |                        |
      | Asset_CodeDimensionUnitID            | [SELECT]               |
      | Asset_Color                          | Yellow                 |
      | Asset_Weight                         | 20.00                  |
      | Asset_CodeWeightUnitID               | [SELECT]               |
      | Asset_PMPeriod                       | 6                      |
      | Asset_CodePMFrequencyUnitID          | Hours                  |
      | Asset_LOAMonths                      | 12                     |
      | Asset_ExpectedLife                   |                        |
      | Asset_SupplierVendorID               | [SELECT]               |
      | Asset_PurchaseOrderNumber            | Decription two Updated |
      | Asset_PurchaseOrderReference         |                        |
      | Asset_PurchaseDate                   | 01/01/2016             |
      | Asset_PurchasePrice                  | $350.00                |
      | Asset_ReplacementCost                | $8,888.00              |
      | Asset_PurchaseOrderDescrption        |                        |
      | Asset_InstallerVendorID              | [SELECT]               |
      | Asset_InstallationDate               | 12/31/2017             |
      | Asset_InServiceDate                  |                        |
      | Asset_WarrantyVendorID               | Vendor B               |
      | Asset_WarrantyBeginDate              | 12/01/2015             |
      | Asset_WarrantyEndDate                | 12/31/2021             |
      | Asset_WarrantyComments               | Warranty c2            |
      | Asset_WarrantyNumber                 | 56789                  |
      | Asset_Description                    |                        |

    Examples:
      | Entity Name        | Secondary Tab    | Third Level Tab  | grid    | Reports Grid ID |
      | Facility Equipment | Asset Management | Equipment (FF&E) | thisDiv | ^editBOGrid     |


#@all @smoke @smoke3
#Feature: (Jira Ref: AUTOMATION-402) I create and update Equipment and verify them in Facility > Asset Management > Equipment(FF&E)
#
#  Scenario Outline: I create and update Equipment and verify them in Facility > Asset Management > Equipment(FF&E)
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
#    And I import following file name:
#      | Create_Equipment.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment/Create_Equipment.xlsx"
#    Then I compare attribute value on editable page by reading data from spread sheet row "6"
#      | name                     | value                    |
#      | Asset_AssetBarcodeNumber | Asset.AssetBarcodeNumber |
#      | Asset_ClientNumber       | Asset.ClientNumber       |
#      | Asset_Color              | Asset.Color              |
#    And I logout
#
#  Examples:
#    | Item     | Second Level Tab | Third Level Tab  | Entity Name       |
#    | Facility | Asset Management | Equipment (FF&E) | Lucernex-Facility |
#
#
#  Scenario Outline: I update Equipment and verify them in Facility > Asset Management > Equipment(FF&E)
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
#    And I import following file name:
#      | Update_Equipment.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    When I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    #And I click on the "<Entity Name>" on the page button
##    And I click "<Entity Name>" button
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment/Update_Equipment.xlsx"
#    Then I compare attribute value on editable page by reading data from spread sheet row "6"
#      | name                     | value                    |
#      | Asset_AssetBarcodeNumber | Asset.AssetBarcodeNumber |
#      | Asset_ClientNumber       | Asset.ClientNumber       |
#      | Asset_Color              | Asset.Color              |
#    And I logout
#
#  Examples:
#    | Item     | Second Level Tab | Third Level Tab  | Entity Name       |
#    | Facility | Asset Management | Equipment (FF&E) | Lucernex-Facility |


