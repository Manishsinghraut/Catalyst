package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Form oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Facility/FacilityExpense/AttachingDocumentToTheFacilityExpensePage.feature"
    },
        format = {"json:target/cucumber.json","html:FacilityExpense1"}
)
public class FacilityExpense1Tests {
}
