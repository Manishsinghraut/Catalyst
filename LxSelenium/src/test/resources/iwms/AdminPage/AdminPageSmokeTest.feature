@all @smoke @smoke1
Feature: (Jira Ref: AUTOMATION-3) As an admin I should be able to see all links to the pages on Admin Dashboard

  Background: 
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not

  Scenario Outline: Admin should see all the pages on the admin dashboard
    When I navigate to admin "<page>" page
    Then I see that I am on the third level tab or grid"<expected>"

    Examples: 
      | page                               | expected                            |
      | Manage Company                     | Manage Company                      |
      | Manage Schedule Templates          | Schedule Templates                  |
      | Manage Page Layouts                | Manage Summary Pages                |
      | Manage Milestone Timeline          | BOGridProcessTimelineTemplate       |
      | Manage Binder Templates            | Binder Templates                    |
      | Manage Forms                       | BOGridCodeIssueType                 |
      | Manage Custom Lists                | BOGridReportGroupDataCustomList     |
      | Manage Parts and Inventory         | Manage Parts                        |
      | Manage Work Flows                  | BOGridWorkFlowTemplate              |
      | Manage Page Layouts                | Manage Summary Pages                |
      | Manage Data Fields                 | Firm Fields                         |
      | Import Data                        | Import Data                         |
      | Export Configuration               | Summary Pages                       |
      | Job Log                            | Job Log                             |
      | Manage Budget Templates            | mainwrappernoframe                  |
      | Manage Budget Views                | BOGridBudgetView                    |
      | Manage Budget Types                | BOGridBudgetColumnType              |
      | Manage Budget Summary Page         | mainwrappernoframe                  |
      | Manage Budget Options              | mainwrappernoframe                  |
      | Manage Budget Index Variables      | mainwrappernoframe                  |
      | Manage Firm Drop Downs             | BOGridCustomCodeTable               |
      | Client Drop Downs                  | BOGridCustomCodeTable               |
      | Manage Portfolios/Capital Programs | Manage Programs                     |
      | Manage Regions/Org Chart           | Org Chart                           |
      | Manage Facilities                  | Activate/Deactivate                 |
      | Manage Projects                    | Activate/Deactivate Capital Project |
      | Manage Sites                       | Activate/Deactivate                 |
      | Manage Contracts                   | Activate/Deactivate RE Contracts    |
      | Manage Parcels                     | Activate/Deactivate                 |
      | Manage Locations                   | Activate/Deactivate                 |
      | Manage Complex/Center Details      | BOGridComplex                       |
      | Manage Organizations               | BOGridOrganization                  |
      | Manage Prototypes                  | Manage Prototypes                   |
      | Manage Members/Contacts            | Manage Members/Contacts             |
      | Manage Employers                   | BOGridLX_Grid_Employer              |
      | Manage Vendors                     | mainwrappernoframe                  |
      | Project Membership Management      | One Member Many Projects            |
      | Manage Security                    | Page Access                         |
      | Audit Reports                      | BOGridAuditColumn                   |
      | Report Log                         | BOGridReportLog                     |
      | Manage Folder Templates            | Manage Folder Templates             |
      | Manage Excel Service               | Queue                               |
      | Manage Counties/Jurisdictions      | BOGridJurisdiction                  |

  Scenario Outline: As an Admin I should be able to see all the pop ups on the admin dashboard
    When I navigate to admin "<page>" page
    Then I see the "<expected>" modal window

    Examples: 
      | page              | expected          |
      | Export Schema     | Export XML Schema |
      | Job Function Code | Job Function Code |
      | Job Title Code    | Job Title Code    |
      | User Class Code   | User Class Code   |
