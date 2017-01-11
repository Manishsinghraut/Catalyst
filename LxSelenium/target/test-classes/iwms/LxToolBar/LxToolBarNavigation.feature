@all @smoke
Feature: Navigate through the Lx Tool Bar on the top right of the page.

  Background:
    Given I login to IWMS using LxAdmin credentials

  Scenario Outline: Navigation through non-entities via comma delimited strings
    When I navigate to "<1st-level>, <2nd-level>,<3rd-level>"
    Then I see that I am on the third level tab "<expected-loc>"

    Examples:
      | 1st-level | 2nd-level                 | 3rd-level         | expected-loc      |
      | Tools     | My Options                |                   | My Options        |
      #| Reports   |                           |                   | Saved Reports     |
      | Calendar  | Week                      |                   | Week              |
      | Calendar  | Month                     |                   | Month             |
      | Admin     | Manage Schedule Templates | Template Details  | Template Details  |
      | Admin     | Manage Forms              |                   | Manage Forms      |

  Scenario Outline: Navigation to pop up windows
    When I navigate to "<1st-level>, <2nd-level>"
    Then I see the "<expected-window>" modal window

    Examples:
      | 1st-level | 2nd-level       | expected-window |
      | Tools     | Advanced Search | Advanced Search |
      | Tools     | Setup Wizards   | Setup Wizard    |

  Scenario: Testing no comma in navigation function
    When I navigate to "Tools"
    Then I see the Lx Tools dropdown

  Scenario: Testing no comma navigation to Reports
    When I navigate to "Reports"
    Then I see that I am on the third level tab "Saved Reports"