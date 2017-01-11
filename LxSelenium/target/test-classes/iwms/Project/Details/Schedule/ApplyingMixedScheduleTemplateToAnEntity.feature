@all
Feature: Applying Mixed Schedule Template to an Entity (Ref : Jira Ticket No : AUTOMATION-1319)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | 10930_Project_1319.xml |
      | MixedTemplate_1319.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "Testing 1029 Schedule Template" and view the template in full template details tab
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "Inspections" from Schedule Template dropdown list
    And I verify the Days After Start "0" of Name "Energy Saving Panels" on Template Details tab
    And I verify the Days After Start "0" of Name "Reinforce Green layouts" on Template Details tab

    And I select "Revisions" from Schedule Template dropdown list
    And I click "Area Mapping" link "Template Details"
    And I verify Predecessor "Energy Saving Panels", Type "Finish-To-Start" and Lead/Lag Days "1"
    And I click "Close" button

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "Inspections" Template to 10930 Project entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value       |
      | taskTemplateIDToAssign | Inspections |
      | startDate              | 12/31/2020  |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I drag the vertical split bar to right
    And I verify the task name "Energy Saving Panels", status "Not begun", F/A Start is "12/31/2020" pluse 0 days,F/A End is "12/31/2020" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name   |
    | DeleteAccess | Delete Access Access | 10930 Project |


  Scenario Outline: As a delete user I verify the Predecessor task "Energy Saving panels" from template "Inspections" was successfully applied to a successor task "Area Mapping"" from a different template i.e "Revisions" on the same Entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | Revisions  |
      | startDate              | 12/31/2020 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Area Mapping" task
    And I verify the following fields value on editable page
      | name               | value      |
      | ActualDuration     | 1 day      |
      | ProjectedStartDate | 01/04/2021 |
      | ProjectedEndDate   | 01/04/2021 |
    And I click on "Predecessors" tab
    And I verify Predecessor "Energy Saving Panels", Type "Finish-To-Start" and Lead/Lag Days "1 day"
    And I click "Ok" button

    And I double click on "Energy Saving Panels" task
    And I verify the following fields value on editable page
      | name               | value      |
      | ActualDuration     | 1 day      |
      | ProjectedStartDate | 12/31/2020 |
      | ProjectedEndDate   | 12/31/2020 |
    And I click on "Successors" tab
    And I verify Predecessor "Area Mapping", Type "Finish-To-Start" and Lead/Lag Days "1 day"
    And I click "Ok" button
    And I drag the vertical split bar to right
    And I verify the task name "Energy Saving Panels", status "Not begun", F/A Start is "12/31/2020" pluse 0 days,F/A End is "12/31/2020" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"
    And I verify the task name "Area Mapping", status "Not begun", F/A Start is "01/04/2021" pluse 0 days,F/A End is "01/04/2021" pluse 0 days, F/A Duration "1 day", BL Start "01/04/2021" and BL End "01/04/2021"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   |
    | DeleteAccess | Delete Access Access | 10930 Project |

