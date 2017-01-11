package com.lucernex.qa.steps.iwms.contract.reports;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.iwms.ImportClient;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.utils.FileDownloader;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.reports.ReportsView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.io.File;
import java.util.List;
import java.util.concurrent.Delayed;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.lucernex.qa.utils.GridUtils.executeSpecificRowAction;
import static com.lucernex.qa.views.iwms.CommonMethods.verifyRunReports;
import static com.lucernex.qa.views.iwms.CommonMethods.verifyRunSubRowReports;
import static com.lucernex.qa.views.iwms.contract.reports.ReportsView.verifyFieldValuesOnReport;
import static junit.framework.Assert.fail;
import static org.junit.Assert.assertTrue;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;


/**
 * Created by RLE0239 on 10/21/2015.
 */
public class ReportsSteps {
    private static final Logger logger = Logger.getLogger(ReportsSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;

    @And("^I verify a row from reports grid \"([^\"]*)\" having the following header and cell value pair")
    public void I_verify_row_from_grid_having_the_following_header_and_value_pair(String gridID, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        ReportsView.verifyReportsGrid(gridID, fields);
    }

    @And("^I verify a row from payment variance reports grid \"([^\"]*)\" having the following header and cell value pair")
    public void I_verify_row_from_payment_variance_reports_grid_having_the_following_header_and_value_pair(String gridID, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        ReportsView.verifyPaymentVarianceReportsGrid(gridID, fields);
    }

    @Then("^I verify user is directed to \"([^\"]*)\" tab$")
    public void I_verify_I_m_at_tab(String tabName) throws Throwable {
        ReportsView.activeTab(tabName);
    }

    @And("^I verify the without tax and with tax fields in row \"([^\"]*)\" on run report$")
    public void I_verify_the_without_tax_and_with_tax_fields_in_row_on_run_report(String strRow, List<Field> fields) {
        String strHeader = "", strValues = "";
        for (Field f : fields) {
            try {
                strHeader = strHeader + f.getName() + " ";
                if (f.getValue().trim().length() != 0) {
                    strValues = strValues + f.getValue() + " ";
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
        verifyRunReports("table.linedTable tbody tr td table tr", strRow, strHeader, strValues);
    }

//    @And("^I verify the without tax and with tax fields in \"([^\"]*)\" of row \"([^\"]*)\" on run report$")
//    public void I_verify_the_without_tax_and_with_tax_fields_in_of_row_on_run_report(String strFieldsName, String strRow,List<Field> fields) {
//        try {
////            SeleniumUtil.click("xpath", "//a[@title='"+strFieldsName+"']/parent::td[1]/preceding-sibling::td[1]/img", SeleniumUtilities.OBJWAITTIMEOUT);
//            String strHeader = "", strValues = "";
//            for (Field f : fields) {
//                try {
//                    strHeader = strHeader + f.getName() + " ";
//                    if (f.getValue().trim().length() != 0) {
//                        strValues = strValues + f.getValue() + " ";
//                    }
//                } catch (Exception Ex) {
//                    BaseView.takeScreenshot(f.getName() + ".png");
//                    logger.info("Error :" + Ex.getMessage());
//                }
//            }
//            verifyRunReports("table.linedTable tbody tr td table tr", strRow, strHeader, strValues);
//        }
//        catch(Exception ex){
//            logger.info(ex.getMessage());
//
//        }
//    }

    @Then("^I verify entity name \"([^\"]*)\" is clickable$")
    public void I_verify_entity_name_is_clickable(String link) throws Throwable {
        ReportsView.isLinkClickable(link);
    }

    @And("^I close report window$")
    public void I_close_report_window() throws Throwable {
        ReportsView.closeReportsWindow();
    }

    @And("^I click on Expand sign of row \"([^\"]*)\" on report$")
    public void I_click_on_Expand_sign_of_row_on_report(String strFieldsName) throws Throwable {
        //SeleniumUtil.click("xpath", "//a[@title='" + strFieldsName + "']/parent::td[1]/preceding-sibling::td[1]/img", SeleniumUtilities.OBJWAITTIMEOUT);
        try{
            BaseView.popDefaultTimeout();
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//a[@title='" + strFieldsName + "']/parent::td[1]/preceding-sibling::td[1]/img")).click();
        }catch(Exception e){
            BaseView.takeScreenshot("Failed to expand the report.png");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            fail("Failed to expand the report" + e.getMessage());

        }
    }

    @And("^I verify the following data in row \"([^\"]*)\" on run report$")
    public void I_verify_the_following_data_in_row_on_run_report(String strRow, List<Field> fields) {
        String strHeader = "", strValues = "";
        for (Field f : fields) {
            try {
                strHeader = strHeader + f.getName() + " ";
                if (f.getValue().trim().length() != 0) {
                    strValues = strValues + f.getValue() + " ";
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
        verifyRunReports("table.linedTable tbody tr", strRow, strHeader, strValues);
    }

    @And("^I verify without tax and with tax fields in of row \"([^\"]*)\" on run report$")
    public void I_verify_without_tax_and_with_tax_fields_in_of_row_on_run_report(String strRow, List<Field> fields) {
        try {
            String strHeader = "", strValues = "";
            for (Field f : fields) {
                try {
                    strHeader = strHeader + f.getName() + " ";
                    if (f.getValue().trim().length() != 0) {
                        strValues = strValues + f.getValue() + " ";
                    }
                } catch (Exception Ex) {
                    BaseView.takeScreenshot(f.getName() + ".png");
                    logger.info("Error :" + Ex.getMessage());
                }
            }
            verifyRunSubRowReports("table.linedTable tbody tr td table tr", strRow, strValues.replace("\t", " "));
        } catch (Exception ex) {
            logger.info(ex.getMessage());

        }
    }

    @And("^I expand \"([^\"]*)\" entity report$")
    public void I_expand_entity_report(String entity) throws Throwable {
        ReportsView.expandEntityReport(entity);
    }

    @And("^I verify a custom list \"([^\"]*)\" on reports grid \"([^\"]*)\" having the following header and cell value pair")
    public void I_verify_CL_grid_having_the_following_header_and_value_pair(String clName, String gridID, List<Field> fields) throws Throwable {
//        delay(3000);
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        ReportsView.verifyReportsCLGrid(gridID, clName, fields);
    }

    @And("^I see a page title \"([^\"]*)\"$")
    public void I_see_a_page_title(String arg1) throws Throwable {
        ReportsView.waitTillPageTitleContainsText(arg1);
    }

    @And("^I drag and drop the following report fields$")
    public void I_click_page_layout_actions(List<String> field) throws Throwable {
        ReportsView.dragAndDropReportFields(field);
    }

    @And("^I prepare a report layout by the following fields$")
    public void I_prepare_a_report_layout_by_the_following_fields(List<String> field) throws Throwable {
        ReportsView.buildReportLayout(field);
    }

    @And("^I check radio by label name$")
    public void I_check_radio_by_label_name(List<Field> labelName) throws Throwable {
        int i = 0;
        for (Field f : labelName) {
            List<WebElement> radios = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name*='" + f.getName() + "']"));
            WebElement labelElement = BrowserDriver.getParent(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name*='" + f.getName() + "']")));
            String labels = labelElement.getText();
            String splitLabels[] = labels.split("\n");
            for (String s : splitLabels) {
                if (s.contains(f.getValue())) {
                    radios.get(i).click();
                }
                i++;
            }
        }
    }

    @And("^I double click on following fields$")
    public void I_double_click_on_the_following_fields(List<String> field) throws Throwable {
        ReportsView.doubleClickOnFields(field);
    }

    @And("^I verify the entity \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\",\"([^\"]*)\" field value of \"([^\"]*)\" and \"([^\"]*)\" field value \"([^\"]*)\" on report$")
    public void I_verify_the_entity_field_value_of_field_value_of_field_value_of_field_value_of_and_field_value_on_report(String strEntity, String strFristName, String strFristValues, String strSecondName, String strSecondValues, String strSumName, String strSum, String strProductName, String strProduct, String strDivisionName, String strDivision) throws Throwable {
        verifyFieldValuesOnReport(strEntity, strFristValues, strSecondValues, strSum, strProduct, strDivision);
    }

    @And("^I click on the \"([^\"]*)\" link to export the report \"([^\"]*)\" of column \"([^\"]*)\" from grid \"([^\"]*)\"$")
    public void I_click_on_the_link_to_export_the_report_of_column_from_grid(String strAction, String strSearchValue, int intSearchValueInCol, String strElement) throws Throwable {
        try {
            executeSpecificRowAction("id", strElement, strSearchValue, (intSearchValueInCol), strAction);
            FileDownloader.fileDownload();
            System.out.print("Paramesh");
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());

        }
    }


    @And("^I select STEP(\\d+) \"([^\"]*)\" of the report as the step to be edited$")
    public void I_select_STEP_of_the_report_as_the_step_to_be_edited(int arg1, String strStepDescription) throws Throwable {
        ReportsView.clickOnEditButton(strStepDescription);
    }

    @And("^I select \"([^\"]*)\" from \"([^\"]*)\"$")
    public void I_select_from(String strValue, String arg2) throws Throwable {
        ReportsView.selectCriteriaConditions(strValue);
    }

    @And("^I click on the \"([^\"]*)\" button on Modify and Save Report$")
    public void I_click_on_the_button_on_Modify_and_Save_Report(String strSaveButton) throws Throwable {
        ReportsView.clickOnSaveAndRunReportButton(strSaveButton);
    }

    @And("^I verify the report header \"([^\"]*)\"$")
    public void I_verify_the_report_header(String arg1) throws Throwable {
        ReportsView.waitForTextReportHeader(arg1);
    }

	@And("^I edit report step \"([^\"]*)\"$")
    public void I_edit_report_step(String stepName) throws Throwable {
        ReportsView.editStep(stepName);
    }

    @And("^I select the Portfolio filter \"([^\"]*)\"$")
    public void I_select_the_Portfolio_filter(String portfolioOption) throws Throwable {
        ReportsView.portfolio(portfolioOption);
    }

    @And("^I select the Available fields \"([^\"]*)\"$")
    public void I_select_the_Available_fields(String strAvailablefield) throws Throwable {
       ReportsView.availablefields(strAvailablefield);
    }

    @And("^I verify image attached for the entity \"([^\"]*)\" is \"([^\"]*)\"$")
    public void I_verify_image_attached_for_the_entity(String entityName, boolean exist) throws Throwable {
        ReportsView.verifyImageAttachedToEntity(entityName,exist);
    }

    @And("^I verify Name \"([^\"]*)\", Maintenance Category \"([^\"]*)\" and extract Asset RecID on report window$")
    public void I_verify_Name_Maintenance_Category_and_extract_Asset_RecID_on_report_window(String strName,String strMaintenanceCategory) throws Throwable {
        ReportsView.extractRecID(strName, strMaintenanceCategory);
    }

    @And("^I verify Name \"([^\"]*)\", Space Name \"([^\"]*)\" and extract Space RecID and Tenant RecID on report window$")
    public void I_verify_Name_Space_Name_and_extract_Space_RecID_and_Tenant_RecID_on_report_window(String strName,String strSpaceName) throws Throwable {
        ReportsView.extractTenantRecIDnSpaceRecID(strName, strSpaceName);
    }

    @And("^I verify the Name \"([^\"]*)\",Sales Group \"([^\"]*)\",Sales Type \"([^\"]*)\" and extract Exclusion RecID from report window$")
    public void I_verify_the_Name_Sales_Group_Sales_Type_and_extract_Exclusion_RecID_from_report_window(String strName, String strSalesGroup, String strSalesType) throws Throwable {
       ReportsView.extractSalesExclusionRecIDnSpaceRecID(strName, strSalesGroup, strSalesType);
    }

	@And("^I extract Sales RecID of Sales Group \"([^\"]*)\" from sales adjustments section$")
    public void I_extract_Sales_RecID_of_Sales_Group_from_sales_adjustments_section(String strSalesGroup) throws Throwable {
        ReportsView.extractSalesRecIDs(strSalesGroup);
    }

    @And("^I extract Amendment RecID$")
    public void I_extract_Amendment_RecID() throws Throwable {
        ReportsView.extractRecID("ContractAmendment_ContractAmendmentID_span");
    }

    @And("^I extract Allowance RecID$")
    public void I_extract_Allowance_RecID() throws Throwable {
        ReportsView.extractRecID("Allowance_AllowanceID_span");
    }

    @And("^I verify Name \"([^\"]*)\", Maintenance Category \"([^\"]*)\" and extract Responsibilities Rec ID on report window$")
    public void I_verify_Name_Maintenance_Category_and_extract_Responsibilities_Rec_ID_on_report_window(String strName, String strMaintenanceCategory) throws Throwable {
        ReportsView.extractResponsibilitiesRecID(strName,strMaintenanceCategory);
    }

    @And("^I verify Name \"([^\"]*)\" and extract Percentage Rent Breakpoint RecID on report window$")
    public void I_verify_Name_and_extract_Percentage_Rent_Breakpoint_RecID_on_report_window(String strName) throws Throwable {
        ReportsView.extractPercentageRentBreakpointRecID(strName);
    }

	@And("^I verify Name \"([^\"]*)\", 	Covenant Category \"([^\"]*)\" and extract Covenant RecID on report window$")
    public void I_verify_Name_Covenant_Category_and_extract_Covenant_RecID_on_report_window(String strName,String strCovenantCategory) throws Throwable {
        ReportsView.extractsCovenantRecID(strName,strCovenantCategory);
    }

    @And("^I verify the following values are \"([^\"]*)\"")
    public void I_verify_the_following_values_editable(String editable,List<String> editableFields) throws Throwable {
        ReportsView.waitForEditableReportFields(editable,editableFields);

    }

    @And("^I click the field \"([^\"]*)\" under column \"([^\"]*)\" of Entity \"([^\"]*)\" on the report$")
    public void I_click_the_field_under_column_of_Entity_on_the_report(String strFieldValue, String strFieldName, String strEntityName) throws Throwable {
        ReportsView.editReportField(strFieldValue, strFieldName, strEntityName);
    }

    @And("^I click on the green check-mark$")
    public void I_click_on_the_green_check_mark() throws Throwable {
       ReportsView.clickOnGreenMark();
    }

    @And("^I verify Total is \"([^\"]*)\"$")
    public void I_verify_Total_is(String strTotal) throws Throwable {
       ReportsView.verifyTotal(strTotal);
    }

    @And("^I click on the red cross-mark$")
    public void I_click_on_the_red_cross_mark() throws Throwable {
        ReportsView.clickOnRedMark();
    }

    @And("^I click the field \"([^\"]*)\" under column \"([^\"]*)\" of field \"([^\"]*)\" under column of \"([^\"]*)\" on the report$")
    public void I_click_the_field_under_column_of_field_under_column_of_on_the_report(String strFieldValue, String strFieldName, String strSearchFieldValue,String strSearchFieldName) throws Throwable {
        ReportsView.editReportField(strFieldValue, strFieldName, strSearchFieldValue);
    }

    @And("^I click the field \"([^\"]*)\" under column \"([^\"]*)\" of a field \"([^\"]*)\" under column of \"([^\"]*)\" on the report$")
    public void I_click_the_field_under_column_of_a_field_under_column_of_on_the_report(String strFieldValue, String strFieldName, String strSearchFieldValue,String strSearchFieldName) throws Throwable {
        ReportsView.editReportPrecedingField(strFieldValue, strFieldName, strSearchFieldValue);
    }

    @And("^I click on the custom list entity \"([^\"]*)\" to update the value on the report$")
    public void I_click_on_the_custom_list_entity_to_update_the_value_on_the_report(String strEntityName) throws Throwable {
        ReportsView.editReportCustomListFields(strEntityName);
    }

    @And("^I verify File Created Date \"([^\"]*)\" and Version \"([^\"]*)\" of Name \"([^\"]*)\"$")
    public void I_verify_File_Created_Date_and_Version_of_Name(String strFileCreatedDate, String strVersion, String strName) throws Throwable {
        ReportsView.verifyFieldValuesOnReport( strFileCreatedDate,  strVersion,  strName);
    }

    @And("^I verify Full Folder List \"([^\"]*)\" of Name \"([^\"]*)\"$")
    public void I_verify_Full_Folder_List_of_Name(String strFileCreatedDate, String strName) throws Throwable {
        ReportsView.verifyFieldValuesOnReport( strFileCreatedDate,  strName);
    }
}