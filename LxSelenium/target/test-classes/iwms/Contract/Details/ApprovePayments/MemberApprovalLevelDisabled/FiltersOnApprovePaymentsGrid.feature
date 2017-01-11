@all
Feature: (Jira Ref.:AUTOMATION-841 ) Verify all the filters available in the Approve Payment page and ensure that they are filtering the correct results.

  Scenario Outline: I set Security Configuration and Import Data
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    Then I click on the "Manage Company" link
    And I click on "Financial Settings" tab
    And I click on Disable Payment Approval
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    And I import following file name:
      | PortfoliSummaryPage.xml |

    And I import following files:
      | ApprovePaymentMember-841.xls       |
      | ImportedLocation-841.xml           |
      | ApprovePaymentContractA-841.xml    |
      | ApprovePaymentContractA-841-v2.xml |

    And I logout

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a Delete user, I logout
    Given I Login to IWMS using "<Login User>" access credentials
    And I logout

    Examples:
      | Login User   |
      | DeleteAccess |

  Scenario Outline: As a Entity user I Ensure that Approve Payments Pop up
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
#    And I Login to IWMS using "Entity 841" access credentials
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab

    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2030 |

#    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
#      | name            | value             |
#      | Vendor          | Selenium-Employer |
#      | Vendor#         | 1234              |
#      | Payment Percent | 100.00000%        |
#      | Address         | 5601 Democracy Dr |
#      | City            | Plano             |
#      | State           | TX                |
#      | Begin Date      | 01/01/2010        |
#      | End Date        | 12/31/2030        |

    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Begin Date | End Date   |
      | Selenium-Employer | 01/01/2010 | 12/31/2030 |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount |
      | 01/01/2010 | 12/31/2030 | Review          | $1,000.00      |

    And I verify a row from grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |

#    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
#      | name            | value             |
#      | Vendor          | Selenium-Employer |
#      | Vendor#         | 1234              |
#      | Payment Percent | 100.00000%        |
#      | Address         | 5601 Democracy Dr |
#      | City            | Plano             |
#      | State           | TX                |
#      | Begin Date      | 01/01/2010        |
#      | End Date        | 12/31/2030        |

    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Begin Date | End Date   |
      | Selenium-Employer | 01/01/2010 | 12/31/2030 |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount |
      | 01/01/2010 | 12/31/2020 | Review          | $2,000.00      |

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value              |
      | Expense Type     | CAM                |
      | Expense Category | Recurring Expenses |
      | Begin Date       | 01/01/2010         |
      | End Date         | 12/31/2025         |
    And I verify the following frame grids are empty
      | BOGridExpenseVendorAllocation |
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status |
      | 01/01/2010 | 12/31/2013 | Review          |
      | 01/01/2014 | 12/31/2018 | Review          |
      | 01/01/2019 | 12/31/2025 | Review          |

    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Internet   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2015 |
    And I verify the following frame grids are empty
      | BOGridExpenseVendorAllocation |
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount |
      | 01/01/2010 | 12/31/2015 | Review          | $1,000.00      |
    And I switch to default frame

    Examples:
      | Login User | Entity Name                    | Entity Name 2                     | Grid ID                   | Portfolio                      |
      | Entity 841 | Approve Payment Contract A-841 | Approve Payment Contract A-841-v2 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-841 |

  Scenario Outline: As a Delete user, I logout
    Given I Login to IWMS using "<Login User>" access credentials
    And I logout

    Examples:
      | Login User |
      | Entity 841 |

  Scenario Outline: As a Entity user I Ensure that Approve Payments Pop up - Transactions
    Given I Login to IWMS using "<Login User>" access credentials
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "Lease Recurring Expense" under column header "Group"
      | name           | value                 |
      | Effective Date | 01/01/2010            |
      | Type           | Interior Maintainance |
      | Category       | Expense               |
    And I verify the following fields value on editable page
      | name                                       | value |
      | _checkbox_PaymentTransaction_ProcessedFlag | true  |

    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Group"
      | name           | value                |
      | Effective Date | 01/01/2010           |
      | Type           | Building Maintenance |
      | Category       | Expense              |
    And I verify the following fields value on editable page
      | name                                       | value |
      | _checkbox_PaymentTransaction_ProcessedFlag | false |
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I switch to default frame

    Examples:
      | Login User | Entity Name                    | Entity Name 2                     | Grid ID                   | Portfolio                      |
      | Entity 841 | Approve Payment Contract A-841 | Approve Payment Contract A-841-v2 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-841 |

  Scenario Outline: As a Delete user, I logout
    Given I Login to IWMS using "<Login User>" access credentials
    And I logout

    Examples:
      | Login User |
      | Entity 841 |

