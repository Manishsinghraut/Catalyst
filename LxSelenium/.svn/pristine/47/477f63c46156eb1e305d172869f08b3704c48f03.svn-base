@all

Feature: (Ref : Jira Ticket No : Automation-586) As a delete user I can Able to select Predecessor from another schedule template

  Scenario Outline: I import file to select Predecessor from another schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Add_Predecessor_From_This.xml |
      | Add_Predecessor_To_This.xml   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can Able to select Predecessor from another schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template 1>" from the list
    And I click on "<Task>" link
    Then I wait for modal window to open
    And I set following fields value on editable page
      | name                   | value |
      | RadioPredecessorTaskID | true  |
    And I click '+ Add' button to add line items
    And I set list fields values on editable page
      | name                                    | value           |
      | TaskPredecessor_PredecessorTaskIDOrName | <Predecessor>   |
      | TaskPredecessor_CodeTaskLeadLagTypeID   | Finish-To-Start |

    And I set spin fields values on editable page
      | name        | value |
      | numberfield | 3     |
    And I click "Update" button
    And I click on the "Update" button
    Then I see "Successfully updated Task Item" message in the grid


    Examples:
      | Template 1              | Template 2                | Task                 | Predecessor      | Login User   | Login full username  |
      | Add Predecessor To This | Add Predecessor From This | Test Add Predecessor | Predecessor Task | DeleteAccess | Delete Access Access |