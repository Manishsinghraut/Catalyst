@all @smoke
Feature: (Jira - AUTOMATION-349) As an admin I should be able to convert site to project
  #issue exist - IWMS-20761

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Dash board I can see the search box
    When I see the Dashboard
#    And I Search for the "<Name>" that was created
#    And Click on the name of the "Site: <Name>" in the results pop-up
##    And Click on the name of the "Project: <Name>, Plano, TX 75024 United States" in the results pop-up
#    Then I see "<Name>" name on the header
    And I navigate to entity type "Sites" named "<Name>" through search option
    And I click on the "Convert to Project" action panel button
    And I set following fields value on editable page
      | name        | value             |
      | locationSel | createNewLocation |
    And I verify the following fields value on editable page
      | name         | value  |
      | locationName | <Name> |

    And I click on the "Convert Site to Project" button
    And I wait for modal window to close
    Then I see "<Name>" name on the header
#    #IWMS-21307
    Then I see that I am on the entity page "Project: <Name>"
    Then I see that I am on the entity page "<Name>"
#    Then I verify the following details in non editable summary page in frame grid
#      | General Information |                                                     |              |                    |
#      | Name                | <Name>                                              |              |                    |
#      | Store Number        |                                                     | Portfolio    | Lucernex-Selenium  |
#      | Region              | Central (Central region - preOpen) Frisco(Pre-Open) | Market Area  | Legacy Market Area |
#      | Prototype           | <Prototype>                                         | Project Type | Retail Project     |

    And I verify the General Information fields value on non-editable summary tab
      | name      | value                                               |
      | Name      | <Name>                                              |
      | Portfolio | Lucernex-Selenium                                   |
      | Region    | Central (Central region - preOpen) Frisco(Pre-Open) |

    Then I verify the following details in non editable summary page in frame grid
      | Milestone Timeline  |            |
      | Baseline Start Date | 06/09/2015 |
      | Current Start Date  | 06/09/2015 |

    And I verify the General Information fields value on project entity non-editable summary tab
      | name              | value                     |
      | Market Type       | Retail Mall               |
      | Trade Area        | Test                      |
      | Construction Type | Brick                     |
      | Deal Type         | Leasing                   |
      | Description       | Selenium Test Description |

    And I verify the Location fields value on project entity non-editable summary tab
      | name             | value             |
      | Center Name      | Stonebriar        |
      | Cross Street 2   | Democracy         |
      | Cross Street 1   | Parkwood          |
      | Street Address   | 5601 democracy dr |
      | City             | Plano             |
      | State / Province | TX                |
      | Zip / Postal Cd  | 75024             |
      | Country          | United States     |

    And I verify the Site Survey Summary fields value on non-editable summary tab
      | name          | value       |
      | Rentable Area | 100         |
      | Sales Area    | 80          |
      | Depth         | 10          |
      | Parcel Area   | 100         |
      | Frontage      | 20          |
      | Area Unit     | Square Feet |

    And I verify management members "Lx Administrator"
    And I verify management member link "Lx Administrator"
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
      | Team Member | Selenium Tester  |

    Examples:
      | Location | Prototype                    | Name                    |
      | 000056   | Selenium Webdriver Prototype | Selenium Webdriver Site |










#@all @smoke @smoke5
#Feature: (Jira - AUTOMATION-349) As an admin I should be able to convert site to project
#  #issue exist - IWMS-20761
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: when I navigate to Dash board I can see the search box
#    When I see the Dashboard
#    And I Search for the "<Name>" that was created
#    And Click on the name of the "<Name>" in the results pop-up
#    Then I see "<Name>" name on the header
#    And I click on the "Convert to Project" action panel button
#    And I set following fields value on editable page
#      | name        | value             |
#      | locationSel | createNewLocation |
#    And I verify the following fields value on editable page
#      | name         | value  |
#      | locationName | <Name> |
#
#    And I click on the "Convert Site to Project" button
##    Then I see "<Name>" name on the header
#    #IWMS-21307
##    Then I see that I am on the entity page "Project: <Name>"
#    Then I see that I am on the entity page "<Name>"
#    And I verify the General Information fields value on project entity non-editable summary tab
#      | name              | value                                               |
#      | Name              | <Name>                                              |
#      #      | Store Number      | 7777                                                |
#      | Region            | Central (Central region - preOpen) Frisco(Pre-Open) |
#      | Market Area       | Legacy Market Area                                  |
#      #      | Prototype         | <Prototype>                                         |
#      | Project Type      | Retail Project                                      |
#      | Market Type       | Retail Mall                                         |
#      | Trade Area        | Test                                                |
#      | Construction Type | Brick                                               |
#      | Deal Type         | Leasing                                             |
#      #      | Client ID         | client-34554                                        |
#      | Description       | Selenium Test Description                           |
#    And I verify the Location fields value on project entity non-editable summary tab
#      | name             | value             |
#      | Center Name      | Stonebriar        |
##      | Cross Street 2   | Democracy         |
##      | Cross Street 1   | Parkwood          |
#      | Street Address   | 5601 democracy dr |
#      | City             | Plano             |
#      | State / Province | TX                |
#      | Zip / Postal Cd  | 75024             |
#      | Country          | United States     |
##    And I verify the Milestone Timeline fields value on non-editable summary tab
##      | name                           | value      |
##      | Actual/Projected Delivery Date | 12/31/2015 |
#    And I verify the Site Survey Summary fields value on non-editable summary tab
#      | name          | value       |
#      | Rentable Area | 100         |
#      | Sales Area    | 80          |
#      | Depth         | 10          |
#      | Parcel Area   | 100         |
#      | Frontage      | 20          |
#      | Area Unit     | Square Feet |
##    And I verify the Management fields value on non-editable summary tab
##      | name             | value            |
##      | Lx Administrator | Lx Administrator |
#    And I verify management members "Lx Administrator"
#    And I verify management member link "Lx Administrator"
#    And I click on the "Members/Contacts" tab
#    And I verify the Members/Contacts tab
#      | type        | name             |
#      | Team Member | Lx Administrator |
#      | Team Member | Selenium Tester  |
##    And I click on the "Documents" tab
##    And I verify the list of folders Document
##      | SeleniumTestRootFolder1 |
#    #    And I navigate to link "Facility, Schedule"
#    #    And I verify the scheduler already applied
#    #      | Pre-Contruction |
#    Examples:
#      | Location | Prototype                    | Name                    |
#      | 000056   | Selenium Webdriver Prototype | Selenium Webdriver Site |
