@Designer
Feature: As SuperAdmin I Create Designer User

  Scenario: As Super Admin I Create the Designer User
    Given I Login to catalyst using "Login User" access credentials
    Then I see the catalyst "workzone"
    And I click on the "SETTINGS" link
    And I move the cursor on "Menu"
    And I click on the "User Configuration" link
    And I click on the "Users" link
    And I Click on New Button of Users page
    And I Enter the "Designer" User Login Name
    And I Enter the "Email address" of the User
    And I Enter the "Password" of the User field
    And I Enter the "Confirm Password" of User field
    And I Select the Role as "DesignerRole"
    And I Assign the Teams for the User with respect to "Organization"
    And I Click on Save Button of User creation page
    Then I Verify the "Designer" User is created
    Then I Verify the "Designer" User with this "Email address" is created
    Then I Verify the "Designer" User with this "DesignerRole" created
    Then I Verify the "Designer" User with this "Organization" is available
