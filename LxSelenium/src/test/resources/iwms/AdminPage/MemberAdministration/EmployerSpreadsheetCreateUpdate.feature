@all @smoke @smoke1
Feature: Employer Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1163)

  Scenario Outline: I Employer Spreadsheet - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | EmployerCreateSS-1163.xlsx |
    And I navigate to the admin dashboard
    And I click on the "Manage Employers" link
    And I click on "edit" row action in the grid "<grid>" having the following header "Name" and cell value "Employer-Testing-8486a"
      | name         | value                  |
      | Company Type | Vendor                 |
      | Name         | Employer-Testing-8486a |
      | Address      | 100                    |
      | City         | Plano                  |
      | State        | TX                     |
      | Vendor#      | 200012                 |

    And I verify the following fields value on editable page
      | name                                    | value                  |
      | CompanyType                             | Vendor                 |
      | CodeContactTypeIDList                   | Vendor                 |
      | CodeAssetCategoryIDList                 | Electrical             |
      | Employer_EmployerName                   | Employer-Testing-8486a |
      | Employer_StreetAddress1                 | 100                    |
      | Employer_StreetAddress2                 | WindCrest              |
      | Employer_City                           | Plano                  |
      | Employer_IStateProvinceCountryID        | TX                     |
      | Employer_PostalCode                     | 75024                  |
      | Employer_CountryID                      | United States          |
      | Employer_Phone                          | (469) 325-1236         |
      | Employer_Department                     | Building               |

      | Employer_CodeMasterEmployerGroupID      |                        |
      | Employer_Fax                            |                        |
      | Employer_MobileNumber                   |                        |

      | Employer_EMail1                         | imported@noemail.com   |
      | Employer_WebSite                        | importeda.com          |
      | Employer_Notes                          | This will be imported  |

      | Employer_APVendorNumber                 | 200012                 |
      | Employer_FederalTaxID                   | 10                     |
      | Employer_BankRoutingNumber              | 00003562               |
      | Employer_BankAccountNumber              | 0000231                |
      | Employer_HourlyRate                     |                        |
      | Employer_TravelRate                     | $45.00                 |
      | Employer_AfterHoursRate                 | $25.00                 |

      | Employer_CodeCoverageID                 | Regional               |
      | Employer_NumberOfStates                 | 22                     |
      | Employer_NumberOfTechnicians            | 109                    |
      | Employer_NumberOfServiceTrucks          | 55                     |
      | _checkbox_Employer_SelfPerform          | true                   |
      | _checkbox_Employer_HasAfterHoursSupport | false                  |

      | Employer_BusinessHours                  | 8am-10pm               |
      | Employer_AfterHoursContact              | Edit Access            |
      | Employer_CodeVendorGradeID              | Good                   |
      | _checkbox_Employer_IsPreferredVendor    | true                   |
      | _checkbox_Employer_IsMinorityOwned      | true                   |
      | _checkbox_Employer_IsFemaleOwned        | false                  |
      | _checkbox_Employer_IsGLBTOwned          | false                  |
      | _checkbox_Employer_IsSBAProgram         | true                   |

