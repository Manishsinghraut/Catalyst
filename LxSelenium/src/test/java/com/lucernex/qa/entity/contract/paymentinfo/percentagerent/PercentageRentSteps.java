package com.lucernex.qa.entity.contract.paymentinfo.percentagerent;

import com.lucernex.qa.pages.RowsEnum;
import com.lucernex.qa.views.entity.contract.paymentinfo.percentagerent.PercentageRentScheduleView;
import com.lucernex.qa.views.entity.contract.paymentinfo.percentagerent.PercentageRentView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import static junit.framework.Assert.fail;

/**
 * @author Andrew.Subichev
 * @since 10/31/2014
 */
public class PercentageRentSteps {

    public enum PROffsetRadioButton {
        FixedAdjustment("1"),
        CalculatedAdjustment("2");

        private String radioValue;

        PROffsetRadioButton(String radioValue) {
            this.radioValue = radioValue;
        }

        public String getRadioValue() {
            return radioValue;
        }
    }


    @And("^I select \"([^\"]*)\" month and \"([^\"]*)\" year on PRP schedule page$")
    public void I_select_month_and_year_on_PRP_schedule_page(String monthName, String yearName) throws Throwable {
        PercentageRentScheduleView.selectMonthAndYear(monthName, yearName);
    }

    @And("^I click on the \"([^\"]*)\" offset amount link$")
    public void I_click_on_the_offset_amount_link(String linkText) throws Throwable {
        PercentageRentScheduleView.clickLink(linkText);
    }

    @When("^I edit the \"([^\"]*)\" row in \"([^\"]*)\" grid$")
    public void I_edit_the_row_in_grid(RowsEnum rowNumber, String gridID) {
        //TODO This method can be f=refactored to work on many more grids
        try {
            switch(rowNumber) {
                case First:
                    PercentageRentView.clickEditFirstOffsetLink(gridID);
                    break;
                case Second:
                    PercentageRentView.clickEditSecondOffsetLink(gridID);
                    break;
                case Third:
                    PercentageRentView.clickEditThirdOffsetLink(gridID);
                    break;
                default: throw new UnsupportedOperationException("This step is not supported yet");
            }
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    @Then("^I see \"([^\"]*)\" radio button checked$")
    public void I_see_radio_button_checked(PROffsetRadioButton radioButtonSelected) {
        try {
            PercentageRentView.verifyCheckedRadioButton(radioButtonSelected.getRadioValue());
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }
}
