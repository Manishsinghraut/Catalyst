@all
Feature: (Jira Ref: AUTOMATION-413, AUTOMATION-1167)I create and update parts and verify them in  Admin -> Manage Parts and Inventory > Manage Parts > Edit Link for specific part page

  Background:
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not

  Scenario: I create parts and verify them in  Admin -> Manage Parts and Inventory > Manage Parts > Edit Link for specific part page
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/"
    And I import following files:
      | PartsNewSS-1167.xlsx |
    Then I navigate to the admin dashboard
    And I click on the "Manage Parts and Inventory" link
    And I click "edit" row action in the non frame grid "BOGridPart" having the following header and cell values
      | name      | value      |
      | Part Name | Calibrator |

    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/PartsNewSS-1167.xlsx"
    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
      | name                 | value                     |
      | PartName             | Part.PartName             |
      | Cost                 | Part.Cost                 |
      | QuantityOnHand       | Part.QuantityOnHand       |
      | QuantityOnOrder      | Part.QuantityOnOrder      |
      | ParLevel             | Part.ParLevel             |
      | OrderToLevel         | Part.OrderToLevel         |

      | ModelNumber          | Part.ModelNumber          |
      | VendorID             | Part.VendorID             |
      | Cost                 | Part.Cost                 |
      | Manufacturer         | Part.Manufacturer         |
      | WarrantyPeriodInDays | Part.WarrantyPeriodInDays |
    And I click on the "Cancel" button

    And I click "edit" row action in the non frame grid "BOGridPart" having the following header and cell values
      | name      | value  |
      | Part Name | Heater |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/PartsNewSS-1167.xlsx"
    Then I verify all fields values on editable page comparing with "7" th row of spreadsheet
      | name                 | value                     |
      | PartName             | Part.PartName             |
      | Cost                 | Part.Cost                 |
      | QuantityOnHand       | Part.QuantityOnHand       |
      | QuantityOnOrder      | Part.QuantityOnOrder      |
      | ParLevel             | Part.ParLevel             |
      | OrderToLevel         | Part.OrderToLevel         |
      | ModelNumber          | Part.ModelNumber          |
      | VendorID             | Part.VendorID             |
      | Cost                 | Part.Cost                 |
      | Manufacturer         | Part.Manufacturer         |
      | WarrantyPeriodInDays | Part.WarrantyPeriodInDays |
    And I click on the "Cancel" button
    And I extract LxID of the name "Heater" of type "Part" from rest API
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/PartsUpdateSS-1167.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

  Scenario: I update parts and verify them in  Admin -> Manage Parts and Inventory > Manage Parts > Edit Link for specific part page
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/"
    And I import following file name:
      | PartsUpdateSS-1167.xlsx |
    Then I navigate to the admin dashboard
    And I click on the "Manage Parts and Inventory" link
    And I click "edit" row action in the non frame grid "BOGridPart" having the following header and cell values
      | name      | value  |
      | Part Name | Heater |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/PartsUpdateSS-1167.xlsx"
    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
      | name                 | value                     |
      | PartName             | Part.PartName             |
      | Cost                 | Part.Cost                 |
      | QuantityOnOrder      | Part.QuantityOnOrder      |
      | OrderToLevel         | Part.OrderToLevel         |
      | ModelNumber          | Part.ModelNumber          |
      | Manufacturer         | Part.Manufacturer         |

    And I click on the "Cancel" button


#@all
#Feature: (Jira Ref: AUTOMATION-413)I create and update parts and verify them in  Admin -> Manage Parts and Inventory > Manage Parts > Edit Link for specific part page
#
#  Background:
##    Given I login to IWMS using LxAdmin credentials
#    Given I Login to IWMS using "LxSelenium" access credentials
#    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not
#
#
#  Scenario Outline: I create and update parts and verify them in  Admin -> Manage Parts and Inventory > Manage Parts > Edit Link for specific part page
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration"
#    And I import following file name:
#      | Create_PartsSS.xlsx |
#    Then I navigate to the admin dashboard
#    And I click on the "Manage Parts and Inventory" link
#    Given I click on the "edit" row action of column "<create complex name>" of column "1" from grid "id" "BOGridPart"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/Create_PartsSS.xlsx"
#    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
#      | name            | value                |
#      | PartName        | Part.PartName        |
#      | Cost            | Part.Cost            |
#      | QuantityOnHand  | Part.QuantityOnHand  |
#      | QuantityOnOrder | Part.QuantityOnOrder |
#      | ParLevel        | Part.ParLevel        |
#      | OrderToLevel    | Part.OrderToLevel    |
#    And I click on the "Cancel" button
#
#  Examples:
#    | create complex name |
#    | 3/4 inch Nails      |
#
#  Scenario Outline: I create and update parts and verify them in  Admin -> Manage Parts and Inventory > Manage Parts > Edit Link for specific part page
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration"
#    And I import following file name:
#      | Update_PartsSS.xlsx |
#    Then I navigate to the admin dashboard
#    And I click on the "Manage Parts and Inventory" link
#    Given I click on the "edit" row action of column "<update complex name>" of column "1" from grid "id" "BOGridPart"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/Update_PartsSS.xlsx"
#    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
#      | name            | value                |
#      | PartName        | Part.PartName        |
#      | Cost            | Part.Cost            |
#      | QuantityOnHand  | Part.QuantityOnHand  |
#      | QuantityOnOrder | Part.QuantityOnOrder |
#      | ParLevel        | Part.ParLevel        |
#      | OrderToLevel    | Part.OrderToLevel    |
#    And I click on the "Cancel" button
#
#  Examples:
#    | update complex name |
#    | 3/4 inch Nails      |
