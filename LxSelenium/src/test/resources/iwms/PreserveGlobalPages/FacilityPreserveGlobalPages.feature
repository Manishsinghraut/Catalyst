@all
Feature: (Ref : Jira Ticket No : Automation-499) As a delete user I can able to preserve global pages for Facility

  Scenario Outline: As a delete user I can able to preserve global pages for Facility
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Facilities" named "<Entity Name>" through search option
    And I click on the "Summary" tab
    And I fetch and store top menu links of facility
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
      | <Page Name 6> |

    And I verify menu item in a page
      | value         |
      | <Page Name 1> |
#      | <Page Name 2> |
      | <Page Name 3> |
      | <Page Name 4> |
      | <Page Name 5> |
      | <Page Name 6> |

    Examples:
      | Login User   | Login full username  | Entity Name       | Entity Type | Page Name 1           | Page Name 2    | Page Name 3         | Page Name 4 | Page Name 5   | Page Name 6    |
      | DeleteAccess | Delete Access Access | Lucernex-Facility | Facility    | Facility Details Copy | Email Log Copy | Lease Analysis Copy | Survey Copy | Purchase copy | Ownership Copy |

  Scenario Outline: As a delete user I verify global pages
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Facilities" named "<Entity Name>" through search option

    And I select an option "<Page Name 1>"
    And I verify the following details in non editable summary page in frame grid
      | Facility Summary |      |          |     |        |
      | Group            | Type | Category | Use | Status |
    And I verify the following details in non editable summary page in frame grid
      | General Information |                   |
      | Name                | Lucernex-Facility |

#    And I select an option "<Page Name 2>"
#    And I verify text value in a page
#      | value          |
#      | Email Log List |

    And I select an option "<Page Name 3>"
    And I verify the following details in non editable summary page in frame grid
      | Pro Forma Lease   |               |
      | Analyst Name      | Date Prepared |
      | Scenario          |               |
      | NPV Discount Rate |               |

    And I verify the following details in non editable summary page in frame grid
      | Key Lease Information |                       |                 |
      | Lease Start Date      | Lease Expiration Date | Free Rent (mos) |

    And I select an option "<Page Name 4>"
    And I verify the following details in non editable summary page in frame grid
      | Condition of Premises Exterior |               |                  |
      | Monument Signage               | Pylon Signage | Building Signage |

    And I verify the following details in non editable summary page in frame grid
      | Condition of Premises Interior |
      | Approx Building Length(ft)     |
      | Existing Floor Condition       |
      | Existing Floor Condition       |

    And I select an option "<Page Name 5>"
    And I verify the following details in non editable summary page in frame grid
      | Project Data         |
      | Project Name         |
      | Lucernex-Facility    |
      | City                 |
      | Property Description |

    And I select an option "<Page Name 6>"
    And I verify the following values in frame grid "BOGridOwnership"
      | Owner Name | Funding Type | Funding Amount | Funding Percent | Funding Percent | Actions |

    Examples:
      | Login User   | Login full username  | Entity Name       | Page Name 1           | Page Name 2    | Page Name 3         | Page Name 4 | Page Name 5   | Page Name 6    |
      | DeleteAccess | Delete Access Access | Lucernex-Facility | Facility Details Copy | Email Log Copy | Lease Analysis Copy | Survey Copy | Purchase copy | Ownership Copy |