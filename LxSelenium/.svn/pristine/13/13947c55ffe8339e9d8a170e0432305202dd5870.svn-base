Feature: I apply changes to a ProjectEntity via schedule templates

  Background:
    Given I login to IWMS using LxAdmin credentials

  Scenario: I setup my test data scaffolding by importing files
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/ManageScheduleTemplates/"
     And I import following files:
       | member.xml                |
       | construction-template.xml |
       | add-task.xml              |
       | assignees.xml             |
       | notifications.xml         |

  Scenario: I apply the Construction schedule template to a Capital Project
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/ManageScheduleTemplates/"
     And I navigate to "Capital Project, Schedule" entity
     And I navigate from left panel tree to "Lucernex-Capital_Project"
     And I click on the "Apply Template" action panel button
     And I see the "Apply Schedule Template" modal dialog
     And I see these fields in the modal dialog:
       | Schedule Template  |
       | startStopWhenRadio |
       | Start on ....      |
       | Finish on ....     |
    And I enter these field values in the modal dialog:
      | name               | value        |
      | Schedule Template  | Construction |
      | Start on ....      | Today        |
    And I click the "Append Schedule Template" button in the modal dialog
    And I wait for processing to finish with error "Gantt view not seen after clicking 'Append Schedule Template' button"

  Scenario: Update assignees via JobTitle
    When I navigate to the admin dashboard
     And I click on the "Manage Schedule Templates" link
     And I see these tabs:
       | Schedule Templates |
       | Template Details   |
       | Update Portfolio   |
     And I click on the "Template Details" admin page tab
     And I choose "assignees" schedule template on the Template Details admin page
     And I click on the "Leveling Task" task item on the Template Details admin page
     And I see the "Task Detail" modal dialog
     And I add "Chief Cook and Bottle Washer" to Auto-Assign by Job Titles
     And I click the "Update" button in the modal dialog
     And I click on the "Update Portfolio" link
     And I click on the "Update Assignees for not begun tasks?" checkbox on the Update Portfolio page
     And I click on the "<apply template>" link in the "Planned" column where "ProjectEntityName" column is "Lucernex-Capital_Project"
     And I click on the "Apply Template" button on the Update Portfolio page
     And I wait for the "Done" button on the Update Portfolio page
     And I click on the "Done" button on the Update Portfolio page