#    And I click "Cancel" button
    And I click on the "Cancel" button
    And I wait for modal window to close
    And I click on "edit" row action in the grid "<grid>" having the following header "Name" and cell value "Employer-Testing-8486b"
      | name         | value                  |
      | Company Type | Vendor                 |
      | Name         | Employer-Testing-8486b |
      | Address      | 173                    |
      | City         | El Paso                |
      | State        | TX                     |
      | Vendor#      | 200013                 |

    And I verify the following fields value on editable page
      | name                                    | value                  |
      | CompanyType                             | Vendor                 |
      | CodeContactTypeIDList                   | Landlord               |
      | CodeAssetCategoryIDList                 | Electrical             |
      | Employer_EmployerName                   | Employer-Testing-8486b |
      | Employer_StreetAddress1                 | 173                    |
      | Employer_StreetAddress2                 | Buena Visat ST         |
      | Employer_City                           | El Paso                |
      | Employer_IStateProvinceCountryID        | TX                     |
      | Employer_PostalCode                     | 79905                  |
      | Employer_CountryID                      | United States          |
      | Employer_Phone                          | 456-254-7895           |
      | Employer_Department                     | Building               |

      | Employer_CodeMasterEmployerGroupID      |                        |
      | Employer_Fax                            | 909009090              |
      | Employer_MobileNumber                   | 4561237896             |


      | Employer_EMail1                         |                        |
      | Employer_WebSite                        | importedb.com          |

      | Employer_NameAKA                        | Import Emp b           |

      | Employer_Notes                          | This will be imported  |

      | Employer_APVendorNumber                 | 200013                 |
      | Employer_FederalTaxID                   | 9                      |
      | Employer_BankRoutingNumber              | 00003212               |
      | Employer_BankAccountNumber              | 0000231                |
      | Employer_HourlyRate                     | $15.00                 |
      | Employer_TravelRate                     | $35.00                 |
      | Employer_AfterHoursRate                 | $35.00                 |

      | Employer_CodeCoverageID                 | Full                   |
      | Employer_NumberOfStates                 | 12                     |
      | Employer_NumberOfTechnicians            | 99                     |
      | Employer_NumberOfServiceTrucks          | 35                     |
      | _checkbox_Employer_SelfPerform          | true                   |
      | _checkbox_Employer_HasAfterHoursSupport | true                   |

      | Employer_BusinessHours                  | 8am-10pm               |
      | Employer_AfterHoursContact              |                        |

      | Employer_CodeVendorGradeID              | Excellent              |
      | _checkbox_Employer_IsPreferredVendor    | true                   |
      | _checkbox_Employer_IsMinorityOwned      | true                   |
      | _checkbox_Employer_IsFemaleOwned        | true                   |
      | _checkbox_Employer_IsGLBTOwned          | true                   |
      | _checkbox_Employer_IsSBAProgram         | true                   |

    And I click "Cancel" button
    And I logout

  Examples:
    | grid                   |
    | BOGridLX_Grid_Employer |

  Scenario Outline: I Employer Spreadsheet - Update
    Given I Login to IWMS using "EditAccess" access credentials
    And I extract LxID of the name "Employer-Testing-8486a" of type "Employer" from rest API
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/EmployerUpdateSS-1163.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "2"
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | EmployerUpdateSS-1163.xlsx |
    And I navigate to the admin dashboard

    And I click on the "Manage Employers" link
    And I click on "edit" row action in the grid "<grid>" having the following header "Name" and cell value "Employer-Testing-8486a"
      | name         | value                  |
      | Company Type | Vendor                 |
      | Name         | Employer-Testing-8486a |
      | Address      | 200                    |
      | City         | Plano                  |
      | State        | TX                     |
      | Vendor#      | 200012                 |

    And I verify the following fields value on editable page
      | name                                    | value                  |
      | CompanyType                             | Vendor                 |
      | CodeContactTypeIDList                   | Vendor                 |
      | CodeAssetCategoryIDList                 | Landlord               |
      | Employer_EmployerName                   | Employer-Testing-8486a |
      | Employer_StreetAddress1                 | 200                    |
      | Employer_StreetAddress2                 | WindCrest              |
      | Employer_City                           | Plano                  |
      | Employer_IStateProvinceCountryID        | TX                     |
      | Employer_PostalCode                     | 75025                  |
      | Employer_CountryID                      | United States          |
      | Employer_Phone                          | (469) 325-1299         |
      | Employer_Department                     | Building               |

      | Employer_CodeMasterEmployerGroupID      |                        |
      | Employer_Fax                            | 125.124.1254           |
      | Employer_MobileNumber                   |                        |

      | Employer_EMail1                         | imported@noemail.com   |
      | Employer_WebSite                        | importeda.com          |
      | Employer_NameAKA                        | Employer New           |
      | Employer_Notes                          | This will be imported  |

      | Employer_APVendorNumber                 | 200012                 |
      | Employer_FederalTaxID                   | 15                     |
      | Employer_BankRoutingNumber              | 00003562               |
      | Employer_BankAccountNumber              | 0000231                |
      | Employer_HourlyRate                     | $50.00                 |
      | Employer_TravelRate                     | $45.00                 |
      | Employer_AfterHoursRate                 | $30.00                 |

      | Employer_CodeCoverageID                 | Regional               |
      | Employer_NumberOfStates                 | 22                     |
      | Employer_NumberOfTechnicians            | 109                    |
      | Employer_NumberOfServiceTrucks          | 100                    |
      | _checkbox_Employer_SelfPerform          | true                   |
      | _checkbox_Employer_HasAfterHoursSupport | false                  |

      | Employer_BusinessHours                  | 8am-11pm               |
      | Employer_AfterHoursContact              | Edit Access            |
      | Employer_CodeVendorGradeID              | Good                   |
      | _checkbox_Employer_IsPreferredVendor    | true                   |
      | _checkbox_Employer_IsMinorityOwned      | true                   |
      | _checkbox_Employer_IsFemaleOwned        | false                  |
      | _checkbox_Employer_IsGLBTOwned          | true                   |
      | _checkbox_Employer_IsSBAProgram         | true                   |

    And I click on the "Cancel" button
    And I wait for modal window to close
    And I logout

  Examples:
    | grid                   |
    | BOGridLX_Grid_Employer |

#@all @smoke @smoke1
#Feature: (Jira Ref : AUTOMATION-408) I create and update employer and verify them in Admin Dashboard > Manage Employers page
#
#  Background:
##    Given I login to IWMS using LxAdmin credentials
#    Given I Login to IWMS using "LxSelenium" access credentials
#    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not
#
#  Scenario Outline: I create employer and verify them in Admin Dashboard > Manage Employers page
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration"
#    And I import following file name:
#      | Create_Employer.xlsx |
#    Then I navigate to the admin dashboard
#    And I click on the "Manage Employers" link
#    Given I click on the "edit" row action of column "<create complex name>" of column "1" from grid "id" "BOGridLX_Grid_Employer"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Create_Employer.xlsx"
#    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
#      | name                       | value                      |
#      | Employer_StreetAddress1    | Employer.StreetAddress1    |
#      | Employer_Phone             | Employer.Phone             |
#      | Employer_BankRoutingNumber | Employer.BankRoutingNumber |
#      | Employer_BankAccountNumber | Employer.BankAccountNumber |
#    And I click on the "Cancel" button
#  Examples:
#    | create complex name    |
#    | Imported Employer Inc. |
#
#  Scenario Outline: I update employer and verify them in Admin Dashboard > Manage Employers page
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration"
#    And I import following file name:
#      | Update_Employer.xlsx |
#    Then I navigate to the admin dashboard
#    And I click on the "Manage Employers" link
#    Given I click on the "edit" row action of column "<update complex name>" of column "1" from grid "id" "BOGridLX_Grid_Employer"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Update_Employer.xlsx"
#    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
#      | name                       | value                      |
#      | Employer_StreetAddress1    | Employer.StreetAddress1    |
#      | Employer_Phone             | Employer.Phone             |
#      | Employer_BankRoutingNumber | Employer.BankRoutingNumber |
#      | Employer_BankAccountNumber | Employer.BankAccountNumber |
#    And I click on the "Cancel" button
#
#  Examples:
#    | update complex name    |
#    | Imported Employer Inc. |

