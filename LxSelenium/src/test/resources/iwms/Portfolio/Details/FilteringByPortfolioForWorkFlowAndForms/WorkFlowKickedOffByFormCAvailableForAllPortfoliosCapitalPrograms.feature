@all
Feature: WorkFlow Kicked off by Form C available for all PortfoliosCapital Programs [Jira Ref - AUTOMATION-1463]

  Scenario Outline: As a delete user, I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/"
    And I import following file name:
      | Portfolios-9749_1463.xml  |
      | KickoffForm-9749_1463.xml |
      | WF-9749_1463.xml          |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I delete user, I verify "KickoffForm-9749" form will be visible in the list of available forms to add.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I switch to default frame
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name       | value |
      | Issue_Body | test  |
    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify I am at Form tab
    And I verify success message "KickoffForm-9749 item successfully added"
    And I switch to default frame

    And I click on the "Work Flow" tab
    And I verify grid row "BOGridLX_Grid_WorkFlow" having unique value "WF-9749" under column header "Name"
      | name | value   |
      | Name | WF-9749 |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name            | Form Type        |
    | DeleteAccess | Delete Access Access | Forms           | ExamplePortfolioA-9749 | KickoffForm-9749 |


  Scenario Outline: I delete user, I Navigate to ExamplePortfolioB-9749" and verify "KickoffForm-9749" form will be visible in the list of available forms to add.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I switch to default frame
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name       | value |
      | Issue_Body | test  |
    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify I am at Form tab
    And I verify success message "KickoffForm-9749 item successfully added"
    And I switch to default frame

    And I click on the "Work Flow" tab
    And I verify grid row "BOGridLX_Grid_WorkFlow" having unique value "WF-9749" under column header "Name"
      | name | value   |
      | Name | WF-9749 |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name            | Form Type        |
    | DeleteAccess | Delete Access Access | Forms           | ExamplePortfolioB-9749 | KickoffForm-9749 |


  Scenario Outline: I delete user, I Navigate to ExamplePortfolioC-9749" and verify "KickoffForm-9749" form will be visible in the list of available forms to add.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I switch to default frame
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name       | value |
      | Issue_Body | test  |
    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify I am at Form tab
    And I verify success message "KickoffForm-9749 item successfully added"
    And I switch to default frame

    And I click on the "Work Flow" tab
    And I verify grid row "BOGridLX_Grid_WorkFlow" having unique value "WF-9749" under column header "Name"
      | name | value   |
      | Name | WF-9749 |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name            | Form Type        |
    | DeleteAccess | Delete Access Access | Forms           | ExamplePortfolioC-9749 | KickoffForm-9749 |