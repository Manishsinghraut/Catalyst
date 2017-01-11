@all
Feature: Form C -Available for all Portfolios [Jira Ref - AUTOMATION-1462]

  Scenario Outline: As a delete user, I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/"
    And I import following file name:
      | Portfolio_9748_C_1462.xml  |
      | Portfolio_9748_D_1462.xml  |
      | Project_9748C_1462.xml     |
      | Parcel_9748D_1462.xml      |
      | Form_Testing-9748_1462.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user, I Navigate to Manage Forms and ensure that Form_Testing-9748 Layout is Available for All Portfolios/Capital Programs
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I click " Expand All " button
    And I click "edit" action of "Form_Testing-9748 Layout" sub row in the grid "BOGridCodeIssueType"
    And I verify the following fields value on editable page
      | name           | value                    |
      | PageLayoutName | Form_Testing-9748 Layout |

    And I click "Cancel" button

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I delete user, I verify Form_Testing-9748 Layout should be available in the list of available forms for the specific Portfolio it is filtered for.
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

    And I enter value "Carpet" of field "Item Name" on "popup window"
    And I enter value "10" of field "Quantity" on "popup window"
    And I enter value "500" of field "Price" on "popup window"

    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify I am at Form tab
    And I verify success message "Form_Testing-9748 Layout item successfully added"
    And I verify the following values in frame grid "issueMainDiv"
      | Form Type   | Creator   | Last Reply | # Replies |
      | <Form Type> | <Creator> |            | 0         |

    And I click " Expand All " button
    And I click "<Check Out>" link for form "<Form Name>"
    And I switch to default frame

    And I verify the enter value "Carpet" of field "Item Name" on "popup window"
    And I verify the enter value "10" of field "Quantity" on "popup window"
    And I verify the enter value "$500.00" of field "Price" on "popup window"
    And I verify the field "Total" values has "$5,000.00"
    And I click on the "Close" button

    And I switch to visible frame
    And I click "<Check In>" link for form "<Form Name>"
    And I click " Expand All " button
    And I click "<View>" link for form "<Form Name>"
    And I switch to default frame
    And I wait for " " modal window to open in non frame page
    And I verify the following fields in "modal window"
      | Item Name | Carpet    |
      | Quantity  | 10        |
      | Price     | $500.00   |
      | Total     | $5,000.00 |


    And I click on the "Close" button


  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name                     | Form Type                | Creator              | GRID            | Form Name |
    | DeleteAccess | Delete Access Access | Forms           | Project-9748C, TX United States | Form_Testing-9748 Layout | Delete Access Access | f1EditFormTable | 0001      |


  Scenario Outline: I delete user, I Navigate to Parcel-9748D > Forms and verify Form_Testing-9748 should be available in the list of available forms
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

    And I enter value "Doors" of field "Item Name" on "popup window"
    And I enter value "10" of field "Quantity" on "popup window"
    And I enter value "3000" of field "Price" on "popup window"

    And I click on the "Add" button
    And I wait for modal window to close
    Then I verify I am at Form tab
    And I verify success message "Form_Testing-9748 Layout item successfully added"
    And I verify the following values in frame grid "issueMainDiv"
      | Form Type   | Creator   | Last Reply | # Replies |
      | <Form Type> | <Creator> |            | 0         |

    And I click " Expand All " button
    And I click "<Check Out>" link for form "<Form Name>"
    And I switch to default frame

    And I verify the enter value "Doors" of field "Item Name" on "popup window"
    And I verify the enter value "10" of field "Quantity" on "popup window"
    And I verify the enter value "$3,000.00" of field "Price" on "popup window"
    And I verify the field "Total" values has "$30,000.00"

    And I click on the "Close" button

    And I switch to visible frame
    And I click "<Check In>" link for form "<Form Name>"
    And I click " Expand All " button
    And I click "<View>" link for form "<Form Name>"
    And I switch to default frame
    And I wait for " " modal window to open in non frame page
    And I verify the following fields in "modal window"
      | Item Name | Doors      |
      | Quantity  | 10         |
      | Price     | $3,000.00  |
      | Total     | $30,000.00 |

    And I click on the "Close" button

  Examples:
    | Login User   | Login full username  | Third Level Tab | Entity Name                 | Form Type                | Creator              | GRID            | Form Name |
    | DeleteAccess | Delete Access Access | Forms           | Parcel 9748D, United States | Form_Testing-9748 Layout | Delete Access Access | f1EditFormTable | 0001      |

