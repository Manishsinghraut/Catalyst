package com.lucernex.qa.steps.iwms.project.details.documents;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.GridUtils;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.project.details.documents.DocumentsTabView;
import com.lucernex.qa.views.iwms.project.details.forms.FormsTabView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import junit.framework.Assert;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.eclipse.persistence.jpa.jpql.Assert.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


/**
 * Created by RLE0097 on 08/06/2016.
 */
public class DocumentsSteps {
    private static final Logger logger = Logger.getLogger(DocumentsSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I right click on a document \"([^\"]*)\" and select menu option \"([^\"]*)\"$")
    public void I_right_click_on_a_document_and_select_menu_option(String docName, String strMenuOption) throws Throwable {
        DocumentsTabView.rightClick(docName, strMenuOption);
    }

    @And("^I select and right click on \"([^\"]*)\" and click on \"([^\"]*)\" option$")
    public void I_select_and_right_click_on_and_click_on_option(String arg1, String strOption) throws Throwable {
        DocumentsTabView.selectRightClickDownload(strOption);
    }

    @Then("^I Open \"([^\"]*)\" downloaded file and verify the content$")
    public void I_Open_downloaded_file_and_verify_the_content(String arg1, List<String> expected) throws Throwable {
        DocumentsTabView.verifyHTMLFile(expected);
    }

    @And("^I verify all rows count \"([^\"]*)\" in the non grid$")
    public void I_verify_all_rows_count_in_the_non_grid(Integer count) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        if (DocumentsTabView.getGridAllRowsCount().size() == count) {
            logger.info("Expected row count " + count + " is present");
        } else {
            fail("Expected row count " + count + " is not present " + DocumentsTabView.getGridAllRowsCount().size());
        }
    }

    @And("^I verify the save button will change to \"([^\"]*)\"$")
    public void I_verify_the_save_button_will_change_to(String buttonName) throws Throwable {
        DocumentsTabView.verifyButtonName(buttonName);
    }

    public static void verifyImageUpload() {
        try {
            Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("id", "_memberPhoto", 6, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyImageupload");
            Assert.fail("verify Image upload");
        }
    }

    @And("^I verify the logo$")
    public void I_verify_the_logo() throws Throwable {
        DocumentsTabView.verifyImageUpload();
    }

    @And("^I verify entity photo$")
    public void I_verify_entity_phot() throws Throwable {
        DocumentsTabView.verifyEntityPhoto();
    }

    @And("^I verify Budget \"([^\"]*)\", Budget Cost \"([^\"]*)\", Item Name \"([^\"]*)\", Quantity \"([^\"]*)\", Unit Cost \"([^\"]*)\", Math Total \"([^\"]*)\" on html page$")
    public void I_verify_Budget_Budget_Cost_Item_Name_Quantity_Unit_Cost_Math_Total_on_html_page(String strBudget, String strBudgetCost, String strItemName, String strQuantity, String strUnitCost, String strMathTotal) throws Throwable {
        DocumentsTabView.verifyCustomListBudget(strBudget, strBudgetCost, strItemName, strQuantity, strUnitCost, strMathTotal);
    }

    @And("^I verify rows count \"([^\"]*)\" in the non grid$")
    public void I_verify_rows_count_in_the_non_grid(Integer count) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        if (DocumentsTabView.getGridAllRowsCounts().size() == count) {
            logger.info("Expected row count " + count + " is present");
        } else {
            fail("Expected row count " + count + " is not present " + DocumentsTabView.getGridAllRowsCount().size());
        }
    }

    @And("^I Uncheck the Ready for Release option on Revisions for \"([^\"]*)\" pop-up window$")
    public void I_Uncheck_the_Ready_for_Release_option_on_Revisions_for_pop_up_window(String arg1) throws Throwable {
        DocumentsTabView.uncheckTheReadyForRelease();
    }

    @And("^I verify Uncheck the Ready for Release option on Revisions for \"([^\"]*)\" pop-up window$")
    public void I_verify_Uncheck_the_Ready_for_Release_option_on_Revisions_for_pop_up_window(String arg1) throws Throwable {
        DocumentsTabView.verifyUncheckTheReadyForRelease();
    }

    @And("^I check the Ready for Release option on Revisions for \"([^\"]*)\" pop-up window$")
    public void I_check_the_Ready_for_Release_option_on_Revisions_for_pop_up_window(String arg1) throws Throwable {
        DocumentsTabView.checkTheReadyForRelease();
    }

    @And("^I verify check the Ready for Release option on Revisions for \"([^\"]*)\" pop-up window$")
    public void I_verify_check_the_Ready_for_Release_option_on_Revisions_for_pop_up_window(String arg1) throws Throwable {
        DocumentsTabView.verifycheckTheReadyForRelease();
    }

    @And("^I right click on a document \"([^\"]*)\" and verify menu option \"([^\"]*)\" is disabled$")
    public void I_right_click_on_a_document_and_verify_menu_option_is_disabled(String docName, String strMenuOption) throws Throwable {
        DocumentsTabView.verifyMenuOptionDisabled(docName, strMenuOption);
    }

    @And("^I select the following documents$")
    public void I_select_the_following_documents(List<String> folderName) {
        for (String f : folderName) {
            DocumentsTabView.selectFolders(f);
        }
    }

    @And("^I right click on the \"([^\"]*)\" root folder then select menu option \"([^\"]*)\"$")
    public void I_right_click_on_the_root_folder_then_select_menu_option(String strFolderName, String menuOptionLink) {
        DocumentsTabView.rightClickRootFolderAndSelectOptn(strFolderName, menuOptionLink);
    }

    @And("^I select the following \"([^\"]*)\"$")
    public void I_select_the_following(String strHeader, List<String> folderName) {
        int count = 1;
        for (String f : folderName) {
            DocumentsTabView.selectFolders(f, count);
            count++;
        }
    }

    @And("^I verify \"([^\"]*)\" with \"([^\"]*)\"$")
    public void iVerifyWith(String expStatement, String expValue) throws Throwable {
        DocumentsTabView.verifyDisplayedMessage(expStatement, expValue);
    }

    @And("^I click on 'Search' button on the popup$")
    public void iClickOnButtonOnThePopup() throws Throwable {
        DocumentsTabView.clickOnSearchOnPopup();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I verify alert box with message \"([^\"]*)\"$")
    public void iVerifyAlertBoxWithMessage(String alertMessage) throws Throwable {
        DocumentsTabView.verifyAlertMessage(alertMessage);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click \"([^\"]*)\" arrow of the document \"([^\"]*)\"$")
    public void iClickArrowOfTheDocument(String arrow, String document) throws Throwable {
        DocumentsTabView.clickArrowToRearrange(arrow, document);
    }
}