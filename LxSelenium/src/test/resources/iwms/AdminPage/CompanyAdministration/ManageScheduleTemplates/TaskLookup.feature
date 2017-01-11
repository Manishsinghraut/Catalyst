@all

Feature: (Ref : Jira Ticket No : Automation-585) As a delete user I can able to look up task

  Scenario Outline: I import file for task look up
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Task_Look_Up.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can apply schedule template to an entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Project" named "Lucernex-Project"
    And I click on the "Schedule" tab
    And I wait for the Loading text to disappear
    And I click on the "Apply Template" action panel button
    And I wait for modal window to open
    And I see the "Apply Schedule Template" modal window
    And I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startDate              | 07/01/2015          |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I verify text value in a page
      | value   |
      | <Group> |
      | <Task>  |

    Examples:
      | Schedule Template | Group              | Task              | Login User   | Login full username  |
      | Task Lookup       | Task Lookup Group1 | Task Lookup Task1 | DeleteAccess | Delete Access Access |

  Scenario Outline: I rename task and group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Task_Look_Up_Rename.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can re apply schedule template to an entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Project" named "Lucernex-Project"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    And I wait for modal window to open
    And I see the "Apply Schedule Template" modal window
    And I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startDate              | 07/01/2015          |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I verify text value in a page
      | value          |
      | <Group>        |
      | <Task>         |
      | <Group Update> |
      | <Task Update>  |

    Examples:
      | Schedule Template | Group              | Group Update              | Task              | Task Update              | Login User   | Login full username  |
      | Task Lookup       | Task Lookup Group1 | Task Lookup Group1 Update | Task Lookup Task1 | Task Lookup Task1 Update | DeleteAccess | Delete Access Access |