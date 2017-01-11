@all
Feature: ReplaceSwitch Members  Replace Member - WORKFLOW (Ref : Jira Ticket No : AUTOMATION-1283)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/WorkFlow/"
    And I import following file name:
      | WFMembers_1283.xlsx |
      | FormforST_1283.xml  |
      | ReplaceWF_1283.xml  |
      | WFRProject_1283.xml |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "WFRProject" and add "WFMemberOne 1263" as the assignee, approver, and notifee to the first step of "ReplaceWF"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
#    And I expand all form lists
    And I click " Expand All " button
    And I click on "edit" link of step "KickOff Step" in work flow
    And I switch to default frame

    And I add following project members
      | 1263, WFMemberOne |
    And I add following Approver Member List
      | 1263, WFMemberOne |
    And I add following Notifiee members
      | 1263, WFMemberOne |
    And I click "Update" button

  Examples:
    | Login User   | Login full username  | Entity Name | Third Level Tab | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | WFRProject  | Work Flow       | BOGridMember | Replace Remove Member 1 Testing 1264 |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab
    And I set following fields value on editable page
      | name                        | value             |
      | memberID                    | 1263, WFMemberOne |
      | removeFromReplacedEntitites | false             |
      | replaceWithMemberID         | 1263, WFMemberTwo |
      | promoteReplacee             | false             |
      | memberEditMode              | edit              |
    And I click on Next button on "Replace / Switch Members tab"
    And I click on the "replace" row action of column "WFRProject" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "WFRProject" under column header "Name"
      | name               | value                             |
      | Type               | Opening Project                   |
      | Name               | WFRProject                        |
      | Portfolio/Program  | Lucernex-Selenium                 |
      | Parent Region      | Central(Central region - preOpen) |
      | Sub Region         |                                   |
      | Market             | Central                           |
      | Project Type       |                                   |
      | Current Membership | Member                            |
      | Planned Membership | Replace                           |

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 1" is visible
    And I wait for "Replacing WFMemberOne 1263 with WFMemberTwo 1263" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 1 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 1 entity |

    And I see the following note on the "Replace / Switch Members"
      | * Work Flow Step Notifiee changes: Added 1 record Deleted 1 record |

    And I see the following note on the "Replace / Switch Members"
      | * Work Flow Step Assignee changes: Added 1 record Deleted 1 record |

    And I see the following note on the "Replace / Switch Members"
      | * Work Flow Step Approver changes: Added 1 record Deleted 1 record |


  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate back to "WFRProject" -> Work flow tab and expand the workflow.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
#    And I expand all form lists
    And I click " Expand All " button
    And I verify project members "WFMemberTwo 1263" of step "KickOff Step" in work flow
    And I verify Approver Member "WFMemberTwo 1263" of step "KickOff Step" in work flow
    And I verify Notifiee members "WFMemberTwo 1263" of step "KickOff Step" in work flow
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Third Level Tab | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | WFRProject  | Work Flow       | BOGridMember | Replace Remove Member 1 Testing 1264 |
