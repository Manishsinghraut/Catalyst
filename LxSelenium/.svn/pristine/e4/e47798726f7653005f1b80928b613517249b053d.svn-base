package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/12/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/Reports/GeneratingErrorsWhenFilteringByFiscalYears.feature",
                "target/test-classes/iwms/Contract/Reports/PaymentVarianceReport.feature",
                "target/test-classes/iwms/Reports/SalesValidatorReport.feature",
                "target/test-classes/iwms/Reports/CompareObligationForCalendarAndFiscalYearReport.feature",
                "target/test-classes/iwms/Reports/FinancialSectionOnContractDetailsPage.feature",
                "target/test-classes/iwms/Reports/NewSalesTaxFields.feature",
                "target/test-classes/iwms/Project/Details/Summary/PercentageFieldOnReportWithDecimals.feature"
        },
        format = {"json:target/cucumber.json", "html:BatchI1ContractReports"}
)
public class BatchI1ContractReportsTests {
}
