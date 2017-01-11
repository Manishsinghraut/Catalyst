@all
Feature: Only showing members with a change in membership - PMM Info should not disappear on subsequent pages (Ref : Jira Ticket No : AUTOMATION-1308)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following file name:
      | Member_Test_15658__1308.xlsx |
      | 15658Entity20_1308.xml       |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "One Member Many Projects" tab
    And I set following fields value on editable page
      | name           | value                      |
      | memberID       | Testing 15658, Member abcz |
      | memberEditMode | edit                       |

    And I click on Next button on "One Member Many Projects tab"
    And I wait for "Adding/removing Member abcz Testing 15658 in selected entities" is visible

    And I click "Set Filters.." button
    And I set following fields value on editable page
      | name                    | value |
      | peSecInc_Program        | false |
      | peInc_Location          | false |
      | peInc_Project           | true  |
      | peInc_Contract          | false |
      | peSecInc_CapitalProgram | false |
      | peInc_Parcel            | false |
      | peInc_Facility          | false |
      | peSecInc_Prototype      | false |
      | peInc_PotentialProject  | true  |
      | peInc_CapitalProject    | false |
    And I click "Apply Filters" button

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify the Projects and Sites entities should be displayed and Click on Member for each of the entities

#    And I search member "<Entity Name>"
    And I click on the "Member" row action of column "<Entity Name>" of column "1" from grid "<Grid>"
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

  Examples:
    | Grid         | Entity Name    | Type            |
    | entitySelect | Project PMM 1  | Opening Project |
    | entitySelect | Project PMM 2  | Opening Project |
    | entitySelect | Project PMM 3  | Opening Project |
    | entitySelect | Project PMM 4  | Opening Project |
    | entitySelect | Project PMM 5  | Opening Project |
    | entitySelect | Project PMM 6  | Opening Project |
    | entitySelect | Project PMM 7  | Opening Project |
    | entitySelect | Project PMM 8  | Opening Project |
    | entitySelect | Project PMM 9  | Opening Project |
    | entitySelect | Project PMM 10 | Opening Project |
    | entitySelect | Project PMM 11 | Opening Project |
    | entitySelect | Project PMM 12 | Opening Project |
    | entitySelect | Project PMM 13 | Opening Project |
    | entitySelect | Project PMM 14 | Opening Project |
    | entitySelect | Project PMM 15 | Opening Project |
    | entitySelect | Project PMM 16 | Opening Project |
    | entitySelect | Project PMM 17 | Opening Project |
    | entitySelect | Project PMM 18 | Opening Project |
    | entitySelect | Site PPM -19   | Site            |
    | entitySelect | Site PPM -20   | Site            |


  Scenario Outline: As a delete user I verify only changed entities listed should be displayed
    And I set following fields value on editable page
      | name         | value |
      | showModified | true  |
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
      | Planned Membership | Member  <remove>                  |

  Examples:
    | Grid         | Entity Name    | Type            |
    | entitySelect | Project PMM 1  | Opening Project |
    | entitySelect | Project PMM 2  | Opening Project |
    | entitySelect | Project PMM 3  | Opening Project |
    | entitySelect | Project PMM 4  | Opening Project |
    | entitySelect | Project PMM 5  | Opening Project |
    | entitySelect | Project PMM 6  | Opening Project |
    | entitySelect | Project PMM 7  | Opening Project |
    | entitySelect | Project PMM 8  | Opening Project |
    | entitySelect | Project PMM 9  | Opening Project |
    | entitySelect | Project PMM 10 | Opening Project |
    | entitySelect | Project PMM 11 | Opening Project |
    | entitySelect | Project PMM 12 | Opening Project |
    | entitySelect | Project PMM 13 | Opening Project |
    | entitySelect | Project PMM 14 | Opening Project |
    | entitySelect | Project PMM 15 | Opening Project |
    | entitySelect | Project PMM 16 | Opening Project |
    | entitySelect | Project PMM 17 | Opening Project |
    | entitySelect | Project PMM 18 | Opening Project |
    | entitySelect | Site PPM -19   | Site            |
    | entitySelect | Site PPM -20   | Site            |


  Scenario Outline: As a delete user I verify Finished processing. Message is displayed "Finished processing Total Entities Modified: 20"
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
    | 20            |

  Scenario Outline: As a delete user I verify the Member "Member abczTesting 15658" should be successfully be added to all the above listed entities
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "BOGridMember" having unique value "Member abcz Testing 15658" under column header "Name"
      | name         | value                     |
      | Type         | Broker                    |
      | Name         | Member abcz Testing 15658 |
      | Title        | Delete Access             |
      | Phone        |                           |
      | Email        |                           |
      | Employer     | Selenium-Employer         |
      | Job Function | Delete Access             |
      | User Class   | Delete Access             |

    And I switch to default frame

  Examples:
    | Entity Name    | Third Level Tab  |
    | Project PMM 11 | Members/Contacts |
