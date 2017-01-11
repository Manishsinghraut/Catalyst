@all
Feature: Reconcile-Cannot Reconcile more than one time (Jira Ref : AUTOMATION-738)

  Scenario Outline: As a delete user I Import the attached Recoveries Reconcile Net Page XML
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | RecoveriesNetReconcileMoreThanOneTime.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I User Cannot reconcile more than one time Pop shall display a message " This recovery record was already reconciled"
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Payment Info"
    And I click on the "Recoveries" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | true  |
    And I click on the "Reconcile" action panel button
    And I verify the following message "This recovery record was already reconciled."
    And I click on the "OK"


    Examples:
      | Entity Name                            | Grid ID | Login User   | Login full username  |
      | Recoveries Reconcile Contract Net Page | thisDiv | DeleteAccess | Delete Access Access |
