@all
Feature: Upload custom list values in Project> Details> Forms page (Jira Ref.AUTOMATION-525)

  Scenario Outline: Import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | Add_line_items.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I upload form details
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to "<Item>, <Second Level Tab>"
    And I navigate to entity "<Entity Name>"
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
#    And I click " Add Form... " form button
    And I click " Add Form... " button
    And I switch to default frame
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I click on the "Upload Data" button "from added custom list window"
    And I Download Sample CustomList Template
    And I Upload following Custom List Values "Data/ImportDataFiles/iwms/Project/Details/":
      | CustomList.xls |
    And I verify spreed sheet imported Fields that are not editable will not appear in the UI.
    And I click on the "Add"

    Examples:
      | Item    | Second Level Tab | Third Level Tab | Entity Name      | Form Type      | Login User   | Login full username  |
      #| Project | Details          | Forms           | Lucernex-Project | Form for Custom List | DeleteAccess | Delete Access Access |
      | Project | Details          | Forms           | Lucernex-Project | Add line items | DeleteAccess | Delete Access Access |