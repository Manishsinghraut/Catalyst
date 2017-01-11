@all
Feature: Only showing members with a change in membership (Ref : Jira Ticket No : AUTOMATION-1286)

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Members/"
    And I import following file name:
      | Member_1286.xlsx     |
      | CMembership_1286.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to Location A-11371 > Members/Contacts and ensure that cMember 11371 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row in grid "<Grid>" having value "<Member>" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name      | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Location A-11371 | Members/Contacts | BOGridMember | CMember 11371 |

  Scenario Outline: As a delete user I Navigate to Location B-11371>Members/Contacts and ensure that cMember 11371 is displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Team Member       |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name      | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Location B-11371 | Members/Contacts | BOGridMember | CMember 11371 |


  Scenario Outline: As a delete user I Navigate to Project A-11371> Members/Contacts and ensure that cMember 11371 is displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Team Member       |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Project A-11371 | Members/Contacts | BOGridMember | CMember 11371 |


  Scenario Outline: As a delete user I Navigate to Project B-11371> Members/Contacts and ensure that cMember 11371 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row in grid "<Grid>" having value "<Member>" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Project B-11371 | Members/Contacts | BOGridMember | CMember 11371 |


  Scenario Outline: As a delete user I Navigate to Admin Dashboard and click on Project Membership Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Project Membership Management" link
    And I click on "One Member Many Projects" tab
    And I set following fields value on editable page
      | name           | value          |
      | memberID       | 11371, CMember |
      | memberEditMode | edit           |

    And I click on Next button on "One Member Many Projects tab"
    And I search member "Location A-11371"
    And I click on the "Member" row action of column "Location A-11371" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "Location A-11371" under column header "Name"
      | name               | value             |
      | Type               | Location          |
      | Name               | Location A-11371  |
      | Portfolio/Program  | Lucernex-Selenium |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | None              |
    And I search member "Location B-11371"
    And I click on the "remove" row action of column "Location B-11371" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "Location B-11371" under column header "Name"
      | name               | value             |
      | Type               | Location          |
      | Name               | Location B-11371  |
      | Portfolio/Program  | Lucernex-Selenium |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | Member            |

    And I search member "Project A-11371"
    And I click on the "remove" row action of column "Project A-11371" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "Project A-11371" under column header "Name"
      | name               | value                              |
      | Type               | Opening Project                    |
      | Name               | Project A-11371                    |
      | Portfolio/Program  | Lucernex-Selenium                  |
      | Parent Region      | Central(Central region - preOpen)) |
      | Sub Region         |                                    |
      | Market             | Central                            |
      | Project Type       |                                    |
      | Current Membership | Member                             |

    And I search member "Project B-11371"
    And I click on the "Member" row action of column "Project B-11371" of column "1" from grid "<Grid>"
    And I verify row from non frame grid "<Grid>" having unique value "Project B-11371" under column header "Name"
      | name               | value                              |
      | Type               | Opening Project                    |
      | Name               | Project B-11371                    |
      | Portfolio/Program  | Lucernex-Selenium                  |
      | Parent Region      | Central(Central region - preOpen)) |
      | Sub Region         |                                    |
      | Market             | Central                            |
      | Project Type       |                                    |
      | Current Membership | None                               |
      | Planned Membership | Member                             |

    And I set following fields value on editable page
      | name         | value |
      | showModified | true  |

    And I verify row from non frame grid "<Grid>" having unique value "Location A-11371" under column header "Name"
      | name               | value             |
      | Type               | Location          |
      | Name               | Location A-11371  |
      | Portfolio/Program  | Lucernex-Selenium |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | None              |
      | Planned Membership | Member            |

    And I verify row from non frame grid "<Grid>" having unique value "Location B-11371" under column header "Name"
      | name               | value             |
      | Type               | Location          |
      | Name               | Location B-11371  |
      | Portfolio/Program  | Lucernex-Selenium |
      | Parent Region      |                   |
      | Sub Region         |                   |
      | Market             |                   |
      | Project Type       |                   |
      | Current Membership | Member            |
      | Planned Membership | None              |


    And I verify row from non frame grid "<Grid>" having unique value "Project A-11371" under column header "Name"
      | name               | value                              |
      | Type               | Opening Project                    |
      | Name               | Project A-11371                    |
      | Portfolio/Program  | Lucernex-Selenium                  |
      | Parent Region      | Central(Central region - preOpen)) |
      | Sub Region         |                                    |
      | Market             | Central                            |
      | Project Type       |                                    |
      | Current Membership | Member                             |
      | Planned Membership | None                               |

    And I verify row from non frame grid "<Grid>" having unique value "Project B-11371" under column header "Name"
      | name               | value                              |
      | Type               | Opening Project                    |
      | Name               | Project B-11371                    |
      | Portfolio/Program  | Lucernex-Selenium                  |
      | Parent Region      | Central(Central region - preOpen)) |
      | Sub Region         |                                    |
      | Market             | Central                            |
      | Project Type       |                                    |
      | Current Membership | None                               |
      | Planned Membership | Member                             |
    And I click on Process Planned Membership button
    And I wait for "Total Entities Modified: 4" is visible
    And I see the following note on the "One Member Many Projects"
      | Finished processing           |
    And I see the following note on the "One Member Many Projects"
      | Total Entities Modified: 4    |
    And I see the following note on the "One Member Many Projects"
      | No Errors encountered         |
    And I see the following note on the "One Member Many Projects"
      | Added as member to 2 entities |
    And I see the following note on the "One Member Many Projects"
      | Removed from 2 entities       |

  Examples:
    | Login User   | Login full username  | Entity Name     | Third Level Tab  | Grid         | Members       |
    | DeleteAccess | Delete Access Access | Project B-11371 | Members/Contacts | entitySelect | CMember 11371 |

  Scenario Outline: As a delete user I Navigate to Location A-11371 > Members/Contacts and ensure that cMember 11371 is displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Team Member       |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name      | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Location A-11371 | Members/Contacts | BOGridMember | CMember 11371 |

  Scenario Outline: As a delete user I Navigate to Location B-11371>Members/Contacts and ensure that cMember 11371 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row in grid "<Grid>" having value "<Member>" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name      | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Location B-11371 | Members/Contacts | BOGridMember | CMember 11371 |


  Scenario Outline: As a delete user I Navigate to Project A-11371> Members/Contacts and ensure that cMember 11371 is Not displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify row in grid "<Grid>" having value "<Member>" under column header "Name" not present
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Project A-11371 | Members/Contacts | BOGridMember | CMember 11371 |


  Scenario Outline: As a delete user I Navigate to Project B-11371> Members/Contacts and ensure that cMember 11371 is displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<Grid>" having unique value "<Member>" under column header "Name"
      | name         | value             |
      | Type         | Team Member       |
      | Name         | <Member>          |
      | Title        | Delete Access     |
      | Phone        |                   |
      | Email        |                   |
      | Employer     | Selenium-Employer |
      | Job Function | Delete Access     |
      | User Class   | Delete Access     |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name     | Third Level Tab  | Grid         | Member        |
    | DeleteAccess | Delete Access Access | Project B-11371 | Members/Contacts | BOGridMember | CMember 11371 |
