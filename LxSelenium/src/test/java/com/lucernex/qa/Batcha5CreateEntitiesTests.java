package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Entity Creation oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/SetupWizards/1H_CreateProject.feature",
                "target/test-classes/iwms/SetupWizards/1I_CreateCapitalProgram.feature",
                "target/test-classes/iwms/SetupWizards/1J_CreateCapitalProjectViaAddFacProjectsButtonOnCapitalProgram(Updated).feature",
                "target/test-classes/iwms/SetupWizards/ChangeLocationOnProject.feature",
                "target/test-classes/iwms/SetupWizards/ConvertSiteToProjectEntityNameIncludeTheApostrophe.feature"



        },
        format = {"json:target/cucumber.json","html:Batch5CreateEntitiesTests"}
)
public class Batcha5CreateEntitiesTests {
}