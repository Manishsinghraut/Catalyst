package com.lucernex.qa.steps.iwms.adminpages.costmanagement;

import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.costmanagement.BudgetTemplateView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by rle0239 on 02-05-2016.
 */
public class BudgetTemplateSteps {
    private static final Logger logger = Logger.getLogger(BudgetTemplateSteps.class.getName());

    @Then("^I check the CSI Division and CSI Code against the spreadsheet$")
    public void I_check_the_CSI_Division_and_CSI_Code(List<List<String>> data) throws Throwable {
        BudgetTemplateView.verifyCSICode(data);
    }

    @And("^I select line item code \"([^\"]*)\"$")
    public void I_select_line_item_code(String arg1) throws Throwable {
        BudgetTemplateView.selectLineItemCode(arg1);
    }

    @And("^I assert the row position of budget line items in the grid \"([^\"]*)\"$")
    public void I_assert_the_rwo_position_of_budget_line_item(String arg1, List<List<String>> lineItems) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        BudgetTemplateView.verifyBudgetLineItemsOrder(arg1, lineItems);
    }

    @And("^I click \"([^\"]*)\" arrow of the line item \"([^\"]*)\"$")
    public void I_click_arrow_of_the_line_item(String arrow, String lineItem) throws Throwable {
        BudgetTemplateView.clickArrows(arrow, lineItem);
    }

    @And("^I click on new cell pluse mark and then click on \"([^\"]*)\" option to create field$")
    public void I_click_on_new_cell_pluse_mark_and_then_click_on_option_to_create_field(String arg1) throws Throwable {
        BudgetTemplateView.createMathField();
    }

    @And("^I verify budget name \"([^\"]*)\" on template$")
    public void I_verify_budget_name_on_template(String strText) throws Throwable {
       BudgetTemplateView.verifyBudgetName(strText);
    }

    @And("^I verify budget name \"([^\"]*)\" and Total \"([^\"]*)\" on template$")
    public void I_verify_budget_name_and_Total_on_template(String strText,String strTotal) throws Throwable {
       BudgetTemplateView.verifyBudgetNameTotal(strText,strTotal);
    }

    @And("^I click on \"([^\"]*)\" of budget name \"([^\"]*)\"$")
    public void I_click_on_of_budget_name(String strText,String strAction) throws Throwable {
        BudgetTemplateView.clickOnValueofBudgetName(strText,strAction);
    }

    @And("^I double click on \"([^\"]*)\" of line and add value \"([^\"]*)\"$")
    public void I_double_click_on_of_line_and_add_value(String strText,String strValue) throws Throwable {
        BudgetTemplateView.enterValueOfBudgetName(strText,strValue);
    }

    @And("^I click on Numberic Constant \"([^\"]*)\" button$")
    public void I_click_on_Numberic_Constant_button(String arg1) throws Throwable {
        BudgetTemplateView.clickOnNumbericContantButton();
    }

    @And("^I Upload the following Budget template from path \"([^\"]*)\"$")
    public void I_Upload_the_following_Budget_template_from_path(String dataDir) throws Throwable {
//        BudgetTemplateView.uploadBudgetTemplate(dataDir,fileName );
    }

    @And("^I verify \"([^\"]*)\" field added sucessfully$")
    public void I_verify_field_added_sucessfully(String strField) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        BudgetTemplateView.verifyAddedField(strField);
    }

    @And("^I verify Budget name \"([^\"]*)\" of \"([^\"]*)\" of  Building Cost \"([^\"]*)\" , Installation \"([^\"]*)\" , Investment factors \"([^\"]*)\", Installation Div Building Cost \"([^\"]*)\", Building Cost x Investment factors \"([^\"]*)\",Installation Percent \"([^\"]*)\" and Total All \"([^\"]*)\"$")
    public void I_verify_Budget_name_of_of_Building_Cost_Installation_Investment_factors_Installation_Div_Building_Cost_Building_Cost_x_Investment_factors_Installation_Percent_and_Total_All(String strBudgetName,String strItemName,String strBuildingCost,String strInstallation,String strInvestmentfactors,String strMathBudget,String strBuildingCostxInvestmentfactors,String strInstallationPercent,String strTotalAll) throws Throwable {
        BudgetTemplateView.verifyBudgetTemplate(strBudgetName,strItemName,strBuildingCost,strInstallation,strInvestmentfactors,strMathBudget,strBuildingCostxInvestmentfactors,strInstallationPercent,strTotalAll);
    }

    @And("^I verify Total of Building Cost \"([^\"]*)\" , Installation \"([^\"]*)\" , Investment factors \"([^\"]*)\", Installation Div Building Cost \"([^\"]*)\", Building Cost x Investment factors \"([^\"]*)\",Installation Percent \"([^\"]*)\" and Total All \"([^\"]*)\"$")
    public void I_verify_Total_of_Building_Cost_Installation_Investment_factors_Installation_Div_Building_Cost_Building_Cost_x_Investment_factors_Installation_Percent_and_Total_All(String strBuildingCost,String strInstallation,String strInvestmentfactors,String strMathBudget,String strBuildingCostxInvestmentfactors,String strInstallationPercent,String strTotalAll) throws Throwable {
        BudgetTemplateView.verifyBudgetTemplate(strBuildingCost,strInstallation,strInvestmentfactors,strMathBudget,strBuildingCostxInvestmentfactors,strInstallationPercent,strTotalAll);
    }

