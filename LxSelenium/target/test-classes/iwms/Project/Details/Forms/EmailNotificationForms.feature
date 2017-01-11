@all
Feature: Email Notifications- Forms (Ref : Jira Ticket No : Automation-754)

  Scenario Outline: As a delete user I can able to add custom list to form layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Forms/"
    And I import following file name:
      | EmailNotificationContract.xml |
      | EmailForm.xml                 |
     #| Update_Member_SS.xls          |
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value                 |
      | Name | <Login full username> |
    And I set following fields value on editable page
      | name   | value              |
      | EMail1 | svcQA@lucernex.com |
    And I click on the "Update" button
    And I wait for modal window to close


    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I add form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I click on the "Forms" tab
    Then I verify user is directed to "Forms" tab
    Then I wait for the Loading text to disappear
#    And I click "Add Item" form button
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I see a modal window
    And I select form type "<Email Form layout>" in modal window
    And I click on the "OK" button
    And I add following persons
      | Access, Delete Access |
    And I click on the "Add" button
    Then I verify user is directed to "Forms" tab
    And I check for complete frame 'loading...'
    And I verify message "Email Form item successfully added, email successfully sent"
#    And I verify a row from reports grid "issueMainDiv" having the following header and cell value pair
#      | name      | value                 |
#      | Form Type | <Email Form layout>   |
#      | Creator   | <Login full username> |
#      | Title     | Today's Date          |
#      | Days Open | 0                     |
#      | # Replies | 0                     |

    And I verify the following values in frame grid "issueMainDiv"
      | Title          | Days Open | Due Date | Assignees | Form Type           | Creator               | Last Reply | # Replies |
      | [Today's Date] | 0         |          |           | <Email Form layout> | <Login full username> |            | 0         |

    Examples:
      | Entity Name                 | Login User   | Login full username  | Email Form layout |
      | Email notification contract | DeleteAccess | Delete Access Access | Email Form layout |


  Scenario Outline: I verify Email should be received for members in the "Attention Email to" column
#    Given I login to web mail as "<Username>" user and password "<Password>"
    Given I login to web mail on existing window
    And I search for the mail using subject "[LxRetail] Email Form: [CURRENT DATE] (Email notification contract)"
    And I check mail body for the following contents
      | This Email Form item has been entered in LxRetail.\nClick on the link below to view the Email Form details. |
      #This is environment dependent
#      | https://TEST.lucernex.com/redir.jsp?fiID=                                                                   |
      | Author: Delete Access Access                                                                                |
      | Contract: "Email notification contract"                                                                     |
      | No Assignees                                                                                                |

    And I click application link within the mail body
    And I switch to lucernex application window
    Then I verify user is directed to "Forms" tab
    And I close lucernex window
    And I close mail window
    And I switch to main window

    Examples:
      | Username           | Password  |
      | svcQA@lucernex.com | Zsb5lFs0u |