@all
Feature: (Ref : Jira Ticket No : Automation-903),Reporting on Schedules
#issue reported for this IWMS-20716
  Scenario Outline: I import file for Reporting on Schedules
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | CleanNovemberScheduleTemplate.xml |
      | s007903.xml                       |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I create report for schedules

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/31/2020 |
    And I click on the "Append Schedule Template" button
    And I navigate to the admin reports page
#    And I navigate to "Reports"
#    And I click on the " Create Report... "
    And I click " Create Report... " button
    And I switch to "report" child window
    And I see a page title "Step 1: A report about what?"
    And I select following radio by label names
      | Entity Filters |
    And I click on "Next>>" Button
    And I see a page title "Step 2: Geographical Filters"
    And I click on "Next>>" Button
    And I see a page title "Step 3: Select Data Group and Fields"
    And I expand the following
      | Available Fields  |
      | Schedule          |
      | Schedule Tasks    |
      | November Schedule |
      | Get permit        |
    And I drag and drop the following report fields
      | Forecast/Actual End Date   |
      | Forecast/Actual Start Date |
      | Task Status                |

#      | Baseline Start Date        |
    And I collapse the following
      | Get permit |
    And I expand the following
      | Submit required forms |

    And I drag and drop the following report fields
      | Forecast/Actual End Date   |
      | Forecast/Actual Start Date |
      | Task Status                |

    And I verify multiple selected values on editable page
      | name           | value                                              |
      | selectedFields | Get permit (Task Status)                           |
      | selectedFields | Get permit (Forecast/Actual Start Date)            |
      | selectedFields | Get permit (Forecast/Actual End Date)              |
      | selectedFields | Name (General Summary Information)                 |
      | selectedFields | Submit required forms (Task Status)                |
      | selectedFields | Submit required forms (Forecast/Actual Start Date) |
      | selectedFields | Submit required forms (Forecast/Actual End Date)   |

    And I click on "Next>>" Button
    And I see a page title "Step 4: Field Detail and Criteria"

    And I click on "edit" row action in the grid "BOGridCustomObjectDel" having the following header "Lx Default Name" and cell value "Get permit (Task Status)"
      | name                 | value      |
      | Field Name On Report | Get permit |
      | Data Type            | Dropdown   |
    And I set following fields value on editable page
      | name      | value                  |
      | LabelName | Get permit-Task Status |
    And I click on the "Update" button
    And I wait for modal window to close

    And I click on "edit" row action in the grid "BOGridCustomObjectDel" having the following header "Lx Default Name" and cell value "Get permit (Forecast/Actual Start Date)"
      | name                 | value      |
      | Field Name On Report | Get permit |
      | Data Type            | Date       |
    And I set following fields value on editable page
      | name      | value                                 |
      | LabelName | Get permit-Forecast/Actual Start Date |
    And I click on the "Update" button
    And I wait for modal window to close

    And I click on "edit" row action in the grid "BOGridCustomObjectDel" having the following header "Lx Default Name" and cell value "Get permit (Forecast/Actual End Date)"
      | name                 | value      |
      | Field Name On Report | Get permit |
      | Data Type            | Date       |
    And I set following fields value on editable page
      | name      | value                               |
      | LabelName | Get permit-Forecast/Actual End Date |
    And I click on the "Update" button
    And I wait for modal window to close

    And I click on "edit" row action in the grid "BOGridCustomObjectDel" having the following header "Lx Default Name" and cell value "Submit required forms (Task Status)"
      | name                 | value                 |
      | Field Name On Report | Submit required forms |
      | Data Type            | Dropdown              |
    And I set following fields value on editable page
      | name      | value                             |
      | LabelName | Submit required forms-Task Status |
    And I click on the "Update" button
    And I wait for modal window to close

    And I click on "edit" row action in the grid "BOGridCustomObjectDel" having the following header "Lx Default Name" and cell value "Submit required forms (Forecast/Actual Start Date)"
      | name                 | value                 |
      | Field Name On Report | Submit required forms |
      | Data Type            | Date                  |

    And I set following fields value on editable page
      | name      | value                                            |
      | LabelName | Submit required forms-Forecast/Actual Start Date |
    And I click on the "Update" button
    And I wait for modal window to close

    And I click on "edit" row action in the grid "BOGridCustomObjectDel" having the following header "Lx Default Name" and cell value "Submit required forms (Forecast/Actual End Date)"
      | name                 | value                 |
      | Field Name On Report | Submit required forms |
      | Data Type            | Date                  |
    And I set following fields value on editable page
      | name      | value                                          |
      | LabelName | Submit required forms-Forecast/Actual End Date |
    And I click on the "Update" button
    And I wait for modal window to close

    And I click on "Next>>" Button
    And I see a page title "Step 5: Choose filters (optional)"
    And I click on "Next>>" Button
    And I see a page title "Step 6: Choose Grouping and Sorting"
    And I click on "Next>>" Button
    And I see a page title "Step 7: Choose the view type and currency"
    And I set following fields value on editable page
      | name       | value       |
      | outputType | Spreadsheet |
    And I click on "Next>>" Button
    And I see a page title "Step 8: Layout the Report"
    And I prepare a report layout by the following fields
      | Name (Entity Name)(1x1)*                                                           |
      | Get permit-Task Status (Task Status)(1x1)                                          |
      | Get permit-Forecast/Actual Start Date (Forecast/Actual Start Date)(1x1)            |
      | Get permit-Forecast/Actual End Date (Forecast/Actual End Date)(1x1)                |
      | Submit required forms-Task Status (Task Status)(1x1)                               |
      | Submit required forms-Forecast/Actual Start Date (Forecast/Actual Start Date)(1x1) |
      | Submit required forms-Forecast/Actual End Date (Forecast/Actual End Date)(1x1)     |
    And I click on "Next>>" Button
    And I see a page title "Step 9: Modify and Save Report"
    And I set following fields value on editable page
      | name           | value         |
      | PageLayoutName | <Entity Name> |

    And I check radio by label name
      | name           | value                  |
      | IsGlobalReport | Everyone in my company |
    And I click on "Save and Run Report" Button
    And I verify a row from reports grid "popupBody" having the following header and cell value pair
      | name                                             | value         |
      | Name                                             | <Entity Name> |
      | Get permit-Task Status                           | Not begun     |
      | Get permit-Forecast/Actual Start Date            | 12/31/2020    |
      | Get permit-Forecast/Actual End Date              | 12/31/2020    |
      | Submit required forms-Task Status                | Not begun     |
      | Submit required forms-Forecast/Actual Start Date | 12/31/2020    |
      | Submit required forms-Forecast/Actual End Date   | 12/31/2020    |

    Examples:
      | Login User   | Login full username  | Entity Name | Template          |
      | DeleteAccess | Delete Access Access | s007903     | November Schedule |