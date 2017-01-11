package com.lucernex.qa;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Entity;
import com.lucernex.qa.data.Entity.EntityType;
import com.lucernex.qa.iwms.JSPClient;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.support.PageFactory;

import java.io.File;
import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;


/**
 * @author Andrew.Subichev
 */
public class ManageEntitySteps {

    private static final Logger logger = Logger.getLogger(ManageEntitySteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;

    @And("^I initialize these entities:$")
    public void I_initialize_these_entities(List<Entity> initEntities) throws Throwable {

        for(Entity workEntity : initEntities) {
            if(workEntity.isDeleteFirst())
            {
                GenericEntityView.deleteProjectEntityByName(workEntity.getType(), workEntity.getName());
            }

            JSPClient jspClient = new JSPClient(BrowserDriver.getCurrentDriver());
            File entitiesFile = new File(FileUtilities.getCWD(), workEntity.getXmlFilePathAndName());
            ImportDataResults results = jspClient.importFile(entitiesFile, 60, false);

            assertNotNull("Import results cannot be NULL", results);

            if(workEntity.isFailOnWarning()) {
                assertTrue(results.isSuccess());
            }
        }
    }

    @And("^I delete \"([^\"]*)\" entity by name \"([^\"]*)\"$")
    public void I_delete_entity_by_name(EntityType entityType, String entityName) throws Throwable {
        GenericEntityView.deleteProjectEntityByName(entityType, entityName);
    }

    @And("^I navigate to entity type \"([^\"]*)\" named \"([^\"]*)\"$")
    public void I_navigate_to_entity_type_named(EntityType entityType, String entityName) throws Throwable {
        assertTrue("Entity name cannot be empty", StringUtils.isNotEmpty(entityName));
        GenericEntityView.switchToEntityByName(entityType, entityName);
    }

    @And("^I extract LxID of the name \"([^\"]*)\" of type \"([^\"]*)\" from rest API$")
    public void I_extract_LxID_of_the_name_of_type_from_rest_API(String strName,String strType) throws Throwable {
        GenericEntityView.getLxID(strName,strType);
    }
}
