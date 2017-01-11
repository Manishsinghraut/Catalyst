@all
Feature: Save Portfolio RE Planner and Facility/Store List Pages to documents (Ref : Jira Ticket No : AUTOMATION-1355)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | SDPortfolio_8449_1355.xml |
      | Targets-8449_1355.xlsx    |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I verify the Save Portfolio RE Planner and Facility/Store List Pages to documents
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second level tab>" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I set following fields value on editable page
      | name      | value |
      | startYear | 2020  |
      | endYear   | 2040  |

    And I click on the refresh button

    And I verify the Region "Region: Dallas Plano" values is "12,008.4"
    And I verify the Market "Market: Central" values is "7,833.6"
    And I verify the "T3-0" values is "1,043.7"
    And I verify the "T3-1" values is "985.9"
    And I verify the "T3-2" values is "928.0"
    And I verify the "T3-3" values is "870.1"
    And I verify the "T3-4" values is "812.3"

    And I verify the "T3-5" values is "754.4"
    And I verify the "T3-6" values is "696.6"
    And I verify the "T3-7" values is "638.7"
    And I verify the "T3-8" values is "580.9"
    And I verify the "T3-9" values is "523.0"
    And I verify the Market "Market: Legacy Market Area" values is "4,174.9"
    And I verify the "T1" values is "1,043.7"
    And I verify the "T2-0" values is "1,043.7"
    And I verify the "T2-1" values is "1,043.7"
    And I verify the "T2-2" values is "1,043.7"

    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document Name>         |
    And I click on "Save" Button
    And I switch to main window
  Examples:
    | Login User   | Login full username  | Entity Name      | Second level tab | Document Name |
    | DeleteAccess | Delete Access Access | SDPortfolio-8449 | RE Planner       | 2020 targets  |

  Scenario Outline: As Delete user, I verify the Save documents
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | SDPortfolio-8449 |

    And I verify the Region "Region: Dallas Plano" values is "12,008.4"
    And I verify the Market "Market: Central" values is "7,833.6"
    And I verify the "T3-0" values is "1,043.7"
    And I verify the "T3-1" values is "985.9"
    And I verify the "T3-2" values is "928.0"
    And I verify the "T3-3" values is "870.1"
    And I verify the "T3-4" values is "812.3"

    And I verify the "T3-5" values is "754.4"
    And I verify the "T3-6" values is "696.6"
    And I verify the "T3-7" values is "638.7"
    And I verify the "T3-8" values is "580.9"
    And I verify the "T3-9" values is "523.0"
    And I verify the Market "Market: Legacy Market Area" values is "4,174.9"
    And I verify the "T1" values is "1,043.7"
    And I verify the "T2-0" values is "1,043.7"
    And I verify the "T2-1" values is "1,043.7"
    And I verify the "T2-2" values is "1,043.7"
    And I close the "HTML window" child window
  Examples:
    | Login User   | Login full username  | Entity Name      | Second level tab | Document Name |
    | DeleteAccess | Delete Access Access | SDPortfolio-8449 | RE Planner       | 2020 targets  |

  Scenario Outline: As Delete user, I verify the Facility / Store List documents
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Facility / Store List" tab
    And I verify grid row "thisDiv" having unique value "SDContract-8449" under column header "Store Number"
      | name              | value           |
      | Store Number      | SDContract-8449 |
      | Region            |                 |
      | Name              | SDContract-8449 |
      | Street Address #1 | Pinehigh Dr     |
      | City              | Alpharetta      |
      | State             | GA              |
      | Postal Code       | 30022           |
      | Rentable Area     | 1,000           |
      | Commence Date     | 12/31/2020      |
      | Expire Date       | 12/30/2030      |
      | Location Type     | 90909           |
      | Effective Date    | 12/31/2020      |
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | Store list              |
    And I click on "Save" Button
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name      | Second level tab | Document Name |
    | DeleteAccess | Delete Access Access | SDPortfolio-8449 | RE Planner       | 2020 targets  |

  Scenario Outline: As Delete user, I verify the Save documents
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (2) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | Store list.html | Store list.html | Delete Access Access | Available |
    And I right click on a document "Store list.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | SDPortfolio-8449 |
    And I verify a row from non frame grid "thisDiv" having unique value "SDContract-8449" under column header "Store Number"
      | name              | value           |
      | Store Number      | SDContract-8449 |
      | Region            |                 |
      | Name              | SDContract-8449 |
      | Street Address #1 | Pinehigh Dr     |
      | City              | Alpharetta      |
      | State             | GA              |
      | Postal Code       | 30022           |
      | Rentable Area     | 1,000           |
      | Commence Date     | 12/31/2020      |
      | Expire Date       | 12/30/2030      |
      | Location Type     | 90909           |
      | Effective Date    | 12/31/2020      |
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name      | Second level tab | Document Name |
    | DeleteAccess | Delete Access Access | SDPortfolio-8449 | RE Planner       | 2020 targets  |

