@all
Feature: Accept EULA for imported members

  Scenario: I Login to IWMS using LxSelenium admin credentials
    Given I Login to IWMS using "LxSelenium" access credentials expecting EULA page
     Then Accept Eula and move on
      And I logout

  Scenario: I Login to IWMS using Edit access credentials
    Given I Login to IWMS using "EditAccess" access credentials expecting EULA page
     Then Accept Eula and move on
      And I logout

  Scenario: I Login to IWMS using View access credentials
    Given I Login to IWMS using "ViewAccess" access credentials expecting EULA page
     Then Accept Eula and move on
      And I logout

  Scenario: I Login to IWMS using Delete access credentials
    Given I Login to IWMS using "DeleteAccess" access credentials expecting EULA page
     Then Accept Eula and move on
      And I logout
