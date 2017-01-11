package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Entity Creation oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/SetupWizards/1A_CreatePortfolio.feature",
                "target/test-classes/iwms/SetupWizards/1B_CreatePrototype.feature",
                "target/test-classes/iwms/SetupWizards/1C_CreateSite.feature",
                "target/test-classes/iwms/SetupWizards/1CC_CreateLocation.feature",
                "target/test-classes/iwms/SetupWizards/1D_CreateParcel.feature",
                "target/test-classes/iwms/SetupWizards/1F_CreateFacility.feature",
                "target/test-classes/iwms/SetupWizards/ChangePasswordViaWizard.feature"
//                "target/test-classes/iwms/SetupWizards/1G_CreateContract.feature"
        },
        format = {"json:target/cucumber.json","html:Batch4CreateEntitiesTests"}
)
public class Batcha4CreateEntitiesTests {
}
