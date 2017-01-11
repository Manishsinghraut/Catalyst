package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 6/17/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Location/Details/Members/OnlyShowingMembersWithAChangeInMembership.feature",
        "target/test-classes/iwms/AdminPage/MemberAdministration/ReplacingENTITYMANAGERInProjectAndSite.feature",
        "target/test-classes/iwms/Project/Details/Members/ReplaceSwitchMembersScheduleTasksAndNotification.feature",
        "target/test-classes/iwms/Project/Details/WorkFlow/ReplaceSwitchMembersReplaceMemberWORKFLOW.feature",
        "target/test-classes/iwms/Site/Details/Members/ReplaceMemberButDoNotRemoveEntityMemberSiteProject.feature",
    },
    format = {"json:target/cucumber.json", "html:ProjectMembershipManagement7"}
)
public class ProjectMembershipManagement7Tests {
}
