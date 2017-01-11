Feature: Import test data

  Scenario: I Login to IWMS using Delete access credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I used data files from "Data/ImportDataFiles/xml/"
    And I import following files:
      | SeleniumWebdriverPrototype.xml      |
      | SeleniumWebdriverSite.xml           |
      | SeleniumWebdriverCapitalProgram.xml |
      | BuudgetTemplate.xml                 |

