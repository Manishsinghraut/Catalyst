Feature: Create a new enterprise firm
  An Lx Admin (and only an Lx Admin) should be able to create a new enterprise firm, as long as all required fields
  are filled in, and there is not already a firm with the same firm login name.

  Scenario: An Lx Admin tries to create a brand new, and unique, firm with only the required fields.
    Given I login to IWMS using LxAdmin credentials into the "webdriver" firm
    And I navigate to the Lx Admin Page
    And I click on the "Create New Company" Lx Admin Page button
    And I navigate to "Create Enterprise Company"
    And I see that I am on the third level tab "Create Enterprise Company"
#    And I see it has these required fields in the Create Enterprise Company form:
#      | Firm Name                                  |
#      | Phone                                      |
#      | Fiscal Year End                            |
#      | Login Firm Name                            |
#      | Address                                    |
#      | City                                       |
#      | Country                                    |
#      | State                                      |
#      | PostalCode                                 |
#      | Default Folder Security                    |
#      | Work Weekends? (default for new schedules) |
#      | Recent News                                |
#      | From Email                                 |
#      | Lx ID Name                                 |
#      | Product Type                               |
#      | Is Test Firm?                              |
#      | Lock Out Users?                            |
#      | Allow Documents?                           |
#      | Allow Data Integration?                    |
#      | Is Audit Enabled?                          |
#      | Allow Portfolio?                           |
#      | Allow Capital Programs?                    |
#      | Allow Sites?                               |
#      | Allow Opening Projects?                    |
#      | Allow Capital Projects?                    |
#      | Allow Prototypes?                          |
#      | Allow Facilities?                          |
#      | Allow Locations?                           |
#      | Allow Parcels?                             |
#      | Allow Contracts?                           |
#      | Color Scheme                               |
#    Then I enter these field values into the Create Enterprise Company form
#      | name                                       | value                    |
#      | Firm Name                                  | Selenium                 |
#      | Phone                                      | 9721234568               |
#      | Login Firm Name                            | selenium                 |
#      | Address                                    | 19002 Dallas Pkwy        |
#      | City                                       | Dallas                   |
#      | Country                                    | United States            |
#      | State                                      | TX                       |
#      | PostalCode                                 | 75287                    |
#      | Work Weekends? (default for new schedules) | No                       |
#      | Default Folder Security                    | None                     |
#      | Recent News                                | Recent news for Selenium |
#      | From Email                                 | QA1@lucernex.com         |
#      | Lx ID Name                                 | Lx WebDriver             |
#      | Product Type                               | Enterprise               |
#      | Is Test Firm?                              | Yes                      |
#      | Lx Abstractor Support? (Only IT Enables)   | No                       |
#      | Lock Out Users?                            | No                       |
#      | Allow Documents?                           | Yes                      |
#      | Allow Data Integration?                    | Yes                      |
#      | Is Audit Enabled?                          | Yes                      |
#      | Allow Portfolio?                           | Yes                      |
#      | Allow Capital Programs?                    | Yes                      |
#      | Allow Sites?                               | Yes                      |
#      | Allow Opening Projects?                    | Yes                      |
#      | Allow Capital Projects?                    | Yes                      |
#      | Allow Prototypes?                          | Yes                      |
#      | Allow Facilities?                          | Yes                      |
#      | Allow Locations?                           | Yes                      |
#      | Allow Parcels?                             | Yes                      |
#      | Allow Contracts?                           | Yes                      |
#      | Color Scheme                               | Grey                     |
    Then I enter these field values into the Create Enterprise Company form
      | name                            | value                    |
      | FirmName                        | Selenium                 |
      | Phone                           | 9721234568               |
      | LoginFirmName                   | selenium                 |
      | StreetAddress1                  | 19002 Dallas Pkwy        |
      | City                            | Dallas                   |
      | CountryID                       | United States            |
      | IStateProvinceCountryID         | TX                       |
      | PostalCode                      | 75287                    |
      | DefaultWorkWeekends             | false                    |
      | CodeDefaultFolderSecurityID     | None                     |
      | RecentNews                      | Recent news for Selenium |
      | FromEMailAddress                | QA1@lucernex.com         |
      | LxIDName                        | Lx WebDriver             |
      | CodeProductTypeID               | Enterprise               |
      | IsTestFirm                      | true                     |
      | json_KimvioIntegration          | false                    |
      | LockOutUsers                    | false                    |
      | AllowDocumentFunctionality      | true                     |
      | AllowDataIntegration            | true                     |
      | IsAuditEnabled                  | true                     |
      | AllowPortfolioFunctionality     | true                     |
      | AllowCapProgramFunctionality    | true                     |
      | AllowSiteFunctionality          | true                     |
      | AllowOpenProjectFunctionality   | true                     |
      | AllowCapProjectFunctionality    | true                     |
      | AllowPrototypeFunctionality     | true                     |
      | AllowFacilityFunctionality      | true                     |
      | AllowLocationFunctionality      | true                     |
      | AllowParcelFunctionality        | true                     |
      | AllowContractFunctionality      | true                     |
      | AllowAdvancedReports            | true                     |
      | json_ColorScheme                | Grey                     |
      | AllowAssetContractFunctionality | true                     |

    And I click the "Add" button in the setup firm wizard
    And I click the "Start Processing" button in the setup firm wizard
    And I click the "Reset" button in the setup firm wizard
    And I see that I am in the right firm
    And I used data files from "Data/ImportDataFiles/"
    And I import following file name:
#      | 38 QASecurity.xml |
      | QASecurityNew.xml |
    And I used data files from "Data/ImportDataFiles/xml/"
    And I import following files:
      | Selenium-Employer.xml         |
      | Members.xml                   |
      | Lucernex_Selenium_Program.xml |
      | Lucernex_Site.xml             |
      | Lucernex_Facility.xml         |
      | Selenium_Location.xml         |
      | Lucernex_Parcel.xml           |
      | Selenium_Contract.xml         |
      | Lucernex_Project.xml          |
      | Lucernex_Capital_Project.xml  |
      | ExpenseVendorAllocation.xml   |
      | FolderTemplate.xml            |
      | ScheduleTemplate.xml          |
      | BuudgetTemplate.xml           |
    And I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following files:
      | Members.xlsx |
#      | Member_SS_New_Updated.xlsx |