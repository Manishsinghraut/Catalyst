@all
Feature: Complex - Adding a New Developer [Ref : Jira Ticket No : AUTOMATION-1409]

  Scenario Outline: As a delete user, I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/ComplexCenter/"
    And I import following file name:
      | Portfolio00018And2077_Location_1409.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I verify All the data shall be populated
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the field "Name" is "2077 Complex"
    And I verify the field "Developer" is "Delete Access"
    And I verify the field "Property Manager" is "Delete Access"
    And I verify the field "Landlord" is "Delete Access"
    And I verify the field "Notable Tenants" is "2 Blocks away"
    And I verify the field "Status" is "Newly Opened"
    And I verify the field "Format" is "Mall"
    And I verify the field "Scheme" is "Class"
    And I verify the field "Hours of Operation" is "24"
    And I verify the field "Format" is "Mall"
    And I verify the field "Year Built" is "2002"

    And I verify the field "Gross Lease Area (GLA)" is "150,000"
    And I verify the field "Area Unit" is "Square Feet"
    And I verify the field "Number of Levels" is "45"
    And I verify the field "Gla Excluding Anchors" is "200,000"
    And I verify the field "Occupancy Percentage" is "10.00000%"
    And I verify the field "Number of Stores" is "500"
    And I verify the field "Sales Per Area" is "$45,000.00"
    And I verify the field "Vacancy Rate" is "90"
    And I verify the field "Number of Outparcels" is "67"

    And I verify the field "Number Parking Spaces" is "23,456"
    And I verify the field "Is Space Available?" values is "Yes"
    And I verify the field "Has Food Court?" values is "Yes"
    And I verify the field "Is Enclosed?" values is "Yes"

    And I verify the field "Last Renovation Date" is "01/01/2000"
    And I verify the field "Is Renovation Planned?" values is "Yes"
    And I verify the field "Renovation Plan Date" is "12/31/2020"

    And I verify the field "Is Expansion Planned?" values is "Yes"
    And I verify the field "Expansion Plan Date" is "12/31/2020"
    And I switch to default frame
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I Click the "..." next to the "Complex_DeveloperID" dropdown
    And I switch to default frame
    And I click "Add Person..." button
    And I see the "Add Person" modal window
    And I set following fields value on editable page
      | name              | value              |
      | ConvertToMember   | true               |
      | Title             | Architect          |
      | FirstName         | SeleniumUser       |
      | LastName          | Webdriver          |
      | CodeJobFunctionID | Delete Access      |
      | CodeJobTitleID    | Delete Access      |
      | Person_Phone      | 111-222-3333       |
      | EmployerID        | Selenium-Employer  |
      | EMail1            | svcQA@lucernex.com |
      | MobileNumber      | 9123456789         |
      | Fax               | 9123456789         |
      | WebSite           | www.lucernex.com   |
      | LoginName         | SeleniumUser       |
      | Password          | RegressionTest     |
      | CodeUserClassID   | Delete Access      |
      | Description       | Adding a developer |

    And I add following Contract type
      | Team Member |
    Then I click on the "Add" button
    And I switch to visible frame
    And I verify the following fields value on editable page
      | name                | value                  |
      | Complex_DeveloperID | SeleniumUser Webdriver |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify the field "Developer" is "SeleniumUser Webdriver"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab        | Grid         | Member        |
    | DeleteAccess | Delete Access Access | 2077 Location | Complex/Center   | Complex/Center Details | BOGridMember | CMember 11371 |


  Scenario Outline: As an delete user ,I verify the Developer "SeleniumUser Webdriver" shall be successfully be added as a Developer on the Complex as well as to the list of members and contacts.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I search for record "SeleniumUser Webdriver"
    Then I verify following values in non frame grid "<Grid>"
      | Name                   | Member? | Job Title     | Job Function  | Email              | Employer          | User Class    | Last Login |
      | SeleniumUser Webdriver | Yes     | Delete Access | Delete Access | svcQA@lucernex.com | Selenium-Employer | Delete Access |            |

  Examples:
    | Login User   | Login full username  | Grid                      |
    | DeleteAccess | Delete Access Access | BOGridBOListExtGridPerson |