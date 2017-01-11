Feature: Dashboard - Custom HTML Module (Jira Ref : AUTOMATION-1109)

  Scenario Outline: As Delete user, I verify 'Custom HTML' Dashboard Item functionality - weather.com
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I expand portfolio navigation tab
    And I Drag and Drop module "<Module>"
    And I click on the "Configure"
    And I set following fields value on editable page
      | name     | value               |
      | title    | weather.com         |
      | htmlText | https://weather.com |
    And I click "Submit" button
    And I verify the "weather.com" should be displayed

  Examples:
    | Login User   | Login full username  | Module      |
    | DeleteAccess | Delete Access Access | Custom HTML |

  Scenario Outline: As Delete user, I verify 'Custom HTML' Dashboard Item functionality - HTML Text
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I expand portfolio navigation tab
    And I Drag and Drop module "<Module>"
    And I click on the "Configure"
    And I select "Free form HTML" radio button
    And I enter the text "<h1>business intelligence dashboard</h1>"
    And I select the text "business intelligence dashboard"
    And I click to grow text icon "business intelligence dashboard"
    And I select the text "business intelligence dashboard"
    And I select text "business intelligence dashboard" to change font color
    And I select the text "business intelligence dashboard"
    And I select text "business intelligence dashboard" to Highlight color
    And I click "Submit" button
    And I switch to custom html frame window
    And I verify the text "business intelligence dashboard" size "7",font color "red" and Text Highlight color is displayed
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Module      |
    | DeleteAccess | Delete Access Access | Custom HTML |

