package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/MemberAdministration/VerifyUSTerritoriesInStateSropdownList.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/VerifyCountryAndStateFieldTables.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/ManageClientDropdowns.feature"
        },
        format = {"json:target/cucumber.json", "html:Batche1DropDownsTests"}
)
public class Batche1DropDownsTests {
}
