Feature: Basic GC Bidding-Bid Package Functionality (Jira Ref : AUTOMATION-782)

  Scenario Outline: I import test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/"
    And I import following file name:
      | GCForms.xml                |
      | GCWorkflow.xml             |
      | SecurityGCOnly22.xml       |
      | VendorAndMemberImport.xml  |
      | BuudgetTemplate.xml        |
      | GCBiddingProjectEntity.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: GC Bid Package work flow will be kicked off with the begun and due date that were filled out in the previous step (Jira Ref : AUTOMATION-784)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I click on the Add Item button
    And I switch to default frame
    And I set following fields value on editable page
      | name          | value              |
      | PageLayoutID" | Create Bid Package |
    And I click on the "OK" button "on pop window"
    And I switch to default frame
    And I set following fields value on editable page
      | name                                 | value      |
      | BidPackage_BidderKickOffPageLayoutID | Bid Invite |
    And I add current date as Bid open date
    And I add current date plus one day as Bid close date
    And I add current date plus two days as construction start date
    And I click on the "Add" button "on pop window"
    And I navigate to "<Second Level Tab>"
    And I navigate to "Members/Contacts"
    And I click on the "Edit Members" button " on action panel"
    And I switch to visible frame
    And I add following members
      | Access, Delete Access |
    And I click on "Update  members to <Entity Name>" Button
    And I switch to default frame
    And I navigate to "<Second Level Tab>"
    And I navigate to "Budget"
    And I switch to visible frame
    And I set following fields value on editable page
      | name                     | value           |
      | budgetTemplateIDToAssign | Selenium-Budget |
    And I click on Assign Budget Template
    And I switch to default frame
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Package" work flow to expose the first step to invite bidders
    And I click on "edit" link
    And I switch to default frame
    And I set following fields value on editable page
      | name                  | value                 |
      | WorkFlowAdhocMemberID | Access, Delete Access |
    And I add following project members
      | Access, Delete Access |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Invite Bidders" link
    And I switch to default frame
    And I click on Check Out button
    And I click on Invite Bidders button
    And I add following members
      | Vendor A : GC One   |
      | Vendor B : GC Two   |
      | Vendor C : GC Three |
    And I click on the "Next" button "on pop window"
    And I verify the following number fields value on editable page
      | name         | value                                                 |
      | EmailSubject | <Entity Name>:  Response Required - Invitation to Bid |
    And I click on the "Next" button "on pop window"
    And I verify the following message "Emailed Invitation to:<QA1@lucernex.com> GC One"
    And I verify the following message "Emailed Invitation to:<QA1@lucernex.com> GC Two"
    And I verify the following message "Emailed Invitation to:<QA1@lucernex.com> GC Three"
    And I click on the close button on pop window
    And I verify grid item "Vendor A" present is "true" in grid "BOGridBidderIssue"
    And I verify grid item "Vendor B" present is "true" in grid "BOGridBidderIssue"
    And I verify grid item "Vendor C" present is "true" in grid "BOGridBidderIssue"
    And I click on the "Complete" button "on pop window"
    And I switch to visible frame
    And I verify grid item "GC One" present is "true" in grid "issueMainDiv"
    And I verify grid item "GC Two" present is "true" in grid "issueMainDiv"
    And I verify grid item "GC Three" present is "true" in grid "issueMainDiv"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Accept Invite and Submit Bid as GC One (Jira Ref : AUTOMATION-785)
    Given I Login to IWMS using "BidderOne" access credentials expecting EULA page
    Then Accept Eula and move on
#    Given I Login to IWMS using "BidderOne" access credentials
    And I expand portfolio navigation tab
    And I Drag and Drop module "My Approvals"
#    And I click on "Accept/Decline Invite - Bid Invite" link
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Response and Submission" work flow to expose the first step to invite bidders
    And I click on "Accept/Decline Invite - Bid Invite" link
    And I switch to default frame
    And I click on Check Out button
    And I set following fields value on editable page
      | name                            | value |
      | BidderIssue_IsBidInviteAccepted | true  |
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                    |
      | WorkFlowTemplateStepActionID | Accept Invitation to Bid |
    And I click on the "Update" button "on pop window"
