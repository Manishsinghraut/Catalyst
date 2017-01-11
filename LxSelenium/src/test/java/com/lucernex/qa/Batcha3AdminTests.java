package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/AdminPageSmokeTest.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/UserNameHyperlink.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/SearchAMemberUsingLoginId.feature"
        },
        format = {"json:target/cucumber.json", "html:Batch3AdminTests"}
)
public class Batcha3AdminTests {
}
