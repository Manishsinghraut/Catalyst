package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/15/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/PercentRentWithExclusions.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/ExclusionForSalesGroupAlias.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/VerifyCapPercentForGroupExclusionAndSalesTypeExclusions.feature"
        },
        format = {"json:target/cucumber.json", "html:BatchG2PercentRentExclusionsAndSalesGroupAlias"}
)
public class BatchG2PercentRentExclusionsAndSalesGroupAliasTests {
}