#    And I click on the "Close" button "on pop window"
#    And I Drag and Drop module "My Work Queue"
#    And I click on "Prepare/Submit Bid" link
#    And I click on "Prepare/Submit Bid" Link from "GCBidding"
    And I switch to visible frame
    And I click on "Prepare/Submit Bid" link
    And I switch to default frame
    And I click on Check Out button
    And I click on Submit Bid button
    And I switch to default frame
    And I switch to "Budget" child window
    And I click on Create Empty Bid button
    And I set following fields value on editable page
      | name        | value            |
      | Description | Test Description |
    And I click on the "Add" button "on pop window"
    And I click on "values" link
    And I enter row values in grid "putTheGridHere" by the following value
      | name            | comment | quantity | units | unitCost | value |
      | Carpet          | Test    | 1        |       | 400      |       |
      | Doors           | Test    | 1        |       | 900      |       |
      | Patio Furniture | Test    | 1        |       | 1600     |       |
      | Playground      | Test    | 1        |       | 2500     |       |
    And I click on close window button
    And I switch to main window
    And I click on the "Complete" button "on pop window"
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Resubmit Bid For GC One (Jira Ref : AUTOMATION-786)
#    Given I Login to IWMS using "BidderThree" access credentials expecting EULA page
#    Then Accept Eula and move on
    Given I Login to IWMS using "BidderOne" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Response and Submission" work flow to expose the first step to invite bidders
    And I click on "Re-Submit Bid - Submit Bid" link
    And I switch to default frame
    And I click on Check Out button
#    And I click on Submit Bid button
#    And I click on value="Upload"
#  name="filename"
#  name="submitbutton"
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value     |
      | WorkFlowTemplateStepActionID | Re-Submit |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Re-Submit Bid - Submit Bid" link
    And I switch to default frame
    And I click on Check Out button
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value    |
      | WorkFlowTemplateStepActionID | Complete |
    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Reject Bid as GC Two (Jira Ref : AUTOMATION-791)
    Given I Login to IWMS using "BidderTwo" access credentials expecting EULA page
    Then Accept Eula and move on
#    Given I Login to IWMS using "BidderTwo" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Response and Submission" work flow to expose the first step to invite bidders
    And I click on "Accept/Decline Invite - Bid Invite" link
    And I switch to default frame
    And I click on Check Out button
    And I set following fields value on editable page
      | name                            | value |
      | BidderIssue_IsBidInviteAccepted | false |
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                     |
      | WorkFlowTemplateStepActionID | Decline Invitation to Bid |
    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |

  Scenario Outline: Accept Invite and Submit Bid as GC Three (Jira Ref : AUTOMATION-785)
    Given I Login to IWMS using "BidderThree" access credentials expecting EULA page
    Then Accept Eula and move on
#    Given I Login to IWMS using "BidderThree" access credentials
    And I expand portfolio navigation tab
    And I Drag and Drop module "My Approvals"
#    And I click on "Accept/Decline Invite - Bid Invite" link
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Response and Submission" work flow to expose the first step to invite bidders
    And I click on "Accept/Decline Invite - Bid Invite" link
    And I switch to default frame
    And I click on Check Out button
    And I set following fields value on editable page
      | name                            | value |
      | BidderIssue_IsBidInviteAccepted | true  |
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                    |
      | WorkFlowTemplateStepActionID | Accept Invitation to Bid |
    And I click on the "Update" button "on pop window"
#    And I click on the "Close" button "on pop window"
#    And I Drag and Drop module "My Work Queue"
#    And I click on "Prepare/Submit Bid" link
#    And I click on "Prepare/Submit Bid" Link from "GCBidding"
    And I switch to visible frame
    And I click on "Prepare/Submit Bid" link
    And I switch to default frame
    And I click on Check Out button
    And I click on Submit Bid button
    And I switch to "Budget" child window
    And I click on download Blank Spreadsheet button
    And I Upload Bid spreadsheet "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/":
      | BudgetSpreadsheet.xls |
    And I switch to main window
    And I click on Submit Bid button
    And I switch to "Budget" child window
    And I verify following Budget values in gird :
      | name        | value          |
      | Budget Name | #1             |
      | Description | Bid values     |
      | Status      | Default Status |
      | Contractor  |                |
      | Total       | $8,200.00      |
    And I close the "Budget" child window
    And I switch to main window
    And I click on the "Complete" button "on pop window"
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |

  Scenario Outline: Resubmit Bid For GC Three (Jira Ref : AUTOMATION-786)
