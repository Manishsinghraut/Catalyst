package com.lucernex.qa.steps.iwms.adminpages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.GridActionsView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.TestCase.fail;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class GridActionsSteps {
    private static final Logger logger = Logger.getLogger(GridActionsSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I click \"([^\"]*)\" action of \"([^\"]*)\" row in the grid \"([^\"]*)\"$")
    public void I_click_actions_links_in_any_grid(String actions, String title, String gridID) throws Throwable {
        GridActionsView.gridActions(title, actions, gridID);
    }

    @And("^I click \"([^\"]*)\" action of \"([^\"]*)\" sub row in the grid \"([^\"]*)\"$")
    public void I_click_actions_links_in_any_grid_for_sub_rows(String actions, String title, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridActionsView.gridActionsForSubRows(title, actions, gridID);
    }

    @And("^I click on \"([^\"]*)\" action of \"([^\"]*)\" sub row in the grid \"([^\"]*)\"$")
    public void I_click_on_actions_links_in_any_grid_for_sub_rows(String actions, String title, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridActionsView.gridActionsForManageDataFields(actions, title, gridID);
    }

    @And("^I expand the \"([^\"]*)\" row in grid \"([^\"]*)\"$")
    public void I_expand_row_in_any_grid(String title, String gridID) throws Throwable {
        GridActionsView.clickRow(title, gridID);
    }

    @Then("^I verify page layout in grid \"([^\"]*)\" having value \"([^\"]*)\" under column header \"([^\"]*)\" not present$")
    public void I_verify_page_layout_from_grid_having_unique_value(String gridID, String uniqueValue, String header) throws Throwable {
        GridActionsView.verifyPageLayoutNotPresent(gridID, uniqueValue, header);
    }

    @Then("^I verify row in grid \"([^\"]*)\" having value \"([^\"]*)\" under column header \"([^\"]*)\" not present$")
    public void I_verify_row_from_grid_having_unique_value(String gridID, String uniqueValue, String header) throws Throwable {
        GridActionsView.verifyGridRowNotPresent(gridID, uniqueValue, header);
    }
}