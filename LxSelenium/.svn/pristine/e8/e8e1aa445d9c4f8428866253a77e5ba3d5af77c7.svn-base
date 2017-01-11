Feature: Data Scaffolding
  Developers can use this feature file to populate a JUnitTest firm with the same set of records that the
  [CreateEnterpriseCompany.feature] test case provides. The idea is when developers work a ticket that
  originates from a failed LxSelenium test case they can use this feature file to populate their JUnitTest
  firm with the same set of records as provided by the running [CreateEnterpriseCompany.feature].

  Recommended steps for developers:
  ---------------------------------
  1) Create empty JUnitTest firm via IWMS [Firm.Test.testCreateFirm] JUnit test case
  2) Select [localhost] maven profile for this LxSelenium project in IntelliJ [Maven Projects] area
  3) Edit the LxSelenium/pom.xml file and visit properties section within [localhost] profile
     a) Set [iwms.url]      property to point to your local IWMS deployment
     b) Set [iwms.username] property to the IWMS admin username that you use locally
     c) Set [iwms.password] property to the IWMS admin password that you use locally
     d) Set [iwms.firm]     property to the value 'JUnitTest'
  4) If you changed any of the properties in the LxSelenium/pom.xml file, then
     a) Execute maven clean target
     b) Execute maven package target
  5) Make sure your local deployment of IWMS is running and available
  6) Execute this .feature file via a right mouse click on this DataScaffolding.feature file

  Scenario: Populate JUnitTest firm with same records as provided by CreateEnterpriseCompany.feature.
    Given I login to IWMS using LxAdmin credentials into the "JUnitTest" firm
      And I used data files from "Data/ImportDataFiles/"
      And I import following file name:
          | 38 QASecurity.xml |
      And I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
      And I import following files:
          | Member_SS.xlsx |
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
