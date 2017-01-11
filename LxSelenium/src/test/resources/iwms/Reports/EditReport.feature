Feature: Edit Report (Jira Ref. : AUTOMATION-1105)

  Scenario Outline: Export the Reports
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | PortfolioReport.xml |
      | ReportEntities.xml  |
    Then I navigate to the reports dashboard
#    And I click on the "edit" row action of column "Portfolio Report" of column "0" from grid "<Grid>"

    And I click "edit" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value            |
      | Report Name | Portfolio Report |

    And I switch to "report" child window
    And I select STEP4 "Field List and Details" of the report as the step to be edited
    And I click on the "edit" row action of column "Portfolio" of column "0" from grid "BOGridCustomObjectDel"
    And I select "search/runtime filter" from "Criteria/Conditions"
    And I click "Update" button
    And I verify the following message "Successfully updated item"
    And I verify a row from non frame grid "BOGridCustomObjectDel" having unique value "Portfolio" under column header "Field Name On Report"
      | name                 | value                                   |
      | Field Name On Report | Portfolio                               |
      | Lx Default Name      | Portfolio (General Summary Information) |
      | Data Type            | Text                                    |
      | Criteria             | search/runtime filter                   |
    And I click on Finish button
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I select the Portfolio filter "is in"
    And I select the Available fields "Portfolio for Report"
    And I click on " >> " button to move field
    And I click on "Next" Button
    And I verify following "report results"
      | Portfolio Name Entity Type Building Area Unit City Country Full Address                             |
      | Portfolio for Report Facility For report Facility Square Feet Plano United States 5601 Democracy Dr |
      | Plano, TX 75024 United States                                                                       |
      | Portfolio for Report Parcel for report Parcel Plano United States 5601 Democracy Dr                 |
      | Plano, TX 75024 United States                                                                       |
    And I close the "Report" child window
    And I switch to main window

  Examples:s
    | Login User   | Login full username  | Grid        |
    | DeleteAccess | Delete Access Access | pageContent |
#    | DeleteAccess | Delete Access Access | BOGridPageLayout |

#Feature: ImportExport Reports (Jira Ref. : AUTOMATION-381)
#
#  Scenario Outline: Export the Reports
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I see the Dashboard
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
#    And I import following file name:
#      | RelatedContractReport.xml |
#    Then I navigate to the reports dashboard
#    And I click on the "edit" row action of column "Related Contracts all" of column "0" from grid "<Grid>"
#    And I switch to "report" child window
#    And I select STEP4 "Field List and Details" of the report as the step to be edited
#    And I click on the "edit" row action of column "Contract Name" of column "0" from grid "BOGridCustomObjectDel"
#    And I select "search/runtime filter" from "Criteria/Conditions"
#    And I click "Update" button
#    And I click on Finish button
#    And I click on the "Save and Run Report" button on Modify and Save Report
#    And I close the "Report" child window
#    And I switch to main window
#    And I click on the "edit" row action of column "Related Contracts all" of column "0" from grid "<Grid>"
#    And I switch to "report" child window
#    And I select STEP4 "Field List and Details" of the report as the step to be edited
#    And I verify a row from non frame grid "BOGridCustomObjectDel" having unique value "Field Name On Report" under column header "Contract Name"
#      | name                 | value                         |
#      | Field Name On Report | Contract Name                 |
#      | Lx Default Name      | Contract Name (Contract Info) |
#      | Data Type            | Text                          |
#      | Criteria             | search/runtime filter         |
#    And I click on Finish button
#    And I click on the "Save and Run Report" button on Modify and Save Report
#    And I close the "Report" child window
#
#  Examples:s
#    | Login User   | Login full username  | Grid             |
#    | DeleteAccess | Delete Access Access | BOGridPageLayout |