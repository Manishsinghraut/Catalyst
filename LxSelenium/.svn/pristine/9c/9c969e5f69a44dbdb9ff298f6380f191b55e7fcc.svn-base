@all
Feature: Replace/Switch Members - Completely remove this member from all Org Charts (Operating and Pre-open)? (Ref : Jira Ticket No : AUTOMATION-1306)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following file name:
      | Members 15649_1306.xlsx           |
      | PortfolioProjectLocation_1306.xml |
    And I logout

  Examples:
    | Login User | Login full username |
    | LxSelenium | Selenium Tester     |

  Scenario Outline: As a delete user I Navigate to "Portfolio Testing 15649" -> Org Chart and expand the org chart fully and verify the user assigned
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
    And I expand "Chicago" region list and verify the member "<Member>"
    And I expand "Suburb of Chicago" region list and verify the member "<Member>"
    And I expand "Central" region list and verify the member "<Member>"
    And I set following fields value on editable page
      | name            | value     |
      | OperatingStatus | Operating |
    And I wait for the loading text to be disappear
    And I expand "Suburb of Detroit" region list and verify the member "<Member>"
    And I expand "Central" region list and verify the member "<Member>"

    And I switch to default frame

    And I click on the "Details" tab
    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Wood              |
      | Name         | <Member>          |
      | Title        | Lx Administrator  |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Lx Administrator  |
      | User Class   | Lx Administrator  |
    And I switch to default frame

  Examples:
    | Login User | Login full username | Entity Name             | Second Level Tab | Member                 | Grid         |
    | LxSelenium | Selenium Tester     | Portfolio Testing 15649 | Org Chart        | Chris Chris Paul 15649 | BOGridMember |


  Scenario Outline: As a delete user I Navigate to Location 15649 > Details > Members/Contacts and verify the member
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
      | Type         | Wood              |
      | Name         | <Member>          |
      | Title        | Lx Administrator  |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Lx Administrator  |
      | User Class   | Lx Administrator  |
    And I switch to default frame

  Examples:
    | Login User | Login full username | Entity Name    | Second Level Tab | Member                 | Grid         |
    | LxSelenium | Selenium Tester     | Location 15649 | Details          | Chris Chris Paul 15649 | BOGridMember |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab
    And I set following fields value on editable page
      | name                        | value                   |
      | memberID                    | Chris Paul 15649, Chris |
      | removeFromReplacedEntitites | true                    |
      | replaceWithMemberID         | Nelson 15649, Jameer    |
      | promoteReplacee             | true                    |
      | memberEditMode              | remove                  |
      | orgChartMode                | removeMem               |
      | deactivateMember            | true                    |
    And I click on Next button on "Replace / Switch Members tab"

    And I verify row from non frame grid "<Grid>" having unique value "Location 15649" under column header "Name"
      | name               | value             |
      | Type               | Location          |
      | Name               | Location 15649    |
      | Portfolio/Program  | Lucernex-Selenium |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | Member            |
      | Planned Membership | Replace           |

    And I verify row from non frame grid "<Grid>" having unique value "Project 15649" under column header "Name"
      | name               | value                   |
      | Type               | Opening Project         |
      | Name               | Project 15649           |
      | Portfolio/Program  | Portfolio Testing 15649 |
      | Parent Region      | Chicago                 |
      | Sub Region         |                         |
      | Market             | Legacy Market Area      |
      | Project Type       |                         |
      | Current Membership | Member                  |
      | Planned Membership | Replace                 |

    And I verify row from non frame grid "<Grid>" having unique value "Portfolio Testing 15649" under column header "Name"
      | name               | value                   |
      | Type               | Portfolio               |
      | Name               | Portfolio Testing 15649 |
      | Portfolio/Program  | Portfolio Testing 15649 |
      | Parent Region      |                         |
      | Sub Region         |                         |
      | Market             |                         |
      | Project Type       |                         |
      | Current Membership | Member                  |
      | Planned Membership | Replace                 |


    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 3" is visible
    And I wait for "Replacing Chris Chris Paul 15649 with Jameer Nelson 15649" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 3 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | * Replaced in 3 entities |

    And I see the following note on the "Replace / Switch Members"
      | * Org Chart Member changes: Deleted 8 records |

    And I see the following note on the "Replace / Switch Members"
      | Successfully deactivated 'Chris Chris Paul 15649' |


  Examples:
    | Login User | Login full username | Grid         |
    | LxSelenium | Selenium Tester     | entitySelect |

  Scenario Outline: As a delete user I Navigate to Portfolio Testing 15649 > Org Chart And verify the org chart then verify the members
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
    And I expand "Chicago" region list and verify the "<add><edit>"
    And I expand "Suburb of Chicago" region list and verify the "<add><edit>"
    And I expand "Central" region list and verify the "<edit><delete>"
    And I set following fields value on editable page
      | name            | value     |
      | OperatingStatus | Operating |
    And I wait for the loading text to be disappear
    And I expand "Suburb of Detroit" region list and verify the "<add><edit>"
    And I expand "Central" region list and verify the "<edit><delete>"

    And I switch to default frame

  Examples:
    | Login User | Login full username | Entity Name             | Second Level Tab |
    | LxSelenium | Selenium Tester     | Portfolio Testing 15649 | Org Chart        |


  Scenario Outline: As a delete user I Navigate to Portfolio Testing 15649>Members/Contacts and ensure that OCMember 15648 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Brick             |
      | Name         | <Member>          |
      | Title        | Lx Administrator  |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Lx Administrator  |
      | User Class   | Lx Administrator  |
    And I switch to default frame

  Examples:
    | Login User | Login full username | Entity Name             | Third Level Tab  | Grid         | Member              |
    | LxSelenium | Selenium Tester     | Portfolio Testing 15649 | Members/Contacts | BOGridMember | Jameer Nelson 15649 |


  Scenario Outline: As a delete user I Navigate to Location 15649>Members/Contacts and ensure that OCMember 15648 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Brick             |
      | Name         | <Member>          |
      | Title        | Lx Administrator  |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Lx Administrator  |
      | User Class   | Lx Administrator  |
    And I switch to default frame

  Examples:
    | Login User | Login full username | Entity Name    | Third Level Tab  | Grid         | Member              |
    | LxSelenium | Selenium Tester     | Location 15649 | Members/Contacts | BOGridMember | Jameer Nelson 15649 |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard > Manage Members/Contacts > Activate/Deactivate and click the radio option 'List Inactive'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I click on the "Activate/Deactivate" tab
    And I select List Inactive radio button
    And I search for a "<Member>"
    And I verify a row from non frame grid "<Grid>" having unique value "Chris Chris Paul 15649" under column header "Name"
      | name               | value                  |
      | Name               | Chris Chris Paul 15649 |
      | Job Title          | Lx Administrator       |
      | Phone              |                        |
      | Email              |                        |
      | Employer           | Selenium-Employer      |
      | Job Function       | Lx Administrator       |
      | Currently Inactive | Inactive               |
      | Action             | <Deactivate>           |

  Examples:
    | Login User   | Login full username  | Member                 | Grid        |
    | DeleteAccess | Delete Access Access | Chris Chris Paul 15649 | MembersGrid |