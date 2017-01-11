package com.lucernex.qa.admin;


import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.admin.AdminPageView;
import com.lucernex.qa.views.admin.AdminTabsView;
import com.lucernex.qa.views.components.ConfirmationPopupView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Preconditions.*;
import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.TestCase.assertTrue;
import static junit.framework.TestCase.fail;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

public class AdminSteps {
    private static final Logger logger = Logger.getLogger(AdminSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final AdminPage adminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AdminPage.class);

    private String gridItemName,
            possibleGridItemName,
            confirmationDialog;

    private void failWithScreenshot(String filename, String fmt, Object... args) {
        BaseView.takeScreenshot(filename);
        logger.info(String.format("Took screenshot to file '%s'", filename));
        fail(String.format(fmt, args));
    }

    @And("^I click on the \"([^\"]*)\" link$")
    public void I_click_on_the_link(String link) throws InterruptedException {
//        delay(2000);
        try {
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            AdminPageView.clickLink(link);
            //HomeView.verifyFooterDisplayed();
                AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
//        delay(4000);
    }

    @And("^I see these tabs:$")
    public void I_see_these_tabs(List<String> names) {
        List<String> tabNames = AdminTabsView.getTabNames();

        for (String n : names) {
            if (!tabNames.contains(n)) {
                failWithScreenshot("expected-tab-not-seen.png", "Did not see the expected '%s' tab!", n);
            }
        }
    }

    /**
     * Returns a list of strings derived from the specified list of strings with
     * the localization tokens removed.
     * <p/>
     * ~~Actions#~ -> Actions
     *
     * @param src - source strings
     */
    public List<String> removeLocalizationTokens(List<String> src) {
        if (src == null) {
            return null;
        }

        if (src.isEmpty()) {
            return src;
        }

        List<String> dst = new ArrayList<String>(src.size());
        Pattern re = Pattern.compile("^~~(.*)#~$");

        for (String s : src) {
            Matcher m = re.matcher(s);

            if (m.find()) {
                dst.add(m.group(1));
            } else {
                dst.add(s);
            }
        }

        return dst;
    }

    @And("^I see these grid columns:$")
    public void I_see_these_grid_columns(List<String> columns) {
        List<String> columnHeaders;

        try {
            columnHeaders = removeLocalizationTokens(AdminGridView.getGridColumnHeaders());
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        for (String c : columns) {
            if (!columnHeaders.contains(c)) {
                failWithScreenshot(c + ".png", "Did not see the expected '%s' grid column!", c);
            }
        }
    }

    @And("^I see some rows with data in the grid$")
    public void I_see_some_rows_with_data_in_the_grid() {
        int rowCount;

        try {
            rowCount = AdminGridView.getGridRowCount();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (rowCount == 0) {
            failWithScreenshot("grid-has-no-rows.png", "Grid does not have any rows!");
        }

        List<String> cells;

        try {
            cells = AdminGridView.getGridRow(0);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (cells == null || cells.isEmpty()) {
            failWithScreenshot("no-cell-values-in-grid.png", "First grid row does not have any cell values!");
        }
    }

    @And("^I see these row actions:$")
    public void I_see_these_row_actions(List<String> actions) {
        List<String> cellActions;

        try {
            cellActions = AdminGridView.getActions();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        for (String action : actions) {
            if (!cellActions.contains(action)) {
                failWithScreenshot("expected-grid-action-not-seen.png", "Did not see action '%s' in the grid!", action);
            }
        }
    }

    @And("^I see the grid contains records of type \"([^\"]*)\"$")
    public void I_see_the_grid_contains_records_of_type(String expectedRecordType) {
        assert expectedRecordType != null;

        String recordType;

        try {
            recordType = AdminGridView.getRecordType();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (recordType == null) {
            failWithScreenshot("no-grid-record-type-found.png", "Unable to determine the record type which the grid handles!");
            return;
        }

        if (!recordType.equals(expectedRecordType)) {
            failWithScreenshot("expected-record-type-not-seen.png", "Record type '%s' not same as expected '%s'!", recordType, expectedRecordType);
        }
    }

    @And("^I see page \"([^\"]*)\" in the grid's pagination controls$")
    public void I_see_page_in_the_grid_s_pagination_controls(int expectedPage) {
        int page;

        try {
            page = AdminGridView.getCurrentPage();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (page != expectedPage) {
            failWithScreenshot("not-on-expected-grid-page.png", "Expected the current page to be '%d' but is '%d' instead!", expectedPage, page);
        }
    }

    @And("^I see the number of pages in the grid's pagination controls$")
    public void I_see_the_number_of_pages_in_the_grid_s_pagination_controls() {
        int count;

        try {
            count = AdminGridView.getPageCount();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (count == 0) {
            failWithScreenshot("no-grid-pages.png", "Expected there to be at lease one page in the number of pages but it was '%d'!", count);
        }
    }

    @When("^I click on the \"([^\"]*)\" row action on row \"([^\"]*)\"$")
    public void I_click_on_the_row_action_on_row(String action, int row) throws Exception {
        try {
            AdminGridView.executeAction(action, row);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    /**
     * Modified this method to avoid delay
     * @param expectedLabel
     */
    @Then("^I see the \"([^\"]*)\" modal window$")
    public void I_see_the_modal_window(String expectedLabel) {
//        delay(5000);
        LxModalWindow.waitForModalWindow(expectedLabel);
    }

   /* @Then("^I see the \"([^\"]*)\" modal window$")
    public void I_see_the_modal_window(String expectedLabel) {
        try {
            String label = LxModalWindow.getModalWindowLabel();


            if (label == null) {
                try {
                    delay(5000);
                    label = LxModalWindow.getModalWindowLabel();

                    if (label == null) {
                        failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                        return;
                    }

                    if (!label.startsWith(expectedLabel)) {
                        failWithScreenshot("expected-modal-window-label-not-seen.png", "Modal window label '%s' not the expected '%s'!", label, expectedLabel);
                    }
                } catch (Exception ex) {
                    failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                    return;
                }

            }
            else if(SeleniumUtil.verifyTextValue("cssselector", "div[class='frmNote']", "Delete", SeleniumUtilities.OBJWAITTIMEOUT)){
                SeleniumUtil.hitEnterKey("linktext","Delete",SeleniumUtilities.OBJWAITTIMEOUT);
            }

            if (!label.startsWith(expectedLabel)) {
                try {
                    delay(5000);
                    label = LxModalWindow.getModalWindowLabel();

                    if (label == null) {
                        failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                        return;
                    }

                    if (!label.startsWith(expectedLabel)) {
                        failWithScreenshot("expected-modal-window-label-not-seen.png", "Modal window label '%s' not the expected '%s'!", label, expectedLabel);
                    }
                } catch (Exception ex) {
                    failWithScreenshot("expected-modal-window-label-not-seen.png", "Modal window label '%s' not the expected '%s'!", label, expectedLabel);
                }

            }

        } catch (Exception e) {
            try {
                delay(5000);
                String label = LxModalWindow.getModalWindowLabel();

                if (label == null) {
                    failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                    return;
                }

                if (!label.startsWith(expectedLabel)) {
                    failWithScreenshot("expected-modal-window-label-not-seen.png", "Modal window label '%s' not the expected '%s'!", label, expectedLabel);
                }
            } catch (Exception ex) {
                fail(e.getMessage());
            }
        }

    }*/

    @And("^I click on the \"([^\"]*)\" button$")
    public void I_click_on_the_button(String button) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            LxModalWindow.clickButton(button);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

   /* @And("^I click on the \"([^\"]*)\" button$")
    public void I_click_on_the_button(String button) throws Throwable{
        try {
            LxModalWindow.clickButton(button);
            delay(5000);
        } catch (Exception e) {
            try {
                delay(3000);
                LxModalWindow.clickButton(button);
                delay(3000);
            } catch (Exception ex) {
                fail(e.getMessage());
            }
        }
        CommonMethods.waitTillDivisionLoads();
    }*/

    @Given("^I click the Add button$")
    public void I_click_the_Add_button() {
        try {
//            delay(4000);
            AdminGridView.executeAddAction();
//            delay(2000);
        } catch (Exception e) {
            try {
//                delay(6000);
                AdminGridView.executeAddAction();
            } catch (Exception ex) {
                fail(e.getMessage());
            }

        }
    }

    private String toString(Set<String> set) {
        if (set == null || set.isEmpty()) {
            return "[]";
        }

        StringBuilder sb = new StringBuilder();
        Iterator<String> it = set.iterator();

        sb.append('[');

        if (it.hasNext()) {
            sb.append(it.next());
        }

        while (it.hasNext()) {
            sb.append(",");
            sb.append(it.next());
        }

        sb.append(']');

        return sb.toString();
    }
/*

    @And("^I see it has these required fields:$")
    public void I_see_it_has_these_required_fields(List<String> expected) {
        Set<String> required = LxModalWindow.getRequiredFields();

        checkNotNull(required, "Did not see any required fields!");

        Set<String> notRequired = new TreeSet<String>();

        for (String r : expected) {
            if (!required.remove(r)) {
                notRequired.add(r);
            }
        }

        // Complain if a require field was not specified.
        if (required.size() > 0) {
            fail(String.format("Required fields %s were not specified!", toString(required)));
        }

        // Complain if a specified field is not a required field.
        if (notRequired.size() > 0) {
            fail(String.format("Specified fields %s are not required fields!", toString(notRequired)));
        }
    }
*/

    /*@And("^I enter these field values$")
    public void I_enter_these_field_values(List<Field> fields) {
        checkArgument(fields != null, "Required argument 'fields' is null!");

        Set<String> supported = LxModalWindow.getFieldLabels();
        Set<String>   unknown = new TreeSet<String>();

        for (Field f : fields) {
            if (!supported.contains(f.getName())) {
                unknown.add(f.getName());
            }
        }

        if (unknown.size() > 0) {
            fail(String.format("Specified fields %s are unknown!", toString(unknown)));
        }

        for (Field f : fields) {
            LxModalWindow.setFieldValue(f.getName(), f.getValue());
        }
    }*/

    @And("^I see a new grid row with \"([^\"]*)\" in column \"([^\"]*)\"$")
    public void I_see_a_new_grid_row_with_in_column(String value, String column) {
        checkArgument(value != null, "Required argument 'value' is null!");
        checkArgument(column != null, "Required argument 'column' is null!");

        List<String> columnHeaders;

        try {
            columnHeaders = AdminGridView.getGridColumnHeaders();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        checkNotNull(columnHeaders);

        int columnIndex = columnHeaders.indexOf(column);

        if (columnIndex == -1) {
            String msg = String.format("Specified column '%s' is not present in grid!", column);

            fail(msg);
        }

        List<String> values;

        try {
            values = AdminGridView.getGridColumn(columnIndex);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        checkNotNull(values);
        checkState(values.size() > 0);

        checkState(value.contains(value), "Did not find a grid row with a '%s' column cell value of '%s'!", column, value);
    }

    @And("^I click \"([^\"]*)\" row action for the row that has \"([^\"]*)\" in column \"([^\"]*)\"$")
    public void I_click_row_action_for_the_row_that_has_in_column(String action, String value, String column) throws Exception {
//        delay(3000);
        checkArgument(action != null, "Required argument 'action' is null!");
        checkArgument(value != null, "Required argument 'value' is null!");
        checkArgument(column != null, "Required argument 'column' is null!");

        List<String> columnHeaders;

        try {
            columnHeaders = AdminGridView.getGridColumnHeaders();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        int columnIndex = columnHeaders.indexOf(column);

        if (columnIndex == -1) {
            String msg = String.format("Specified column '%s' is not present in grid!", column);

            fail(msg);
        }

        int row;

        try {
            row = AdminGridView.getGridRowIndex(columnIndex, value);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (row == -1) {
            String msg = String.format("Did not find a grid row with a '%s' column cell value of '%s'!", column, value);

            fail(msg);
        }

        try {
            AdminGridView.executeAction(action, row);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    @And("^I click \"([^\"]*)\" button on \"([^\"]*)\" confirmation dialog$")
    public void I_click_button_on_confirmation_dialog(String button, String dialog) throws Throwable{
        try {
//            delay(5000);
            ConfirmationPopupView confirmDialog = new ConfirmationPopupView(dialog);
            confirmDialog.clickButton(button);
            CommonMethods.waitTillDivisionLoads();
            //delay(10000);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    @And("^I see \"([^\"]*)\" message in the grid$")
    public void I_see_message_in_the_grid(String expectedMsg) throws Throwable {
        AdminGridView.getMessage(expectedMsg);
    }

    @And("^I see \"([^\"]*)\" message in the frame grid$")
    public void I_see_message_in_the_frame_grid(String expectedMsg) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        AdminGridView.getMessage(expectedMsg);
    }

    @And("^I see \"([^\"]*)\" message in the header$")
    public void I_see_message_in_the_header(String expectedMsg) throws Throwable {
        AdminGridView.getErrorMessage(expectedMsg);
    }

    @And("^I see \"([^\"]*)\" action message$")
    public void I_see_action_message_in_the_header(String expectedMsg) throws Throwable {
        AdminGridView.getActionSuccessFullMessage(expectedMsg);
    }

    @And("^I see \"([^\"]*)\" in the grid header$")
    public void I_see_in_the_grid_header(String expectedMsg) throws Throwable{
        CommonMethods.waitTillDivisionLoads();
        String message;

        try {
            message = AdminGridView.getGridMessage();
        } catch (InterruptedException e) {
            try {
                message = AdminGridView.getGridMessage();
            } catch (Exception Ex) {
                fail(e.getMessage());
                return;
            }
        }

        if (isNullOrEmpty(message) || !message.equalsIgnoreCase(expectedMsg)) {
            String screenshotFile = "expected-grid-message-not-seen.png";

            BaseView.takeScreenshot(screenshotFile);
            logger.info(String.format("Took screenshot to file '%s'", screenshotFile));
            fail("Never saw the confirmation dialog!");
        }
    }

    @Given("^I search for \"([^\"]*)\"$")
    public void I_search_for(String searchText) throws Throwable {
//        delay(5000);
        AdminGridView.searchFor(searchText);
    }

    @Then("^I see the following row actions for the row that has \"([^\"]*)\" in the column \"([^\"]*)\":$")
    public void I_see_the_following_row_actions_for_the_row_that_has_in_the_column_(String value, String colName, List<String> expectedActions) {
        checkArgument(value != null, "Required argument 'value' is null!");
        checkArgument(colName != null, "Required argument 'column name' is null!");

        //  Find the Actions column
        int colIndex;

        try {
            colIndex = AdminGridView.getIndexOfColumn(colName);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        assertTrue("Specified column, " + colName + ", is not present in the grid!", colIndex > -1);

        //  Find the row of interest
        int rowIndex;

        try {
            rowIndex = AdminGridView.getGridRowIndexFromZero(colIndex, value);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        assertTrue("Did not find a grid row with a " + colName + " column cell value of " + value, rowIndex > -1);

        //  Get the Row's actions
        List<String> actualActions;

        try {
            actualActions = AdminGridView.getActions(rowIndex);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        //  Compare against the expected Actions
        boolean areEqual;
        if ((expectedActions.size() == 1 && expectedActions.get(0).equalsIgnoreCase("none"))
                && (actualActions == null || actualActions.isEmpty())) {
            areEqual = true;
        } else {
            areEqual = expectedActions.equals(actualActions);
        }

        assertTrue("Did not see the expected actions for the row with a " + colName + " column cell value of " + value,
                areEqual);
    }

    @Then("^I see the item was successfully imported$")
    public void I_see_the_item_was_successfully_imported() throws Throwable {
        // Express the Regexp above with the code you wish you had
        throw new PendingException();
    }

    @Then("^I see something$")
    public void I_see_something() throws Throwable {
        // Express the Regexp above with the code you wish you had
        throw new PendingException();
    }

    @And("^I switch to iframe$")
    public void I_switch_to_iframe() throws Throwable {
        BaseView.switchToFrame();
    }

    @Given("^I switch to iframe titled \"([^\"]*)\"$")
    public void I_switch_to_iframe_titled(String title) throws Throwable {
        BaseView.switchToFrameByTitle(title);
    }

    @Given("^I see the \"([^\"]*)\" grid$")
    public void I_see_the_grid(String gridName) {
        assertTrue(
                String.format("Did not see the '%s' admin grid", gridName),
                AdminGridView.findGrid(gridName)
        );
    }

    @Then("^I see the error message \"([^\"]*)\" in the Lx Modal Window$")
    public void I_see_the_error_message_in_the_Lx_Modal_Window(String expectedMsg) throws Throwable {
        AdminGridView.seeErrorMsgOnLxModalWindow(expectedMsg);
    }

    @And("^I add Contact Type on the Form$")
    public void I_add_Contact_Type_on_the_Form() throws Throwable {
        LxModalWindow.addEmployerContactType();
//        delay(5000);
    }

    @And("^I see the \"([^\"]*)\" on active modal window$")
    public void I_see_the_on_active_modal_window(String expectedLabel) throws Throwable {
        AllContractPagesView.waitTillDivisionLoads();
        AdminGridView.seeActiveModalWindow(expectedLabel);
        AllContractPagesView.waitTillDivisionLoads();
    }

    @Then("^I see the error message \"([^\"]*)\" in the Lx Modal active Window$")
    public void I_see_the_error_message_in_the_Lx_Modal_active_Window(String expectedLabel) throws Throwable {
        AdminGridView.seeErrorMsgOnActiveLxModalWindow(expectedLabel);
    }

    @And("^I see the grid \"([^\"]*)\" \"([^\"]*)\" contains records of type \"([^\"]*)\"$")
    public void I_see_the_grid_contains_records_of_type(String strLoctor, String strElement, String expectedRecordType) throws Throwable {
        assert expectedRecordType != null;

        String recordType;

        try {
            recordType = AdminGridView.getRecordType(strLoctor, strElement);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (recordType == null) {
            failWithScreenshot("no-grid-record-type-found.png", "Unable to determine the record type which the grid handles!");
            return;
        }

        if (!recordType.contains(expectedRecordType)) {
            failWithScreenshot("expected-record-type-not-seen.png", "Record type '%s' not same as expected '%s'!", recordType, expectedRecordType);
        }
    }

    @When("^I click on the \"([^\"]*)\" button on Add Item Modal Window$")
    public void I_click_on_the_button_on_Add_Item_Modal_Window(String buttonName) throws Throwable {
        AdminGridView.clickAddBtnOnModalWindow(buttonName);
    }

    @And("^Click on the name of the \"([^\"]*)\" in the results pop-up$")
    public void Click_on_the_name_of_the_in_the_results_pop_up(String strEntityName) throws Throwable {
        AdminGridView.clickEntityNameOnPopup(strEntityName);
    }

    @And("^I select \"([^\"]*)\" radio in members/contacts tab")
    public void I_select_radio_generic_in_members_contacts_tab(String radio) throws Throwable {
        AdminGridView.filterContacts(radio);
    }

    @Then("^I verify grid item action message \"([^\"]*)\"$")
    public void I_verify_grid_item_action_message(String msg) throws Throwable {
        AdminGridView.getGridActionMessage(msg);
    }


    @And("^I click \"([^\"]*)\" action for the row that has \"([^\"]*)\" in column \"([^\"]*)\"$")
    public void I_click_action_for_the_row_that_has_in_column(String action, String value, String column) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        checkArgument(action != null, "Required argument 'action' is null!");
        checkArgument(value != null, "Required argument 'value' is null!");
        checkArgument(column != null, "Required argument 'column' is null!");
        AdminGridView. searchRecordInGrid(value);
        List<String> columnHeaders;

        try {
            columnHeaders = AdminGridView.getGridColumnHeaders();
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        int columnIndex = columnHeaders.indexOf(column);

        if (columnIndex == -1) {
            String msg = String.format("Specified column '%s' is not present in grid!", column);

            fail(msg);
        }

        int row;

        try {
            row = AdminGridView.getGridRowIndex(columnIndex, value);
        } catch (InterruptedException e) {
            fail(e.getMessage());
            return;
        }

        if (row == -1) {
            String msg = String.format("Did not find a grid row with a '%s' column cell value of '%s'!", column, value);

            fail(msg);
        }

        try {
            AdminGridView.executeAction(action, row);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    @And("^I click on \"([^\"]*)\" radio button$")
    public void I_click_on_radio_button(String strShowTypeRadioButton) throws Throwable {
        AdminGridView.filterShowTypeRadioButton(strShowTypeRadioButton);
    }
}
