package com.lucernex.qa.steps.iwms.adminpages.companyadministration.managepages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.managepages.PageLayoutView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static com.lucernex.qa.views.iwms.adminpages.companyadministration.managepages.PageLayoutView.*;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class PageLayoutSteps {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final Logger logger = Logger.getLogger(PageLayoutSteps.class.getName());

    @And("^I select Allow Edit 'Yes' radio button on modal window$")
    public void I_select_Allow_Reply_Yes_radio_button_on_modal_window() {
        selectAllowEditYesRadioButton("true");
    }

    @And("^I click 'Edit' link of the page layout \"([^\"]*)\"$")
    public void I_click_Edit_link_of_the_page_layout(String strLayoutName) {
        editPageLayout(strLayoutName);
    }

    @And("^I click 'Delete' link of the page layout \"([^\"]*)\"$")
    public void I_click_delete_link_of_the_page_layout(String strLayoutName) {
        deletePageLayout(strLayoutName);
    }

    @And("^I click \"([^\"]*)\" link of \"([^\"]*)\" page layout$")
    public void I_click_page_layout_actions(String actions, String strLayoutName) {
        pageLayoutActions(strLayoutName, actions);
    }

    @And("^I drag and drop the following$")
    public void I_click_page_layout_actions(List<String> field) throws Throwable {
        for (String f : field) {

            PageLayoutView.dragAndDrop(f);
        }
    }

    @When("^I expand the following math operation tree$")
    public void I_expand_the_following_math_operation_tree(List<String> folderName) throws Throwable{
        for (String f : folderName) {
            PageLayoutView.expandMathOperationTree(f);
        }
    }

    @When("^I select the following math operation fields$")
    public void I_select_the_following_math_operations(List<String> folderName) {
        for (String f : folderName) {
            PageLayoutView.selectMathOperationFields(f);
        }
    }

    @And("^I click the \"...\" for the \"([^\"]*)\" field$")
    public void I_click_the_for_the_field(String field) throws Throwable {
        PageLayoutView.clickEditOption("requiredFieldLabel", field);
//        PageLayoutView.clickEditOption(field);
    }

    @And("^I click edit option for the \"([^\"]*)\" field$")
    public void I_click_edit_option_for_the_field(String field) throws Throwable {
        PageLayoutView.clickEditOptionForOptionalField(field);
    }

    @And("^I click on >> button to move field$")
    public void I_click_button_push_field() {
        try {
            PageLayoutView.moveField();
            logger.info("Clicked >> button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I click on >> button to move constants$")
    public void I_click_button_push_constants() throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            PageLayoutView.moveValue();
            logger.info("Clicked >> button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I click on \\+ button$")
    public void I_click_addition_button() {
        try {
            PageLayoutView.add();
            logger.info("Clicked >> button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I click on \\+ button to add new fields$")
    public void I_click_on_button_to_add_new_fields() throws Throwable {
        //Unexpected alert is coming
       /* try{
            ForceWaitForItem.delay(10000);
            Alert alert = BrowserDriver.getCurrentDriver().switchTo().alert();
            alert.accept();
        }catch(Exception e ){

        }
        try {*/
        PageLayoutView.addNewField();
       /*     Log.info("Clicked + button");
        } catch (Exception Ex) {
            try{
                ForceWaitForItem.delay(5000);
                PageLayoutView.addNewField();
            }
            catch(Exception ex) {
                BaseView.takeScreenshot("I_click_on_button.png");
                Log.info("Error :" + ex.getMessage());
            }
        }catch(AssertionError e){

        }*/
    }

    @Then("^I verify page layout \"([^\"]*)\" present is \"([^\"]*)\"$")
    public void I_verify_form_present(String strFormName, boolean present) throws Throwable {
        verifyPageLayout(strFormName, present);
    }

    @And("^I click the \"([^\"]*)\" for the \"([^\"]*)\" field for edit$")
    public void I_click_the_for_the_field_for_edit(String arg1, String field) throws Throwable {
        PageLayoutView.clickEditOptionButton("optionalFieldLabel", field);
    }

    @And("^I remove following field from the layout \"([^\"]*)\"$")
    public void I_click_the_for_the_field_for_edit(String field) throws Throwable {
        PageLayoutView.removeField(field);
    }

    @And("^I verify the following fields are not editable$")
    public void I_verify_the_following_fields_are_not_editable(List<Field> fields) throws Throwable {
        for (Field f : fields) {
            PageLayoutView.verifyNameIsNonEditable(f.getName(), f.getValue());
        }
    }

    @And("^I verify I am at Project details summary tab$")
    public void I_verify_I_am_at_project_details_summary_tab() throws Throwable {
        PageLayoutView.switchToProjectDetailsSummaryTab("ProjectEntityName_label");
    }

    @Given("^I click on the \"([^\"]*)\" button confirmation popup window$")
    public void I_click_on_the_button_confirmation_popup_window(String strButton) {
        try {
            CommonMethods.clickOnButton(strButton);
            logger.info("Clicked " + strButton + "confirmation popup window");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + "confirmation popup window.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Then("^I verify the City, State fields are not editable$")
    public void I_verify_the_City_State_fields_are_not_editable() throws Throwable {
        PageLayoutView.switchToProjectDetailsSummaryTab("CityStateProvinceCountry_label");
    }

    @And("^I click on the \"([^\"]*)\" optional Field Label for the \"([^\"]*)\" field$")
    public void I_click_on_the_optional_Field_Label_for_the_field(String arg1, String field) throws Throwable {
        PageLayoutView.clickEditOption("optionalFieldLabel", field);
    }

    @And("^I click on the '...' corresponding to field label \"([^\"]*)\"$")
    public void I_click_on_the_Field_Label_for_the_field(String field) throws Throwable {
        SeleniumUtil.handleUnexpectedAlerts();
        PageLayoutView.clickEditOptionForOptionalFields(field);
    }

    @And("^I click on the '...' corresponding to field \"([^\"]*)\"$")
    public void I_click_on_the_Field_Label_for__field(String field) throws Throwable {
        SeleniumUtil.handleUnexpectedAlerts();
        PageLayoutView.clickEditOptionForField(field);
    }

    @And("^I insert the new field \"([^\"]*)\"$")
    public void I_insert_new_fields(String fieldName) throws Throwable {
        PageLayoutView.insertNewField(fieldName);
    }

    @And("^I verify \"([^\"]*)\" is displayed on layout page$")
    public void I_verify_is_displayed_on_layout_page(String strFieldName) throws Throwable {
        AllContractPagesView.waitTillDivisionLoads();
        AllContractPagesView.waitTillDivisionLoads();
        PageLayoutView.verifyFormExist(strFieldName);
        AllContractPagesView.waitTillDivisionLoads();
        AllContractPagesView.waitTillDivisionLoads();
    }

    @And("^I verify \"([^\"]*)\" field is displayed on layout page$")
    public void I_verify_field_is_displayed_on_layout_page(String strFieldName) throws Throwable {
        PageLayoutView.verifyFieldExist(strFieldName);
    }

    @And("^I verify \"([^\"]*)\" is label is displayed on layout page$")
    public void I_verify_is_label_is_displayed_on_layout_page(String arg1) throws Throwable {
        PageLayoutView.verifyMathFieldExist();
    }

    @And("^I verify \"([^\"]*)\" is displayed on summary page$")
    public void I_verify_is_displayed_on_summary_page(String strFieldName) throws Throwable {
       PageLayoutView.verifyFormExist(strFieldName);
    }

    @And("^I verify \"([^\"]*)\" \"([^\"]*)\" is displayed on summary page$")
    public void I_verify_is_displayed_on_summary_page(String strFieldName,String strValue) throws Throwable {
        PageLayoutView.verifyFieldExistSummaryPage(strFieldName,strValue);
    }

    @And("^I verify \"([^\"]*)\" \"([^\"]*)\" math field is displayed on summary page$")
    public void I_verify_math_field_is_displayed_on_summary_page(String strFieldName,String strValue) throws Throwable {
        PageLayoutView.verifyMathFieldExistSummaryPage(strFieldName,strValue);
    }

    @And("^I select \"([^\"]*)\" field to move in current operation field$")
    public void I_select_field_to_move_in_current_operation_field(String strFieldName) throws Throwable {
        PageLayoutView.selectField(strFieldName);
    }

    @And("^I click on \"([^\"]*)\" operator button$")
    public void I_click_on_operator_button(String strOperator) throws Throwable {
       PageLayoutView.clickOnOperationButton(strOperator);
    }

    @And("^I click on build layout of \"([^\"]*)\" page layout name$")
    public void I_click_on_build_layout_of_page_layout_name(String strPageLayoutButton) throws Throwable {
        PageLayoutView.clickOnBuildLayoutButton(strPageLayoutButton);
    }

    @And("^I verify the \"([^\"]*)\" field is displayed$")
    public void I_verify_the_field_is_displayed(String strField) throws Throwable {
       PageLayoutView.verifyFieldsOnPageLayout(strField);
    }

    @And("^I verify \"([^\"]*)\" \"([^\"]*)\" is displayed$")
    public void I_verify_is_displayed(String strFieldName, String strFieldValue) throws Throwable {
        PageLayoutView.verifyFieldsOnNonEditablePage(strFieldName, strFieldValue);
    }

    @And("^I verify the \"([^\"]*)\" field is displayed on Form layout$")
    public void I_verify_the_field_is_displayed_on_Form_layout(String strField) throws Throwable {
        PageLayoutView.verifyFieldsOnFormLayout(strField);
    }

    @And("^I verify the \"([^\"]*)\" field is displayed on Page layout$")
    public void I_verify_the_field_is_displayed_on_Page_layout(String strField) throws Throwable {
        PageLayoutView.verifyFieldsOnCustomListPageLayout(strField);
    }

    @And("^I verify \"([^\"]*)\" field is displayed on summary page$")
    public void I_verify_field_is_displayed_on_summary_page(String strFieldName) throws Throwable {
        PageLayoutView.verifyFieldsOnSummaryPage(strFieldName);
    }

    @And("^I click on the Add Button$")
    public void I_click_on_the_Add_Button() throws Throwable {
        PageLayoutView.clickOnAddButton();
    }

    @And("^I click on the '...' for the following field label \"([^\"]*)\"$")
    public void I_click_on_the_Field_Label_for_the_required_field(String field) throws Throwable {
        SeleniumUtil.handleUnexpectedAlerts();
        PageLayoutView.clickEditOptionForFields(field);
    }

    @And("^I click on the '...' of corresponding to field label \"([^\"]*)\"$")
    public void I_click_on_the_of_corresponding_to_field_label(String field) throws Throwable {
        SeleniumUtil.handleUnexpectedAlerts();
        PageLayoutView.clickEditOptionForOptionalFields(field, "");
    }
}