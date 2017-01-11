package com.lucernex.qa;

/**
 * Created by RLE0097 on 02-12-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/UpdatedManageDataFields.feature",
    },
    format = {"json:target/cucumber.json", "html:Batchb51ManageCustomLists"}
)
public class UpdatedManageDataFieldsTests {
}
