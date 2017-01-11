@all
Feature: (Ref : Jira Ticket No : Automation-995), Editing Task info from Task bars on Gantt view - Continued

  Scenario Outline: Precondition: I import file for  Editing Task info from Task bars on Gantt view - Continued

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | TaskBarEdit-995.xml |
      | TaskFolders.zip     |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify The secondary pop-up will close and the file will successfully populate in the folder tree pop-up. Refer to screenshot "8. File uploaded".
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Members/Contacts" tab
    And I verify the following values in frame grid "BOGridMember"
      | Type   | Name                 | Title         | Phone        | Email              | Employer | Job Function         | User Class    |
      | Broker | Delete Access Access | Delete Access | 456.236.3698 | svcQA@lucernex.com | Lucernex | System Administrator | Delete Access |
    And I click on the "Documents" tab
    And I switch to visible frame
    And I expand the following
      | example |

    And I select the following
      | example |
      | a       |
      | b       |

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I verify the following values in frame grid "<Grid ID>"
      | Task Name             |
      | Get permit            |
      | Submit required forms |
      | Start construction    |
      | Find contractor       |
      | Submit proposal       |
      | Prepare proposal      |
      | Submit draft          |

    And I Right click on the 1 "st" blue bar "<Task Name>" task on the bar graph/timeline and click "Task information..." to edit the task
    And I click on "Documents" tab in the popup window of edit task
    And I click "Add" button
    And I open document upload window
    And I select the following folders
      | example |
    And I attach following schedule document files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates":
      | Attachment.txt |
    And I click on file "Attachment.txt" link
    And I switch to visible frame
#    And I click on Ok button from file upload popup window
    And I click "Ok" button
    And I Right click on the 1 "st" blue bar "<Task Name>" task on the bar graph/timeline and click "Task information..." to edit the task
    And I click on "Documents" tab in the popup window of edit task
    And I verify the following text in a page
      | Attachment.txt |
    And I click on the "Cancel" button


    Examples:
      | Login User   | Login full username  | Entity Name     | Grid ID           | Task Name             |
      | DeleteAccess | Delete Access Access | TaskBarEdit-995 | ^Lx-ui-GanttPanel | Submit required forms |

  Scenario Outline: As a delete user I verify A line item will populate that will list: Alert, Date Due, Name, Details, and the Alert Date. Refer to screenshot "16. Alert populated".
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I Right click on the 2 "nd" blue bar "<Task Name>" task on the bar graph/timeline and click "Task information..." to edit the task
    And I click on "Notifications" tab in the popup window of edit task
    And I click on "<<Add Notify>>" link
    And I switch to default frame
    And I set following fields value on editable page
      | name                         | value                                                  |
      | NotifyName                   | Forecast Change                                        |
      | AlertType                    | Forecast End Date Change Notification                  |
      | EMailMessage                 | Forecast end date has changed while testing 995 ticket |
      | _checkbox_EnableForDashboard | true                                                   |
      | _checkbox_EnableForEMail     | true                                                   |
      | availMemberIDList            | Access, Delete Access                                  |
    And I click on ">>" Button
    And I click on the "Update" button
    And I switch to visible frame
    And I click on "Save Notifications" Button
    And I click on "General" tab in the popup window of edit task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I wait for the loading text to be disappear
    And I verify blue bar "Not Present" at position "4"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     | Alert Grid ID | Task Name             |
    | DeleteAccess | Delete Access Access | TaskBarEdit-995 | AlertList     | Submit required forms |


  Scenario Outline: As a delete user I verify A line item will populate that will list: Alert
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to "Dashboard"
    And I close alert
    And I expand portfolio navigation tab
    And I Drag and Drop module "My Alerts"
#    And I click on "Get Notifications alerts" link
    And I click on get notifications alerts link
    And I verify the following values in non frame grid "<Alert Grid ID>"
      | Alert           | Date Due       | Name                     | Alert Date     | Details                                                                      |
      | Forecast Change | [Today's Date] | Location:TaskBarEdit-995 | [Today's Date] | Task: Find contractor:Forecast end date has changed while testing 995 ticket |

    And I close alert


    Examples:
      | Login User   | Login full username  | Entity Name     | Alert Grid ID | Task Name             |
      | DeleteAccess | Delete Access Access | TaskBarEdit-995 | AlertList     | Submit required forms |