#  Scenario Outline: As a Entity user I Ensure that Approve Payments Pop up - Details
#    Given I Login to IWMS using "<Login User>" access credentials
##    And I navigate to entity type "Contract" named "<Entity Name>"
##    Then I navigate to "Payment Info"
##    And I navigate to entity type "Contract" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Details"
#    And I click on the "Approve Payments" action panel button
#    And I switch to "Approve Payments" child window
#
##    #Checking Date filters From and To on Expense Schedule
##    And I select expense schedules radio button
##    And I set following fields value on editable page
##      | name      | value      |
##      | BeginDate | 01/01/2010 |
##      | EndDate   | 12/31/2030 |
##    And I click on the "approve" action from non frame grid "<Grid ID>" having unique value "Internet" under column header "Expense Type"
##      | name          | value           |
##      | Contract Name | <Entity Name 2> |
##      | Expense Group | Expense         |
##      | Portfolio     | <Portfolio>     |
##    And I verify the following values in non frame grid "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
##      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
##      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
##      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
##
##      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
##      | Review | <Portfolio> | <Entity Name> | Expense            | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
##      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |
##
##    #Checking Date filters From and To on Transaction
##    And I select transactions radio button
##    And I verify the following values in non frame grid "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense           | Building Maintenance  | 01/01/2010     | 12/31/2030         |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
##
##    #Filtering by Expense Category on Transactions
##    And I select expense schedules radio button
##    And I set following fields value on editable page
##      | name                  | value      |
##      | BeginDate             | 01/01/2010 |
##      | EndDate               | 12/31/2030 |
##      | CodeExpenseCategoryID | Expense    |
##    And I verify the following values in non frame grid "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
##    #Filtering by Expense Category on Transactions
##    And I select transactions radio button
##    And I verify the following values in non frame grid "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense           | Building Maintenance  | 01/01/2010     | 12/31/2030         |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
##
##    #Filtering by Expense Type on Expense Schedules
##    And I select expense schedules radio button
##    And I set following fields value on editable page
##      | name                  | value          |
##      | BeginDate             | 01/01/2010     |
##      | EndDate               | 12/31/2030     |
##      | CodeExpenseCategoryID | All Categories |
##      | CodeExpenseGroupID    | CAM            |
##      | CodeExpenseTypeID     | CAM            |
##    And I verify the following values in non frame grid "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
##      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
##      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
##      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
##
##    #Filtering by Expense Type on Transactions
##    And I select transactions radio button
##    And I set following fields value on editable page
##      | name                  | value                |
##      | BeginDate             | 01/01/2010           |
##      | EndDate               | 12/31/2030           |
##      | CodeExpenseCategoryID | All Categories       |
##      | CodeExpenseGroupID    | Lease Expense        |
##      | CodeExpenseTypeID     | Building Maintenance |
##    And I verify the following values in non frame grid "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type         | Effective Date | Effective End Date |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense | Building Maintenance | 01/01/2010     | 12/31/2030         |
##    And I verify the following values in non frame grid not exist "<Grid ID>"
##      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
##      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
##
##
##    #Show All Check Box
##    And I set following fields value on editable page
##      | name                  | value          |
##      | BeginDate             | 01/01/2010     |
##      | EndDate               | 12/31/2030     |
##      | CodeExpenseCategoryID | All Categories |
##      | CodeExpenseGroupID    | All Groups     |
##      | CodeExpenseTypeID     | All Types      |
##      | showAll               | true           |
#    And I click sort in header "Contract Name" from non frame grid "<Grid ID>" in "Sort Ascending"
#    And I assert the following values in non frame grid "<Grid ID>"
#      | Status | Contract ID | Portfolio   | Contract Name   | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
#      | Review |             | <Portfolio> | <Entity Name>   | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
#      | Review |             | <Portfolio> | <Entity Name>   | Expense          | Lease Expense           | Building Maintenance  | 01/01/2010     | 12/31/2030         |
#      | Review |             | <Portfolio> | <Entity Name 2> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
#
#    #Filtering with Status
#    And I select expense schedules radio button
#    And I set following fields value on editable page
#      | name                  | value          |
#      | BeginDate             | 01/01/2010     |
#      | EndDate               | 12/31/2030     |
#      | CodeExpenseCategoryID | All Categories |
#      | CodeExpenseGroupID    | All Groups     |
#      | CodeExpenseTypeID     | All Types      |
#      | CodeApprovalStatusID  | Approved       |
#      | CodeApprovalStatusID  | Review         |
#      | CodeApprovalStatusID  | Approved       |
#    And I verify the following values in non frame grid "<Grid ID>"
#      | Status   | Portfolio   | Contract Name   | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Approved | <Portfolio> | <Entity Name 2> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
#    And I verify the following values in non frame grid not exist "<Grid ID>"
#      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
#      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Expense            | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |
#
#    And I set following fields value on editable page
#      | name                 | value    |
#      | CodeApprovalStatusID | Review   |
#      | CodeApprovalStatusID | Approved |
#      | CodeApprovalStatusID | Review   |
#    And I verify the following values in non frame grid "<Grid ID>"
#      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
#      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Expense            | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |
#    And I verify the following values in non frame grid not exist "<Grid ID>"
#      | Status   | Portfolio   | Contract Name   | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Approved | <Portfolio> | <Entity Name 2> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
#
#    And I click on the "deny" action from non frame grid "<Grid ID>" having unique value "Water" under column header "Expense Type"
#      | name          | value         |
#      | Contract Name | <Entity Name> |
#      | Expense Group | Utilities     |
#      | Begin Date    | 01/01/2010    |
#      | End Date      | 12/31/2020    |
#    And I set following fields value on editable page
#      | name                 | value  |
#      | CodeApprovalStatusID | Denied |
#      | CodeApprovalStatusID | Review |
#      | CodeApprovalStatusID | Denied |
#    And I verify the following values in non frame grid "<Grid ID>"
#      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Denied | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
#    And I verify the following values in non frame grid not exist "<Grid ID>"
#      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
#      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
#      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
#      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |
#    And I verify the following values in non frame grid not exist "<Grid ID>"
#      | Status   | Portfolio   | Contract Name   | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
#      | Approved | <Portfolio> | <Entity Name 2> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
#    And I close the "Approve Payments" child window
#    And I switch to main window

  Scenario Outline: As a Entity user I Ensure that Approve Payments Pop up - Details
    Given I Login to IWMS using "<Login User>" access credentials
