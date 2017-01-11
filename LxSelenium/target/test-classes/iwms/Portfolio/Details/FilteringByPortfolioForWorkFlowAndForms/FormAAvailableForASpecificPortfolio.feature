@all
Feature: Form A - Available for a Specific Portfolio [Jira Ref - AUTOMATION-1460]

  Scenario Outline: As a delete user, I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/"
    And I import following file name:
      | Portfolio9745_A_1460.xml |
      | Portfolio9745_B_1460.xml |
      | forms_1460.xml           |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user, I Navigate to Manage Forms and Expand Form 9746 and edit "Form A" layout to be Available for Portfolio9745-A and click 'Update Layout'
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I click " Expand All " button
    And I click "edit" action of "Form A" sub row in the grid "BOGridCodeIssueType"
    And I select a following Items from field
      | name                       | value           |
      | PageLayout_PortfolioIDList | Portfolio9745-A |

    And I click "Update Layout" button

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I delete user, I verify Form A should be available in the list of available forms for the specific Portfolio it is filtered for.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I see a modal window
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I click on the "Add" button
    And I wait for modal window to close
    And I verify success message "Form 9746 item successfully added"
    Then I verify I am at Form tab
    And I verify the following values in frame grid "issueMainDiv"
      | Title        | Days Open | Due Date | Assignees | Form Type   | Creator   | Last Reply | # Replies |
      | <<NO TITLE>> | 0         |          |           | <Form Type> | <Creator> |            | 0         |

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name     | Form Type | Creator              |
    | DeleteAccess | Delete Access Access | Forms           | Portfolio9745-A | Form A    | Delete Access Access |


  Scenario Outline: I delete user, I verify Form A will be unavailable in the drop-down
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    Then I verify I am at Form tab
    And I click "Add Form..." button of frame grid "issueMainDiv"
    And I see a modal window
    And I verify form type "<Form Type>" does not exist in dropdown in modal window
    And I click on the "OK" button

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name     | Form Type |
    | DeleteAccess | Delete Access Access | Forms           | Portfolio9745-B | Form A    |


