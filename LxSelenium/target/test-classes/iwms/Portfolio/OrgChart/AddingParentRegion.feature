@all
Feature: (Jira Ref: Automation-441) I add parent region in org chart

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | AddingParentRegion.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I add parent region
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value              |
      | OperatingStatus | <Operating Status> |
    And I wait for the loading text to be disappear
    And I click on "<add Parent Region>" link
    And I switch to default frame
    Then I see the "Add Parent Region" modal window
    And I set these field values on editable page
      | name                            | value             |
      | RegionName                      | <Region Name>     |
      | Description                     | <Description>     |
      | _LinkRegionManager_MemberID_add | Administrator, Lx |

    And I set fields values on editable page
      | name                                       | value |
      | _checkbox__LinkRegionManager_IsManager_add | true  |
    And I click add link to add member "Administrator, Lx"
    And I set fields values on editable page
      | name                                       | value |
      | _checkbox__LinkRegionManager_IsManager_add | false |
    And I set these field values on editable page
      | name                            | value          |
      | _LinkRegionManager_MemberID_add | Access, Delete |

    And I click add link to add member "Access, Delete"

    Then I verify values on add parent region editable pop up
      | name          | value |
      | Access        | no    |
      | Administrator | yes   |

    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify members in "<Region Name>" org chart
      | name             | value            |
      | Lx Administrator | Lx Administrator |
      | Delete Access    | Delete Access    |
      | Managers         |                  |
      | Members          |                  |

    And I switch to visible frame
    And I click "<edit>" link corresponding "<Region Name>" region
    And I switch to default frame
    Then I see the "Edit Parent Region" modal window
    And I set these field values on editable page
      | name                            | value                |
      | Description                     | <Edited Description> |
      | _LinkRegionManager_MemberID_add | Access, Edit         |
    And I click add link to add member "Access, Edit"
    And I click "delete" link corresponding to member "Delete Access"
    And I click on the "Update" button
    And I wait for modal window to close
    Then I verify members in "<Region Name>" org chart
      | name             | value            |
      | Lx Administrator | Lx Administrator |
      | Edit Access      | Edit Access      |
      | Managers         |                  |
      | Members          |                  |

    And I switch to visible frame
    And I click "<delete>" link corresponding "<Region Name>" region
    And I switch to default frame
    Then I see the "Confirm Delete" modal window
    And I click on the "Yes" button
    And I wait for modal window to close
    Then I verify deleted region "<Region Name>" not present in org chart

    Examples:
      | Operating Status | Second Level Tab | Region Name            | Description   | Entity Name              | Login User   | Login full username  | Edited Description |
      | Pre-open         | Org Chart        | Selenium-Parent-Region | Parent Region | Adding Parent Region-441 | DeleteAccess | Delete Access Access | Edit Parent Region |
      | Operating        | Org Chart        | Selenium-Parent-Region | Parent Region | Adding Parent Region-441 | DeleteAccess | Delete Access Access | Edit Parent Region |