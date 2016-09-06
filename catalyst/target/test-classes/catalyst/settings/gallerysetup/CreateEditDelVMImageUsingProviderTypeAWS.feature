@All
Feature: As a super user I Create, Edit & Delete VMImage Using AWS provider
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
      | superadmin | UAT_RL1      |

  Scenario Outline: As a super user I create a AWS Provider
    And I click on "DevOps Setup" link
    And I click on "Providers" link
    And I click on "addnewitem" button
    And I select provider type "AWS"
    And I enter "<AWS service name>" in "name" Edit box
    And I click on "credentials-accessKeys" User Access Key
    And I enter "<Access Key>" in "accessKey" Edit box
    And I enter "<Secret Key>" in "secretKey" Edit box
    And I enter "<S3 Bucket Name>" in "s3BucketName" Edit box
    And I select "<Organization>" from the select box in new provider page
    And I select "<Region>" from the region select box
    And I select "<Key Pair>" from the key pair select box
    And I click on user pem file browse button and select pem file
    And I click on save button
    And I verify "<Provider Type>" in the provider table

    Examples:
      | AWS service name |Access Key             |Secret Key                               |S3 Bucket Name|Organization|Region               |Key Pair      |Provider Type|
      |RL_AWS            |  AKIAIIK5APRNV54QAVQA |bz6Hl4wtjXi5Mg2EaZxLR1I/7y0bmYXEiYINDBSp |  RLBilling   |   UAT_RL1  |US West (N. California)| bootstrapncal|AWS|

  Scenario Outline: As a super user I create VMImage
    And I click on "Gallery Setup" link
    And I click on "VMImage" link
    And I click on "addnewitem" button
    And I enter "<VMImage Name>" in "name" Edit box
    And I select "<Organization>" from the select box in VMImage page
    And I select "<Operating System>" type
    And I enter "<Image ID>" in "imageidentifire" Edit box
    And I enter "<Admin User Name>" in "UserName" Edit box
    And I click on save button
    And I verify created "<VMImage Name>" in the Images table
    And I select "<VMImage Name>" and verify given "<Image ID>" in Images table
    And I select "<VMImage Name>" and verify assigned "<Organization>" in Images table
    And I select "<VMImage Name>" and verify assigned "<Provider Name>" in Images table
    And I select "<VMImage Name>" and verify assigned "<Operating System>" in Images table
    And I select the "<VMImage Name>" and verify "Edit" Button is enabled
    And I select the "<VMImage Name>" and verify "Delete" Button is enabled

    Examples:
      |VMImage Name|Organization|Operating System|Image ID     |Admin User Name|Provider Name|
      | RL_VM      | UAT_RL1    |  Ubuntu        |ami-a3314fc3 |  ubuntu       |   RL_AWS    |

  Scenario Outline: As a super user I edit the created VMImage
    And I select the "<VMImage Name>" and click on corresponding "Edit" Button
    And I clear the existing "name" in the edit box
    And I enter "<New VMImage Name>" in "name" Edit box
    And I click on save button
    And I verify created "<New VMImage Name>" in the Images table
    And I select "<New VMImage Name>" and verify given "<Image ID>" in Images table
    And I select "<New VMImage Name>" and verify assigned "<Organization>" in Images table
    And I select "<New VMImage Name>" and verify assigned "<Provider Name>" in Images table
    And I select "<New VMImage Name>" and verify assigned "<Operating System>" in Images table
    And I select the "<New VMImage Name>" and verify "Edit" Button is enabled
    And I select the "<New VMImage Name>" and verify "Delete" Button is enabled
    Examples:
      |VMImage Name|New VMImage Name|Organization|Operating System|Image ID    |Provider Name|
      | RL_VM      | AWS_VMImage    | UAT_RL1    | Ubuntu         |ami-06116566|   RL_AWS    |


  Scenario Outline: As a super user I delete the created a VMImage
    And I select the "<VMImage Name>" and click on corresponding "Delete" Button
    And I click on OK button
    And I verify created "<VMImage Name>" is deleted

    Examples:
      |VMImage Name |
      |AWS_VMImage  |

  Scenario Outline:Aa a super user I delete the created AWS provider
    And I click on "Providers" link
    And I select the "<Provider Name>" and click on corresponding "Delete" Button
    And I click on OK button
    Examples:
      |Provider Name|
      |RL_AWS       |

  Scenario Outline:As a super user I delete the created organization
    And I click on "Organizations" link
    And I select the "<Organization>" and click on corresponding "Delete" Button
    And I click on OK button

    Examples:
      |Organization|
      |UAT_RL1     |

  Scenario: As a super user I Sign out
    And I Sign Out
    And I verify login page is displayed