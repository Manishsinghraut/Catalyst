@all
Feature: (Ref : Jira Ticket No : Automation-499) As a delete user I can able to preserve global pages for site

  Scenario Outline: As a delete user I can able to preserve global pages for site
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Sites" named "<Entity Name>" through search option
    And I click on the "Summary" tab
    And I fetch and store top menu links
    And I navigate to the admin dashboard
    And I click on "Manage Top Menu" link
    And I expand the following
      | <Entity Type> |
      | Details       |
      | Summary       |

    And I add the following menu items
      | <Page Name 1> |
#      | <Page Name 2> |
      | <Page Name 3> |
      | <Page Name 4> |
      | <Page Name 5> |

    And I verify menu item in a page
      | value         |
      | <Page Name 1> |
#      | <Page Name 2> |
      | <Page Name 3> |
      | <Page Name 4> |
      | <Page Name 5> |

    Examples:
      | Login User   | Login full username  | Entity Name  | Entity Type | Page Name 1       | Page Name 2    | Page Name 3 | Page Name 4    | Page Name 5   |
      | DeleteAccess | Delete Access Access | LucernexSite | Site        | Site Details Copy | Email Log Copy | Survey Copy | Ownership Copy | Purchase copy |

  Scenario Outline: As a delete user I verify global pages
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Entity Name>" through search option

    And I select an option "<Page Name 1>"
    And I verify text value in a page
      | value        |
      | LucernexSite |

#    And I select an option "<Page Name 2>"
#    And I verify text value in a page
#      | value          |
#      | Email Log List |

    And I select an option "<Page Name 3>"
    And I verify text value in a page
      | value                          |
      | Condition of Premises Exterior |

    And I select an option "<Page Name 4>"
    And I verify text value in a page
      | value      |
      | Owner Name |

    And I select an option "<Page Name 5>"
    And I verify text value in a page
      | value        |
      | Project Data |

    Examples:
      | Login User   | Login full username  | Entity Name  | Entity Type | Page Name 1       | Page Name 2    | Page Name 3 | Page Name 4    | Page Name 5   |
      | DeleteAccess | Delete Access Access | LucernexSite | Sites       | Site Details Copy | Email Log Copy | Survey Copy | Ownership Copy | Purchase copy |
