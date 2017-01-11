package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                //"target/test-classes/iwms/AdminPage/ManageDefinedFields/AddCodeItem.feature",
//                "target/test-classes/iwms/AdminPage/MemberAdministration/ManageEmployers.feature",
//                "target/test-classes/iwms/AdminPage/MemberAdministration/ManageMembers.feature",
                "target/test-classes/iwms/AdminPage/ManageDefinedFields/ManageDefinedFields.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ImportData/ProperMessageOnJobLog.feature"

        },
        format = {"json:target/cucumber.json", "html:Batch2AdminTests"}
)
public class Batcha2AdminTests {
}
