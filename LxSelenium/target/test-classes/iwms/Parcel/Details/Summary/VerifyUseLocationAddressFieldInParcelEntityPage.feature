@all
Feature: I Verify UseLocationAddress field in Parcel Entity page (Jira Ref. : AUTOMATION-676)

  Scenario Outline: I Import the Parcel-Use Location XML
    Given I Login to IWMS using "<User>" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/Details/Summary/"
    And I import following file name:
      | LucernexParcel.xml               |
      | ParcelLocationSubpageCreated.xml |
      | ParcelSummaryPageCreated.xml     |
      | ParcelSummaryPageReCreated.xml   |

    Examples:
      | User         |
      | DeleteAccess |

  Scenario Outline: I Use Location Address should be set to Yes and Use Location Address flag should be No(unchecked) and address should be updated
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I select "Parcel Summary page -Created" from Page dropdown
    And I click on the "Edit" action panel button
    And I switch to iframe
    And I set following fields value on editable page
      | name                                | value              |
      | _checkbox_Parcel_UseLocationAddress | false              |
      | Parcel_StreetAddress1               | 6509               |
      | Parcel_StreetAddress2               | Winocrest, Ste 100 |
    And I click on the "Save Changes" action panel button
    And I verify the Parcel Location Subpage created value on non-editable summary tab
      | name                  | value              |
      | Use Location Address? | No                 |
      | Address               | 6509               |
      |                       | Winocrest, Ste 100 |
      | City                  | Plano              |
      | State / Province      | TX                 |
      | Country               | United States      |
      | Zip / Postal Code     | 75024              |
      | Cross Street 1        | Parkwood           |
      | Cross Street 2        | Democracy          |
    And I click on the "Edit" action panel button
    And I switch to iframe
    And I set following fields value on editable page
      | name                                | value |
      | _checkbox_Parcel_UseLocationAddress | true  |
    And I click on the "Save Changes" action panel button
    And I verify the Parcel Location Subpage created value on non-editable summary tab
      | name                  | value |
      | Use Location Address? | Yes   |
    
    Examples:
      | Entity Name     | Second Level Tab | Third Level Tab |
      | Lucernex-Parcel | Details          | Summary         |
