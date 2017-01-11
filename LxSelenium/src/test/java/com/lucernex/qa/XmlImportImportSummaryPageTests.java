package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/FormWithCustomList.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/FormReportWithCustomList.feature"
    },
    format = {"json:target/cucumber.json", "html:XmlImportImportSummaryPage"}
)
public class XmlImportImportSummaryPageTests {
}