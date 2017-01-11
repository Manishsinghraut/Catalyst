@all
Feature: (Jira Ref: Automation-443) I add market to sub region in org chart

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | AddMarketToSubRegion.xml       |
      | AddingMarketToParentRegion.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I add market to sub region in org chart
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
    And I expand "<Region Name>" region list
    And I click "<add>" link corresponding "<Sub Region Name>" region
    And I switch to default frame
    Then I see the "Add Market" modal window
    And I set following fields value on editable page
      | name                                                | value              |
      | CodeMarketAreaID                                    | Legacy Market Area |
      | _LinkRegionManagerForMarket_MemberID_add            | Administrator, Lx  |
      | _checkbox__LinkRegionManagerForMarket_IsManager_add | true               |
    And I click add link to add member "Administrator, Lx"
    And I set fields values on editable page
      | name                                                | value |
      | _checkbox__LinkRegionManagerForMarket_IsManager_add | false |
    And I set these field values on editable page
      | name                                     | value          |
      | _LinkRegionManagerForMarket_MemberID_add | Access, Delete |

    And I click add link to add member "Access, Delete"

    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify market is added

    And I wait for the Loading text to disappear
    And I expand "<Sub Region Name>" sub region list in "<Region Name>" region
    And I click "<edit>" link corresponding "<Market>" sub region
    And I switch to default frame
    Then I see the "Edit Market" modal window
    And I set these field values on editable page
      | name                                     | value        |
      | _LinkRegionManagerForMarket_MemberID_add | Access, Edit |
    And I click add link to add member "Access, Edit"
    And I click "delete" link corresponding to member "Delete Access"
    And I click on the "Update" button
    And I wait for modal window to close

    And I wait for the loading text to be disappear
    And I expand "<Sub Region Name>" sub region list in "<Region Name>" region
    And I switch to visible frame
    And I click "<delete>" link corresponding "<Market>" region
    And I switch to default frame
    Then I see the "Confirm Delete" modal window
    And I click on the "Yes" button
    And I wait for modal window to close
    And I switch to visible frame
    And I expand "<Region Name>" region list
    Then I verify market is deleted

    Examples:
      | Operating Status | Second Level Tab | Region Name       | Entity Name              | Sub Region Name | Market             | Login User   | Login full username  |
      | Pre-open         | Org Chart        | Add Market To Sub | AddMarketToSubRegion-443 | Add Market Here | Legacy Market Area | DeleteAccess | Delete Access Access |
      | Operating        | Org Chart        | Add Market To Sub | AddMarketToSubRegion-443 | Add Market Here | Legacy Market Area | DeleteAccess | Delete Access Access |


  Scenario Outline: I add market to parent region in org chart
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
    And I expand "<Region Name>" region list
    And I click "<add>" link corresponding "<Region Name>" region
    And I switch to default frame
    Then I see the "Add" modal window
    And I set following fields value on editable page
      | name   | value  |
      | BOType | Market |
    And I click on the "Next" button
    And I set following fields value on editable page
      | name                                                | value              |
      | CodeMarketAreaID                                    | Legacy Market Area |
      | _LinkRegionManagerForMarket_MemberID_add            | Administrator, Lx  |
      | _checkbox__LinkRegionManagerForMarket_IsManager_add | true               |
    And I click add link to add member "Administrator, Lx"
    And I set fields values on editable page
      | name                                                | value |
      | _checkbox__LinkRegionManagerForMarket_IsManager_add | false |
    And I set these field values on editable page
      | name                                     | value          |
      | _LinkRegionManagerForMarket_MemberID_add | Access, Delete |

    And I click add link to add member "Access, Delete"

    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify market is added

    And I wait for the Loading text to disappear
    And I expand "<Region Name>" region list
    And I click "<edit>" link corresponding "<Market>" sub region
    And I switch to default frame
    Then I see the "Edit Market" modal window
    And I set these field values on editable page
      | name                                     | value        |
      | _LinkRegionManagerForMarket_MemberID_add | Access, Edit |
    And I click add link to add member "Access, Edit"
    And I click "delete" link corresponding to member "Delete Access"
    And I click on the "Update" button
    And I wait for modal window to close

    And I wait for the loading text to be disappear
    And I expand "<Region Name>" region list
    And I switch to visible frame
    And I click "<delete>" link corresponding "<Market>" region
    And I switch to default frame
    Then I see the "Confirm Delete" modal window
    And I click on the "Yes" button
    And I wait for modal window to close
    And I switch to visible frame
    And I expand "<Region Name>" region list
    Then I verify market is deleted

    Examples:
      | Operating Status | Second Level Tab | Region Name     | Entity Name                 | Market             | Login User   | Login full username  |
      | Pre-open         | Org Chart        | Add Market Here | AddMarketToParentRegion-443 | Legacy Market Area | DeleteAccess | Delete Access Access |
      | Operating        | Org Chart        | Add Market Here | AddMarketToParentRegion-443 | Legacy Market Area | DeleteAccess | Delete Access Access |