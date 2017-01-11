@all
Feature: Upload a photo to a Member from Entity - Members/Contacts - (Jira ticket Ref : AUTOMATION-1038)

  Scenario Outline: As an delete user I'm able to Upload a photo to a Member from Entity - Members/Contacts- (Jira ticket Ref : AUTOMATION-1038)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Members/Contacts" tab
    And I switch to visible frame
    Then I click on the "Lx Administrator" row action of column "Lx Administrator" of column "2" from grid "BOGridMember"
    And I switch to default frame
    And I click "Upload Member Photo" link "from Members/Contacts"
    And I Upload selected image "Data/ImportDataFiles/iwms/AdminPage/ManageMemebers/":
      | Penguins.jpg |
    And I click "Upload Image" button
    And I verify a single photo uploaded successfully

  Examples:
    | Entity Name       |
    | Lucernex-Selenium |