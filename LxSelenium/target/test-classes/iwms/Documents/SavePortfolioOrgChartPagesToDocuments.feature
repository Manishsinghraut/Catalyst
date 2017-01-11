@all
Feature: Save Portfolio - Org Chart pages to documents (Ref : Jira Ticket No : AUTOMATION-1356)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | Testing_8450_1356.xml        |
      | NewCompressedFolder_1356.zip |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user, I verify displaying dropdown and Management dropdown as Pre-open - Vertically
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value      |
      | OperatingStatus | Pre-open   |
      | RgnLayout       | Vertically |
    And I wait for the loading text to be disappear
    And I expand "Illinois" region list and verify the "<add><edit>"
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value        |
      | FolderID | Testing 8450 |
      | BaseName | <Document>   |
    And I expand "Illinois" region list and verify the "<add><edit>"
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I click on "Save" Button
    And I switch to main window


  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 A |

  Scenario Outline: As a delete user, I verify the saved document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | Testing 8450 (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I expand "Illinois" region list and verify the "<add><edit>"
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 A |


  Scenario Outline: As a delete user, I verify displaying dropdown and Management dropdown as Pre-open - Horizontally
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value      |
      | OperatingStatus | Pre-open   |
      | RgnLayout       | Horizontally |
    And I wait for the loading text to be disappear
    And I expand "Illinois" region list and verify the "<add><edit>"
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value        |
      | FolderID | Testing 8450 |
      | BaseName | <Document>   |
    And I expand "Illinois" region list and verify the "<add><edit>"
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I click on "Save" Button
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 B |

  Scenario Outline: As a delete user, I verify saved Document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | Testing 8450 (2) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I expand "Illinois" region list and verify the "<add><edit>"
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 B |


  Scenario Outline: As a delete user, I verify displaying dropdown and Management dropdown as Operating - Horizontally
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value      |
      | OperatingStatus | Operating   |
      | RgnLayout       | Horizontally |
    And I wait for the loading text to be disappear
    And I expand "Texas" region list and verify the "<add><edit>"
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value        |
      | FolderID | Testing 8450 |
      | BaseName | <Document>   |
    And I expand "Texas" region list and verify the "<add><edit>"
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I click on "Save" Button
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 C |

  Scenario Outline: As a delete user, I verify the saved document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | Testing 8450 (3) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I expand "Texas" region list and verify the "<add><edit>"
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 C |


  Scenario Outline: As a delete user, I verify displaying dropdown and Management dropdown as Operating - Vertically
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value      |
      | OperatingStatus | Operating   |
      | RgnLayout       | Vertically |
    And I wait for the loading text to be disappear
    And I expand "Texas" region list and verify the "<add><edit>"
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value        |
      | FolderID | Testing 8450 |
      | BaseName | <Document>   |
    And I expand "Texas" region list and verify the "<add><edit>"
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I click on "Save" Button
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 D |

  Scenario Outline: As a delete user, I verify the saved document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | Testing 8450 (4) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I expand "Texas" region list and verify the "<add><edit>"
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document       |
    | DeleteAccess | Delete Access Access | Testing-8450 | Org Chart        | Testing-8450 D |

