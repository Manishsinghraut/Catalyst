@all
Feature: Replace Member but do not Remove Entity Member (Site/Project) (Ref : Jira Ticket No : AUTOMATION-1284)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Members/"
    And I import following file name:
      | Member_Test_1264_1284.xlsx |
      | Entity_1264_1284.xml       |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to Site "Testing 1264 Site">Summary.View the Manager
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify management members "Replace Remove Member 1 Testing 1264"
    And I switch to default frame

    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Broker            |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Third Level Tab | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | Testing 1264 Site | Summary         | BOGridMember | Replace Remove Member 1 Testing 1264 |


  Scenario Outline: As a delete user I Navigate to Project "Testing 1264 Project">Members and Contacts Tab and view Member
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Broker            |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name          | Third Level Tab  | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | Testing 1264 Project | Members/Contacts | BOGridMember | Replace Remove Member 1 Testing 1264 |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab
    And I set following fields value on editable page
      | name                        | value                                 |
      | memberID                    | Testing 1264, Replace Remove Member 1 |
      | removeFromReplacedEntitites | false                                 |
      | replaceWithMemberID         | Testing 1264, Replace Remove Member 2 |
      | promoteReplacee             | true                                  |
      | memberEditMode              | remove                                |
    And I click on Next button on "Replace / Switch Members tab"

    And I verify row from non frame grid "<Grid>" having unique value "Testing 1264 Project" under column header "Name"
      | name               | value                             |
      | Type               | Opening Project                   |
      | Name               | Testing 1264 Project              |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Central                           |
      | Project Type       |                                   |
      | Current Membership | Member                            |
      | Planned Membership | Replace                           |

    And I verify row from non frame grid "<Grid>" having unique value "Testing 1264 Site" under column header "Name"
      | name               | value                             |
      | Type               | Site                              |
      | Name               | Testing 1264 Site                 |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Central                           |
      | Project Type       |                                   |
      | Current Membership | Manager                           |
      | Planned Membership | Replace                           |


    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 2" is visible
    And I wait for "Replacing Replace Remove Member 1 Testing 1264 with Replace Remove Member 2 Testing 1264" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 2 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 2 entities |

  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to Entity Site "Testing 1264 Site">Summary Page. View the Managers
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify management members "Replace Remove Member 1 Testing 1264"
    And I verify management members "Replace Remove Member 2 Testing 1264"
    And I switch to default frame

    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Broker            |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I verify a row from grid "<Grid>" having unique value "Replace Remove Member 2 Testing 1264" under column header "Name"
      | name         | value                                |
      | Type         | Broker                               |
      | Name         | Replace Remove Member 2 Testing 1264 |
      | Title        | Delete Access                        |
      | Phone        |                                      |
      | Email        |                                      |
      | Employer     | Selenium-Employer                    |
      | Job Function | Delete Access                        |
      | User Class   | Delete Access                        |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Third Level Tab | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | Testing 1264 Site | Summary         | BOGridMember | Replace Remove Member 1 Testing 1264 |


  Scenario Outline: As a delete user I Navigate to Entity Project "Testing 1264 Project">Members and contacts tab.View the Members
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Broker            |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I verify a row from grid "<Grid>" having unique value "Replace Remove Member 2 Testing 1264" under column header "Name"
      | name         | value                                |
      | Type         | Broker                               |
      | Name         | Replace Remove Member 2 Testing 1264 |
      | Title        | Delete Access                        |
      | Phone        |                                      |
      | Email        |                                      |
      | Employer     | Selenium-Employer                    |
      | Job Function | Delete Access                        |
      | User Class   | Delete Access                        |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name          | Third Level Tab  | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | Testing 1264 Project | Members/Contacts | BOGridMember | Replace Remove Member 1 Testing 1264 |