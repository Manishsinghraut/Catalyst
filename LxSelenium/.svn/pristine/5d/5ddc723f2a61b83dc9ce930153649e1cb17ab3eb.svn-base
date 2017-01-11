@smoke1Dot1
Feature: Global Report Buttons - Portfolio List of Entity Reports (Jira Ref. : AUTOMATION-386)

  Scenario Outline: Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | ContractReport.xml             |
      | FacilityReport.xml             |
      | LocationsReport.xml            |
      | PortfolioSummaryPageLayout.xml |
      | ProjectsReport.xml             |
      | SiteReport.xml                 |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Manage Sub Pages
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click on "Manage Sub-pages" tab
    And I click "build layout" row action in the non frame grid "<Grid>" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page Layout> |
    And I switch to "build layout" child window
    And I click the "..." for the "<field>" field for edit
    And I set following fields value on editable page
      | name     | value    |
      | context1 | <report> |
    And I click on "Set Options" Button
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Grid             | Page Layout            | report                                     | field                                  |
      | DeleteAccess | Delete Access Access | BOGridPageLayout | Portfolio - Contracts  | Admin-Contracts for this Portfolio_Button  | List of Contracts (Run Report Action)  |
      | DeleteAccess | Delete Access Access | BOGridPageLayout | Portfolio - Facilities | Admin-Facilities for this Portfolio_Button | List of Facilities (Run Report Action) |
      | DeleteAccess | Delete Access Access | BOGridPageLayout | Portfolio - Locations  | Admin-Locations for this Portfolio_Button  | List of Locations (Run Report Action)  |
      | DeleteAccess | Delete Access Access | BOGridPageLayout | Portfolio - Projects   | Admin-Projects for this Portfolio_Button   | List of Projects (Run Report Action)   |
      | DeleteAccess | Delete Access Access | BOGridPageLayout | Portfolio - Sites      | Admin-Sites for this Portfolio_Button      | List of Sites (Run Report Action)      |

  Scenario Outline: As a delete user I Navigate to portfolio and verify the contracts report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I click on the "<action panel button>" action panel button
    And I switch to "Report window" child window
    And I verify following "report results"
      | Portfolio Contract Name Facility Contract Number Contract Status Contract Type Effective Date Expire Date Term Length |
    And I close the "Report window" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name       | action panel button |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium | List of Contracts   |

  Scenario Outline: As a delete user I Navigate to portfolio and verify the Facilities report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I click on the "<action panel button>" action panel button
    And I switch to "Report window" child window
    And I verify following "report results"
      | Portfolio Name Project Status Project Type Street Address #1 City State Store Number |
    And I close the "Report window" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name       | action panel button |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium | List of Facilities  |


  Scenario Outline: As a delete user I Navigate to portfolio and verify the Locations report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I click on the "<action panel button>" action panel button
    And I switch to "Report window" child window
    And I verify following "report results"
      | Portfolio Name Estimated Number of Sites Location Status Street Address #1 City State Related Facility |
    And I close the "Report window" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name       | action panel button |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium | List of Locations   |

  Scenario Outline: As a delete user I Navigate to portfolio and verify the Projects report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I click on the "<action panel button>" action panel button
    And I switch to "Report window" child window
    And I verify following "report results"
      | Portfolio Name Project Status Project Type Street Address #1 City State Store Number |
    And I close the "Report window" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name       | action panel button |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium | List of Projects    |


  Scenario Outline: As a delete user I Navigate to portfolio and verify the Sites report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I click on the "<action panel button>" action panel button
    And I switch to "Report window" child window
    And I verify following "report results"
      | Portfolio Name Project Status Project Type Street Address #1 City State Store Number |
    And I close the "Report window" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name       | action panel button |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium | List of Sites       |