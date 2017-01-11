package com.lucernex.qa.steps.iwms.preserveglobalpages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.PageFormNonEditableFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.joblog.JobLogView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import com.lucernex.qa.views.iwms.preserveglobalpages.PreserveGlobalPagesViews;
import com.lucernex.qa.views.iwms.project.details.schedule.ScheduleView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class PreserveGlobalPagesSteps {
    private static final Logger logger = Logger.getLogger(PreserveGlobalPagesSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I fetch and store top menu link$")
    public void I_fetch_and_store_top_menu_link() throws Throwable {
        PreserveGlobalPagesViews.getLink();
    }

    @And("^I fetch and store top menu links$")
    public void I_fetch_and_store_top_menu_links_of_site() throws Throwable {
        PreserveGlobalPagesViews.getLinks();
    }

    @And("^I fetch and store top menu links of project$")
    public void I_fetch_and_store_top_menu_links_of_project() throws Throwable {
        PreserveGlobalPagesViews.getLinksOfProject();
    }

    @And("^I fetch and store top menu links of facility$")
    public void I_fetch_and_store_top_menu_links_of_facility() throws Throwable {
        PreserveGlobalPagesViews.getLinksOfFacility();
    }


    @And("^I right click on menu \"([^\"]*)\"$")
    public void I_right_click_on_menu(String menuItem) throws Throwable {
        ScheduleView.rightClickOnTask(menuItem);
    }

    @And("^I click on the menu \"([^\"]*)\"$")
    public void I_click_on_the_menu(String strText) throws Exception {
        CommonMethods.clickButton(strText);
    }

    @And("^I add menu item of name \"([^\"]*)\"$")
    public void I_add_menu_item_of_name(String name) throws Exception {
        PreserveGlobalPagesViews.addMenuItem(name);
    }

    @And("^I add the following menu items$")
    public void I_add_menu_item_of_name(List<String> name) throws Throwable {
        for(int i = 0;i < name.size();i++){
            ScheduleView.rightClickOnTask("Summary");
            CommonMethods.clickButton("Add Menu Item");
            OrgChartView.waitTillModalWindowToOpen();
            PreserveGlobalPagesViews.addMenuItems(i,name.get(i));
            LxModalWindow.clickButton("Submit");
            OrgChartView.waitTillModalWindowToClose();
        }
    }

    @Then("^I verify menu item in a page$")
    public void I_verify_menu_item_in_a_page(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            PreserveGlobalPagesViews.verifyText(f.getValue());
        }
    }

    @And("^I select an option \"([^\"]*)\"$")
    public void I_select_an_option(String option) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        PreserveGlobalPagesViews.selectLayoutOption(option);
    }

    @Then("^I verify the following text not present$")
    public void I_verify_the_following_text_not_present(List<String> text) throws Throwable {
        JobLogView.verifyLogTextNotPresent(text);
    }

    @Then("^I verify the following text not present in non frame page$")
    public void I_verify_the_following_text_not_present_in_non_frame_page(List<String> text) throws Throwable {
        JobLogView.verifyTextNotPresent(text);
    }

    @And("^I verify the following details in non editable summary page in frame grid$")
    public void I_verify_the_following_details_in_non_editable_summary_page_in_frame_grid(List<List<String>> summaryData) throws Throwable {
       CommonMethods.switchToVisibleFrame();
       CommonMethods.waitTillDivisionLoads();
       PreserveGlobalPagesViews.verifySummaryData(summaryData);
    }

    @And("^I verify the following details in non editable summary page in non frame grid$")
    public void I_verify_the_following_details_in_non_editable_summary_page_in_non_frame_grid(List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try{
            PageFormNonEditableFields.fieldValueSameRowInNonFrame(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the following details in non editable summary page in non-frame grid$")
    public void I_verify_the_following_details_in_non_frame_noneditable_summary_page_in_frame_grid(List<List<String>> summaryData) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        PreserveGlobalPagesViews.verifySummaryData(summaryData);
    }

    @And("^I verify the following details is not present in non editable summary page in frame grid$")
    public void I_verify_the_following_details_is_not_present_in_non_editable_summary_page_in_frame_grid(List<List<String>> summaryData) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        PreserveGlobalPagesViews.verifySummaryDataNotPresent(summaryData);
    }

}