@all
Feature: (JIRA - Automation-941) As a Lx Admin I set security access. This feature file should be executed before all the delete accrual tcs

  Scenario Outline: As a Lx Admin I set security access

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Security" link
    And I select user class "Delete Access"
    And I expand the following folders
      | Administration   |
      | Dashboard        |
      | Manage Contracts |

    And I select security access for the following
      | Delete Accrual Payment | Delete |
    And I click on "Apply Changes" Button

    And I click on the "Field Security" link
    And I select user class "Delete Access"
    And I expand the following folders
      | Summary Information  |
      | Summary Page Buttons |
    And I select security access for the following
      | Delete Accrual Payments | Edit |
    And I click on "Apply Changes" Button
    And I click on the "Manage Security" link

    Examples:
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |