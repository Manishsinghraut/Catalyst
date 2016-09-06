@SuperAdmin
Feature: As SuperAdmin I Create Organization, Create, Edit, Delete a SuperAdmin User & Delete Organization

  Scenario Outline: As a super user I create a organization
    Given I Login to catalyst using "<Login User>" access credentials
    And I see the catalyst "workzone"
    And I click on the Settings Link
    And I click on Organizations link in main page
    And I click on "newOrg" button
    And I enter "<Organization>" in "orgname" Edit box
    And I click on save button
    And I verify the created "<Organization>" in list

    Examples:
      | Login User | Organization |
      | superadmin | TestOrg      |


  Scenario Outline: As Superadmin I Create the SuperAdmin User
    And I Click on "Users Setup" Link
    And I Click on "Users" Link in the link
    And I Click on New Button of Users page
    And I Enter the "<SuperAdmin>" User Login Name
    And I Enter the "<Email address>" of the User
    And I Enter the "<Password>" of the User field
    And I Enter the "<Confirm Password>" of User field
    And I Click on Org Dropdown and select "<Organization>"
    And I Select the Role as "<AdminRole>"
    And I Assign the Teams for the SuperAdmin User with respect to "<Team Default>"
    And I Click on Save Button of User creation page
    And I Verify the "<SuperAdmin>" User is created
    And I Verify the "<SuperAdmin>" User with this "<Email address>" is created
    And I Verify the "<SuperAdmin>" User with this "<AdminRole>" created
    And I Verify the "<SuperAdmin>" User with this "<Organization>" is available
    And I select the "<SuperAdmin>" and verify "Delete" Button is enabled
    And I select the "<SuperAdmin>" and verify "Edit" Button is enabled



    Examples:
      | Organizationname | Email address       | Password  | Organization | Confirm Password | SuperAdmin | AdminRole | Team Default |
      | RelevanceLab     | Superuser@gmail.com | Superuser | All          | Superuser        | SuperUser  | Admin     | DevTeam      |


  Scenario Outline: As SuperAdmin I Edit the SuperAdmin User
    And I Click on Edit Button the "<SuperAdmin>" user created
    #And I Verify the Login name is disabled
    And I Enter the "<Email address>" of the User
    And I Click on Update Password tick
    And I Enter the "<Password>" of the User field
    And I Enter the "<Confirm Password>" of User field
    #And I Select the Role as "<AdminRole>"
    And I Click on Save Button of User creation page
    And I Verify the "<SuperAdmin>" User is created
    And I Verify the "<Email address>" is updated
    And I Verify the "<SuperAdmin>" User with this "<Email address>" is created
    And I Verify the "<SuperAdmin>" User with this "<AdminRole>" created
    And I Verify the "<SuperAdmin>" User with this "<Organization>" is available
    And I select the "<SuperAdmin>" and verify "Delete" Button is enabled
    And I select the "<SuperAdmin>" and verify "Edit" Button is enabled




    Examples:
      | SuperAdmin | Email address        | Password   | Confirm Password | AdminRole | Organization |
      | SuperUser  | SuperAdmin@gmail.com | Superadmin | Superadmin       | Admin     | All          |


  Scenario Outline: As SuperAdmin I Delete the SuperAdmin User
    And I Click on Delete button of the "<SuperAdmin>" user created
    And I Click on "OK" Button to remove the Designer user
    And I Verify the "<SuperAdmin>" user is deleted

    Examples:
      | SuperAdmin |
      | SuperUser  |


  Scenario Outline: As SuperAdmin I Delete the Created Organization
    And I click on Organizations link in the settings tree
    And I click on "<New_Organization>" delete button
    And I click on OK button
    And I verify the "<New_Organization>" is deleted

    Examples:
      | New_Organization |
      | TestOrg          |


  Scenario:As a super user I  Sign out
    And I Sign Out
    And I verify login page is displayed
