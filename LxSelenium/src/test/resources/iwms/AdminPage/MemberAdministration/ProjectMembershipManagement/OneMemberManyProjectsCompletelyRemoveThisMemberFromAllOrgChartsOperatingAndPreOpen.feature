@all
Feature: One Member Many Projects: Completely remove this member from all Org Charts (Operating and Pre-open) (Ref : Jira Ticket No : AUTOMATION-1305)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following file name:
      | OCMember-15648_1305.xlsx |
      | OCMPortfolio_1305.xml    |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to Portfolio_Testing_1260 Portfolio > Org Chart And verify the org chart then verify the members
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value    |
      | OperatingStatus | Pre-open |
    And I wait for the loading text to be disappear
    And I expand "Dallas" region list and verify the member "<Member>"
    And I expand "Plano" region list and verify the member "<Member>"
    And I expand "Legacy Market Area" region list and verify the member "<Member>"
    And I set following fields value on editable page
      | name            | value     |
      | OperatingStatus | Operating |
    And I wait for the loading text to be disappear
    And I expand "Sugar Land" region list and verify the member "<Member>"
    And I expand "Legacy Market Area" region list and verify the member "<Member>"

    And I switch to default frame

    And I click on the "Details" tab
    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Team Member       |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Second Level Tab | Member         | Grid         |
    | DeleteAccess | Delete Access Access | RMPortfolio-15648 | Org Chart        | OCMember 15648 | BOGridMember |


  Scenario Outline: As a delete user I Navigate to OCMLocation > Details > Members/Contacts and verify the member
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Team Member       |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Second Level Tab | Member         | Grid         |
    | DeleteAccess | Delete Access Access | OCMLocation | Details          | OCMember 15648 | BOGridMember |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "One Member Many Projects" tab
    And I set following fields value on editable page
      | name           | value           |
      | memberID       | 15648, OCMember |
      | memberEditMode | remove          |
      | removeOrgChart | true            |
    And I click on Next button on "One Member Many Projects tab"

    And I verify row from non frame grid "<Grid>" having unique value "OCMLocation" under column header "Name"
      | name               | value             |
      | Type               | Location          |
      | Name               | OCMLocation       |
      | Portfolio/Program  | RMPortfolio-15648 |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | Member            |
      | Planned Membership | None              |

    And I verify row from non frame grid "<Grid>" having unique value "Portfolio" under column header "Type"
      | name               | value             |
      | Type               | Portfolio         |
      | Name               | RMPortfolio-15648 |
      | Portfolio/Program  | RMPortfolio-15648 |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | Member            |
      | Planned Membership | None              |

    And I click on Process Planned Membership button
    And I wait for "Total Entities Modified: 2" is visible

    And I see the following note on the "One Member Many Projects tab"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "One Member Many Projects tab"
      | Finished processing |

    And I see the following note on the "One Member Many Projects tab"
      | Total Entities Modified: 2 |

    And I see the following note on the "One Member Many Projects tab"
      | No Errors encountered |

    And I see the following note on the "One Member Many Projects tab"
      | * Removed from 2 entities |

    And I see the following note on the "One Member Many Projects tab"
      | * Org Chart Member changes: Deleted 7 records |

  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to RMPortfolio-15648 > Org Chart And verify the org chart then verify the members
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value    |
      | OperatingStatus | Pre-open |
    And I wait for the loading text to be disappear
    And I expand "Dallas" region list and verify the "<add><edit>"
    And I expand "Plano" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"
    And I set following fields value on editable page
      | name            | value     |
      | OperatingStatus | Operating |
    And I wait for the loading text to be disappear
    And I expand "Sugar Land" region list and verify the "<add><edit>"
    And I expand "Legacy Market Area" region list and verify the "<edit><delete>"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Second Level Tab |
    | DeleteAccess | Delete Access Access | RMPortfolio-15648 | Org Chart        |


  Scenario Outline: As a delete user I Navigate to RMPortfolio-15648>Members/Contacts and ensure that OCMember 15648 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row in grid "<Grid>" having value "<Member>" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Third Level Tab  | Grid         | Member         |
    | DeleteAccess | Delete Access Access | RMPortfolio-15648 | Members/Contacts | BOGridMember | OCMember 15648 |


  Scenario Outline: As a delete user I Navigate to OCMLocation>Members/Contacts and ensure that OCMember 15648 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row in grid "<Grid>" having value "<Member>" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Third Level Tab  | Grid         | Member         |
    | DeleteAccess | Delete Access Access | OCMLocation | Members/Contacts | BOGridMember | OCMember 15648 |
