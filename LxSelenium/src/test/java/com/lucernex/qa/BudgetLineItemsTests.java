package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Budget Line Items Tests
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/BudgetLineItems.feature"
    },
    format = {"json:target/cucumber.json","html:BudgetLineItems"}
)
public class BudgetLineItemsTests {
}
