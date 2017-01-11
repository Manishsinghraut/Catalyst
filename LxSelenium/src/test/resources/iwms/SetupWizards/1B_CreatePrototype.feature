@all @smoke @smoke5
Feature: (Ref: JIRA ticket AUTOMATION-342) As an admin I should be able to create Prototype Wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    Then I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    And I click on the "Next" button
    Then I see the "<Grid Header>" modal window
    And I set these field values on editable page
      | name                          | value                 |
      | PrototypeName                 | <Entity Name>         |
      | AverageCostOfProject          | 5000                  |
      | CodeDefaultDistribCenterID    | Distribution Center A |
      | DefaultUsableArea             | 5000                  |
      | DefaultRentableArea           | 5000                  |
      | CodeBuildingAreaUnitID        | Square Feet           |
      | AverageDurationOfProject      | 12                    |
      | Description                   | Test-Description      |
      | Notes                         | Notes                 |
      | CodeDefaultConstructionTypeID | Brick                 |
      | _ManagerIDList_MemberID_add   | Administrator, Lx     |
      | CodeDefaultProjectTypeID      | <Project Type>        |

    And I click on the "Next" button
    And I select an option "<Folder Template>" from folder template list
    And I click on the "Next" button
    And I click on Assign Members button
    And I add following members
      | Access, Delete |
      | Access, Edit   |
    And I click on "Update  members to <Entity Name>" Button
    And I click on the "Finish Assigning Members" button
    Then I see the "Prototype Setup Wizard -> <Entity Name> -> Assign Members" modal window
    And I click on the "Finish" button
    Then I see that I am on the entity "Prototype: <Entity Name>"
    And I verify label and value on summary page
      | name                               | value                 |
      | Average Cost Of Project:           | $5,000.00             |
      | Default Distribution Center:       | Distribution Center A |
      | Default Usable Area:               | 5,000.00              |
      | Default Rentable Area:             | 5,000.00              |
      | Average Project Duration (months): | 12                    |
      | Default Project Type:              | <Project Type>        |
      | Default Construction Type:         | Brick                 |
      | Management                         | Lx Administrator      |
    #Issue exist hence not verifying these fields
    #      | Description                        | Test-Description           |
    #      | Notes                              | Test-Notes                 |
    And I verify description "Test-Description"
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
      | Broker      | Delete Access    |
      | Broker      | Edit Access      |
    And I click on the "Documents" tab
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |

    Examples:
      | Item      | Grid Header            | Entity Name                      | Folder Template          | Project Type   | Portfolio         |
      | Prototype | Prototype Setup Wizard | New Selenium Webdriver Prototype | Selenium Folder Template | Retail Project | Lucernex-Selenium |
