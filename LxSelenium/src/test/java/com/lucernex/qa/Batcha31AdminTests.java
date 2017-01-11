package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by parameshwars on 6/20/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/ManageFirmDictionary/Dictionary.feature",
                "target/test-classes/iwms/AdminPage/SSL_URL.feature",
                "target/test-classes/iwms/DataImport/ExcelSpreadsheetImport.feature"
        },
        format = {"json:target/cucumber.json","html:Batch31AdminTests"}
)
public class Batcha31AdminTests {
}
