@all
Feature: (Jira Ref : AUTOMATION-1383) Forms tab should not appear for user after security changed to No Access

  Scenario Outline: I import test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/"
    And I import following files:
      | CPARFormProject(1)-1383.xml                     |
      | CorrectiveAndPreventativeAction-1383.xml        |
      | 1.0ISOCorrectiveAndPreventativeRequest-1383.xml |

    Examples:
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |

  Scenario Outline: As a LxAdmin user I validate security access and modify user password
    Given I navigate to the admin dashboard
    And I click on the "Manage Security" link
    And I select user class "Edit Access"
    And I expand the following folders
      | Project |
      | Details |
    And I select "Edit" security access in the following hierarchy
      | Project |
    And I select "Default" security access in the following hierarchy
      | Project |
      | Details |
      | Forms   |
    And I click on "Apply Changes" Button

    And I click on "Field Security" link
    And I select user class "Edit Access"
    And I expand the following folders
      | Forms |
    And I select "Edit" security access in the following hierarchy
      | Forms                              |
      | Corrective and Preventative Action |
    And I click on "Apply Changes" Button

    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" row action in the non frame grid "<Member Grid>" having the following header and cell values
      | name         | value       |
      | Name         | Edit Access |
      | Job Function | Edit Access |
      | Last Login   |             |
    Then I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page

    And I click on the "Reset Password" button
    And I wait for " " modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value          |
      | NewPassword1 | RegressionTest |
      | NewPassword2 | RegressionTest |
    And I click on "Update" button in modal window "blank"
    And  I wait for the Loading text to disappear in grid

    And I click on the "Update" button
    Then I wait for "Edit Person  ***Required fields in red" modal window to close
    And I logout


    Examples:
      | Member Grid               |
      | BOGridBOListExtGridPerson |

  Scenario Outline: As a Edit Access user I login and verify workflow step
    Given I Login to IWMS using "Edit Access" access credentials expecting EULA page
    Then Accept Eula and move on
    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name                       | value          |
      | Issue_Subject              | CPAR Form      |
      | Issue_CltExtIssue__Values5 | Internal Audit |
    And I click on the "Add" button
    And I wait for the Loading text to disappear
    And I see "Corrective and Preventative Action item successfully added" message in the header
    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I click " Expand All " button
    And I verify the following values in frame grid "BOGridLX_Grid_WorkFlow"
      | Name                                        |
      | 1.0 ISO Corrective and Preventative Request |
    Then I verify non editable reply data in row having unique value "1 - CPAR Review - CPAR - Creation" in form grid
      | name   | value   |
      | Status | Invalid |


    Examples:
      | Entity Name       | Form Type       |
      | CPAR Form Project | CPAR - Creation |


  Scenario Outline: Login as Lx Admin and navigate to Manage Security > Page Access, Change the security for Forms No access for Edit Access User class
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Security" link
    And I select user class "Edit Access"
    And I expand the following folders
      | Project |
      | Details |
    And I select "NoAccess" security access for "Project" Forms
    And I click on "Apply Changes" Button
    And I logout

    Examples:
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |

  Scenario Outline: Login as Edit Access user I login and verify Forms tab is not present in Project > Forms
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    Then I verify "Forms" third level tab not present

    Examples:
      | Login User  | Login full username | Entity Name       |
      | Edit Access | Edit Access         | CPAR Form Project |