#    Given I Login to IWMS using "BidderThree" access credentials expecting EULA page
#    Then Accept Eula and move on
    Given I Login to IWMS using "BidderThree" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Response and Submission" work flow to expose the first step to invite bidders
    And I click on "Re-Submit Bid - Submit Bid" link
    And I switch to default frame
    And I click on Check Out button
#    And I click on Submit Bid button
#    And I click on value="Upload"
#  name="filename"
#  name="submitbutton"
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value     |
      | WorkFlowTemplateStepActionID | Re-Submit |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Re-Submit Bid - Submit Bid" link
    And I switch to default frame
    And I click on Check Out button
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value    |
      | WorkFlowTemplateStepActionID | Complete |
    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Invite More Bidders (Jira Ref : AUTOMATION-787)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/"
    And I import following file name:
      | EMP.xlsx    |
      | Member.xlsx |
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Package" work flow to expose the first step to invite bidders
    And I click on "edit" link
    And I switch to default frame
    And I add following Approver Member List
      | Access, Delete Access |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Invite More Bidders or Adjust Bid Date - Invite Bidders" link
    And I switch to default frame
    And I click on Check Out button
    And I click on Invite Bidders button
    And I add following members
      | Vendor D : GC Four |
    And I click on the "Next" button "on pop window"
    And I verify the following number fields value on editable page
      | name         | value                                                 |
      | EmailSubject | <Entity Name>:  Response Required - Invitation to Bid |
    And I click on the "Next" button "on pop window"
    And I verify the following message "Emailed Invitation to:<muhammad.sameer@lucernex.com> GC"
    And I click on the close button on pop window
    And I verify grid item "Vendor A" present is "true" in grid "BOGridBidderIssue"
    And I verify grid item "Vendor B" present is "true" in grid "BOGridBidderIssue"
    And I verify grid item "Vendor C" present is "true" in grid "BOGridBidderIssue"
#    And I verify grid item "Vendor D" present is "true" in grid "BOGridBidderIssue"
    And I click on the "Close" button "on pop window"
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Reject Bid as GC Four (Jira Ref : AUTOMATION-791)
    Given I Login to IWMS using "BidderFour" access credentials expecting EULA page
    Then Accept Eula and move on
#    Given I Login to IWMS using "BidderTwo" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Response and Submission" work flow to expose the first step to invite bidders
    And I click on "Accept/Decline Invite - Bid Invite" link
    And I switch to default frame
    And I click on Check Out button
    And I set following fields value on editable page
      | name                            | value |
      | BidderIssue_IsBidInviteAccepted | false |
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                     |
      | WorkFlowTemplateStepActionID | Decline Invitation to Bid |
    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Close Bidding (Jira Ref : AUTOMATION-788)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Package" work flow to expose the first step to invite bidders
    And I click on "Invite More Bidders or Adjust Bid Date - Invite Bidders" link
    And I switch to default frame
    And I click on Check Out button
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                     |
      | WorkFlowTemplateStepActionID | Done - Wait for Bid Close |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "edit" link
    And I switch to default frame
    And I add following Approver Member List
      | Access, Delete Access |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Condition Bids - Condition and Award Bids" link
    And I switch to default frame
    And I click on Check Out button
    And I change the Bid Close date to yesterday date
    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                    |
      | WorkFlowTemplateStepActionID | Notify Bid Winner/Losers |
    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I navigate to url "https://testb.lucernex.com/en/admin/lxadmin/LxSiteAdmin.jsp"
    And I click on Run Nightly Bid Process button
    And I click on Start processing button
    And I processing of General contractor bid is done
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Condition Bids (Jira Ref : AUTOMATION-789)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Package" work flow to expose the first step to invite bidders
#    And I click on "edit" link
#    And I switch to default frame
#    And I add following Approver Member List
#      | Access, Delete Access |
#    And I click on the "Update" button "on pop window"
#    And I switch to visible frame
    And I click on "Condition Bids - Condition and Award Bids" link
    And I switch to default frame
    And I click on Check Out button
    And I change the Bid Close date to yesterday date
    And I click on Condition Bids button
    And I switch to "Condition" child window
    And I click on "Vendor A : GC One" default status link
    And I set following fields value on editable page
      | name                     | value    |
      | CodeBudgetColumnStatusID | Rejected |
    And I click on the "Update" button "on pop window"
    And I click on "Vendor C : GC Three" Conditioning default link
    And I set following fields value on editable page
      | name                     | value                |
      | CodeBudgetColumnStatusID | Conditioning Awarded |
    And I click on the "Update" button "on pop window"
    And I close the "Conditioning" child window
    And I switch to main window
