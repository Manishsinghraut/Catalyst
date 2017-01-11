@all
Feature:(Jira - AUTOMATION-545) Generate Rent for Payables with All Portfolio and one Portfolio

  Scenario Outline: As a delete user I import basic generate rent xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/"
    And I import following file name:
      | Imported_Location.xml                |
      | Portfolio_Generate_Rent_Payables.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I can able Generate Rent for Payables with one Portfolio
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
    When I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header
#    And I navigate to "<Second Level Tab>"
    And I click on the "Details" tab
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Rent" under column header "Expense Type"
    And I switch to default frame
    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value  |
      | yrToGenerate | <Year> |
      #| batchDate    | <Batch Date> |

    And I set following list fields values on editable page
      | name         | value             |
      | paymntClass  | <Generate Option> |
      | mnToGenerate | <Month>           |

    And I select following Items from field
      | name            | value       |
      | portfolioIDList | <Portfolio> |

    Then I fetch record number while generating rent
    And I click "OK" button
    And I verify "generated" message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I switch to default frame
    When I navigate to the admin dashboard
    And I click on the "Job Log" link
    And I click on log file link
    Then I verify the following text present in log file
      | Portfolio-Generate-Rent-Payables |

    And I verify the following text not present in log file
      | Selenium-Contract |
#    And I logout

  Examples:
    | Generate Option         | Year | Month | Batch Date | Portfolio | Login User   | Login full username  | Entity Type | Contract Name                    | Second Level Tab | Third Level Tab    | Grid ID |
#    | Payables  All Contracts | 2014 | May   | 03/24/2015 | Lucernex  | DeleteAccess | Delete Access Access | Contract    | Portfolio-Generate-Rent-Payables | Payment Info     | Recurring Expenses | thisDiv |
    | Payables                | 2014 | May   | 03/24/2015 | Lucernex  | DeleteAccess | Delete Access Access | Contract    | Portfolio-Generate-Rent-Payables | Payment Info     | Recurring Expenses | thisDiv |

#  Scenario Outline: As a delete user I can able Generate Rent for Payables with All Portfolios
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    When I Search for the "<Contract Name>" that was created
#    And Click on the name of the "<Contract Name>" in the results pop-up
#    Then I see "<Contract Name>" name on the header
##    And I navigate to "<Second Level Tab>"
#    And I click on the "<Second Level Tab>" tab
#    And I click on the "<Third Level Tab>" tab
#    And I click row from grid "<Grid ID>" having unique value "Rent" under column header "Expense Type"
#    And I switch to default frame
#    Then I click on the "Generate Rent" action panel button
#    Then I set fields values on editable page
#      | name         | value  |
#      | yrToGenerate | <Year> |
#      #| batchDate    | <Batch Date> |
#
#    And I set following list fields values on editable page
#      | name         | value             |
#      | paymntClass  | <Generate Option> |
#      | mnToGenerate | <Month>           |
#
#    And I select following Items from field
#      | name            | value       |
#      | portfolioIDList | <Portfolio> |
#
#    Then I fetch record number while generating rent
#    And I click "OK" button
#    Then I verify "processed." message appear after generating rent
#    And I click "OK" button
#    And I wait for the Loading text to disappear
#    And I switch to default frame
#    When I navigate to the admin dashboard
#    And I click on the "Job Log" link
#    And I click on log file link
#    Then I verify the following text present in log file
#      | Portfolio-Generate-Rent-Payables |
#
#    Examples:
#      | Generate Option         | Year | Month    | Batch Date | Portfolio      | Login User   | Login full username  | Entity Type | Contract Name                    | Second Level Tab | Third Level Tab    | Grid ID |
##      | Payables        | 2013 | February | 03/24/2015 | All Portfolios | DeleteAccess | Delete Access Access | Contract    | Portfolio-Generate-Rent-Payables | Payment Info     | Recurring Expenses | thisDiv |
#      | Payables  All Contracts | 2013 | February | 03/24/2015 | All Portfolios | DeleteAccess | Delete Access Access | Contract    | Portfolio-Generate-Rent-Payables | Payment Info     | Recurring Expenses | thisDiv |
#
#
#
