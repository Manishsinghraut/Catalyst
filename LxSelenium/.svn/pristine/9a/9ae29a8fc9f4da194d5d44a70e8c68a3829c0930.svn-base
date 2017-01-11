@all
Feature: In Line editing of Gantt View (Ref : Jira Ticket No : AUTOMATION-884)

  Scenario Outline: I import file for apply schedule template and S010 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details"
    And I import following file name:
      | NovemberScheduleTemplate.xml |
      | S010.xml                     |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user the value for the group and the task will change to "50" and the status will automatically change to "in-process".
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 01/01/2020 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the bar graph all the way to the right to show more details for groups and tasks
    And I double click the % Done field for "Submit required forms" task to bring up in-line editing and enter "50%" in Done field
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Submit required forms" task has to change the status will automatically change to "In-process"
    And I switch to default frame
  Examples:
    | Template          | Login User   | Login full username  | Entity Name | Item     |
    | November Schedule | DeleteAccess | Delete Access Access | s010        | Location |


  Scenario Outline: As a delete user The status for the group and the task will return back to "Not begun"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the bar graph all the way to the right to show more details for groups and tasks
    And I double click the % Done field for "Submit required forms" task to bring up in-line editing and enter "0" in Done field
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Submit required forms" task has to change the status will automatically change to "Not begun"
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name | Item     |
    | DeleteAccess | Delete Access Access | s010        | Location |

  Scenario Outline: As a delete user The group and the task will both be updated with the year as "2021" for both F/A Start and F/A End.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the bar graph all the way to the right to show more details for groups and tasks
    And I double click the F/A Start field for "Submit required forms" task to bring up in-line editing and change the year to "01/01/2021"
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Submit required forms" task has to change the year as "01/01/2021" for both F/A Start and F/A End
    And I switch to default frame

  Examples:
   | Login User   | Login full username  | Entity Name | Item     |
   | DeleteAccess | Delete Access Access | s010        | Location |

  Scenario Outline: As a delete user The F/A End for both the group and task will change to 2021 and the F/A Duration will change to reflect the duration between the start and end date
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the bar graph all the way to the right to show more details for groups and tasks
    And I double click the F/A End field for "Submit required forms" task to bring up in-line editing and change the year to "01/01/2020"
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Submit required forms" task has to change the year as "01/01/2021" for F/A End
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Item     |
    | DeleteAccess | Delete Access Access | s010        | Location |


  Scenario Outline: As a delete user The The comment will populate successfully
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the bar graph all the way to the right to show more details for groups and tasks
    And I double click the comments field for "Submit required forms" task to bring up in-line editing and add "This is test comments"
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify "Submit required forms" task has to populate the "This is test comments" comment successfully
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Item     |
    | DeleteAccess | Delete Access Access | s010        | Location |