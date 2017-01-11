package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/15/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/CreateSalesExclusionGroup.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/CreateSingleSalesExclusion.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/CalculatePRWhenUsingAliasSalesGroup.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/ShouldNotAllowAliasGroupToReferenceAnotherAlias.feature",
        },
        format = {"json:target/cucumber.json", "html:BatchG1PercentRentExclusionsAndSalesGroupAlias"}
)
public class BatchG1PercentRentExclusionsAndSalesGroupAliasTests {
}
