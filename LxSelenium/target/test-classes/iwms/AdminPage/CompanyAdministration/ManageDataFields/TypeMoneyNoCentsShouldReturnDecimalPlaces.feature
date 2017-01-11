@all
Feature: Type_Money_NoCents should return Decimal places (Jira Ref. AUTOMATION-1345)

  Scenario Outline: As a delete user I Import the following  files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | Portfolio__Sprint_16_1345.xml |
      | Location_Sprint_16_1345.xml   |
      | 15310Page_Layouts_1345.xml    |
      | 15310_Project_1345.xml        |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario: As a delete user I verify The NetValue field should have Global form field type set to "sType_Money_NoCENTS", so it should not displays any value for cents.
    And I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
#    And I expand the "Contract"
#    And I expand the "Sales"
    And I expand the the following data fields group
      | Contract |
      | Sales    |
    And I click "edit" for field "NetValue"
    And I switch to "Manage data fields" child window
    And I verify the following fields value on editable page
      | name                | value               |
      | GlobalFormFieldType | sTYPE_MONEY_NOCENTS |
    And I close the "Manage data fields" child window
    And I switch to main window

  Scenario Outline: As a delete user I verify The field NetValue should only display the dollar amount 3456.It should not display the .75 cents as field was set to sType_Money_NoCENTS"
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                   | value   |
      | ProjectEntity_NetValue | 3456.75 |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify the field "NetValue" has "$3,456"
    And I switch to default frame

  Examples:
    | Entity Name   | Second Level Tab |
    | 15310 Project | Details          |