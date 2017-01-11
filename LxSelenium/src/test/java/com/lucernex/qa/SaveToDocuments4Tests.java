package com.lucernex.qa;

/**
 * Created by RLE0097 on 29-09-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Documents/SavePortfolioREPlannerAndFacilityStoreListPagesToDocuments.feature",
                "target/test-classes/iwms/Documents/SavePortfolioOrgChartPagesToDocuments.feature",
                "target/test-classes/iwms/Documents/SaveScheduleDetailsPageToDocumentForProject.feature",
                "target/test-classes/iwms/Documents/SaveParcelParcelAccessAndPropertyTaxesPagesToDocuments.feature",
                "target/test-classes/iwms/Documents/SaveFormsReportsToDocuments.feature",

        },
        format = {"json:target/cucumber.json", "html:SaveToDocuments3"}
)
public class SaveToDocuments4Tests {
}
