@all
Feature: Custom HTML test

  Background:
    Given I login to IWMS using LxAdmin credentials

  Scenario: Create custom HTML instance of Iframe type
    When I see the IWMS Dashboard
    And I close all the dashboard portals
    And I expand the Modules Panel
    And I drag module "Custom HTML" onto the Dashboard
    And And I hide the Modules Panel
    Then I set these field values on editable page
      |name                                |value                                      |
      |title                               |Cukes Info                                 |
      |htmlText                            |http://cukes.info/step-definitions.html    |
    And I click on the "Submit" button
And I Drag and Drop module "<string>"

  Scenario: Create custom HTML instance of free form type
    When I expand the Modules Panel
    And I drag module "Custom HTML" onto the Dashboard
    And And I hide the Modules Panel
    Then I set these field values on editable page
      |name                                |value                                      |
      |title                               |Lorem Ipsum                                |
      |htmlType                            |1                                          |
      |htmlText                            |Lorem ipsum dolor sit amet, sed ad soleat labore semper. Ne mucius vocibus lucilius his, ad delicata voluptaria pro, at quod nominati sit. Ex agam imperdiet tincidunt vis. Ad eam accusamus prodesset, diam erat aliquando qui id.      |
    And I click on the "Submit" button


  Scenario: Verify the portlets
    When I verify "Cukes Info" portlet's body contains HTML
    """
    <iframe src="http://cukes.info/step-definitions.html" frameborder="0" height="100%" width="100%"></iframe>
    """
    And I verify "Lorem Ipsum" portlet's body contains HTML
    """
    Ne mucius vocibus lucilius his, ad delicata voluptaria pro, at quod nominati sit.
    """
    Then I close all the dashboard portals

