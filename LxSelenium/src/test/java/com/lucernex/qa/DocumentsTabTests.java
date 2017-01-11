package com.lucernex.qa;

/**
 * Created by RLE0097 on 02-12-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Project/Details/Documents/UploadNewDocument.feature",
        "target/test-classes/iwms/Project/Details/Documents/UploadNewVersionOfADocument.feature",
        "target/test-classes/iwms/Project/Details/Documents/UploadZipFile.feature",
        "target/test-classes/iwms/Project/Details/Documents/DocumentFolders.feature",
        "target/test-classes/iwms/Project/Details/Documents/AbilityToReportOnExistingDocumentAndFoldersByEntity.feature",
        "target/test-classes/iwms/Project/Details/Documents/DocumentReadyForRelease.feature",
        "target/test-classes/iwms/Project/Details/Documents/DeleteDocument.feature",
    },
    format = {"json:target/cucumber.json", "html:DocumentsTabTests"}
)
public class DocumentsTabTests {
}