//    @And("^I verify that \"([^\"]*)\" \"([^\"]*)\" were created and \"([^\"]*)\" \"([^\"]*)\" was created$")
//    public void I_verify_that_were_created_and_was_created(String strNoofBudgetLineItem, String strBudgetLineItemName, String strNoofBudgetTemplate, String strBudgetTemplateName) throws Throwable {
//        BudgetTemplateView.verifyImportSummaryPage(strNoofBudgetLineItem, strBudgetLineItemName, strNoofBudgetTemplate, strBudgetTemplateName);
//    }

    @And("^I verify a loading bar will appear \"([^\"]*)\" and after it has processed to (\\d+)%$")
    public void I_verify_a_loading_bar_will_appear_and_after_it_has_processed_to_(String strProgressbarStatus, int arg2) throws Throwable {
        BudgetTemplateView.verifyImportProgressbarStatus(strProgressbarStatus);
    }

    @And("^I verify that \"([^\"]*)\" \"([^\"]*)\" were created,\"([^\"]*)\" \"([^\"]*)\" was created and creates \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_verify_that_were_created_was_created_and_creates(String strNoofBudgetLineItem, String strBudgetLineItemName, String strNoofBudgetTemplate, String strBudgetTemplateName,String strTotalName,String strTotalNumber) throws Throwable {
        BudgetTemplateView.verifyImportSummaryPage(strNoofBudgetLineItem, strBudgetLineItemName, strNoofBudgetTemplate, strBudgetTemplateName,strTotalName,strTotalNumber);
    }

    @And("^I verify the \"([^\"]*)\" of the line item code \"([^\"]*)\" and Default Amount \"([^\"]*)\" will be displayed$")
    public void I_verify_the_of_the_line_item_code_and_Default_Amount_will_be_displayed(String strName,String strLineItemCode, String strDefaultAmount) throws Throwable {
        BudgetTemplateView.verifyTheLineItemCode(strName,strLineItemCode,strDefaultAmount);
    }

    @And("^I click on the \"([^\"]*)\" of Contractor Field$")
    public void I_click_on_the_of_Contractor_Field(String arg1) throws Throwable {
        BudgetTemplateView.clickOnThreeDot();
    }

    @And("^I click OK button$")
    public void I_click_OK_button() throws Throwable {
        BudgetTemplateView.clickOnOkButton();
    }

    @And("^I click \"([^\"]*)\" for \"([^\"]*)\"$")
    public void I_click_for(String strName,String strLink) throws Throwable {
       BudgetTemplateView.clickOnlinkofRow(strName,strLink);
    }

    @And("^I enter the budget \"([^\"]*)\", Quantity \"([^\"]*)\", Budget Cost \"([^\"]*)\"$")
    public void I_enter_the_budget_Quantity_Budget_Cost(String strBudgetname, String strQuantity, String strBudgetCost) throws Throwable {
        BudgetTemplateView.enterValueInBudgetRow(strBudgetname, strQuantity, strBudgetCost);
    }

    @And("^I verify a \"([^\"]*)\" on \"([^\"]*)\"$")
    public void I_verify_a_on(String strText, String arg2) throws Throwable {
        BudgetTemplateView. verifyText(strText);
    }
}