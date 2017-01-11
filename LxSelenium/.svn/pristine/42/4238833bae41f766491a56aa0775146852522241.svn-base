@all
Feature: WorkFlow Kicked off by Form C available for specific PortfoliosCapital Programs [Jira Ref - AUTOMATION-1464]

  Scenario Outline: As a delete user, I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/"
    And I import following file name:
      | Portfolio9745_A_1464.xml |
      | Portfolio9745_B_1464.xml |
      | LimitedForms_1464.xml    |
      | workflow_1464.xml        |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I Navigate to "manage workflows" and set "WF-9750" to be available for specific Portfolio
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to the admin dashboard
    And I click on the "Manage Work Flows" link
    And I click on "edit" row action in the grid "<Grid>" having the following header "Work Flow name" and cell value "WF-9750"
      | name        | value |
      | Description |       |

    And I select a following Items from field
      | name                       | value           |
      | PageLayout_PortfolioIDList | Portfolio9745-A |

    And I click "Update" button
    And I see "Successfully updated Work Flow" in the grid header

  Examples:
    | Login User   | Login full username  | Grid                   |
    | DeleteAccess | Delete Access Access | BOGridWorkFlowTemplate |

  Scenario Outline: I delete user, I verify "Form C" will be available in the list of Work Flow Kickoff Form for the Portfolios its filtered for, which is only Portfolio9745A because it was selected in the beginning and 'Limited Forms-9745 item successfully added' message will appear
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Add Workflow..." button of frame grid "issueMainDiv"
    And I switch to default frame
    And I see a modal window
    And I select form type "<Select Work Flow Kickoff Form>" in modal window
    And I click on the "OK" button
    And I click on the "Add" button
    And I wait for modal window to close

    And I switch to visible frame
    And I verify success message "Limited Forms-9745 item successfully added"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name     | Select Work Flow Kickoff Form       |
    | DeleteAccess | Delete Access Access | Work Flow       | Portfolio9745-A | FormC-Available for Portfolio9745-C |


  Scenario Outline: I delete user, I verify Form C should not be available in the list of Work Flow Kickoff Form for Portfolio9745-B because its not filtered for it
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Add Workflow..." button of frame grid "issueMainDiv"
    And I switch to default frame
    And I see a modal window
    And I verify form type "<Select Work Flow Kickoff Form>" does not exist in dropdown in modal window
    And I click on the "OK" button

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name     | Select Work Flow Kickoff Form       |
    | DeleteAccess | Delete Access Access | Work Flow       | Portfolio9745-B | FormC-Available for Portfolio9745-C |

