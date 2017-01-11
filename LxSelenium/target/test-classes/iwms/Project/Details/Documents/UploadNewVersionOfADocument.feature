@all
Feature: Upload New Version of a Document [Ref : Jira Ticket No : AUTOMATION-1440]

  Scenario Outline: As Delete User, I import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020_1440.xml |
      | DocumentVersionProject_44_1440.xml        |
      | DocumentStructureCreate-44_1440.zip       |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I download the document and verify The document will be populated in the gird and the "ver" column will display "1"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following
      | DV-44 (1) |
      | A (1)     |
    And I verify the following values in frame grid "resultsPane"
      | File Name           | Description | Author               | Status                | Ver |
      | <Document Name>.txt |             | Delete Access Access | Not Ready for Release | 1   |

    And I right click on a document "<Document Name>.txt" and select menu option "Download"
    And I wait for the Loading text to disappear

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name               | Second Level Tab | Third Level Tab | Document Name |
    | DeleteAccess | Delete Access Access | DocumentVersionProject-44 | Details          | Documents       | DVP44         |

  Scenario Outline: As Delete User, I import the "DocumentStructureUpdate-44.zip" file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | DocumentStructureUpdate-44_1440.zip |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I download the document and verify The document will be populated in the gird and the "ver" column will display "2"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following
      | DV-44 (1) |
      | A (1)     |
    And I verify the following values in frame grid "resultsPane"
      | File Name           | Description | Author               | Status                | Ver |
      | <Document Name>.txt |             | Delete Access Access | Not Ready for Release | 2   |

    And I right click on a document "<Document Name>.txt" and select menu option "Download"
    And I wait for the Loading text to disappear
    And I right click on a document "<Document Name>.txt" and select menu option "Upload new version"
    And I wait for the Loading text to disappear

    And I upload the following document from path "target/DownloadFiles/":
      | DVP44(Version=2).txt |

    And I click on the "Upload" button
    And I wait for modal window to close

    And I verify the following values in frame grid "resultsPane"
      | File Name           | Description | Author               | Status    | Ver |
      | <Document Name>.txt |             | Delete Access Access | Available | 3   |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name               | Second Level Tab | Third Level Tab | Document Name |
    | DeleteAccess | Delete Access Access | DocumentVersionProject-44 | Details          | Documents       | DVP44         |