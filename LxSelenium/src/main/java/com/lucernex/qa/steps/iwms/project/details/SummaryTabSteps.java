package com.lucernex.qa.steps.iwms.project.details;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.location.summary.SummaryView;
import com.lucernex.qa.views.iwms.project.details.SummaryTabView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class SummaryTabSteps {
    private static final Logger logger = Logger.getLogger(SummaryTabSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @Then("^I verify row from custom list grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_from_custom_list_grid_having_unique_value_under_column_header(String gridID, String uniqueValue,String header,List<Field> fields) throws Throwable {
        SummaryTabView.verifyUniqueTableGridRow(gridID,uniqueValue,header,fields);
    }

    @And("^I collapse the \"([^\"]*)\" section$")
    public void I_collapse_the_section(String arg1) throws Throwable {
        SummaryTabView.clickCollapseButton(arg1);
    }

    @And("^I hide the \"([^\"]*)\" section$")
    public void I_hide_the_section(String arg1) throws Throwable {
        SummaryTabView.clickHideButton(arg1);
    }

    @And("^I verify the grid \"([^\"]*)\" is invisible$")
    public void I_verify_the_grid_is_invisible(String arg1) throws Throwable {
       SummaryTabView.verifyGridInvisibility(arg1);
    }

    @And("^I fetch entity ID from project summary page$")
    public void I_fetch_entity_ID_from_project_summary_page() throws Throwable {
        SummaryTabView.getEntityID();
    }

    @And("^I fetch \"([^\"]*)\" entity sequence number$")
    public void I_fetch_entity_sequence_number(String entityType) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        SummaryTabView.fetchEntitySequenceNumber(entityType);
    }

    @Then("^I verify the \"([^\"]*)\" in entity summary page$")
    public void I_verify_the_entity_sequence_number(String label) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        SummaryTabView.verifySequenceNumber(label);
    }

    @And("^I click on the \"([^\"]*)\" button in modal window \"([^\"]*)\"$")
    public void iClickOnTheButtonInModalWindow(String btn, String name) throws Throwable {
        SummaryTabView.getModalWindowButtonNew(btn, name);
    }

    @And("^I verify the field \"([^\"]*)\" does not have value in a same column$")
    public void iVerifyTheFieldDoesNotHaveValue(String expVal) throws Throwable {
        CommonMethods.verifyValueInSameColumn(expVal);
    }
}