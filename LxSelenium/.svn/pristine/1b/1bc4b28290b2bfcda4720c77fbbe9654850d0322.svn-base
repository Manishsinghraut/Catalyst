@all
Feature: (Jira Ref. : AUTOMATION-1103) Email Report

  Scenario Outline: Email Report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | EntityPhotos(3).xml |
      | PictureProject.xml  |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I wait for the Loading text to disappear
    And I click on "Upload Photo" link
    And I Upload selected image "Data/ImportDataFiles/iwms/Reports/":
      | SamplePictureOne - Copy.jpg |
    And I click on "Upload" Button

    Then I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Run Report" child window
    And I wait for the Loading text to disappear in grid
    And I verify image attached for the entity "PictureProjectOne" is "true"
    And I verify image attached for the entity "PictureProjectTwo" is "false"
    And I click on "Email Report" link
    And I switch to "Email Report" third child window
    And I set following fields value on editable page
      | name  | value                                            |
      | ToBox | svcQA@lucernex.com                               |
      | body  | Entity one has image and enityt two has no image |
    And I click on "Send" Button
    And I switch to "Run Report" child window
    And I wait for the Loading text to disappear in grid
    And I close the "Run Report" child window
    And I switch to main window
    And I wait for the Loading text to disappear in grid
    #Issue exist IWMS-9532
    Given I login to web mail
    And I search for the mail using subject "[LxRetail] EntityPhotos"
    And I check mail body for the following contents
      | PictureProjectOne |

    Examples:
      | Login User   | Login full username  | Grid        | Report Name  | Entity Name       |
      | DeleteAccess | Delete Access Access | ^editBOGrid | EntityPhotos | PictureProjectOne |