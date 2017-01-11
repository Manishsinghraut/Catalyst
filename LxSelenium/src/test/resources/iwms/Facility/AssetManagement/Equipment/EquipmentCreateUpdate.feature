@all @smoke @smoke3
Feature: (Jira Ref: AUTOMATION-402) I create and update Equipment and verify them in Facility > Asset Management > Equipment(FF&E)

  Scenario Outline: I create and update Equipment and verify them in Facility > Asset Management > Equipment(FF&E)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
    And I import following file name:
      | Create_Equipment.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment/Create_Equipment.xlsx"
    Then I compare attribute value on editable page by reading data from spread sheet row "6"
      | name                     | value                    |
      | Asset_AssetBarcodeNumber | Asset.AssetBarcodeNumber |
      | Asset_ClientNumber       | Asset.ClientNumber       |
      | Asset_Color              | Asset.Color              |
    And I logout

    Examples:
      | Item     | Second Level Tab | Third Level Tab  | Entity Name       |
      | Facility | Asset Management | Equipment (FF&E) | Lucernex-Facility |


  Scenario Outline: I update Equipment and verify them in Facility > Asset Management > Equipment(FF&E)
    Given I Login to IWMS using "EditAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment"
    And I import following file name:
      | Update_Equipment.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    #And I click on the "<Entity Name>" on the page button
#    And I click "<Entity Name>" button
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/AssetManagement/Equipment/Update_Equipment.xlsx"
    Then I compare attribute value on editable page by reading data from spread sheet row "6"
      | name                     | value                    |
      | Asset_AssetBarcodeNumber | Asset.AssetBarcodeNumber |
      | Asset_ClientNumber       | Asset.ClientNumber       |
      | Asset_Color              | Asset.Color              |
    And I logout

    Examples:
      | Item     | Second Level Tab | Third Level Tab  | Entity Name       |
      | Facility | Asset Management | Equipment (FF&E) | Lucernex-Facility |
