package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Contract/Details/Summary/ExtendingContractWithAccrualRecordsFor12Periods.feature",
        "target/test-classes/iwms/Contract/Details/Summary/ExtendContractsToNon-MTMContracts.feature"
    },
    format = {"json:target/cucumber.json","html:BatchJ2ExtendContract"}
)
public class BatchJ2ExtendContractTests {
}
