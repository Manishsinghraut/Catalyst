package com.lucernex.qa;

/**
 * Created by RLE0097 on 03-10-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Documents/SaveFacilitySpaceManagementAndFacilityExpensePagesToDocuments.feature",
                "target/test-classes/iwms/Documents/SaveToDocumentsBudget.feature",
                "target/test-classes/iwms/Documents/SaveBinderToDocuments.feature",
        },
        format = {"json:target/cucumber.json", "html:SaveToDocuments5Tests"}
)
public class SaveToDocuments5Tests {
}
