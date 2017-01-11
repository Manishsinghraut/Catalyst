package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Budget Tab Tests
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Entity/WorkFlowTab/EditAssigneesApproversNotifees.feature",
                "target/test-classes/iwms/Entity/WorkFlowTab/FormStep-Assignee.feature",
                "target/test-classes/iwms/Entity/WorkFlowTab/KickoffWorkflowSuccessfullyViaCompletionOfTask.feature",
                "target/test-classes/iwms/Entity/WorkFlowTab/KickoffWorkflowViaCompletionOfForm.feature",
                "target/test-classes/iwms/Entity/WorkFlowTab/KickoffWorkflowViaWorkflowAction.feature"
        },
        format = {"json:target/cucumber.json", "html:WorkFlowTab1"}
)
public class WorkFlowTab1Tests {
}
