@all
Feature: Replacing Members and Managers on Portfolio - Org Chart (Ref : Jira Ticket No : AUTOMATION-1280)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | Member_Test_1260_1280.xlsx      |
      | Portfolio_Testing_1260_1280.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to Manage Members/Contacts and ensure that 8 members are created
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Members/Contacts" link
    And I search member "Top Level"
    And I verify a row from non frame grid "<Grid>" having unique value "Top Level Manager A" under column header "Name"
      | name         | value               |
      | Name         | Top Level Manager A |
      | Member?      | Yes                 |
      | Job Title    | Delete Access       |
      | Job Function | Delete Access       |
      | Email        | QA1@lucernex.com    |
      | Employer     | Selenium-Employer   |
      | User Class   | Delete Access       |
      | Last Login   |                     |
    And I verify a row from non frame grid "<Grid>" having unique value "Top Level Manager B" under column header "Name"
      | name         | value               |
      | Name         | Top Level Manager B |
      | Member?      | Yes                 |
      | Job Title    | Delete Access       |
      | Job Function | Delete Access       |
      | Email        | QA1@lucernex.com    |
      | Employer     | Selenium-Employer   |
      | User Class   | Delete Access       |
      | Last Login   |                     |

    And I verify a row from non frame grid "<Grid>" having unique value "Top Level Member A" under column header "Name"
      | name         | value              |
      | Name         | Top Level Member A |
      | Member?      | Yes                |
      | Job Title    | Delete Access      |
      | Job Function | Delete Access      |
      | Email        | QA1@lucernex.com   |
      | Employer     | Selenium-Employer  |
      | User Class   | Delete Access      |
      | Last Login   |                    |

    And I verify a row from non frame grid "<Grid>" having unique value "Top Level Member B" under column header "Name"
      | name         | value              |
      | Name         | Top Level Member B |
      | Member?      | Yes                |
      | Job Title    | Delete Access      |
      | Job Function | Delete Access      |
      | Email        | QA1@lucernex.com   |
      | Employer     | Selenium-Employer  |
      | User Class   | Delete Access      |
      | Last Login   |                    |

    And I search member "Region"
    And I verify a row from non frame grid "<Grid>" having unique value "Region Manager A" under column header "Name"
      | name         | value             |
      | Name         | Region Manager A  |
      | Member?      | Yes               |
      | Job Title    | Delete Access     |
      | Job Function | Delete Access     |
      | Email        | QA1@lucernex.com  |
      | Employer     | Selenium-Employer |
      | User Class   | Delete Access     |
      | Last Login   |                   |

    And I verify a row from non frame grid "<Grid>" having unique value "Region Manager B" under column header "Name"
      | name         | value             |
      | Name         | Region Manager B  |
      | Member?      | Yes               |
      | Job Title    | Delete Access     |
      | Job Function | Delete Access     |
      | Email        | QA1@lucernex.com  |
      | Employer     | Selenium-Employer |
      | User Class   | Delete Access     |
      | Last Login   |                   |

    And I verify a row from non frame grid "<Grid>" having unique value "Region Member A" under column header "Name"
      | name         | value             |
      | Name         | Region Member A   |
      | Member?      | Yes               |
      | Job Title    | Delete Access     |
      | Job Function | Delete Access     |
      | Email        | QA1@lucernex.com  |
      | Employer     | Selenium-Employer |
      | User Class   | Delete Access     |
      | Last Login   |                   |

    And I verify a row from non frame grid "<Grid>" having unique value "Region Member B" under column header "Name"
      | name         | value             |
      | Name         | Region Member B   |
      | Member?      | Yes               |
      | Job Title    | Delete Access     |
      | Job Function | Delete Access     |
      | Email        | QA1@lucernex.com  |
      | Employer     | Selenium-Employer |
      | User Class   | Delete Access     |
      | Last Login   |                   |

  Examples:
    | Login User   | Login full username  | Grid                      |
    | DeleteAccess | Delete Access Access | BOGridBOListExtGridPerson |

  Scenario Outline: As a delete user I Navigate to Portfolio_Testing_1260 Portfolio > Org Chart
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value    |
      | OperatingStatus | Pre-open |
    And I wait for the loading text to be disappear
    And I expand "Parent Region-1260" region list
    And I expand "Sub Region-1260" region list
    And I set following fields value on editable page
      | name            | value     |
      | OperatingStatus | Operating |
    And I wait for the loading text to be disappear
    And I expand "Operating-PR" region list
    And I expand "Operating-SR" region list
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name            | Second Level Tab |
    | DeleteAccess | Delete Access Access | Portfolio Testing 1260 | Org Chart        |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "Replace / Switch Members" tab

    And I set following fields value on editable page
      | name                        | value               |
      | memberID                    | Member A, Top Level |
      | removeFromReplacedEntitites | true                |
      | replaceWithMemberID         | Member B, Top Level |
      | promoteReplacee             | false               |
      | memberEditMode              | remove              |
      | orgChartMode                | replaceMem          |
    And I click on Next button on "Replace / Switch Members tab"

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 0" is visible
    And I wait for "Replacing Top Level Member A with Top Level Member B" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 0 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 0 entity |
    And I see the following note on the "Replace / Switch Members"