#    And I click on the "Update & Take Action" button "on pop window"
    And I click on the "Update & Check in" button "on pop window"
#    And I set following fields value on editable page
#      | name                         | value                    |
#      | WorkFlowTemplateStepActionID | Notify Bid Winner/Losers |
#    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Notify Winner and Losers (Jira Ref : AUTOMATION-790)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Package" work flow to expose the first step to invite bidders
    And I click on "edit" link
    And I switch to default frame
    And I add following project members
      | Access, Delete Access |
#    And I add following Notifiee members
#      | Three, GC |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Notify Bidder of Results" link
    And I switch to default frame
    And I click on Check Out button
    And I click on Notify Winning Bidder button
    And I verify the following number fields value on editable page
      | name         | value                                        |
      | EmailSubject | <Entity Name> - Congratulations!             |
      | EmailBody    | You have won the bid <insert your text here> |
    And I click on the "Send Email" button "on pop window"
    And I verify the following message "Emailed Notification to:<QA1@lucernex.com> GC Three"
    And I click on the close button on pop window
    And I click on the "Complete" button "on Notify Bidders pop window"
    And I navigate to "Members/Contacts"
    And I verify the Members/Contacts tab
      | type        | name     |
      | Team Member | GC One   |
      | Team Member | GC Three |
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |


  Scenario Outline: Complete Bidding (Jira Ref : AUTOMATION-793)
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Third Level Tab>"
    And I switch to visible frame
    And I Expand the "GC Bid Package" work flow to expose the first step to invite bidders
    And I click on "edit" link
    And I switch to default frame
    And I add following Approver Member List
      | Access, Delete Access |
    And I click on the "Update" button "on pop window"
    And I switch to visible frame
    And I click on "Complete Bidding - Complete Bidding Process" link
    And I switch to default frame
    And I click on Check Out button
    And I verify grid item "Vendor A" present is "true" in grid "BOGridBidderIssue"
    And I verify grid item "Vendor B" present is "true" in grid "BOGridBidderIssue"
    And I verify grid item "Vendor C" present is "true" in grid "BOGridBidderIssue"

#    And I verify a row from grid "BOGridBidderIssue" having unique value "BDR.0001" under column header "Number"
#      | name              | value     |
#      | Vendor            | Vendor A  |
#      | Accepted?         | Yes       |
#      | Winning Bid?      | No        |
#      | Submitted Amount  | $5,400.00 |
#      | Conditione Amount | $7,600.00 |
#
#    And I verify a row from grid "BOGridBidderIssue" having unique value "BDR.0002" under column header "Number"
#      | name              | value    |
#      | Vendor            | Vendor B |
#      | Accepted?         | No       |
#      | Winning Bid?      | No       |
#      | Submitted Amount  |          |
#      | Conditione Amount |          |
#
#    And I verify a row from grid "BOGridBidderIssue" having unique value "BDR.0003" under column header "Number"
#      | name              | value     |
#      | Vendor            | Vendor C  |
#      | Accepted?         | Yes       |
#      | Winning Bid?      | Yes       |
#      | Submitted Amount  | $5,400.00 |
#      | Conditione Amount | $7,600.00 |
#    And I click on the "Close" button "on pop window"

    And I click on the "Update & Take Action" button "on pop window"
    And I set following fields value on editable page
      | name                         | value                    |
      | WorkFlowTemplateStepActionID | Complete Bidding Process |
    And I click on the "Update" button "on pop window"
    And I switch to default frame
    And I logout

  Examples:
    | Item    | Entity Name | Second Level Tab | Third Level Tab |
    | Project | GCBidding   | Details          | Work Flow       |