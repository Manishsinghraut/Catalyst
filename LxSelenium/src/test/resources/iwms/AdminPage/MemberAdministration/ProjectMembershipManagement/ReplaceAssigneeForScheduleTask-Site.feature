@all
Feature: (AUTOMATION-1279) Replace Assignee for Schedule task (Site)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario: Pre-Conditions
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/"
    And I import following files:
      | TwoAssignees-1279.xlsx |
      | ReplaceSites-1279.xml  |

  Scenario Outline: Navigate to ReplaceSiteA-1259 and ReplaceSiteB-1259 entities and add AssigneeOne 1259 to task Submit required forms
    When I navigate to entity type "Sites" named "<Site>" through search option
    And I click on the "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name       | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Team Member | <Member 1> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |
    And I verify all rows count "1" in the frame grid "BOGridMember"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Submit required forms" task
    Then I click on "Assignees" tab in the popup window of edit task
    And I click "Add new" button
    And I enter task name "<Member 1>"
    And I click "Ok" button
    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name             | Assignees  |
      | Get permit            |            |
      | Submit required forms | <Member 1> |
      | Start construction    |            |
      | Find contractor       |            |
      | Submit proposal       |            |
      | Prepare proposal      |            |
      | Submit draft          |            |


    Examples:
      | Member 1         | Site              |
      | AssigneeOne 1259 | ReplaceSiteA-1259 |
      | AssigneeOne 1259 | ReplaceSiteB-1259 |

  Scenario Outline: Replace member from entities
    When I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" link
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                        | value             |
      | removeFromReplacedEntitites | false             |
      | promoteReplacee             | false             |
      | memberID                    | 1259, AssigneeOne |
      | replaceWithMemberID         | 1259, AssigneeTwo |

    And I click on "Next" Button
    And I verify the following message
      | Replacing <Member 1> with <Member 2> in selected entities |
      | Only show entities that will have a change in membership  |

    And I verify all rows count "2" in the non frame grid "entitySelect"
    And I verify the following values in non frame grid "entitySelect"
      | Type | Name              | Portfolio/Program | Parent Region | Sub Region | Market    | Project Type | Current Membership | Planned Membership |
      | Site | ReplaceSiteA-1259 | Lucernex-Selenium | Dallas        |            | Anchorage |              | Member             | Member  <replace>  |
      | Site | ReplaceSiteB-1259 | Lucernex-Selenium | Dallas        |            | Anchorage |              | Member             | Member  <replace>  |

    And I click "<replace link>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value             |
      | Type | Site              |
      | Name | ReplaceSiteB-1259 |

    And I click "<replace link>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value             |
      | Type | Site              |
      | Name | ReplaceSiteA-1259 |


    And I verify the following values in non frame grid "entitySelect"
      | Type | Name              | Portfolio/Program | Parent Region | Sub Region | Market    | Project Type | Current Membership | Planned Membership       |
      | Site | ReplaceSiteA-1259 | Lucernex-Selenium | Dallas        |            | Anchorage |              | Member             | Replace  <don't replace> |
      | Site | ReplaceSiteB-1259 | Lucernex-Selenium | Dallas        |            | Anchorage |              | Member             | Replace  <don't replace> |

    And I click on "Process Planned Membership" Button
    And I verify the following message
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |
      | Replacing <Member 1> with <Member 2>                                                                 |
      | Finished processing                                                                                  |
      | Total Entities Modified: 2                                                                           |
      | No Errors encountered                                                                                |
      | * Replaced in 2 entities                                                                             |
      | Details:                                                                                             |
      | * Task Assignee changes: Added 2 records Deleted 2 records                                           |

    Examples:
      | Member 1         | Member 2         | replace link |
      | AssigneeOne 1259 | AssigneeTwo 1259 | <replace>    |

  Scenario Outline: Navigate to ReplaceSiteA-1259 and ReplaceSiteB-1259 entities and verify  AssigneeTwo 1259 to task Submit required forms
    When I navigate to entity type "Sites" named "<Site>" through search option
    And I click on the "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type        | Name       | Title         | Phone | Email | Employer          | Job Function  | User Class    |
      | Team Member | <Member 1> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |
      | Team Member | <Member 2> | Delete Access |       |       | Selenium-Employer | Delete Access | Delete Access |
    And I verify all rows count "2" in the frame grid "BOGridMember"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Submit required forms" task
    And I click on "Assignees" tab in the popup window of edit task
    Then I verify the following assignees present in Edit task information pop up of entity "<Site>"
      | <Member 2> |
    And I verify the following assignees not present in Edit task information pop up of entity "<Site>"
      | <Member 1> |
    And I click "Ok" button
    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name             | Assignees  |
      | Get permit            |            |
      | Submit required forms | <Member 2> |
      | Start construction    |            |
      | Find contractor       |            |
      | Submit proposal       |            |
      | Prepare proposal      |            |
      | Submit draft          |            |


    Examples:
      | Member 1         | Member 2         | Site              |
      | AssigneeOne 1259 | AssigneeTwo 1259 | ReplaceSiteA-1259 |
      | AssigneeOne 1259 | AssigneeTwo 1259 | ReplaceSiteB-1259 |