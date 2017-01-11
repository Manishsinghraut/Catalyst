package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Reports/EditableReports/CreateReportWith-CustomListOnAForm.feature",
                "target/test-classes/iwms/Location/Details/Summary/CountyFieldOnLocationSummaryPage.feature"

        },
        format = {"json:target/cucumber.json", "html:Regression1FileUploadAndDownload2"}
)

public class Regression1FileUploadAndDownload2Test {
}