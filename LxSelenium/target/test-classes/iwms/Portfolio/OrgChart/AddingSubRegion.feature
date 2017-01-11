@all @smoke1Dot1
Feature: (Jira Ref: Automation-442) I add, edit and delete sub region in org chart pre-open and operating status view

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | AddingSubRegion.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I add sub region
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
    And I wait for the Loading text to disappear
    And I click "<add>" link corresponding "<Region Name>" region
    And I switch to default frame
    Then I see the "Add" modal window
    And I click on the "Next" button
    And I set these field values on editable page
      | name                            | value             |
      | RegionName                      | <Sub Region Name> |
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
    Then I verify I'm at Org chart page
    And I expand "<Region Name>" region list
    Then I verify members in "<Sub Region Name>" org chart
      | name             | value            |
      | Managers         |                  |
      | Lx Administrator | Lx Administrator |
      | Members          |                  |
      | Delete Access    | Delete Access    |

    And I wait for the Loading text to disappear
#    And I expand "<Region Name>" region tree
    And I click "<edit>" link corresponding "<Sub Region Name>" sub region
    And I switch to default frame
    Then I see the "Edit Sub Region" modal window
    And I set these field values on editable page
      | name                            | value                |
      | Description                     | <Edited Description> |
      | _LinkRegionManager_MemberID_add | Access, Edit         |
    And I click add link to add member "Access, Edit"
    And I click "delete" link corresponding to member "Delete Access"
    And I click on the "Update" button
    And I wait for modal window to close
    Then I verify I'm at Org chart page
    And I expand "<Region Name>" region list
    Then I verify members in "<Sub Region Name>" org chart
      | name             | value            |
      | Lx Administrator | Lx Administrator |
      | Edit Access      | Edit Access      |
      | Managers         |                  |
      | Members          |                  |

    And I wait for the Loading text to disappear
    And I expand "<Region Name>" region list
    And I click "<delete>" link corresponding "<Sub Region Name>" sub region
    And I switch to default frame
    Then I see the "Confirm Delete" modal window
    And I click on the "Yes" button
    And I wait for modal window to close
    Then I verify I'm at Org chart page
    Then I verify deleted region "<Sub Region Name>" not present in org chart

    Examples:
      | Operating Status | Second Level Tab | Region Name         | Description       | Entity Name           | Sub Region Name     | Edited Description | Login User   | Login full username  |
      | Pre-open         | Org Chart        | Add Sub Region Here | Create Sub Region | Adding sub region-442 | Selenium Sub Region | Edited Sub Region  | DeleteAccess | Delete Access Access |
      | Operating        | Org Chart        | Add Sub Region Here | Create Sub Region | Adding sub region-442 | Selenium Sub Region | Edited Sub Region  | DeleteAccess | Delete Access Access |