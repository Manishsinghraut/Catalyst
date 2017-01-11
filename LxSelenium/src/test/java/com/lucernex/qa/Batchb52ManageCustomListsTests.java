package com.lucernex.qa;

/**
 * Created by RLE0097 on 18-05-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of OrgChart oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
//                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/ManageDataFields.feature",
                "target/test-classes/iwms/Reports/CustomListOnReport.feature",
                "target/test-classes/iwms/Location/Details/Summary/CountyFieldOnLocationSummaryPage.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchb52ManageCustomLists"}
)
public class Batchb52ManageCustomListsTests {
}
