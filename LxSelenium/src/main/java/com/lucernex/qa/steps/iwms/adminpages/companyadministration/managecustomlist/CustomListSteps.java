package com.lucernex.qa.steps.iwms.adminpages.companyadministration.managecustomlist;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.managecustomlist.CustomListView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class CustomListSteps {
    private static final Logger logger = Logger.getLogger(CustomListSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);


    @And("^I click on >> button to move numeric constants$")
    public void I_click_button_push_numeric_constants() {
        CustomListView.moveNumericValue();
        logger.info("Clicked >> button");
    }

    @And("^I click on >> button to move selected field")
    public void I_click_button_push_selected_field() {
        CustomListView.moveSelectedValue();
        logger.info("Clicked >> button");
    }
    @And("^I select the following options")
      public void I_select_the_following_options(List<String> options) throws Throwable{
        CustomListView.selectCLFields(options);
    }

    @And("^I click '\\+ Add' button to add line items")
    public void I_click_Add_to_add_line_items() throws Throwable{
        CustomListView.addLineItem();
    }

    @And("^I click 'Add' button to add line items")
    public void I_click_Add_button_to_add_line_items() throws Throwable{
        CustomListView.addLineItemsToForm();
    }

    @And("^I enter \"([^\"]*)\" label name")
    public void I_enter_label_name(String name) throws Throwable{
        CustomListView.enterLabelName(name);
    }

    @Then("^I verify row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" in modal window$")
    public void I_verify_row_from_grid_having_unique_value_under_column_header_in_modal_window(String gridID, String uniqueValue,String header,List<Field> fields) throws Throwable {
        CustomListView.verifyUniqueGridRow(gridID, uniqueValue, header, fields);
    }

    @Then("^I verify row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" not present in modal window$")
    public void I_verify_row_from_grid_having_unique_value_in_modal_window(String gridID, String uniqueValue) throws Throwable {
        CustomListView.verifyGridRowNotPresent(gridID,uniqueValue);
    }

    @And("^I expand the Summary Information group$")
    public void I_expand_the_Summary_Information_group() {
        CustomListView.expandTheSummaryInformationGroup();
    }

    @And("^I expand the the following data fields group$")
    public void I_expand_the_following_data_field_group(List<String> fieldNames) throws Throwable{
        CustomListView.expandDataFields(fieldNames);
    }

    @And("^I collapse the the following data fields group$")
    public void I_collapse_the_following_data_field_group(List<String> fieldNames) throws Throwable{
        CustomListView.collapseDataFields(fieldNames);
    }

    @And("^I click Add Field for the \"([^\"]*)\" Group$")
    public void I_click_Add_Field_for_the_Group(String group){
        try {
            CustomListView.addFieldForTheCustomListsGroup(group);
        }
        catch(Exception ex){
            System.out.print(ex.getMessage());
        }
    }

    @And("^I click \"([^\"]*)\" for the \"([^\"]*)\" Group$")
    public void I_click_Add_Field_for_the_Group(String field,String group){
        try {
            CustomListView.addFieldForTheCustomListsGroup(field,group);
        }
        catch(Exception ex){
            System.out.print(ex.getMessage());
        }
    }


    @And("^I click Add Field for the Custom Lists Group$")
    public void I_click_Add_Field_for_the_Custom_Lists_Group(){
        try {
            CustomListView.addFieldForTheCustomListsGroup();
        }
        catch(Exception ex){
            System.out.print(ex.getMessage());
        }
    }

    @And("^I click on the Add button$")
    public void I_click_on_the_Add_button() throws Throwable {
        CustomListView.addButton();
    }

    @And("^I Select Choose Custom List Type$")
    public void I_Select_Choose_Custom_List_Type() throws Throwable {
        CustomListView.chooseCustomListType();
    }

    @And("^I click on the Add button on grid$")
    public void I_click_on_the_Add_button_on_grid() throws Throwable {
        CustomListView.addGridButton();
    }

    @And("^I click on the update button on grid$")
    public void I_click_on_the_update_button_on_grid() throws Throwable {
        CustomListView.updateGridButton();
    }

    @And("^I Click Search Icon in Organization Field$")
    public void I_Click_Search_Icon_in_Organization_Field() throws Throwable {
        CustomListView.clickOnExpenseAllocationOrganizationID();

    }

    @And("^I verify Pop-up organization field should display the correct information$")
    public void I_verify_Pop_up_organization_field_should_display_the_correct_information(List<Field> fields) {
       CustomListView.verifyOrgInfoInPopup(fields);
    }

    @And("^I select following custom list \"([^\"]*)\" radio by label$")
    public void I_select_following_custom_list_checkboxes_by_label(String girdID, List<String> labels) throws Throwable {
       CustomListView.checkCustomListRadio(girdID,labels);
    }

    @And("^I click on the '...' of field \"([^\"]*)\"$")
    public void I_click_on_the_of_field(String name) throws Throwable {
        CustomListView.clickDotDotField(name);
    }
	
	@And("^I expand the following sub data fields group$")
    public void I_expand_the_following_sub_data_fields_group(List<String> fieldNames) throws Throwable{
        CustomListView.expandDataSubFields(fieldNames);
    }

    @And("^I click on Add Field for the \"([^\"]*)\" Group$")
    public void iClickOnAddFieldForTheGroup(String group) throws Throwable {
        try {
            CustomListView.addFieldForTheCustomListGroup(group);
        }
        catch(Exception ex){
            System.out.print(ex.getMessage());
        }

    }

    @And("^I select \"([^\"]*)\" radio option in custom list field$")
    public void I_select_radio_option_in_custom_list_field(String arg1) throws Throwable {
        CustomListView.selectRadioButtonInCustomListFiled(arg1);
    }

    @And("^I open document upload window in \"([^\"]*)\"$")
    public void iOpenDocumentUploadWindowIn(String arg0) throws Throwable {
        CustomListView.openDocUploadWinOnFormCustomList();
    }

    @And("^I click on the Custom List Report$")
    public void iClickOnTheCustomListReport() throws Throwable {
        CustomListView.clickOnCustomListInReport();
    }

    @And("^I click on the Custom List Report to edit custom list$")
    public void iClickOnTheCustomListReport_to_edit_custom_list() throws Throwable {
        CustomListView.clickAndEditCustomListReport();
    }
}