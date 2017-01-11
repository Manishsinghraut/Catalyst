Feature: GC Bidding Forms/Workflows/Security set up (Jira Ref : AUTOMATION-783)

  Scenario Outline: I import test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/"
    And I import following file name:
      | GCForms.xml               |
      | GCWorkflow.xml            |
      | SecurityGCOnly22.xml      |
      | VendorAndMemberImport.xml |
      | BuudgetTemplate.xml       |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: Verify the General Contractor Security should match with attached GCSecurity.xlsx spreadsheet
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    And I navigate to the admin dashboard
    And I click on the "Manage Security" link
    And I validate "General Contractor" Security access
      | AccessTab      | folder              | subfolder                         | accessstatus |
      | Page Access    | Facility            |                                   |              |
      |                | Details             |                                   |              |
      |                | Budget              |                                   | No Access    |
      |                |                     | Budget Creation                   | Edit         |
      |                |                     | GC Upload Bid                     | Edit         |
#      |                |                     | Forms                             | Edit         |
#      |                |                     | Work Flow                         | No Access    |
      |                | Reports             |                                   | No Access    |
      |                | Forms               |                                   | No Access    |
      |                | Forms               | All Bid Package Fields            | View         |
      |                | Forms               | All Bidder Fields                 | View         |
#      |                | Forms               | Bid Invite                        | Edit         |
      |                | Forms               | Submit Bid                        | Edit         |
      | Actions        |                     | Allow Selected Status for Budgets | Edit         |
  ##      |                |           |View Portfolio Documents                        | View         |
      | Field Security | Budget              |                                   | No Access    |
      |                | Budget Column       |                                   | View         |
      |                |                     | Description                       | Edit         |
      |                | Budget Item Value   |                                   | Edit         |
  #      |                |                                   Budget Types|            | Edit         |
  #      |                |                                   | GC1                    | Edit         |
  #      |                |                                   | GC2                    | Edit         |
  #      |                |                                   | GC3                    | Edit         |
      |                | Schedule            |                                   | View         |
      |                | Wrokflow            |                                   | Edit         |
      |                | Workflow Step (All) |                                   |              |
      |                |                     | WF Notify List                    | No Access    |
      |                | Specialized Forms   |                                   |              |
      |                | Bidders             |                                   | Edit         |

  #      |                | Bid Package                 |             | Edit         |
      | Budget Columns |                     | Bid Conditioning                  | View         |
      |                |                     | GC1                               | View         |
      |                |                     | GC2                               | View         |
      |                |                     | GC3                               | View         |

  Examples:
    | Entity Name                    | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Adjustment Contract | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |

  Scenario Outline: Verify the Construction Manager Security should match with attached GCSecurity.xlsx spreadsheet
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    And I navigate to the admin dashboard
    And I click on the "Manage Security" link
    And I validate "Construction Manager" Security access
      | AccessTab      | folder              | subfolder                         | accessstatus |
      | Page Access    | Facility            |                                   |              |
      |                | Details             |                                   |              |
      |                | Budget              |                                   | Edit         |
      |                |                     | Budget Creation                   | Edit         |
      |                |                     | GC Upload Bid                     | Edit         |
      |                |                     | Forms                             | Edit         |
      |                |                     | Work Flow                         | Edit         |
      |                | Reports             |                                   | Edit         |
      |                | Forms               |                                   | Edit         |
      |                | Forms               | All Bid Package Fields            | Edit         |
      |                | Forms               | All Bidder Fields                 | Edit         |
      |                | Forms               | Bid Invite                        | Edit         |
      |                | Forms               | Submit Bid                        | Edit         |
      | Actions        |                     | Allow Selected Status for Budgets | Edit         |
      |                |                     | View Portfolio Documents          | Edit         |
      | Field Security | Budget              |                                   | Edit         |
      |                | Budget Column       |                                   | Edit         |
      |                |                     | Description                       | Edit         |
      |                | Budget Item Value   |                                   | Edit         |
      |                | Budget Types        |                                   | Edit         |
      |                |                     | GC1                               | Edit         |
      |                |                     | GC2                               | Edit         |
      |                |                     | GC3                               | Edit         |
      |                | Schedule            |                                   | Edit         |
      |                | Wrokflow            |                                   | Edit         |
      |                | Workflow Step (All) |                                   |              |
      |                |                     | WF Notify List                    | Edit         |
      |                | Specialized Forms   |                                   |              |
      |                | Bidders             |                                   | Edit         |
      |                | Bid Package         |                                   | Edit         |
      | Budget Columns |                     | Bid Conditioning                  | Edit         |
      |                |                     | GC1                               | No Access    |
      |                |                     | GC2                               | No Access    |
      |                |                     | GC3                               | No Access    |


  Examples:
    | Entity Name                    | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Adjustment Contract | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |


  Scenario Outline: I Verify the Selected Status for all the Budget Types
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify the "Bid Conditioning" selected status "Conditioning Awarded"
    And I verify the "GC1" selected status "Default Status"
    And I verify the "GC2" selected status "Default Status"
    And I verify the "GC3" selected status "Default Status"
    And I click on the "status list" row action of column "Bid Conditioning" of column "1" from grid "BOGridBudgetColumnType"
    And I switch to "Status List" child window
    And I verify the "Conditioning Awarded" Lock status
#    And I verify the "Rejected" Lock status
    And I close the "Status List" child window
    And I click on the "status values" row action of column "Bid Conditioning" of column "1" from grid "BOGridBudgetColumnType"
    And I switch to "Status List" child window
    And I verify the following fields value on editable page
      | name                 | value                |
      | CodeStatusSelectedID | Conditioning Awarded |
      | CodeStatusDefaultID  | Conditioning Default |
    And I close the "Status Value" child window

  Examples:
    | Entity Name                    | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Adjustment Contract | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |

  Scenario Outline: Budget Template should be assigned successfully
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I navigate to "Budget"
    And I switch to visible frame
    And I set following fields value on editable page
      | name                     | value           |
      | budgetTemplateIDToAssign | Selenium-Budget |
    And I click on Assign Budget Template
    And I switch to default frame

  Examples:
    | Entity Name       | Second Level Tab | Third Level Tab |
    | Lucernex-Facility | Details          | Budget          |

  Scenario Outline: I Verify the Selected Status for all the Budget Types
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I click on the row of "Bid Package" of column "Name" from grid "BOGridCodeIssueType"
    And I click on the "build layout" row action of column "All Bid Package Fields" of column "1" from grid "BOGridCodeIssueType"
    And I switch to "build layout" child window
    And I click "..." on "Invite Bidders" and verify Bid Invitation Email Subject "Invitation to Bid",Field Label "Invite Bidders",Lx Script Name "BidPackage.InviteBidders"
    And I click "..." on "Notify Winning Bidder" and verify Bid Invitation Email Subject "You Win this Bid",Field Label "Notify Winning Bidder",Lx Script Name "BidPackage.NotifyWinningBidder"
    And I click "..." on "Notify Losing Bidders" and verify Bid Invitation Email Subject "Sorry, you loose",Field Label "Notify Losing Bidders",Lx Script Name "BidPackage.NotifyLosingBidders"
    And I close the "build layout" child window

  Examples:
    | Entity Name                    | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Adjustment Contract | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |

