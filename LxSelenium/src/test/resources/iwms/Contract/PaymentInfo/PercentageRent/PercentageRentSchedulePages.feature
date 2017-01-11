@all
Feature: I verify the Percentage Rent (Single BP) and Percentage Rent (Multi BP) Schedule details (Jira Ref : AUTOMATION-636)

  Scenario Outline: I verify the Percentage Rent (Single BP) Schedule details
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
     # | PRCalculationMethods.xml |
#      | PR_Calculation_Methods.xml |
      | PercentageRentSchedulePages-636.xml |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "January" month and "2012" year from dropdown in schedule details to view the details
    And I verify the "<Percentage Rent page>" grid loads
      | Name                   |
      | Sales Group            |
      | Month/Year             |
      | Gross Sales            |
      | Excluded Sales         |
      | Lease YTD Sales        |
      | Breakpoint             |
      | Sales Past Breakpoint  |
      | Rate                   |
      | Total %Rent            |
      | Amount Previously Paid |
      | %Rent Owed             |
    And I verify the values at the bottom of the page
      | name                  | value      |
      | Total Percentage Rent | $27,900.00 |
      | Amount Already Paid   | $0.00      |
      | Percentage Rent Owed  | $27,900.00 |
      | Offset Amount         | $0.00      |
      | Net Amount Due        | $27,900.00 |
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                        | Percentage Rent page                 |
#      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Single BP) Schedule |
      | Contract | Payment Info     | Percentage Rent | Percentage Rent Schedule Pages-636 | Percentage Rent (Single BP) Schedule |

  Scenario Outline: I verify the Percentage Rent (Multi BP) Schedule details
    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      #| PRCalculationMethods.xml |
#      | PR_Calculation_Methods.xml |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "January" month and "2012" year from dropdown in schedule details to view the details
    And I verify the "<Percentage Rent page>" grid loads
      | Name              |
      | Sales Group       |
      | Period /Year      |
      | Gross Sales       |
      | Excl. Sales       |
      | Net Sales         |
      | Lease YTD Sales   |
      | Brkpt 1           |
      | Rate 1            |
      | Amt Due 1         |
      | Brkpt 2           |
      | Rate 2            |
      | Amt Due 2         |
      | Brkpt 3           |
      | Rate 3            |
      | Amt Due 3         |
      | Total %Rent       |
      | Amount Prev. Paid |
      | %Rent Owed        |

    #And I verify the "<Percentage Rent page>" values at the bottom of the page
    And I verify pair of values on non editable summary page
      | name                  | value      |
      | Total Percentage Rent | $27,900.00 |
      | Amount Already Paid   | $0.00      |
      | Percentage Rent Owed  | $27,900.00 |
      | Offset Amount         | $0.00      |
      | Net Amount Due        | $27,900.00 |
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                        | Percentage Rent page                |
#      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule |
      | Contract | Payment Info     | Percentage Rent | Percentage Rent Schedule Pages-636 | Percentage Rent (Multi BP) Schedule |