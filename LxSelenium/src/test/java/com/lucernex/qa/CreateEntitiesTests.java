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
              "target/test-classes/iwms/SetupWizards/1G_CreateContract.feature",
                "target/test-classes/iwms/SetupWizards/1H_CreateProject.feature",
                "target/test-classes/iwms/SetupWizards/1I_CreateCapitalProgram.feature",
                "target/test-classes/iwms/SetupWizards/1J_ConvertCaptialProgram.feature",
                "target/test-classes/iwms/SetupWizards/1K_ConvertSitetoProject.feature",
                "target/test-classes/iwms/SetupWizards/1L_ImportFacilityWhenCreateCapitalProject.feature"
//                "target/test-classes/iwms/AdminPage/ManageScheduleTemplates/ManageScheduleTemplates.feature",
//                "target/test-classes/iwms/AdminPage/MemberAdministration/ManageFolderTemplates.feature",
//                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/2ASetupPages.feature"
        },
        format = {"json:target/cucumber.json","html:CreateEntitiesTests"}
)
public class CreateEntitiesTests {
}
