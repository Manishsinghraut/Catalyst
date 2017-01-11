@all
Feature: Verify Ability to "move" asset to another facility

  #==========================================================
  # Testing of embedded project's members grid
  #==========================================================
  Scenario: Login and navigate to Project, Details, Members/Contacts
    Given I login to IWMS using LxAdmin credentials
    When I navigate to entity type "Project" named "1-RAR"
    And I navigate to "Members/Contacts"
    Then I see that I am on the "Project" entity tab
    And I see that I am on the second level tab "Details"
    And I see that I am on the third level tab "Members/Contacts"

  Scenario Outline: Test Project member contracts grid
    Then I verify in grid "<gridId>" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
  Examples:
    |gridId        |rowNumber  |headerName     |cellValue                                            |
    |BOGridMember  |1          |Name           |Andre Violentyev                                     |
    |BOGridMember  |2          |Phone          |206-555-1212                                         |
    |BOGridMember  |5          |User Class     |Lease Admin                                          |
    |BOGridMember  |7          |Email          |rory.nagy@lucernex.com\n\nrory.nagy@comcast.net      |

  #==========================================================
  # Testing of embedded contract's offset grid
  #==========================================================
  Scenario: Navigate to Contract, Payment Info, Percentage Rent
    When I navigate to entity type "Contract" named "PRPVariousFixedOffsets"
    And I navigate to "Payment Info, Percentage Rent"
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Percentage Rent"

  Scenario Outline: Test PRP Offsets grid
    Then I verify in grid "<gridId>" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
  Examples:
    |gridId        |rowNumber  |headerName     |cellValue                                                  |
    |BOGridVariableRentOffset  |1              |Begin Date                |01/01/2010                      |
    |BOGridVariableRentOffset  |2              |Offset Group              |Group A                         |
    |BOGridVariableRentOffset  |3              |End Date                  |02/28/2013                      |
    |BOGridVariableRentOffset  |3              |Fixed Offset Amount       |€100.00                         |

  #==========================================================
  # Testing of contract's percentage rent grid
  #==========================================================
  Scenario: Navigate to Contract, Payment Info, Percentage Rent
    When I navigate to entity type "Contract" named "PRPVariousFixedOffsets"
    And I navigate to "Payment Info, Percentage Rent"
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Percentage Rent"

  Scenario Outline: Test Percent Rent grid
    Then I verify in grid "<gridId>" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
  Examples:
    |gridId        |rowNumber  |headerName        |cellValue                                       |
    |thisDiv       |1          |End Date          |12/31/2015                                      |
    |thisDiv       |1          |Description       |Complicated PR                                  |

  #==========================================================
  # Testing of contract's alternate rent grid
  #==========================================================
  Scenario: Navigate to Contract, Payment Info, Alternate Rent
    When I navigate to entity type "Contract" named "PRPVariousFixedOffsets"
    And I navigate to "Payment Info, Alternate Rent"
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Alternate Rent"
    And I click on the "Alternate Rent Wizard" action panel button

  Scenario Outline: Test Alternate Rent grid
    Then I verify in grid "<gridId>" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
  Examples:
    |gridId                |rowNumber  |headerName                 |cellValue           |
    |expenseSetupDiv       |1          |Expense Group              |Base Rent           |
    |expenseSetupDiv       |3          |Period Amount              |€416.67             |

  #==========================================================
  # Testing of contract's approve payments grid
  #==========================================================
  Scenario: Navigate to Contract, Details, Summary
    When I navigate to entity type "Contract" named "PRPVariousFixedOffsets"
    And I navigate to "Details, Summary"
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Details"
    And I see that I am on the third level tab "Summary"
    And I click on the "Approve Payments" action panel button

  Scenario Outline: Test Approve Payments grid
    Then I verify in grid "<gridId>" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
  Examples:
    |gridId                          |rowNumber  |headerName        |cellValue                                       |
    |ApproveExpenseScheduleDiv       |1          |Contract ID       |MergePmtAndFcstExample                          |
    |ApproveExpenseScheduleDiv       |3          |Contract Name     |Chicago - 60603 (Demo) - Primary Lease          |


  #==========================================================
  # Testing of contract's recurring expenses schedule grid
  #==========================================================
  Scenario: Navigate to Contract, Payment Info, Recurring Expenses
    When I navigate to entity type "Contract" named "PRPVariousFixedOffsets"
    And I navigate to "Payment Info, Recurring Expenses"
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Recurring Expenses"

  Scenario Outline: Test Recurring Expenses Schedule grid
    Then I verify in grid "BOGridExpenseSchedule" that "<rowNumber>" and "<headerName>" has "<cellValue>" value
  Examples:
    |rowNumber  |headerName        |cellValue      |
    |1          |Begin Date        |01/01/2010     |
    |1          |Payment Amount    |€1,500.00      |
    |1          |Rate              |€3.60          |




