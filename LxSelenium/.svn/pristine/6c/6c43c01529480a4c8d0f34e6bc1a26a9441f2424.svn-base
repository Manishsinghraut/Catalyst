@all
Feature: One Member many Project-Add as Member to all Grid rows (Ref : Jira Ticket No : AUTOMATION-1295)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following file name:
      | Member_Test_15650_1295.xlsx |
      | 16EntityXml_1295.xml        |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify the 14 Projects and 2 Sites entities should be created and verify Member "1a Testing 15650" should not be a member on the entities
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify row in grid "BOGridMember" having value "Member 1a Testing 15650" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Entity Name     |
    | Project OMMP 1  |
    | Project OMMP 2  |
    | Project OMMP 3  |
    | Project OMMP 4  |
    | Project OMMP 5  |
    | Project OMMP 6  |
    | Project OMMP 7  |
    | Project OMMP 8  |
    | Project OMMP 9  |
    | Project OMMP 10 |
    | Project OMMP 11 |
    | Project OMMP 12 |
    | Project OMMP 13 |
    | Project OMMP 14 |
    | Site OMMP -19   |
    | Site OMMP -20   |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "One Member Many Projects" tab
    And I set following fields value on editable page
      | name           | value                    |
      | memberID       | Testing 15650, Member 1a |
      | memberEditMode | edit                     |

    And I click on Next button on "One Member Many Projects tab"
    And I wait for "Adding/removing Member 1a Testing 15650 in selected entities" is visible

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify Page 1 shall display 15 entities and page 2 displays 1 Entity - Total 16 Entities on both pages should be displayed
    And I search member "OMMP"
    And I verify rows count in multiple pages "16" in non frame grid "<Grid>"
    And I search member "<Entity Name>"
    And I verify row from non frame grid "<Grid>" having unique value "<Entity Name>" under column header "Name"
      | name               | value                             |
      | Type               | <Type>                            |
      | Name               | <Entity Name>                     |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Legacy Market Area                |
      | Project Type       |                                   |
      | Current Membership | None                              |
      | State              | <State>                           |
      | Planned Membership | None <Member> <Manager>           |

  Examples:
    | Grid         | Entity Name     | Type            | State |
    | entitySelect | Project OMMP 1  | Opening Project | TX    |
    | entitySelect | Project OMMP 2  | Opening Project | TX    |
    | entitySelect | Project OMMP 3  | Opening Project | TX    |
    | entitySelect | Project OMMP 4  | Opening Project | TX    |
    | entitySelect | Project OMMP 5  | Opening Project | TX    |
    | entitySelect | Project OMMP 6  | Opening Project | TX    |
    | entitySelect | Project OMMP 7  | Opening Project | TX    |
    | entitySelect | Project OMMP 8  | Opening Project | TX    |
    | entitySelect | Project OMMP 9  | Opening Project | TX    |
    | entitySelect | Project OMMP 10 | Opening Project | TX    |
    | entitySelect | Project OMMP 11 | Opening Project | TX    |
    | entitySelect | Project OMMP 12 | Opening Project | TX    |
    | entitySelect | Project OMMP 13 | Opening Project | TX    |
    | entitySelect | Project OMMP 14 | Opening Project | TX    |
    | entitySelect | Site OMMP -19   | Site            | FL    |
    | entitySelect | Site OMMP -20   | Site            | FL    |

#  Scenario Outline: As a delete user I verify Page 1 shall display 15 entities and page 2 displays 1 Entity - Total 16 Entities on both pages should be displayed
##    And I search member "<Entity Name>"
#    And I click on "Add as Member to all Grid rows" action of header "Planned Membership" in non frame grid "<Grid>"
#
#  Examples:
#    | Grid         | Entity Name |
#    | entitySelect | OMMP        |

  Scenario Outline: As a delete user I verify Page 1 shall display 15 entities and page 2 displays 1 Entity - Total 16 Entities on both pages should be displayed
#    And I click on "Add as Member to all Grid rows" action of header "Planned Membership" in non frame grid "<Grid>"
#    And I search member "<Entity Name>"
    And I click on "Add as Member to all Grid rows" action of header "Planned Membership" in non frame grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "<Entity Name>" under column header "Name"
      | name               | value                             |
      | Type               | <Type>                            |
      | Name               | <Entity Name>                     |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Legacy Market Area                |
      | Project Type       |                                   |
      | Current Membership | None                              |
      | State              | <State>                           |
      | Planned Membership | Member  <remove>                  |

  Examples:
    | Grid         | Entity Name     | Type            | State |
    | entitySelect | Project OMMP 1  | Opening Project | TX    |
    | entitySelect | Project OMMP 2  | Opening Project | TX    |
    | entitySelect | Project OMMP 3  | Opening Project | TX    |
    | entitySelect | Project OMMP 4  | Opening Project | TX    |
    | entitySelect | Project OMMP 5  | Opening Project | TX    |
    | entitySelect | Project OMMP 6  | Opening Project | TX    |
    | entitySelect | Project OMMP 7  | Opening Project | TX    |
    | entitySelect | Project OMMP 8  | Opening Project | TX    |
    | entitySelect | Project OMMP 9  | Opening Project | TX    |
    | entitySelect | Project OMMP 10 | Opening Project | TX    |
    | entitySelect | Project OMMP 11 | Opening Project | TX    |
    | entitySelect | Project OMMP 12 | Opening Project | TX    |
    | entitySelect | Project OMMP 13 | Opening Project | TX    |
    | entitySelect | Project OMMP 14 | Opening Project | TX    |
    | entitySelect | Site OMMP -19   | Site            | FL    |
    | entitySelect | Site OMMP -20   | Site            | FL    |


  Scenario Outline: As a delete user I verify Finished processing. Message is displayed "Finished processing Total Entities Modified: 16"
    And I click on Process Planned Membership button
    And I wait for "Total Entities Modified: <Total Memeber>" is visible
    And I see the following note on the "One Member Many Projects"
      | Finished processing |
    And I see the following note on the "One Member Many Projects"
      | Total Entities Modified: <Total Memeber> |
    And I see the following note on the "One Member Many Projects"
      | No Errors encountered |
    And I see the following note on the "One Member Many Projects"
      | * Added as member to <Total Memeber> entities |

  Examples:
    | Total Memeber |
    | 16            |


  Scenario Outline: As a delete user I Navigate to the 16 Entities listed above and make sure member "Member 1a Testing 15650" was added to all the 16 Entities.
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    And I verify a row from grid "BOGridMember" having unique value "Member abcz Testing 15658" under column header "Name"
      | name         | value                   |
      | Type         | Broker                  |
      | Name         | Member 1a Testing 15650 |
      | Title        | Delete Access           |
      | Phone        |                         |
      | Email        |                         |
      | Employer     | Selenium-Employer       |
      | Job Function | Delete Access           |
      | User Class   | Delete Access           |

    And I switch to default frame

  Examples:
    | Entity Name     |
    | Project OMMP 1  |
    | Project OMMP 2  |
    | Project OMMP 3  |
    | Project OMMP 4  |
    | Project OMMP 5  |
    | Project OMMP 6  |
    | Project OMMP 7  |
    | Project OMMP 8  |
    | Project OMMP 9  |
    | Project OMMP 10 |
    | Project OMMP 11 |
    | Project OMMP 12 |
    | Project OMMP 13 |
    | Project OMMP 14 |
    | Site OMMP -19   |
    | Site OMMP -20   |
