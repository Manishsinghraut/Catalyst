package com.lucernex.qa;

/**
 * Created by RLE0097 on 28-09-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/FirmDefinedClientFieldsNotAllowedToUseReservedKeywords.feature",
            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/AddingSmartWiseDropDowns.feature",
                //Moved scenario in generic batch for testing
//            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/EditTheLabelOfAGlobalField.feature",
            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/AbilityToAddMultiValueFieldType.feature",
            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/TypeMoneyNoCentsShouldReturnDecimalPlaces.feature",
            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/TypeMoneyNoCentsShouldReturnDecimalPlaces.feature",
        },
        format = {"json:target/cucumber.json", "html:ManageDataFieldsTest"}
)
public class ManageDataFieldsTest {
}
