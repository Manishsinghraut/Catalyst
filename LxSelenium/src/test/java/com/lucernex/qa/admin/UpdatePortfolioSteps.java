package com.lucernex.qa.admin;

import com.lucernex.qa.views.admin.ManageScheduleTemplate.UpdatePortfolioView;
import com.lucernex.qa.views.components.GridPanelView;
import cucumber.api.java.en.And;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Cucumber steps for sake of [Admin->Manage Schedule Templates->Update Portfolio] page.
 */
public class UpdatePortfolioSteps {
    @And("^I click on the \"([^\"]*)\" checkbox on the Update Portfolio page$")
    public void I_click_on_the_checkbox_on_the_Update_Portfolio_page(String checkboxLabel) {
        String msg = String.format("Did not see the checkbox labeled '%s'", checkboxLabel);

        assertTrue(msg, UpdatePortfolioView.clickUpdateOptionsCheckbox(checkboxLabel));
    }

    @And("^I click on the \"([^\"]*)\" link in the \"([^\"]*)\" column where \"([^\"]*)\" column is \"([^\"]*)\"$")
    public void I_click_on_the_link_in_the_column_where_column_is(
        String linkLabel, String actionColumn, String whereColumn, String whereValue
    ) {
        assertNotNull(linkLabel);
        assertNotNull(actionColumn);
        assertNotNull(whereColumn);
        assertNotNull(whereValue);

        GridPanelView grid = new GridPanelView("div", "entitySelect");

        int rowIndex = grid.findGridRowWithCellValue(whereColumn, whereValue);

        assertTrue("Did not see the '" + whereValue + "' in the [" + whereColumn + "] in any grid row", rowIndex > -1);

        grid.clickCellLink(rowIndex, actionColumn);

        try {
            // Give web-ui a chance to do its AJAX call.
            Thread.sleep(1000l);
        } catch (InterruptedException e) {
            // ignore
        }
    }

    @And("^I click on the \"([^\"]*)\" button on the Update Portfolio page$")
    public void I_click_on_the_button_on_the_Update_Portfolio_page(String buttonLabel) {
        UpdatePortfolioView.clickButton(buttonLabel);
    }

    @And("^I wait for the \"([^\"]*)\" button on the Update Portfolio page$")
    public void I_wait_for_the_button_on_the_Update_Portfolio_page(String buttonLabel) {
        assertTrue("Never saw the [" + buttonLabel + "] button.", UpdatePortfolioView.waitForButton(buttonLabel));
    }
}
