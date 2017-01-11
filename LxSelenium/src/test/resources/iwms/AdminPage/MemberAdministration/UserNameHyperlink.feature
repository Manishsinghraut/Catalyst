@all
Feature: (AUTOMATION-1024 )User Name Hyperlink

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: I create/update contacts through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | UserNameHyperLink-1024.xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Summary" tab
    And I wait for the Loading text to disappear
    And I click on "<Member Name>" link
    And I switch to default frame
    And I see the "Member Info" modal window
    And I verify the following details in non editable summary page in non frame grid
      | name         | value         |
      | Member Name  | <Member Name> |
      | Member Title | Delete Access |

    And I click on the "Close" button

    And I click on the "Members/Contacts" tab
    And I wait for the Loading text to disappear
    And I click on "<Member Name>" link
    And I switch to default frame
    And I see the "Member Info" modal window
    And I verify the following details in non editable summary page in non frame grid
      | name         | value         |
      | Member Name  | <Member Name> |
      | Member Title | Delete Access |

    And I click on the "Close" button

    Examples:
      | Member Name          | Entity Name                 |
      | Delete Access Access | User Name Hyper Link - 1024 |