#    And I navigate to entity type "Contract" named "<Entity Name>"
#    Then I navigate to "Payment Info"
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window

  #Checking Date filters From and To on Expense Schedule
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2010 |
      | EndDate   | 12/31/2030 |
    And I click on the "approve" action from non frame grid "<Grid ID>" having unique value "Internet" under column header "Expense Type"
      | name          | value           |
      | Contract Name | <Entity Name 2> |
      | Expense Group | Expense         |
      | Portfolio     | <Portfolio>     |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |

      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
      | Review | <Portfolio> | <Entity Name> | Expense            | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |

  #Checking Date filters From and To on Transaction
    And I select transactions radio button
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense           | Building Maintenance  | 01/01/2010     | 12/31/2030         |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |

  #Filtering by Expense Category on Transactions
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name                  | value      |
      | BeginDate             | 01/01/2010 |
      | EndDate               | 12/31/2030 |
      | CodeExpenseCategoryID | Expense    |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
      | Review | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
  #Filtering by Expense Category on Transactions
    And I select transactions radio button
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense           | Building Maintenance  | 01/01/2010     | 12/31/2030         |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |

  #Filtering by Expense Type on Expense Schedules
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name                  | value          |
      | BeginDate             | 01/01/2010     |
      | EndDate               | 12/31/2030     |
      | CodeExpenseCategoryID | All Categories |
      | CodeExpenseGroupID    | CAM            |
      | CodeExpenseTypeID     | CAM            |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |

  #Filtering by Expense Type on Transactions
    And I select transactions radio button
    And I set following fields value on editable page
      | name                  | value                |
      | BeginDate             | 01/01/2010           |
      | EndDate               | 12/31/2030           |
      | CodeExpenseCategoryID | All Categories       |
      | CodeExpenseGroupID    | Lease Expense        |
      | CodeExpenseTypeID     | Building Maintenance |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type         | Effective Date | Effective End Date |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense | Building Maintenance | 01/01/2010     | 12/31/2030         |
    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |


  #Show All Check Box
    And I set following fields value on editable page
      | name                  | value          |
      | BeginDate             | 01/01/2010     |
      | EndDate               | 12/31/2030     |
      | CodeExpenseCategoryID | All Categories |
      | CodeExpenseGroupID    | All Groups     |
      | CodeExpenseTypeID     | All Types      |
      | showAll               | true           |
    And I click sort in header "Contract Name" from non frame grid "<Grid ID>" in "Sort Ascending"
    And I assert the following values in non frame grid "<Grid ID>"
      | Status | Contract ID | Portfolio   | Contract Name   | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
      | Review |             | <Portfolio> | <Entity Name>   | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
      | Review |             | <Portfolio> | <Entity Name>   | Expense          | Lease Expense           | Building Maintenance  | 01/01/2010     | 12/31/2030         |
      | Review |             | <Portfolio> | <Entity Name 2> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |

  #Filtering with Status
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name                  | value          |
      | BeginDate             | 01/01/2010     |
      | EndDate               | 12/31/2030     |
      | CodeExpenseCategoryID | All Categories |
      | CodeExpenseGroupID    | All Groups     |
      | CodeExpenseTypeID     | All Types      |
      | CodeApprovalStatusID  | Approved       |
      | CodeApprovalStatusID  | Review         |
      | CodeApprovalStatusID  | Approved       |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status   | Portfolio   | Contract Name   | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Approved | <Portfolio> | <Entity Name 2> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
      | Review | <Portfolio> | <Entity Name> | Expense            | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |

    And I set following fields value on editable page
      | name                 | value    |
      | CodeApprovalStatusID | Review   |
      | CodeApprovalStatusID | Approved |
      | CodeApprovalStatusID | Review   |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
      | Review | <Portfolio> | <Entity Name> | Expense            | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |
    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status   | Portfolio   | Contract Name   | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Approved | <Portfolio> | <Entity Name 2> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |

    And I click on the "deny" action from non frame grid "<Grid ID>" having unique value "Water" under column header "Expense Type"
      | name          | value         |
      | Contract Name | <Entity Name> |
      | Expense Group | Utilities     |
      | Begin Date    | 01/01/2010    |
      | End Date      | 12/31/2020    |
    And I set following fields value on editable page
      | name                 | value  |
      | CodeApprovalStatusID | Denied |
      | CodeApprovalStatusID | Review |
      | CodeApprovalStatusID | Denied |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Denied | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $2,000.00 |
    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |
      | Review | <Portfolio> | <Entity Name> | Expense            | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
      | Review | <Portfolio> | <Entity Name> | Rent               | Base Rent     | Base Rent    | 01/01/2010 | 12/31/2030 | $1,000.00 |
    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status   | Portfolio   | Contract Name   | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Approved | <Portfolio> | <Entity Name 2> | Expense          | Expense       | Internet     | 01/01/2010 | 12/31/2015 | $1,000.00 |
    And I close the "Approve Payments" child window
    And I switch to main window

  Examples:
    | Login User | Entity Name                    | Entity Name 2                     | Grid ID                   | Portfolio                      |
    | Entity 841 | Approve Payment Contract A-841 | Approve Payment Contract A-841-v2 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-841 |

  Scenario Outline: As a Entity user I Ensure that Approve Payments Pop up - Transactions
    Given I Login to IWMS using "<Login User>" access credentials
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Group"
      | name           | value                |
      | Effective Date | 01/01/2010           |
      | Type           | Building Maintenance |
      | Category       | Expense              |
    And I set following fields value on editable page
      | name                       | value      |
      | PaymentTransaction_DueDate | 12/31/2017 |
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I click on the "No"
    And I wait for the Loading text to disappear

    And I switch to default frame
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "Details"
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select transactions radio button
    And I set following fields value on editable page
      | name         | value      |
      | BeginDueDate | 01/01/2017 |
      | BeginDate    | 01/01/2010 |
      | EndDate      | 12/31/2030 |

    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type         | Effective Date | Effective End Date |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Expense | Building Maintenance | 01/01/2010     | 12/31/2030         |
    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 01/01/2010     | 12/31/2030         |
    And I close the "Approve Payments" child window
    And I switch to main window

    Examples:
      | Login User | Entity Name                    | Entity Name 2                     | Grid ID                   | Portfolio                      |
      | Entity 841 | Approve Payment Contract A-841 | Approve Payment Contract A-841-v2 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-841 |
