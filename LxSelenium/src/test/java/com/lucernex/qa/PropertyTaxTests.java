package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by parameshwars on 6/20/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
        "target/test-classes/iwms/Parcel/PropertyTaxes/GeneratePaymentWithNoEffectiveDueDate.feature",
        "target/test-classes/iwms/Parcel/PropertyTaxes/GenerateThePaymentsWithoutSelectingVendor.feature",
        "target/test-classes/iwms/Parcel/PropertyTaxes/PropertyTaxGenerateRecovery.feature",
        },
        format = {"json:target/cucumber.json","html:PropertyTaxTests.html"}
)
public class PropertyTaxTests {
}