#      | * Org Chart Member changes: Deleted 2 records |
      | * Org Chart Member changes: Updated 2 records |

  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link

    And I click on "Replace / Switch Members" tab

    And I set following fields value on editable page
      | name                        | value                |
      | memberID                    | Manager A, Top Level |
      | removeFromReplacedEntitites | true                 |
      | replaceWithMemberID         | Manager B, Top Level |
      | promoteReplacee             | false                |
      | memberEditMode              | remove               |
      | orgChartMode                | replaceMem           |
    And I click on Next button on "Replace / Switch Members tab"

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 0" is visible
    And I wait for "Replacing Top Level Manager A with Top Level Member B" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 0 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 0 entity |
    And I see the following note on the "Replace / Switch Members"
      | * Org Chart Member changes: Updated 2 records |

  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link

    And I click on "Replace / Switch Members" tab

    And I set following fields value on editable page
      | name                        | value            |
      | memberID                    | Member A, Region |
      | removeFromReplacedEntitites | true             |
      | replaceWithMemberID         | Member B, Region |
      | promoteReplacee             | false            |
      | memberEditMode              | remove           |
      | orgChartMode                | replaceMem       |
    And I click on Next button on "Replace / Switch Members tab"

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 0" is visible
    And I wait for "Replacing Region Member A with Region Member B" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 0 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 0 entity |
    And I see the following note on the "Replace / Switch Members"
      | * Org Chart Member changes: Updated 6 records |

  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link

    And I click on "Replace / Switch Members" tab

    And I set following fields value on editable page
      | name                        | value             |
      | memberID                    | Manager A, Region |
      | removeFromReplacedEntitites | true              |
      | replaceWithMemberID         | Manager B, Region |
      | promoteReplacee             | false             |
      | memberEditMode              | remove            |
      | orgChartMode                | replaceMem        |
    And I click on Next button on "Replace / Switch Members tab"

    And I click on Process Planned Membership button

    And I wait for "Total Entities Modified: 0" is visible
    And I wait for "Replacing Region Manager A with Region Manager B" is visible

    And I see the following note on the "Replace / Switch Members"
      | This interface allows System Administrators to manage membership for ONE member to MULTIPLE entities |

    And I see the following note on the "Replace / Switch Members"
      | Finished processing |

    And I see the following note on the "Replace / Switch Members"
      | Total Entities Modified: 0 |

    And I see the following note on the "Replace / Switch Members"
      | No Errors encountered |

    And I see the following note on the "Replace / Switch Members"
      | Replaced in 0 entity |
    And I see the following note on the "Replace / Switch Members"
      | * Org Chart Member changes: Updated 6 records |


  Examples:
    | Login User   | Login full username  | Grid         |
    | DeleteAccess | Delete Access Access | entitySelect |

  Scenario Outline: As a delete user I Navigate to Portfolio_Testing_1260 Portfolio > Org Chart
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I switch to visible frame
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value    |
      | OperatingStatus | Pre-open |
    And I wait for the loading text to be disappear

    And I verify the "Portfolio Testing 1260" region of managers "Delete Access Top Level Manager B"
    And I verify the "Portfolio Testing 1260" region of member "Delete Access Top Level Member B"

    And I expand "Parent Region-1260" region list
    And I verify the "Parent Region-1260" region of managers "Delete Access Region Manager B"
    And I verify the "Parent Region-1260" region of member "Delete Access Region Member B"

    And I expand "Sub Region-1260" region list
    And I verify the "Sub Region-1260" region of managers "Delete Access Region Manager B"
    And I verify the "Sub Region-1260" region of member "Delete Access Region Member B"

    And I verify the "Legacy Market Area" region of managers "Delete Access Region Manager B"
    And I verify the "Legacy Market Area" region of member "Delete Access Region Member B"

    And I set following fields value on editable page
      | name            | value     |
      | OperatingStatus | Operating |
    And I wait for the loading text to be disappear

    And I verify the "Portfolio Testing 1260" region of managers "Delete Access Top Level Manager B"
    And I verify the "Portfolio Testing 1260" region of member "Delete Access Top Level Member B"

    And I expand "Operating-PR" region list
    And I verify the "Operating-PR" region of managers "Delete Access Region Manager B"
    And I verify the "Operating-PR" region of member "Delete Access Region Member B"

    And I expand "Operating-SR" region list
    And I verify the "Operating-SR" region of managers "Delete Access Region Manager B"
    And I verify the "Operating-SR" region of member "Delete Access Region Member B"

    And I verify the "Legacy Market Area" region of managers "Delete Access Region Manager B"
    And I verify the "Legacy Market Area" region of member "Delete Access Region Member B"

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name            | Second Level Tab |
    | DeleteAccess | Delete Access Access | Portfolio Testing 1260 | Org Chart        |