package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 6/17/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/OneMemberManyProject-RemoveAsMemberToAllGridRows.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/OneMemberManyProject-RemoveAsMemberToGridRowsDisplayed.feature",

        },
        format = {"json:target/cucumber.json", "html:ProjectMembershipManagement5"}
)
public class ProjectMembershipManagement5Tests {
}
