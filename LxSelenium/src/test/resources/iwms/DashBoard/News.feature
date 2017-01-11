Feature: To make sure the news/announcements entered under "Manage Company" are reflected under the "News" dashboard module (Jira Ref : AUTOMATION-1110)

  Scenario Outline: As Delete user, I entered News in Recent News field under Manage Company tab
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    Then I set following fields value on editable page
      | name       | value                                                                                                                                                                                                                  |
      | RecentNews | Red Nose Day came a day early to Lucernex, but we all had a good time with it. Red Nose Day in the US is officially Thursday, June 26, 2016. Please read below for more information on what Red Nose Day is all about. |
    And I click on manage company update button
    And I verify the following message "Successfully updated Company"

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I verify the grid would populate with the memo that was entered earlier in Recent news field under Manage Company
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I see the Dashboard
    And I expand portfolio navigation tab
    And I Drag and Drop module "<Module>"
    And I verify the "Red Nose Day came a day early to Lucernex, but we all had a good time with it. Red Nose Day in the US is officially Thursday, June 26, 2016. Please read below for more information on what Red Nose Day is all about." should be displayed

  Examples:
    | Login User   | Login full username  | Module |
    | DeleteAccess | Delete Access Access | News   |

  Scenario Outline: As Delete user, I delete News in the Recent News field under Manage Company tab
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    Then I enter the value "" in the "RecentNews" field
    And I click on manage company update button
    And I verify the following message "Recent News must be specified"

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I verify the "news" module will have retained the text from before and it will be displayed.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I see the Dashboard
    And I verify the "Red Nose Day came a day early to Lucernex, but we all had a good time with it. Red Nose Day in the US is officially Thursday, June 26, 2016. Please read below for more information on what Red Nose Day is all about." should be displayed

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |