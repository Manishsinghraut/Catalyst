@all
Feature: (Ref : Jira Ticket No : Automation-499) As a delete user I can able to preserve global pages for Capital project

  Scenario Outline: As a delete user I can able to preserve global pages for Capital project
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Capital Projects" named "<Entity Name>" through search option
    And I verify the following details in non editable summary page in frame grid
      | General Information |                          |
      | Name                | Lucernex-Capital_Project |
      | Store Number        | Portfolio                |
      | Region              | Market Area              |
      | Prototype           | Project Type             |

    And I click on the "Link" action panel button
    And I fetch and store top menu link
    And I see the "Links to this page" modal window
    And I click on the "Close" button
    And I wait for modal window to close
    And I navigate to the admin dashboard
    And I click on "Manage Top Menu" link
    And I expand the following
      | <Entity Type> |
      | Details       |
      | Summary       |
    And I right click on menu "Summary"
    And I click on the menu "Add Menu Item"
    Then I wait for modal window to open
    And I add menu item of name "<Page Name>"
    And I click on the "Submit" button
    And I wait for modal window to close
    And I verify menu item in a page
      | value       |
      | <Page Name> |

    Examples:
      | Login User   | Login full username  | Entity Type     | Page Name            | Entity Name              |
      | DeleteAccess | Delete Access Access | Capital Project | Capital Project Copy | Lucernex-Capital_Project |

  Scenario Outline: I import file for  preserve global pages for Capital Project
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/PreserveGlobalPages/"
    And I import following file name:
      | Preserve_Capital_Project_Global_Pages.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify global pages of Capital Project
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Capital Projects" named "<Entity Name>" through search option
    And I select an option "<Page Layout>"
    And I switch to visible frame
    And I verify the following text not present
      | <Entity Name> |
    And I select an option "<Page Name>"
    And I verify the following details in non editable summary page in frame grid
      | General Information |                          |
      | Name                | Lucernex-Capital_Project |
      | Store Number        | Portfolio                |
      | Region              | Market Area              |
      | Prototype           | Project Type             |

    Examples:
      | Login User   | Login full username  | Entity Name              | Page Name            | Page Layout                           |
      | DeleteAccess | Delete Access Access | Lucernex-Capital_Project | Capital Project Copy | Preserve Capital project Global Pages |