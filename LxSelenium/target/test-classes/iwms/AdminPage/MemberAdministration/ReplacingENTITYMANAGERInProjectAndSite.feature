@all
Feature: Replacing ENTITY MANAGER in Project and Site (Ref : Jira Ticket No : AUTOMATION-1281)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | Member_Test_1261_1281.xlsx        |
      | Replace_Manager_Entities_1281.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to Manage Members/Contacts and ensure that 2 members are created
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I verify a row from non frame grid "<Grid>" having unique value "Manager 1 Testing 1261" under column header "Name"
      | name         | value                  |
      | Name         | Manager 1 Testing 1261 |
      | Member?      | Yes                    |
      | Job Title    | Delete Access          |
      | Job Function | Delete Access          |
      | Email        |                        |
      | Employer     | Selenium-Employer      |
      | User Class   | Delete Access          |
      | Last Login   |                        |
    And I verify a row from non frame grid "<Grid>" having unique value "Manager 2 Testing 1261" under column header "Name"
      | name         | value                  |
      | Name         | Manager 2 Testing 1261 |
      | Member?      | Yes                    |
      | Job Title    | Delete Access          |
      | Job Function | Delete Access          |
      | Email        |                        |
      | Employer     | Selenium-Employer      |
      | User Class   | Delete Access          |
      | Last Login   |                        |

  Examples:
    | Login User   | Login full username  | Grid                      |
    | DeleteAccess | Delete Access Access | BOGridBOListExtGridPerson |

  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab
    And I set following fields value on editable page
      | name                        | value                   |
      | memberID                    | Testing 1261, Manager 1 |
      | removeFromReplacedEntitites | true                    |
      | replaceWithMemberID         | Testing 1261, Manager 2 |
      | promoteReplacee             | true                    |
      | memberEditMode              | remove                  |
    And I click on Next button on "Replace / Switch Members tab"
    And I verify row from non frame grid "<Grid>" having unique value "Replace Manager Project" under column header "Name"
      | name               | value                             |
      | Type               | Opening Project                   |
      | Name               | Replace Manager Project           |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Legacy Market Area                |
      | Project Type       |                                   |
      | Current Membership | Manager                           |
      | Planned Membership | Replace                           |

    And I verify row from non frame grid "<Grid>" having unique value "Replace Manager Site" under column header "Name"
      | name               | value                             |
      | Type               | Site                              |
      | Name               | Replace Manager Site              |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Legacy Market Area                |
      | Project Type       |                                   |
      | Current Membership | Manager                           |
      | Planned Membership | Replace                           |

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 2" is visible
    And I wait for "Replacing Manager 1 Testing 1261 with Manager 2 Testing 1261" is visible

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

  Scenario Outline: As a delete user I Navigate to Replace Manager Project and verify the Management section
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify management members "Manager 2 Testing 1261"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name             | Third Level Tab |
    | DeleteAccess | Delete Access Access | Replace Manager Project | Summary         |

  Scenario Outline: As a delete user I Navigate to Replace Manager Site and verify the Management section
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify management members "Manager 2 Testing 1261"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name          | Third Level Tab |
    | DeleteAccess | Delete Access Access | Replace Manager Site | Summary         |
