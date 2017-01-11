@all
Feature: (Ref : Jira Ticket No : AUTOMATION-897) Appending Multiple (Standalone) Schedule Templates with Start On/Finish On dates to an Entity

  Scenario Outline: I import file for apply schedule template and Multiple Stand Alone location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | MultipleStandAlone.xml |
      | FrameWorks.xml         |
      | Roofing.xml            |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Appending Multiple (Standalone) Schedule Templates with Start On/Finish On dates to an Entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/31/2020 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    Then I verify the task "Framing Task 2" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Framing Task A" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Structural Task A" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Structural Task B" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I switch to default frame
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | Roofing    |
      | startDate              | 11/30/2021 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    Then I verify the task "Framing Task 2" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Framing Task A" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Structural Task A" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I verify the task "Structural Task B" of F/A start date "12/31/2020" ,F/A end date "12/31/2020", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    Then I verify the task "Struts I" of F/A start date "11/30/2021" ,F/A end date "11/30/2021", BL start date "11/30/2021" and BL end date "11/30/2021" shall be reflected correctly on spreed sheet
    Then I verify the task "Struts II" of F/A start date "11/30/2021" ,F/A end date "11/30/2021", BL start date "11/30/2021" and BL end date "11/30/2021" shall be reflected correctly on spreed sheet
    Then I verify the task "Joist 1" of F/A start date "11/30/2021" ,F/A end date "11/30/2021", BL start date "11/30/2021" and BL end date "11/30/2021" shall be reflected correctly on spreed sheet
    Then I verify the task "Joist 11" of F/A start date "11/30/2021" ,F/A end date "11/30/2021", BL start date "11/30/2021" and BL end date "11/30/2021" shall be reflected correctly on spreed sheet
    And I switch to default frame

  Examples:
    | Template    | Login User   | Login full username  | Entity Name          |
    | Frame Works | DeleteAccess | Delete Access Access | Multiple Stand alone |
