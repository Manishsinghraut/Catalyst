package com.lucernex.qa.steps.iwms.dashboard;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.dashboard.DashBoardView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by RLE0097 on 07-06-2016.
 */
public class DashBoardSteps {
    private static final Logger logger = Logger.getLogger(DashBoardSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;
    @And("^I verify the \"([^\"]*)\" should be displayed$")
    public void I_verify_the_should_be_displayed(String strText) throws Throwable {
        DashBoardView.verifyCustomHTMLModuleTitle("xpath",".//*[contains(./text(),'"+strText+"')]",strText);
    }

    @And("^I enter the text \"([^\"]*)\"$")
    public void I_enter_the_text(String strText) throws Throwable {
        DashBoardView.enterText(strText);
    }

    @And("^I enter a name \"([^\"]*)\" for the tab in dashboard$")
    public void I_enter_a_name_for_the_tab_in_dashboard(String strText) throws Throwable {
        DashBoardView.enterDashBoardTabName(strText);
    }

    @And("^I Drag and Drop module \"([^\"]*)\" on dashboard \"([^\"]*)\"$")
    public void I_Drag_and_Drop_module_on_dashboard(String strFrom,String strTo) throws Throwable {
       DashBoardView.dragAndDropModule(strFrom,strTo);
    }

    @And("^I verify the module item \"([^\"]*)\" displayed on the created dashboard$")
    public void I_verify_the_module_item_displayed_on_the_created_dashboard(String strModule) throws Throwable {
        DashBoardView.verifyModule(strModule);
    }

    @And("^I verify Newly Created Dashboards shall added in descending alphabetical order between Map and Dashboard$")
    public void I_verify_Newly_Created_Dashboards_shall_added_in_descending_alphabetical_order_between_Map_and_Dashboard(List<String> expected) throws Throwable {
        DashBoardView.verifyDashboardTabOrder(expected);
    }

    @And("^I Drag and Drop module \"([^\"]*)\" on dashboard \"([^\"]*)\" in X coordinate (\\d+) and Y coordinate (\\d+) order$")
    public void I_Drag_and_Drop_module_on_dashboard_in_X_coordinate_and_Y_coordinate_order(String strFrom, String strTo, int intX, int intY) throws Throwable {
        DashBoardView.dragAndDropModuleInOrder(strFrom,intX,intY);
    }

    @And("^I verify the dashboard modules made as default should appear in the same alphabetical order$")
    public void I_verify_the_dashboard_modules_made_as_default_should_appear_in_the_same_alphabetical_order(List<String> expected) throws Throwable {
       DashBoardView.verifyModulesOrderOnDashBoard(expected);
    }


    @And("^I stretch the module window so all the columns can be displayed$")
    public void I_stretch_the_module_window_so_all_the_columns_can_be_displayed() throws Throwable {
        DashBoardView.stretchTheModule();
    }

    @And("^I verify that the dashboard object has \"([^\"]*)\" under column \"([^\"]*)\"$")
    public void I_verify_that_the_dashboard_object_has_under_column(String strUser,String strWhoAssigned) throws Throwable {
        DashBoardView.verifyWhoAssigned(strUser,strWhoAssigned);
    }

    @And("^I select the text \"([^\"]*)\"$")
    public void I_select_the_text(String strText) throws Throwable {
        DashBoardView.selectText(strText);
    }

    @And("^I click to grow text icon \"([^\"]*)\"$")
    public void I_click_to_grow_text_icon(String strText) throws Throwable {
        DashBoardView.clickOnGrowTextIcon(strText);
    }

    @And("^I switch to custom html frame window$")
    public void I_switch_to_custom_html_frame_window() throws Throwable {
        DashBoardView.switchToCustomHTMLFrame();
    }

    @And("^I verify the text \"([^\"]*)\" size \"([^\"]*)\",font color \"([^\"]*)\" and Text Highlight color is displayed$")
    public void I_verify_the_text_size_font_color_and_Text_Highlight_color_is_displayed(String strText, String strFontSize, String strFontColor) throws Throwable {
        DashBoardView.verifyCustomHTMLModuleTitle(strText, strFontSize, strFontColor);
    }

    @And("^I select text \"([^\"]*)\" to change font color$")
    public void I_select_text_to_change_font_color(String strText) throws Throwable {
        DashBoardView.clickOnFontColorIcon(strText);
    }

    @And("^I select text \"([^\"]*)\" to Highlight color$")
    public void I_select_text_to_Highlight_color(String strText) throws Throwable {
        DashBoardView.clickOnBackColorIcon(strText);
    }

    @And("^I select radio 'Total:'$")
    public void I_select_radio_Total_() throws Throwable {
       DashBoardView.clickRadioTotal();
    }

    @And("^I enter 'Line Field' value as \"([^\"]*)\"$")
    public void I_enter_Line_Field_value_as(String arg1) throws Throwable {
        DashBoardView.enterLineFieldValue(arg1);
    }

    @And("^I select portfolio \"([^\"]*)\"$")
    public void I_select_portfolio(String arg1) throws Throwable {
        DashBoardView.selectPortfolio(arg1);
    }
}
