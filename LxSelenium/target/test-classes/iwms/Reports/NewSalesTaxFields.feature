@all
Feature: New Sales Tax Fields (Jira Ref. : AUTOMATION-756)

  Scenario Outline: New Sales Tax Fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | LucernexProject.xml           |
      | NewSalesTaxFieldsContract.xml |
      | NewSalesTaxFieldsReport.xml   |
    And I navigate to entity type "Locations" named "Lucernex-Project" through search option
    And I click on the "Summary" tab
    And I verify the "Primary Tax/Sales/GST/HST 10.000%"
    And I navigate to entity type "Contracts" named "<Entity Name>" through search option
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I verify the following fields value on editable page
      | name                                 | value |
      | _checkbox_ExpenseSetup_ApplyTax1Flag | true  |
    And I switch to default frame
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                       |
      | Report Name | New Sales Tax Fields Report |

    And I switch to "report" child window
    And I Select "contains" from "Name is" filter drop-down and enter "New Sales"
    And I click on Next button from run report filter
    And I click on Expand sign of row "New Sales Tax Fields Contract" on report
    And I verify without tax and with tax fields in of row "2021+" on run report
      | name                        | value                                                      |
      | Name                        | 2021+                                                      |
      | Aggregate Base Rent         | $1,200,000.00	Beyond Fifth Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $1,320,000.00 2021+                                        |
      | Aggregate Total Rent        | $1,200,000.00	Beyond Fifth Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $1,320,000.00                                              |

    And I verify without tax and with tax fields in of row "2022+" on run report
      | name                        | value                                                      |
      | Name                        | 2022+                                                      |
      | Aggregate Base Rent         | $1,080,000.00	Beyond Sixth Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $1,188,000.00	2022+                                        |
      | Aggregate Total Rent        | $1,080,000.00	Beyond Sixth Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $1,188,000.00                                              |

    And I verify without tax and with tax fields in of row "2016" on run report
      | name                        | value                                                 |
      | Name                        | 2016                                                  |
      | Aggregate Base Rent         | $120,000.00 Current Annual Calendar Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $132,000.00 2016                                      |
      | Aggregate Total Rent        | $120,000.00 Current Annual Calendar Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $132,000.00                                           |

    And I verify without tax and with tax fields in of row "Current Monthly Base Rent" on run report
      | name                        | value                                        |
      | Name                        | Current Monthly Base Rent                    |
      | Aggregate Base Rent         | $10,000.00 Current Monthly Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $11,000.00 Current Monthly Total Rent        |
      | Aggregate Total Rent        | $10,000.00 Current Monthly Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $11,000.00                                   |

    And I verify without tax and with tax fields in of row "2020" on run report
      | name                        | value                                             |
      | Name                        | 2020                                              |
      | Aggregate Base Rent         | $120,000.00 Fifth Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $132,000.00 2020                                  |
      | Aggregate Total Rent        | $120,000.00 Fifth Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $132,000.00                                       |

    And I verify without tax and with tax fields in of row "2019" on run report
      | name                        | value                                              |
      | Name                        | 2019                                               |
      | Aggregate Base Rent         | $120,000.00 Fourth Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $132,000.00 2019                                   |
      | Aggregate Total Rent        | $120,000.00 Fourth Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $132,000.00                                        |

    And I verify without tax and with tax fields in of row "2017" on run report
      | name                        | value                                            |
      | Name                        | 2017                                             |
      | Aggregate Base Rent         | $120,000.00 Next Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $132,000.00 2017                                 |
      | Aggregate Total Rent        | $120,000.00 Next Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $132,000.00                                      |

    And I verify without tax and with tax fields in of row "2021" on run report
      | name                        | value                                             |
      | Name                        | 2021                                              |
      | Aggregate Base Rent         | $120,000.00 Sixth Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $132,000.00 2021                                  |
      | Aggregate Total Rent        | $120,000.00 Sixth Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $132,000.00                                       |

    And I verify without tax and with tax fields in of row "2018" on run report
      | name                        | value                                             |
      | Name                        | 2018                                              |
      | Aggregate Base Rent         | $120,000.00 Third Calendar Year Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $132,000.00 2018                                  |
      | Aggregate Total Rent        | $120,000.00 Third Calendar Year Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $132,000.00                                       |

    And I verify without tax and with tax fields in of row "Current Calendar Q1 Base Rent" on run report
      | name                        | value                                            |
      | Name                        | Current Calendar Q1 Base Rent                    |
      | Aggregate Base Rent         | $30,000.00 Current Calendar Q1 Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $33,000.00 Current Calendar Q1 Total Rent        |
      | Aggregate Total Rent        | $30,000.00 Current Calendar Q1 Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $33,000.00                                       |

    And I verify without tax and with tax fields in of row "Current Calendar Q2 Base Rent" on run report
      | name                        | value                                            |
      | Name                        | Current Calendar Q2 Base Rent                    |
      | Aggregate Base Rent         | $30,000.00 Current Calendar Q2 Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $33,000.00 Current Calendar Q2 Total Rent        |
      | Aggregate Total Rent        | $30,000.00 Current Calendar Q2 Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $33,000.00                                       |

    And I verify without tax and with tax fields in of row "Current Calendar Q3 Base Rent" on run report
      | name                        | value                                            |
      | Name                        | Current Calendar Q3 Base Rent                    |
      | Aggregate Base Rent         | $30,000.00 Current Calendar Q3 Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $33,000.00 Current Calendar Q3 Total Rent        |
      | Aggregate Total Rent        | $30,000.00 Current Calendar Q3 Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $33,000.00                                       |

    And I verify without tax and with tax fields in of row "Current Calendar Q4 Base Rent" on run report
      | name                        | value                                            |
      | Name                        | Current Calendar Q4 Base Rent                    |
      | Aggregate Base Rent         | $30,000.00 Current Calendar Q4 Base Rent w/ Tax  |
      | Aggregate Base Rent w/ Tax  | $33,000.00 Current Calendar Q4 Total Rent        |
      | Aggregate Total Rent        | $30,000.00 Current Calendar Q4 Total Rent w/ Tax |
      | Aggregate Total Rent w/ Tax | $33,000.00                                       |

    And I close report window
    And I switch to main window

    Examples:
      | Entity Name                   | Second Level Tab | Third Level Tab    | Grid title                  |
      | New Sales Tax Fields Contract | Payment Info     | Recurring Expenses | Contract Expense Setup List |