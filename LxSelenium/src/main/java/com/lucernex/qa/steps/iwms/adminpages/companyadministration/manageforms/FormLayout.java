package com.lucernex.qa.steps.iwms.adminpages.companyadministration.manageforms;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

import java.util.List;

import static com.lucernex.qa.views.iwms.adminpages.companyadministration.manageforms.FormLayout.*;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class FormLayout {
    @And("^I select Allow Reply Yes radio button on modal window$")
    public void I_select_Allow_Reply_Yes_radio_button_on_modal_window() {
        selectAllowReplyYesRadioButton("true");
    }

    @And("^I select field set type default radio button on modal window$")
    public void I_select_field_set_type_default_radio_button_on_modal_window() throws Throwable {
        selectFieldSetTypeDefaultRadioButton("2446");
    }

    @And("^I select Allow edit Yes radio button on add layout modal window$")
    public void I_select_Allow_edit_Yes_radio_button_on_add_layout_modal_window() throws Throwable {
        selectAllowEditYesRadioButton("true");
    }

    @And("^I select Allow users to create this form Yes radio button on add layout modal window$")
    public void I_select_Allow_users_to_create_this_form_Yes_radio_button_on_add_layout_modal_window() throws Throwable {
        selectAllowUserCreateYesRadioButton("true");
    }

    @And("^I drag and drop the \"([^\"]*)\" to \"([^\"]*)\"$")
    public void I_drag_and_drop_the_to(String strFromLocation, String strTargetElement) throws Throwable {
        dragAndDrop(strFromLocation, strTargetElement);
    }

    @And("^I click on the save layout button on page layout$")
    public void I_click_on_the_save_layout_button_on_page_layout() throws Throwable {
        clickSaveLayoutButton();
    }

    @And("^I click on the close button on page layout$")
    public void I_click_on_the_close_button_on_page_layout() throws Throwable {
        clickCloseButton();
    }

    @And("^I verify the added \"([^\"]*)\" Field on the \"([^\"]*)\" pop window$")
    public void I_verify_the_added_Field_on_the_pop_window(String strFields, String strDescription) throws Throwable {
        verifyFieldsOnPopupWindowPageLayout(strFields);
    }

    @And("^I click 'Delete' link of the form \"([^\"]*)\"$")
    public void I_click_delete_link_of_the_page_layout(String strFormName) throws Throwable{
        deleteForms(strFormName);
    }

    @Then("^I verify form \"([^\"]*)\" present is \"([^\"]*)\"$")
    public void I_verify_form_present(String strFormName, boolean present) throws Throwable{
        verifyForms(strFormName,present);
    }

    @And("^I verify the following added Fields on the Page Layout pop window$")
    public void I_verify_the_following_added_Fields_on_the_Page_Layout_pop_window(List<String> field) throws Throwable {
        for (String f : field) {
            Thread.sleep(5000);
            verifyFieldsOnPopupWindowPageLayout(f);
        }
    }

    @Then("^I drag the \"([^\"]*)\" field to be on the row below the \"([^\"]*)\" field$")
    public void I_drag_the_field_to_be_on_the_row_below_the_field(String strFromLocation, String strTargetElement) throws Throwable {
        dragAndDropField(strFromLocation, strTargetElement);
    }

    @And("^I enter \"([^\"]*)\" field the value of \"([^\"]*)\", and \"([^\"]*)\" field the value of \"([^\"]*)\"$")
    public void I_enter_field_the_value_of_and_field_the_value_of(String arg1, String strFristValues, String arg3, String strSecondValues) throws Throwable {
        enterValues(strFristValues,strSecondValues);
    }

    @And("^I verify \"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\" and \"([^\"]*)\" field value \"([^\"]*)\"$")
    public void I_verify_field_value_of_field_value_of_field_value_of_field_value_of_and_field_value(String strFristName,String strFristValues,String strSecondName,String strSecondValues,String strSumName,String strSum,String strProductName,String strProduct,String strDivisionName,String strDivision) throws Throwable {
        verifyFieldValues(strFristValues,strSecondValues,strSum,strProduct,strDivision);
    }

    @And("^I enter \"([^\"]*)\" field the value of \"([^\"]*)\",\"([^\"]*)\" field the value of \"([^\"]*)\" and \"([^\"]*)\" field the value of \"([^\"]*)\"$")
    public void I_enter_field_the_value_of_field_the_value_of_and_field_the_value_of(String arg1, String strTitle, String arg3, String strFristValues, String arg5, String strSecondValues) throws Throwable {
        enterMathFieldValues(strTitle,strFristValues,strSecondValues);
    }

    @And("^I verify \"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\" and \"([^\"]*)\" field value \"([^\"]*)\"$")
    public void I_verify_field_value_of_field_value_of_field_value_of_field_value_of_field_value_of_field_value_of_and_field_value(String strTitleName,String strTitle, String strNumberXName,String strNumberXValues, String strNumberYName,String strNumberYValues, String strAddXandYName,String strAddXandY,String strxdivyName, String strxdivy, String strMultiplyxyName,String strMultiplyxy, String strPercentageName,String strPercentage) throws Throwable {
        verifyFieldValuesOnSummaryPage( strTitle, strNumberXValues, strNumberYValues, strAddXandY, strxdivy, strMultiplyxy, strPercentage);
    }

    @And("^I click on existing \"([^\"]*)\" to edit the line item$")
    public void I_click_on_existing_to_edit_the_line_item(String strTitle) throws Throwable {
        clickOnLineItem(strTitle);
    }

    @And("^I verify the field Math Total has \"([^\"]*)\"$")
    public void I_verify_the_field_Math_Total_has(String strField, String strValue) throws Throwable {

    }

    @And("^I verify the \"([^\"]*)\" field value \"([^\"]*)\" and style \"([^\"]*)\"$")
    public void I_verify_the_field_value_and_style(String strField, String strValue, String strStyle) throws Throwable {
        verifyTheFieldValueNStyle(strValue, strStyle);
    }
}

