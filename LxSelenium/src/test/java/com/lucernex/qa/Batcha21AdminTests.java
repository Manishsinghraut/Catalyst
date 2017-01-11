package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CostManagement/AddAndEditBudgetTypeSmokeTest.feature",
                "target/test-classes/iwms/AdminPage/ManageMembers/WelcomeEmailForNewUsers.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/EmployerBankAccountFieldWith255CharactersInLength.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/EmailAddressFieldCharacters.feature"
        },
        format = {"json:target/cucumber.json", "html:Batcha21Admin"}
)
public class Batcha21AdminTests {
}
