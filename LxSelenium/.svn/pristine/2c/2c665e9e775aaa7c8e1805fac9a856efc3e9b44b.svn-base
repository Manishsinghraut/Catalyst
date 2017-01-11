package com.lucernex.qa;

import com.lucernex.qa.iwms.ImportClient;
import com.lucernex.qa.iwms.domain.ImportDataResults;

import cucumber.api.java.en.And;

import java.io.File;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ImportSteps {
    @And("^I import \"([^\"]*)\"$")
    public void I_import(String filePath) throws Throwable {
        File file = new File(FileUtilities.getCWD(), filePath);

        assertTrue(String.format("Specified file '%s' not found!", filePath), file.exists());

        ImportDataResults results = ImportClient.importFile(file, true);

        assertNotNull(results);
        assertTrue(results.isSuccess());
     }
}
