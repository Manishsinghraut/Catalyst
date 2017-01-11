package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Entity/ScheduleTemplates/EditingTaskInfoFromTaskBarsOnGanttViewContinued.feature",
                "target/test-classes/iwms/Location/Details/AddDocumentsToTaskSchedulePopUp.feature",
                "target/test-classes/iwms/Contract/AbstractInfo/Covenants/ContractCovenantsThroughUI.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/DefaultValues-Forms.feature"

        },
        format = {"json:target/cucumber.json", "html:Regression1FileUploadAndDownload"}
)

public class Regression1FileUploadAndDownloadTest {
}
