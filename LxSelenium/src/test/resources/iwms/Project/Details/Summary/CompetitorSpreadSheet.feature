@all @smoke @smoke4Dot1
Feature: Competitor SpreadSheet (Ref : Jira Ticket No : AUTOMATION-1159)

  Scenario Outline: I import the project entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary/"
    And I import following file name:
      | CompetitorProject-1159.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I create Create Competitor
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary/"
    And I import following file name:
      | CreateCompetitor-1159.xlsx |
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on "view" row action in the grid "<grid>" having the following header "Name" and cell value "Competitor A"
      | name                   | value        |
      | Name                   | Competitor A |
      | Type                   | Competitor   |
      | Anchor?                | No           |
      | Distance               | 600          |
      | Last Year Annual Sales | $70,000.00   |
      | Rentable Area          |              |
    And I switch to default frame
    And I verify the "CompetitorName" value "Competitor A" on view popup window
    And I verify the "CodeCompetitorTypeID" value "Competitor" on view popup window
    And I verify the "IsAnchorStore" value "No" on view popup window
    And I verify the "Distance" value "600" on view popup window
    And I verify the "LastYearSales" value "$70,000.00" on view popup window

    And I verify the "CountryID" value "United States" on view popup window
    And I verify the "City" value "Texas" on view popup window
    And I verify the "IStateProvinceCountryID" value "TX" on view popup window
    And I verify the "PostalCode" value "79110" on view popup window
    And I verify the "CrossStreet1" value "Dove" on view popup window
    And I verify the "CrossStreet2" value "Western" on view popup window
    And I click on the "Close" button
    And I verify a row from grid "<grid>" having unique value "Competitor B" under column header "Name"
      | name                   | value        |
      | Name                   | Competitor B |
      | Type                   | Competitor   |
      | Anchor?                | Yes          |
      | Distance               | 800          |
      | Last Year Annual Sales | $80,000.00   |
      | Rentable Area          |              |


    Examples:
      | Secondary Tab | Third Level Tab | Entity Name       | grid             |
      | Details       | Summary         | CompetitorProject | BOGridCompetitor |

  Scenario Outline: I update Competitor
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary/"
    And I import following file name:
      | UpdateCompetitor-1159.xlsx |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on "view" row action in the grid "<grid>" having the following header "Name" and cell value "Competitor B"
      | name                   | value        |
      | Name                   | Competitor B |
      | Type                   | Competitor   |
      | Anchor?                | Yes          |
      | Distance               | 200          |
      | Last Year Annual Sales | $1,200.00    |
      | Rentable Area          |              |
    And I switch to default frame
    And I verify the "CompetitorName" value "Competitor B" on view popup window
    And I verify the "CodeCompetitorTypeID" value "Competitor" on view popup window
    And I verify the "IsAnchorStore" value "Yes" on view popup window
    And I verify the "Distance" value "200" on view popup window
    And I verify the "LastYearSales" value "$1,200.00" on view popup window
    And I verify the "CountryID" value "United States" on view popup window
    And I verify the "City" value "Frisco" on view popup window
    And I verify the "IStateProvinceCountryID" value "TX" on view popup window
    And I verify the "PostalCode" value "78092" on view popup window
    And I verify the "CrossStreet1" value "Alligator" on view popup window
    And I verify the "CrossStreet2" value "Swan" on view popup window
    And I click on the "Close" button
    And I verify a row from grid "<grid>" having unique value "Competitor A" under column header "Name"
      | name                   | value        |
      | Name                   | Competitor A |
      | Type                   | Competitor   |
      | Anchor?                | No           |
      | Distance               | 600          |
      | Last Year Annual Sales | $70,000.00   |
      | Rentable Area          |              |
    And I switch to default frame
    And I logout

    Examples:
      | Secondary Tab | Third Level Tab | Entity Name       | grid             | Login User | Login full username |
      | Details       | Summary         | CompetitorProject | BOGridCompetitor | EditAccess | Edit Access Access  |