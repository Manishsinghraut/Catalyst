package com.lucernex.qa;

/**
 * Created by RLE0097 on 27-10-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/MemberAdministration/AddNewContact.feature",
                "target/test-classes/iwms/Location/ComplexCenter/ComplexAddingANewDeveloper.feature",
                "target/test-classes/iwms/Location/ComplexCenter/VerifyTheAddingAComplexCenter.feature"
        },
        format = {"json:target/cucumber.json", "html:Admin1Tests"}
)
public class Admin1Tests {
}