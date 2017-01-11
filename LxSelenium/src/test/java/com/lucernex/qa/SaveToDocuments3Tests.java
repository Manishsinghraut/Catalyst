package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 09-06-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Documents/VerifySavedDocumentsWhenForceSecureSiteIsOFFManualTesting.feature",
//                "target/test-classes/iwms/Documents/VerifySavedDocumentsWhenForceSecureSiteIsONManualTesting.feature",
                "target/test-classes/iwms/Documents/VerifyTheMembersAndContactsInformationWhileSavingTheDocumentProjectAndParcel.feature",
        },
        format = {"json:target/cucumber.json", "html:SaveToDocuments3"}
)
public class SaveToDocuments3Tests {
}
