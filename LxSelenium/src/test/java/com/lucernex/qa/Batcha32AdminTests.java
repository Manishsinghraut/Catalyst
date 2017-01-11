package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/ManageMembers/AddEditDeleteContact.feature",
                "target/test-classes/iwms/AdminPage/ManageMembers/AddEditDeleteMember.feature",
                "target/test-classes/iwms/AdminPage/ManageMembers/InactivateReactivateMemberAndContact.feature",
                "target/test-classes/iwms/AdminPage/ManageMembers/ManageMembersGrid.feature",
                //Moved to FileUploadAndDownloadTests file
                //"target/test-classes/iwms/AdminPage/ManageMembers/UploadAphotoToAMemberFromEntityMembersContacts.feature",
                "target/test-classes/iwms/AdminPage/ManageMembers/ChangePasswordViaManageMembers.feature"
        },
        format = {"json:target/cucumber.json", "html:Batch3AdminTests"}
)
public class Batcha32AdminTests {
}
