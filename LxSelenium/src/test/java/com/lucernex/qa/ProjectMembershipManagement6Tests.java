package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 6/17/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {

            "target/test-classes/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/OneMemberManyProjectsCompletelyRemoveThisMemberFromAllOrgChartsOperatingAndPreOpen.feature",
            "target/test-classes/iwms/AdminPage/MemberAdministration/ProjectMembershipManagement/OneMemberManyProjectsAddremoveFromSelectedEntitiesSchedulesAndWorkFlows.feature",
        },
        format = {"json:target/cucumber.json", "html:ProjectMembershipManagement6"}
)
public class ProjectMembershipManagement6Tests {
}