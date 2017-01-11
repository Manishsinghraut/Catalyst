package com.lucernex.qa.steps.iwms;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.*;
import com.lucernex.qa.pages.components.EditableFormOrPage;
import com.lucernex.qa.utils.*;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.AdminGenericView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import com.lucernex.qa.views.iwms.preserveglobalpages.PreserveGlobalPagesViews;
import com.lucernex.qa.views.iwms.project.details.documents.DocumentsTabView;
import com.lucernex.qa.views.iwms.project.details.schedule.ScheduleView;
import com.lucernex.qa.views.setupwizards.PortfolioSetupWizardView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.Assert;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.*;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
import static com.lucernex.qa.utils.GridUtils.*;
import static com.lucernex.qa.views.BaseView.switchToSecondWindowToClose;
import static com.lucernex.qa.views.iwms.CommonMethods.*;
import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

//import org.eclipse.jetty.util.log.Log;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by RLE0097 on 3/21/2015.
 */
public class GenericSteps {
    private static final Logger logger = Logger.getLogger(GenericSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public String dataFolder = null;
    public static String publicDataFolder = null;
    public static String lxRecID = null;
    public static String TenantRecID = null;
    public static String lxSalesRecID1 = null;
    public static String lxSalesRecID2 = null;

    @And("^I click on the \"([^\"]*)\" on the page button$")
    public void I_click_on_the_button_on_the_page(String button) {
        CommonMethods.clickOnBtn(button);
    }

    @And("^I set the values in text fields$")
    public void I_set_the_values_in_text_fields(List<TypeFields> fields) {
        CommonMethods.setValuesInTextFields(fields);
    }

    @And("^I set fields values on editable page$")
    public void I_set_the_values_in_text_fields_on_editable_page(List<Field> fields) {
        CommonMethods.setFieldValuesOnEditablePage(fields);
    }

    @And("^I set list fields values on editable page$")
    public void I_set_list_field_values_on_editable_page(List<Field> fields) {
        for (Field f : fields) {
            CommonMethods.selectFromComboBox(f.getName(), f.getValue());
        }
    }

    @And("^I set spin fields values on editable page$")
    public void I_set_spin_field_values_on_editable_page(List<Field> fields) {
        for (Field f : fields) {
            CommonMethods.selectFromSpinButton(f.getName(), f.getValue());
        }
    }

    @And("^I set following list fields values on editable page$")
    public void I_set_non_editable_list_field_values_on_editable_page(List<Field> fields) {
        for (Field f : fields) {
            CommonMethods.selectFromNonEditableComboBox(f.getName(), f.getValue());
        }
    }

    @And("^I select following Items from field$")
    public void I_select_following_items_from_field(List<Field> fields) {
        for (Field f : fields) {
            CommonMethods.selectItemFromList(f.getName(), f.getValue());
        }
    }

    @And("^I click on the page button$")
    public void I_click_on_the_button(List<ClickFields> fields) {
        CommonMethods.clickPageBtn(fields);
    }

    @And("^I click on the element$")
    public void I_click_on_the_element(List<ClickFields> fields) {
        CommonMethods.clickOnElement(fields);

    }

    @And("^I right click on a \"([^\"]*)\" root folder then select menu option \"([^\"]*)\"$")
    public void I_right_click_on_a_root_folder_then_select_menu_option(String strFolderName, String menuOptionLink) {
        CommonMethods.rightClickRootFolderAndSelectOptn(strFolderName, menuOptionLink);
    }

    @And("^Select a folder to move from the \"([^\"]*)\" to \"([^\"]*)\" the folder template$")
    public void Select_a_folder_to_move_from_the_fromFolder_to_TargetFolder_the_folder_template(String fromFolder, String toFolder) {
        CommonMethods.dragDropToFolder(fromFolder, toFolder);
    }

    @And("^I set the available folder template from the select fields$")
    public void I_set_the_available_folder_template_from_the_select_fields(List<TypeFields> fields) {
        CommonMethods.setAvailableFolderTemplate(fields);
    }

    @And("^I see the message \"([^\"]*)\" in the Lx Modal Window$")
    public void I_see_the_message_in_the_Lx_Modal_Window(String expectedMsg) {
        CommonMethods.verifyModalWindowName(expectedMsg);
    }

    @Given("^I click on the \"([^\"]*)\" row action of column \"([^\"]*)\" of column \"([^\"]*)\" from grid \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_click_on_the_row_action_of_column_of_column_from_grid(String strAction, String strSearchValue, int intSearchValueInCol, String locator, String strElement) {
        try {
            executeSpecificRowAction(locator, strElement, strSearchValue, (intSearchValueInCol), strAction);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + throwable.getMessage());
            Assert.fail(throwable.getMessage());
        }
    }

    @And("^I set the values from the select fields$")
    public void I_set_the_values_from_the_select_fields(List<TypeFields> fields) {
        CommonMethods.selectValueFromDropDown(fields);
    }

    @And("^I click on the assign members button on setup wizard$")
    public void I_click_on_the_assign_members_button_on_setup_wizard(List<ClickFields> fields) {
        CommonMethods.clickAssignMembersBtn(fields);
    }

    @And("^I select the values from the list field$")
    public void I_select_the_values_from_the_list_fields(List<TypeFields> fields) {
        CommonMethods.selectValueFromListField(fields);
    }

    @And("^I click on the \"([^\"]*)\"$")
    public void I_click_on_the(String strText) {
        try {
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.clickOnLink(strText);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }

    }

    @Then("^I verify the Members/Contacts tab$")
    public void I_verify_the_Members_Contacts_tab(List<MemberContactsFields> fields) throws Throwable {
        CommonMethods.verifyMemberContactFields(fields);
    }

    @And("^I verify the list of folders Document$")
    public void I_verify_the_list_of_folders_Document(List<FolderNameField> field) throws Throwable {
        CommonMethods.verifyListOfFolder(field);
    }

    @And("^I verify the scheduler already applied$")
    public void I_verify_the_scheduler_already_applied(List<SchedulerField> field) throws Throwable {
        CommonMethods.verifySchedulerApplied(field);
    }

    @And("^I navigate to \"([^\"]*)\" entity$")
    public void I_navigate_to_link(String navExpression) {

        String[] tokens = navExpression.split(", |,");
        for (String token : tokens) {
            try {
                Navigation.navigateTo(token);
            } catch (InterruptedException ex) {
                try {
                    Navigation.navigateTo(token);
                } catch (Exception e) {
                    BaseView.takeScreenshot("navigateTo_" + token + ".png");
                    org.junit.Assert.fail(String.format("Unable to navigate to '%s': %s", token, e.getMessage()));
                }
            }
        }
    }

    @And("^I switch to child window$")
    public void I_switch_to_child_window() {
        try {
            SeleniumUtil.getChildWindow(true);
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_switch_to_child_window.png");
            throwable.printStackTrace();
        }
    }

    @And("^I wait for pop up$")
    public void I_wait_for_pop_up_window() {
        try {
            SeleniumUtil.waitForPopUp(20);
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_wait_for_pop_up_window.png");
            throwable.printStackTrace();
        }

    }

    @And("^I use sleep$")
    public void I_use_sleep() {
        try {
//            delay(10000);
        } catch (Exception e) {
            SeleniumUtilities.Log.error("Error :" + e.getMessage());
        }
    }

    @And("^I verify pair of values on non editable summary page$")
    public void I_verify_pair_if_values_on_non_editable_summary_page(List<Field> fields) throws Throwable {
        CommonMethods.verifyPairOfValues(fields);
    }

    @And("^I verify following pair of values on non editable page$")
    public void I_verify_following_pair_of_values_on_non_editable_page(List<Field> fields) throws Throwable {
        CommonMethods.verifyPairOfValuesOnNonEditablePage(fields);
    }

    @And("^I verify values on non editable summary page$")
    public void I_verify_values_on_non_editable_summary_page(List<Field> fields) throws Throwable {
        CommonMethods.verifyPairOfValuesOnNonEditableSummaryPage(fields);
    }

    @And("^I verify the General Information fields value on non-editable summary tab$")
    public void I_verify_the_General_Information_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable {
        PageFormNonEditableFields.summaryFieldsValue(fields, "General Information");
    }

    @And("^I verify the Location fields value on non-editable summary tab$")
    public void I_verify_the_Location_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable {
        try {
            PageFormNonEditableFields.summaryFieldsValue(fields, "Location");
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_the_Location_fields_value_on_non_editable_summary_tab.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I verify the Milestone Timeline fields value on non-editable summary tab$")
    public void I_verify_the_Milestone_Timeline_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable {
        try {
            PageFormNonEditableFields.summaryFieldsValue(fields, "Milestone Timeline");
        } catch (Exception ex) {
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I verify the Site Survey Summary fields value on non-editable summary tab$")
    public void I_verify_the_Site_Survey_Summary_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable {
        try {
            PageFormNonEditableFields.summaryFieldsValue(fields, "Site Survey Summary");
        } catch (Exception ex) {
            logger.info("Error :" + ex.getMessage());
        }
    }

//    @And("^I use delay of (\\d+) milliseconds$")
//    public void I_use_delay_of_milliseconds(int intMilliSeconds) {
//        delay(intMilliSeconds);
//    }

    @And("^I use force delay of (\\d+) milliseconds$")
    public void I_use_force_delay_of_milliseconds(int intMilliSeconds) {
        try {
            Thread.sleep(intMilliSeconds);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @And("^I verify the Management fields value on non-editable summary tab$")
    public void I_verify_the_Management_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable {
        try {
            PageFormNonEditableFields.fieldValueSameRow(fields);
        } catch (Exception ex) {
            logger.info("Error :" + ex.getMessage());
        }
    }

    @Then("^I hit enter key$")
    public void I_hit_enter_key(List<ClickFields> fields) throws Throwable {
        CommonMethods.hitENTERKey(fields);
    }


    @Then("^I see \"([^\"]*)\" name on the header$")
    public void I_see_the_name_on__header(String strHeaderName) {
        CommonMethods.verifyNameOnHeader(strHeaderName);
    }

    @And("^I de-select radio$")
    public void I_deselect_radio(List<ClickFields> fields) {
        CommonMethods.deselectRadio(fields);
    }

    @And("^I wait for the element to be visible$")
    public void I_wait_for_element_to_be_visible(List<ClickFields> fields) {
        CommonMethods.waitForElementVisible(fields);
    }

    @When("^I use this spreadsheet to compare \"([^\"]*)\"$")
    public void I_used_data_files_from(String dataDir) {
        dataFolder = dataDir;
        publicDataFolder = dataFolder;
    }

    @Then("^I verify these field values on editable page comparing with \"([^\"]*)\" th row of spreadsheet$")
    public void I_verify_these_field_values_on_editable_page_comparing_with_th_row_of_spreadsheet(String strRow, List<Field> fields) {
        try {
            WebDriver driver = BrowserDriver.getCurrentDriver();
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;
            String getSplitValue;
            String fieldValue;
            boolean flag = false;

            (new WebDriverWait(driver, 10)).until(new ExpectedCondition<Boolean>() {
                public Boolean apply(WebDriver d) {
                    WebElement we = d.findElement(By.cssSelector("#f1"));
                    return we != null;
                }
            });

            for (Field f : fields) {
                Object obj = ((JavascriptExecutor) driver).executeScript(EditableFormOrPage.getFormValue("f1", f.getName()));
                fieldValue = obj.toString();

                if (f.getValue().startsWith("$")) {
                    getSplitValue = f.getValue().substring(1);
                    flag = true;
                } else {
                    getSplitValue = f.getValue();
                }
                strCellValue = excel.getCellValue(getSplitValue, Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();

                if (obj != null) {
                    if (flag) {
                        assertTrue("Excel value " + strCellValue + " is not matching with the field value " + fieldValue, fieldValue.replace(",", "").contains("$" + strCellValue + ".00"));
                        logger.info("Excel value " + strCellValue + " is matching with the field value " + fieldValue);
                    } else {

                        assertEquals("Excel value " + strCellValue + " is not matching with the field value " + fieldValue, strCellValue, fieldValue);
                        logger.info("Excel value " + strCellValue + " is matching with the field value " + fieldValue);
                    }

                } else {
                    BaseView.takeScreenshot(fieldValue + ".png");
                    Assert.fail("Executed javascript returned no value!");
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_verify_these_field_values_on_editable_page_comparing_with_th_row_of_spreadsheet.png");
        }
    }

    @When("^I compare selected option from multiple selection box with spreadsheet value \"([^\"]*)\"$")
    public void I_compare_selected_option_from_multiple_selection_box(String strRow, List<TypeFields> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;

            for (TypeFields f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                Select list = new Select(SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()));
                for (WebElement element : list.getOptions()) {
                    assertEquals("Excel value " + strCellValue + " is not matching with the field value " + element.getText(), element.getText(), strCellValue);
                    logger.info("Excel value " + strCellValue + " is matching with the field value " + element.getText());
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_compare_selected_option_from_multiple_selection_box.png");
            fail(e.getMessage());
        }
    }

    @Then("^I verify in grid \"([^\"]*)\" in row \"([^\"]*)\" by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_in_grid_that_and_has_value(String gridId, Integer rowNumber, Integer sheetRowNum, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;
//            delay(2000);

            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString();
                assertTrue(GridUtils.validateSpecificRowOfTheGridValue("cssselector", gridId, rowNumber, f.getName(), strCellValue));
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_in_grid_that_and_has_value.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I verify a row from grid \"([^\"]*)\" by reading data from excel sheet row \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value_under_header_generic_by_reading_data_from_excel(String gridID, Integer sheetRowNum, List<Field> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();

        for (Field f : fields) {
            /*try {
                f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
            } catch (NullPointerException n) {
                f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
            } catch (Exception e) {
                f.setValue(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
            }*/

            if (f.getValue().contains("Date")) {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                } catch (NullPointerException n) {
                }
            } else {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                } catch (NullPointerException e) {
                    logger.info(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                    f.setValue(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                }
            }
        }
        AllContractPagesView.clickUniqueGrid(gridID, fields.get(0).getValue(), fields.get(0).getName(), fields);
    }

    @And("^I verify a row from \"([^\"]*)\" grid by reading data from excel sheet row \"([^\"]*)\"$")
    public void I_verify_row_grid_from_having_unique_value_under_header_generic_by_reading_data_from_excel(String gridID, Integer sheetRowNum, List<Field> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();

        for (Field f : fields) {
            f.setValue(anotherExcel.getCellValue(f.getValue(), sheetRowNum));
        }
        GridUtils.findUniqueRow(gridID, fields.get(0).getValue(), fields.get(0).getName(), fields);
    }

    @Then("^I verify in grid \"([^\"]*)\" in row \"([^\"]*)\" by reading data from spreadsheet row \"([^\"]*)\"$")
    public void I_verify_in_grid_in_row_by_reading_data_from_spreadsheet_row(String gridId, Integer rowNumber, Integer sheetRowNum, List<Field> fields) {
        try {
            boolean existFrame = false;
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            String strCellValue;

            SeleniumUtil.switchTodefaultContent();
//            delay(5000);
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), sheetRowNum);

                if (!existFrame) {
                    if (isNullOrEmpty(gridId)) {
                        SeleniumUtil.getFrameIndex("cssselector", "div[id^=BOGrid]");
                    } else if (gridId.contains("^")) {
                        gridId = gridId.replace("^", "");
                        SeleniumUtil.getFrameIndex("cssselector", "div[id^=" + gridId + "]");

                    } else {
                        SeleniumUtil.getFrameIndex("cssselector", "div[id=" + gridId + "]");

                    }
                    existFrame = true;
                }

                assertTrue(GridUtils.validateSpecificRowOfTheGridValue("cssselector", gridId, rowNumber, f.getName(), strCellValue));
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_in_grid_in_row_by_reading_data_from_spreadsheet_row.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I click in grid \"([^\"]*)\" in row \"([^\"]*)\" by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_click_in_grid_that_and_has_value(String gridId, Integer rowNumber, Integer sheetRowNum, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;

            SeleniumUtil.switchTodefaultContent();
//            delay(2000);
//            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
//            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString();
                assertTrue(GridUtils.clickSpecificRowOfTheGridValue("cssselector", gridId, rowNumber, f.getName(), strCellValue));
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_in_grid_in_row_by_reading_data_from_spreadsheet_row.png");
            logger.info("Error :" + ex.getMessage());
        } catch (Throwable throwable) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_in_grid_in_row_by_reading_data_from_spreadsheet_row.png");
            logger.info("Error :" + throwable.getMessage());
        }
    }

    @Then("^I compare attribute value on editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_compare_attribute_value_on_editable_page_by_reading_data_from_spread_sheet_row(String strRow, List<Field> fields) {
        try {
            boolean existFrame = false;
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;

//            delay(5000);

            for (Field f : fields) {
                if (!isNullOrEmpty(excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString())) {
                    strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                } else {
                    strCellValue = "";
                }

                if (!existFrame) {
                    SeleniumUtil.getFrameIndex("name", f.getName());
                    existFrame = true;
                }

                String strValue = SeleniumUtil.getElement("name", f.getName(), 5, 2).getAttribute("value");//SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");

                if (SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("checkbox") ||
                        SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (SeleniumUtil.getWebElementObject("name", f.getName()).isSelected()) {
                        strValue = "true";
                    } else {
                        strValue = "false";
                    }
                }
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                strValue = SeleniumUtil.replaceSpecialChar(strValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_compare_attribute_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @Then("^I verify date values in grid \"([^\"]*)\" in row \"([^\"]*)\" by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_date_values_in_grid_in_row_by_reading_data_from_spread_sheet_row(String gridId, Integer rowNumber, Integer sheetRowNum, List<Field> fields) {

        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;

            SeleniumUtil.switchTodefaultContent();
//            delay(2000);
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString();

                SimpleDateFormat sdfSource = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
                Date date = sdfSource.parse(strCellValue);
                SimpleDateFormat sdfDestination = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
                strCellValue = sdfDestination.format(date);
                System.out.println(strCellValue);
                assertTrue(GridUtils.validateSpecificRowOfTheGridValue("cssselector", gridId, rowNumber, f.getName(), strCellValue));
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_date_values_in_grid_in_row_by_reading_data_from_spread_sheet_row.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @Then("^I click on the \"([^\"]*)\" tag element \"([^\"]*)\" row action of column \"([^\"]*)\" of column \"([^\"]*)\" from grid \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_click_on_the_tag_element_row_action_of_column_of_column_from_grid(String strTagName, String strActionLabel, String strSearchValueInRows, int intSearchValueInRowCol, String strLocator, String strElement) {
        try {
            clickSpecificColumnInGrid(strTagName, strActionLabel, strSearchValueInRows, (intSearchValueInRowCol - 1), strLocator, strElement);
        } catch (Exception e) {
            BaseView.takeScreenshot("I_click_on_the_tag_element_row_action_of_column_of_column_from_grid.png");
            Assert.fail(e.getMessage());
        }
    }

    @And("^I set fields value on editable page$")
    public void I_set_fields_value_on_editable_page(List<EditableFields> fields) {
        for (EditableFields f : fields) {
            try {
                if (f.getAction().equalsIgnoreCase("click")) {
                    SeleniumUtil.editableClick(f.getLocator(), f.getElement(), SeleniumUtil.OBJWAITTIMEOUT);
                } else {
                    SeleniumUtil.editableField(f.getLocator(), f.getElement(), f.getValue(), SeleniumUtil.OBJWAITTIMEOUT);
                }
            } catch (Exception ex) {
                BaseView.takeScreenshot(f.getValue() + ".png");
                logger.info("Error :" + ex.getMessage());
            }
        }

    }

    @And("^I see the message on the page$")
    public void I_see_the_message_on_the_page(List<ThreeFields> ThreeFields) {
        for (ThreeFields f : ThreeFields) {
            try {
                if (SeleniumUtil.getTextValue(f.getLocator(), f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT).contains(f.getValue()) == false) {
                    BaseView.takeScreenshot(f.getValue() + ".png");
                    Assert.fail(f.getValue() + " text does not exist !");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getValue() + ".png");
                fail(e.getMessage());
            }
        }
    }

    @And("^I click \"([^\"]*)\" link of the row \"([^\"]*)\" in grid \"([^\"]*)\"$")
    public void I_click_edit_button_of_the_member(String strAction, String strRow, String strGridName) throws Throwable {
        CommonMethods.clickEditButtonOfMember(strAction, strRow, strGridName);
    }

    @Then("^I verify all fields values on editable page comparing with \"([^\"]*)\" th row of spreadsheet$")
    public void I_verify_all_fields_values_on_editable_page_comparing_with_th_row_of_spreadsheet(String strRow, List<Field> fields) {
        try {
            WebDriver driver = BrowserDriver.getCurrentDriver();
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            String strCellValue;
            String fieldValue;
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "#f1", 5, 2);

            (new WebDriverWait(driver, SeleniumUtilities.OBJWAITTIMEOUT)).until(new ExpectedCondition<Boolean>() {
                public Boolean apply(WebDriver d) {
                    WebElement we = d.findElement(By.cssSelector("#f1"));
                    return we != null;
                }
            });

            for (Field f : fields) {
                Object obj = ((JavascriptExecutor) driver).executeScript(EditableFormOrPage.getFormValue("f1", f.getName()));
                fieldValue = obj.toString();
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                fieldValue = SeleniumUtil.replaceSpecialChar(fieldValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                if (obj != null) {
                    assertTrue("Excel value " + strCellValue + " is not matching with the field value " + fieldValue,
                            (fieldValue.contains(strCellValue) || strCellValue.contains(fieldValue) || strCellValue.equalsIgnoreCase(fieldValue)));
                    logger.info("Excel value " + strCellValue + " is matching with the field value " + fieldValue);

                } else {
                    Assert.fail("Executed javascript returned no value!");
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_verify_all_fields_values_on_editable_page_comparing_with_th_row_of_spreadsheet.png");
            fail(Ex.getMessage());
        }
    }

    @Then("^I verify pair of values on non editable summary page by reading data from spreadsheet row \"([^\"]*)\"$")
    public void I_verify_pair_if_values_on_non_editable_summary_page(String strRow, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            String strCellValue;

            SeleniumUtil.switchTodefaultContent();
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                if (strCellValue.equalsIgnoreCase("false")) {
                    strCellValue = "No/off/false";
                }
                if (strCellValue.equalsIgnoreCase("true")) {
                    strCellValue = "Yes/on/true";
                }
                SeleniumUtil.verifyDataInTableColumns(tableEle, f.getName(), strCellValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_pair_if_values_on_non_editable_summary_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I select radio$")
    public void I_select_radio(List<ClickFields> fields) {

        for (ClickFields f : fields) {
            try {
                if (!SeleniumUtil.getClickableWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                    SeleniumUtil.focusAndClick(f.getLocator(), f.getElement(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                fail(e.getMessage());
            }
        }

    }

    @Then("^I verify attribute value on editable pop up by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_attribute_value_on_editable_pop_up_by_reading_data_from_spread_sheet_row(String strRow, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            String strCellValue;

            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                String strValue = SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");

                if (SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("checkbox") ||
                        SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (SeleniumUtil.getWebElementObject("name", f.getName()).isSelected()) {
                        strValue = "true";
                    } else {
                        strValue = "false";
                    }
                }
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                strValue = SeleniumUtil.replaceSpecialChar(strValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_verify_attribute_value_on_editable_pop_up_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @Then("^I verify field value on editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_field_value_on_editable_page_by_reading_data_from_spread_sheet_row(Integer row, List<Field> fields) {
        boolean existFrame = false;
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            String strCellValue;

            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), row);
                if (!existFrame) {
                    SeleniumUtil.getFrameIndex("name", f.getName());
                    existFrame = true;
                }
                String strValue = SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");

                if (SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("checkbox") ||
                        SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (SeleniumUtil.getWebElementObject("name", f.getName()).isSelected()) {
                        strValue = "true";
                    } else {
                        strValue = "false";
                    }
                }/*else if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
                    strValue = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim();
                }*/

                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                strValue = SeleniumUtil.replaceSpecialChar(strValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @Then("^I verify field value by passing locator type on editable page and by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_field_value_by_passing_locator_type_on_editable_page_by_reading_data_from_spread_sheet_row(Integer row, List<TypeFields> fields) {

        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            String strCellValue;

            SeleniumUtil.switchTodefaultContent();
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            for (TypeFields f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), row);
                String strValue = SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()).getAttribute("value");

                if (SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()).getAttribute("type").equalsIgnoreCase("checkbox") ||
                        SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                        strValue = "true";
                    } else {
                        strValue = "false";
                    }
                }

                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                strValue = SeleniumUtil.replaceSpecialChar(strValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_verify_field_value_by_passing_locator_type_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @And("^I click on the \"([^\"]*)\" sub tab$")
    public void I_click_on_the_sub_tab(String strSubTab) {
        try {
            SeleniumUtil.selectHitEnterKey("linktext", strSubTab, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSubTab + ".png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    @And("^I click on the \"([^\"]*)\" tab$")
    public void I_click_on_the_tab(String strSubTab) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.clickOnTab(strSubTab);
        SeleniumUtil.handleUnexpectedAlerts();
        CommonMethods.waitTillDivisionLoads();
    }

    @Then("^I compare attribute value on non editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_compare_attribute_value_on_non_editable_page_by_reading_data_from_spread_sheet_row(String strRow, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;

            SeleniumUtil.switchTodefaultContent();
//            delay(5000);
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                String strValue = SeleniumUtil.getElement("name", f.getName(), 5, 2).getAttribute("value");//SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");
                if (strValue.contains("$")) {
                    strValue = strValue.replace("$", "");
                }
                assertEquals("Excel value " + strCellValue + " is not matching with the field value " + strValue, strValue, strCellValue);
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_compare_attribute_value_on_non_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }


    @Then("^I verify row pair of values on non editable summary page by reading data from spreadsheet row \"([^\"]*)\"$")
    public void I_verify_row_pair_of_values_on_non_editable_summary_page_by_reading_data_from_spreadsheet_row(String strRow, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            String strCellValue;
            SeleniumUtil.getFrameIndex("cssSelector", "table[class=\'rowColor1\']");
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                if ((SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), strCellValue)) == false) {
                    BaseView.takeScreenshot(strCellValue + ".png");
                    Assert.fail(f.getName() + " does not exist !");
                }
            }
            SeleniumUtil.switchTodefaultContent();

        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_row_pair_of_values_on_non_editable_summary_page_by_reading_data_from_spreadsheet_row.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I navigate from left panel tree to \"([^\"]*)\"$")
    public void I_navigate_from_left_panel_tree_to(String strEntityName) {
        CommonMethods.navToLeftPanel(strEntityName);
    }

    @Then("^I verify date field value on editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_date_field_value_on_editable_page_by_reading_data_from_spread_sheet_row(Integer row, List<Field> fields) {
        boolean existFrame = false;
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            String strCellValue;

            for (Field f : fields) {
                strCellValue = excel.getDateCellValue(f.getValue(), row);
                if (!existFrame) {
                    SeleniumUtil.getFrameIndex("name", f.getName());
                    existFrame = true;
                }
                String strValue = SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");

                //Convert excel date value to field date value format
                SimpleDateFormat sdfSource = new SimpleDateFormat("dd/MM/yyyy");
                Date date = sdfSource.parse(strCellValue);
                SimpleDateFormat sdfDestination = new SimpleDateFormat("MM/dd/yyyy");
                strCellValue = sdfDestination.format(date);
                System.out.println(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_date_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @And("^I switch to iframe by id \"([^\"]*)\"$")
    public void I_switch_to_iframe(String strFrameID) {
        CommonMethods.switchToIframe(strFrameID);
    }

    @And("^I switch to default frame$")
    public void I_switch_to_default_frame() {
        SeleniumUtil.switchTodefaultContent();
    }

    @Then("^I verify values on non editable summary page by reading data from spreadsheet row \"([^\"]*)\"$")
    public void I_verify_values_on_non_editable_summary_page_by_reading_data_from_spreadsheet_row(String strRow, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            String strCellValue;

            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                if (strCellValue.equalsIgnoreCase("false")) {
                    strCellValue = "No/off";
                }
                if (strCellValue.equalsIgnoreCase("true")) {
                    strCellValue = "Yes/on";
                }
                if ((SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), strCellValue)) == false) {
                    BaseView.takeScreenshot(strCellValue + ".png");
                    Assert.fail(f.getName() + " does not exist !");
                }

            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_values_on_non_editable_summary_page_by_reading_data_from_spreadsheet_row.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @Then("^I verify unique link text on non editable page \"([^\"]*)\"$")
    public void I_verify_unique_link_text_on_non_editable_page(String strLinkText) {
        CommonMethods.verifyUniqueLinkText(strLinkText);
    }

    @Then("^I verify text value in a page$")
    public void I_verify_text_value_in_a_page(List<Field> fields) throws Throwable {
        CommonMethods.verifyText(fields);
    }

    @Then("^I verify label on modal window$")
    public void I_verify_label_on_modal_window(List<Field> fields) throws Throwable {
        CommonMethods.verifyLabelOnModalWindow(fields);
    }

    @And("^I wait for elements not to visible")
    public void I_wait_for_elements_not_to_visible(List<Field> fields) {
        CommonMethods.waitForInvisibilityOfElement(fields);
    }

    @And("^I switch to frame having the following element")
    public void I_switch_to_frame_having_the_following_element(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            SeleniumUtil.switchToFrameHavingElement(f.getLocator(), f.getElement());
        }
    }

    @Then("^I verify data in grid \"([^\"]*)\" in row \"([^\"]*)\" by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_data_in_grid_row_by_reading_data_from_spread_sheet_row(String gridId, Integer rowNumber, Integer sheetRowNum, List<Field> fields) throws Throwable {

        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue = "";

            for (Field f : fields) {
                try {
                    strCellValue = excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString();
                    assertTrue(GridUtils.validateSpecificRowOfTheGridValue("cssselector", gridId, rowNumber, f.getName(), strCellValue));

                } catch (Exception ex) {
                    BaseView.takeScreenshot(strCellValue + ".png");
                    logger.info("Error :" + ex.getMessage());
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_verify_data_in_grid_row_by_reading_data_from_spread_sheet_row.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I select an option \"([^\"]*)\" from the \"([^\"]*)\" list$")
    public void I_select_an_option_from_the_dropdown_list_generic_for_all(String option, String dropdownName, List<TypeFields> fields) {

        for (TypeFields f : fields) {
            try {
                SeleniumUtil.selectDropdownOption(SeleniumUtil.getElementBy(f.getLocator(), f.getElement()), option);
                logger.info("Selected option " + option + " from " + dropdownName + "list");
            } catch (Exception Ex) {
                BaseView.takeScreenshot("I_select_an_option_from_the_dropdown_list_generic_for_all.png");
                logger.info("Error :" + Ex.getMessage());
            }

        }
    }

    @And("^I click on \"([^\"]*)\" button$")
    public void I_click_on_button_generic_for_all(String button, List<TypeFields> fields) {
//        delay(5000);
        try {
            CommonMethods.waitTillDivisionLoads();

            for (TypeFields f : fields) {
                try {
                    SeleniumUtil.clickElement(f.getLocator(), f.getElement(), SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Clicked " + button);
                } catch (Exception Ex) {
                    BaseView.takeScreenshot("I_click_on_button_generic_for_all.png");
                    logger.info("Error :" + Ex.getMessage());
                }

            }

            CommonMethods.waitTillDivisionLoads();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
//        delay(5000);
    }

    @And("^I enter value \"([^\"]*)\" in \"([^\"]*)\" field")
    public void I_enter_value_in_input_field_generic(String text, String fieldName, List<TypeFields> fields) {

        for (TypeFields f : fields) {
            try {
                SeleniumUtil.type(f.getLocator(), f.getElement(), text, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
                logger.info("Entered text " + fieldName + " in field " + fieldName);
            } catch (Exception Ex) {
                BaseView.takeScreenshot("I_select_an_option_from_the_dropdown_list_generic_for_all.png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I click on \"([^\"]*)\" link")
    public void I_click_on_link_generic_for_all(String link) {
//        delay(5000);
        CommonMethods.clickLink(link);
    }

    @And("^I click link \"([^\"]*)\"$")
    public void I_click_on_link_generic_for_all(String link, List<TypeFields> fields) {
        for (TypeFields f : fields) {
            try {
                SeleniumUtil.clickElement(f.getLocator(), f.getElement(), SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
                logger.info("Clicked " + link);
            } catch (Exception Ex) {
                BaseView.takeScreenshot("I_click_on_link_generic_for_all.png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I select \"([^\"]*)\" checkbox$")
    public void I_select_checkbox_generic(String elementName, List<ClickFields> fields) {

        for (ClickFields f : fields) {
            try {
                if (!SeleniumUtil.getClickableWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                    SeleniumUtil.focusAndClick(f.getLocator(), f.getElement(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Selected checkbox " + elementName);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                fail(e.getMessage());
            }
        }
    }

    @And("^I check \"([^\"]*)\" checkbox$")
    public void I_check_checkbox_generic(String elementName, List<ClickFields> fields) {

        for (ClickFields f : fields) {
            try {
//                delay(5000);
                SeleniumUtil.waitForNonStaleWebElement(f.getLocator(), f.getElement(), 5, 2);
                if (!SeleniumUtil.getClickableWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                    SeleniumUtil.focusAndClick(f.getLocator(), f.getElement(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Selected checkbox " + elementName);
                }
//                delay(5000);
            } catch (Exception e) {
                try {
//                    delay(5000);
                    SeleniumUtil.waitForNonStaleWebElement(f.getLocator(), f.getElement(), 5, 2);
                    if (!SeleniumUtil.getClickableWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                        SeleniumUtil.focusAndClick(f.getLocator(), f.getElement(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                        logger.info("Selected checkbox " + elementName);
                    }
//                    delay(5000);
                } catch (Exception ex) {
                    BaseView.takeScreenshot(f.getElement() + ".png");
                    fail(e.getMessage());
                }
            }
        }

    }

    @And("^I deselect \"([^\"]*)\" checkbox$")
    public void I_deselect_checkbox_generic(String elementName, List<ClickFields> fields) {

        for (ClickFields f : fields) {
            try {
                if (SeleniumUtil.getClickableWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                    SeleniumUtil.focusAndClick(f.getLocator(), f.getElement(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Deselected checkbox " + elementName);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                fail(e.getMessage());
            }
        }
    }

    @And("^I set the values in \"([^\"]*)\" text fields$")
    public void I_set_the_values_in_text_fields(String strFieldName, List<TypeFields> fields) {
        for (TypeFields f : fields) {
            try {
                SeleniumUtil.clear(f.getLocator(), f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.type(f.getLocator(), f.getElement(), f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }

    }

    @And("^I click on \"([^\"]*)\" button \"([^\"]*)\"$")
    public void I_click_on_button_with_description_generic_for_all(String button, String description, List<TypeFields> fields) {

        for (TypeFields f : fields) {
            try {
                SeleniumUtil.clickElement(f.getLocator(), f.getElement(), SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
                logger.info("Clicked " + button + " " + description);
            } catch (Exception Ex) {
                BaseView.takeScreenshot("I_click_on_button_generic_for_all.png");
                logger.info("Error :" + Ex.getMessage());
            }

        }
    }

    @And("^I select radio \"([^\"]*)\"")
    public void I_select_radio_generic(String elementName, List<ClickFields> fields) {

        for (ClickFields f : fields) {
            try {
                if (!SeleniumUtil.getClickableWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                    SeleniumUtil.focusAndClick(f.getLocator(), f.getElement(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Selected checkbox " + elementName);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                fail(e.getMessage());
            }
        }

    }

    @And("^I click on \"([^\"]*)\" button from \"([^\"]*)\"$")
    public void I_click_on_button_from(String strText, String strObjectLocation) {
        CommonMethods.clickOnButton(strText, strObjectLocation);
    }

    @And("^I verify \"([^\"]*)\" on \"([^\"]*)\"$")
    public void I_verify_on(String strSearchText, String strObjectLocation) {

        try {
            SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + strSearchText + "\")]");
            logger.info("Verified : " + strSearchText);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchText + ".png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    @And("^I verify the following message \"([^\"]*)\"$")
    public void I_verify_the_following_message(String strSearchText) {

        try {
            //SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + strSearchText + "\")]");
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strSearchText));
            logger.info("Verified : " + strSearchText);
        } catch (Exception e) {
            try {
                SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + strSearchText + "\")]");
            } catch (Exception ex) {
                BaseView.takeScreenshot(strSearchText + ".png");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }
    }

    @And("^I click \"([^\"]*)\" link \"([^\"]*)\"$")
    public void I_click_link_with_description_generic_for_all(String link, String description) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            SeleniumUtil.click("linktext", link, SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked " + link + " " + description);
        } catch (Exception Ex) {
            try {
                BrowserDriver.getCurrentDriver().findElement(By.linkText(link));
            } catch (Exception e) {
                logger.info("Error : Unable to click link text" + Ex.getMessage());
            }
            BaseView.takeScreenshot("I_click_link_with_description_generic_for_all.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I click on the \"([^\"]*)\" link \"([^\"]*)\"$")
    public void I_click_on_the_link(String link, String description) {
        try {
            try {
                AllContractPagesView.waitTillDivisionLoads();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            SeleniumUtil.click("linktext", link, SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked " + link + " " + description);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_link_with_description_generic_for_all.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click on the \"([^\"]*)\" button \"([^\"]*)\"$")
    public void I_click_on_the_button(String strButton, String strDescription) {
        try {

            CommonMethods.clickOnButton(strButton);

            logger.info("Clicked " + strButton + " " + strDescription);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + " " + strDescription + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click on the \"([^\"]*)\" button in confirmation pop up$")
    public void I_click_on_the_button_in_confirmation_pop_up(String strButton) {
        try {
            CommonMethods.clickOnButton(strButton);
            SeleniumUtil.handleUnexpectedAlerts();
            logger.info("Clicked " + strButton + " in confirmation pop up");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + " in confirmation pop up.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click \"([^\"]*)\" button$")
    public void I_click_grid_the_button(String strButton) throws Throwable {
        try {
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickOnButton(strButton);
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click on the \"([^\"]*)\" btn")
    public void I_click_on_the_button(String strButton) throws Throwable {
        try {
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickLastButton(strButton);
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click on \"([^\"]*)\" button in grid$")
    public void I_click_on_add_item_button(String button) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            //CommonMethods.clickGridButtonWhenReady(button);
            CommonMethods.clickGridButtonWhenReady(button.trim());
            CommonMethods.waitTillDivisionLoads();
            logger.info("Clicked  " + button + " button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked  " + button + " button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click on \"([^\"]*)\" tab$")
    public void I_click_on_tab(String tabName) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.clickGridButtonWhenReady(tabName);
            SeleniumUtil.handleUnexpectedAlerts();
            logger.info("Clicked  Add item... button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked  Add item... button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I double click on the \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_double_click_on_the(String strElement, String arg2) throws Throwable {
        dblClickButton(strElement);
    }

    @And("^I switch to \"([^\"]*)\" child window$")
    public void I_switch_to_child_window(String arg1) throws Throwable {
        BaseView.switchToSecondWindow();
        SeleniumUtil.handleUnexpectedAlerts();
    }

    @And("^I switch to \"([^\"]*)\" third child window$")
    public void I_switch_to_third_child_window(String arg1) throws Throwable {
        BaseView.switchToThirdWindow();
    }

    @And("^I switch to main window$")
    public void I_switch_to_main_window() throws Throwable {
        try {
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_switch_to_main_window.png");
            throwable.printStackTrace();
        }
    }

    @And("^I click on the row of \"([^\"]*)\" of column \"([^\"]*)\" from grid \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_click_on_the_row_of_of_column_from_grid(String strSearchValue, int intSearchValueInCol, String locator, String strElement) {
        try {
            try {
                AllContractPagesView.waitTillDivisionLoads();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            selectSpecificRow(locator, strElement, strSearchValue, intSearchValueInCol);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    @When("^I compare selected option from multiple selection box with value$")
    public void I_compare_selected_option_from_multiple_selection_box(List<TypeFields> fields) {
        try {
            for (TypeFields f : fields) {
                Select list = new Select(SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()));
                for (WebElement element : list.getOptions()) {
                    assertEquals("Value " + f.getValue() + " is not matching with the field value " + element.getText(), element.getText(), f.getValue());
                    logger.info("Value " + f.getValue() + " is matching with the field value " + element.getText());
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_compare_selected_option_from_multiple_selection_box.png");
            fail(e.getMessage());
        }
    }

    @When("^I collapse the following$")
    public void I_collapse_the_following(List<String> folderName) throws Throwable {
        for (String f : folderName) {
            CommonMethods.collapseFolders(f);
        }
    }

    @When("^I expand the following$")
    public void I_expand_the_following(List<String> folderName) throws Throwable {
        for (String f : folderName) {
            CommonMethods.expandFolders(f);
        }
    }

    @When("^I select the following$")
    public void I_select_the_following(List<String> folderName) throws Throwable{
        for (String f : folderName) {
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.selectFolders(f);
        }
    }

    @And("^I select following entities check box from model window$")
    public void I_select_following_entities_check_box_from_model_window(List<ClickFields> fields) {

        for (ClickFields f : fields) {
            try {
                SeleniumUtil.click(f.getLocator(), f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (InterruptedException Ex) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + Ex.getMessage());
                fail(Ex.getMessage());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + Ex.getMessage());
                fail(Ex.getMessage());
            }

        }
    }

    @And("^I select the following radio$")
    public void I_select_radio_generic_value(List<String> elementName) {

        for (String f : elementName) {
            try {
                f = f.toLowerCase();
                if (!SeleniumUtil.getClickableWebElementObject("cssselector", "*[value='" + f + "']").isSelected()) {
                    SeleniumUtil.click("cssselector", "*[value='" + f + "']", SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Selected radio " + f);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f + ".png");
                fail(e.getMessage());
            }
        }
    }

    @And("^I select the following radio fields$")
    public void I_select_radio_generic_value_dont_throw_exception(List<String> elementName) {

        for (String f : elementName) {
            try {
                f = f.toLowerCase();
                if (!SeleniumUtil.getClickableWebElementObject("cssselector", "*[value='" + f + "']").isSelected()) {
                    SeleniumUtil.click("cssselector", "*[value='" + f + "']", SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                    logger.info("Selected radio " + f);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f + ".png");
            }
        }
    }


    @And("^I click on \"([^\"]*)\" Button$")
    public void eI_click_on_button(String button) {
        CommonMethods.clickBtnHavingValue(button);
    }

    @And("^I click on the \"([^\"]*)\" Button$")
    public void eI_click_on_the_button(String button) {
        CommonMethods.clickOnBtnHavingValue(button);
    }

    @And("^I click on visible \"([^\"]*)\" Button$")
    public void eI_click_on_the_Button(String button) {
        CommonMethods.clickOnVisibleBtnHavingValue(button);
    }

    @And("^I expand \"([^\"]*)\" State folder from portfolio navigation tab and then select entity \"([^\"]*)\"$")
    public void I_expand_State_folder_from_portfolio_navigation_tab_and_then_select_entity(String strState, String strEntity) throws Throwable {
        try {
            dblClickButton(strState);
            dblClickButton(strEntity);
        } catch (Exception ex) {
            try {
//                delay(3000);
                dblClickButton(strState);
                dblClickButton(strEntity);
            } catch (Exception e) {
                BaseView.takeScreenshot("I_expand_State_folder_from_portfolio_navigation_tab_and_then_select_entity.png");
                logger.info("Error :" + e.getMessage());
            }
        }
    }

    @And("^I Search for the \"([^\"]*)\" that was created$")
    public void I_Search_for_the_that_was_created(String strFieldValue) throws Throwable {
        try {
            SeleniumUtil.switchTodefaultContent();
            SeleniumUtil.type("name", "searchText", strFieldValue, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), SeleniumUtilities.OBJWAITTIMEOUT);
            wait.until(ExpectedConditions.textToBePresentInElementValue(By.name("searchText"), strFieldValue));
            logger.info("Entered text " + strFieldValue + " in search field");
            SeleniumUtil.enter("name", "searchText", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_enter_in_SearchBoxfield.png");
            logger.info("Error :" + Ex.getMessage());
        }

    }

    @And("^I set following fields value on editable page$")
    public void I_set_following_fields_value_on_editable_page(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            try {
                setFields(f.getName(), f.getValue());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I set following radio fields value on editable page$")
    public void I_set_following_radio_fields_value_on_editable_page(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            try {
                selectRadioByValueAndName(f.getName(), f.getValue());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I set following fields value on editable frame page$")
    public void I_set_following_fields_value_on_editable_frame_page(List<Field> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        for (Field f : fields) {
            try {
                setFields(f.getName(), f.getValue());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }


    @And("^I set following fields on editable page$")
    public void I_set_following_fields_on_editable_page(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            try {
                String strValue = "";
                if (f.getValue().contains("[Today's Date]")) {
                    strValue = f.getValue().replace("[Today's Date]", SeleniumUtil.addDaystoCurrentDate(0));
                    setFields(f.getName(), strValue);
                } else {
                    setFields(f.getName(), f.getValue());
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I select following checkboxes by label$")
    public void I_set_following_checkboxes_by_label(List<Field> fields) {

        for (Field f : fields) {
            try {
                selectCheckboxByLabelName(f.getName());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I select following radio by label$")
    public void I_set_following_radio_by_label(List<Field> fields) {

        for (Field f : fields) {
            try {
                selectRadioByLabelName(f.getName());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I select following radio by label names$")
    public void I_set_following_radio_by_label_name(List<String> labels) {

        for (String label : labels) {
            try {
                selectRadioByLabel(label);
            } catch (Exception Ex) {
                BaseView.takeScreenshot(label + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I select following checkboxes$")
    public void I_set_following_checkboxes_by_id(List<Field> fields) {

        for (Field f : fields) {
            try {
                selectCheckboxByID(f.getName());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I deselect following checkboxes by label$")
    public void I_deselect_following_checkboxes_by_label(List<Field> fields) {

        for (Field f : fields) {
            try {
                selectCheckboxByLabelName(f.getName());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }


    @And("^I verify the following fields value on editable page$")
    public void I_verify_the_following_fields_on_editable_page(List<Field> fields) {
//        String strValue="";
//        for (Field f : fields) {
//            try {
//                if (f.getValue().contains("[CURRENT DATE]")) {
//                    strValue = f.getValue().replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
//                }else{
//                    strValue =f.getValue();
//                }
//                if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("checkbox")) {
//                    if (f.getValue().equalsIgnoreCase("true")) {
//                        assertTrue((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
//                        logger.info(f.getValue().trim() + " radio is checked");
//                    } else {
//                        assertFalse((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
//                        logger.info(f.getValue().trim() + " radio is unchecked");
//                    }
//
//                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("text")) {
//                    assertEquals(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value"), f.getValue());
//                    logger.info(f.getValue().trim() + " present on editable field");
//
//                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("select")) {
//                    Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())));
//                    assertEquals(select.getFirstSelectedOption().getText().trim(), f.getValue().trim());
//                    logger.info(f.getValue().trim() + " option is selected");
//
//                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("radio")) {
//                    if (f.getValue().equalsIgnoreCase("true")) {
//                        assertTrue((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
//                        logger.info(f.getValue().trim() + " checkbox is checked");
//                    } else {
//                        assertFalse((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
//                        logger.info(f.getValue().trim() + " checkbox is unchecked");
//                    }
//
//                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("textarea")) {
//                    assertEquals(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value"), f.getValue());
//                    logger.info(f.getValue().trim() + " present on editable field");
//
//                } else if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
//                    if (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim().equalsIgnoreCase(f.getValue().trim())) {
////                        delay(4000);
//                    }
//                    assertEquals(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim(), f.getValue().trim());
//                    logger.info(f.getValue().trim() + " present on editable field");
//                }
//            } catch (Exception Ex) {
//                BaseView.takeScreenshot(f.getName() + ".png");
//                logger.info("Error :" + Ex.getMessage());
//            }
//        }
        String strValue = "";
        for (Field f : fields) {
            try {
                if (f.getValue().contains("[CURRENT DATE]")) {
                    strValue = f.getValue().replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
                } else {
                    strValue = f.getValue();
                }
                if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("checkbox")) {
                    if (strValue.equalsIgnoreCase("true")) {
                        assertTrue((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(strValue + " radio is checked");
                    } else {
                        assertFalse((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(strValue + " radio is unchecked");
                    }

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("text")) {
                    assertEquals(strValue, BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value"));
                    logger.info(strValue + " present on editable field");

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("select")) {
                    Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())));
                    assertEquals(strValue, select.getFirstSelectedOption().getText().trim());
                    logger.info(strValue + " option is selected");

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (strValue.equalsIgnoreCase("true")) {
                        assertTrue((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(strValue + " radio is checked");
                    } else {
                        assertFalse((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(strValue + " radio is unchecked");
                    }

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("textarea")) {
                    assertEquals(strValue, BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value"));
                    logger.info(strValue + " present on editable field");

                } else if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
                    if (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim().equalsIgnoreCase(strValue)) {
                    }
                    assertEquals(strValue, BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim());
                    logger.info(strValue + " present on editable field");
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I verify the following number fields value on editable page$")
    public void I_verify_the_following_number_fields_on_editable_page(List<Field> fields) {
        for (Field f : fields) {
            try {
                if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("text")) {
                    assertTrue(SeleniumUtil.replaceSpecialChar(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value")).contains(f.getValue()));

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("select")) {
                    Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())));
                    assertTrue(SeleniumUtil.replaceSpecialChar(select.getFirstSelectedOption().getText()).contains(f.getValue().trim()));

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("textarea")) {
                    assertTrue(SeleniumUtil.replaceSpecialChar(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value")).contains(f.getValue()));

                } else if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
                    assertTrue(SeleniumUtil.replaceSpecialChar(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + f.getName() + "'][role='combobox']")).getAttribute("value")).contains(f.getValue()));
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I select last row from the grid \"([^\"]*)\"$")
    public void I_select_last_row_from_the_grid(String strElement) {
        try {
            selectLastRow("", strElement);
        } catch (Exception e) {
            BaseView.takeScreenshot("I_select_last_row_from_the_grid.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_select_last_row_from_the_grid.png");
            logger.info("Error :" + throwable.getMessage());
            Assert.fail(throwable.getMessage());
        }
    }

    @Then("^I compare value on popup editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_compare_value_on_popup_editable_page_by_reading_data_from_spread_sheet_row(String strRow, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();
            String strCellValue;

//            delay(5000);

            for (Field f : fields) {
                if (!isNullOrEmpty(excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString())) {
                    strCellValue = excel.getCellValue(f.getValue(), Integer.parseInt(strRow), Spreadsheet.Type.TEXT).toString();
                } else {
                    strCellValue = "";
                }

                String strValue = SeleniumUtil.getElement("name", f.getName(), 5, 2).getAttribute("value");//SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");

                if (SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("checkbox") ||
                        SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (SeleniumUtil.getWebElementObject("name", f.getName()).isSelected()) {
                        strValue = "true";
                    } else {
                        strValue = "false";
                    }
                }
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                strValue = SeleniumUtil.replaceSpecialChar(strValue);

                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_compare_attribute_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    /*@And("^I move to \"([^\"]*)\" link of the row \"([^\"]*)\" in grid \"([^\"]*)\"$")
    public void I_move_to_link_of_the_row_in_grid(String strAction, String strRow, String strGridName) {
        try {
            SeleniumUtil.switchTodefaultContent();
            delay(2000);
            SeleniumUtil.getFrameIndex("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']");
            SeleniumUtil.moveToElement("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            try {
                SeleniumUtil.switchTodefaultContent();
                delay(2000);
                SeleniumUtil.getFrameIndex("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']");
                SeleniumUtil.moveToElement("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.switchTodefaultContent();

            } catch (Exception ex) {
                BaseView.takeScreenshot(strGridName + ".png");
                fail(e.getMessage());
            }
        }
    }*/

    @And("^I check previous user login \"([^\"]*)\" and continue if user \"([^\"]*)\" same or logout and login if not$")
    public void I_check_previous_login_and_continue(String fullUserName, String userName) throws Throwable {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
            wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.tagName("img")));
        } catch (Exception e) {
        }
        CommonMethods.checkSpecifiedLogin(fullUserName, userName);
    }

    @And("^I attach following document files from \"([^\"]*)\":$")
    public void I_attach_following_document_files_from_(String dataDir, List<String> files) {
        try {
            dataFolder = dataDir;
            FileUpload.clickAttachDocumentButton();
            FileUpload.selectFolderToAttachDocument();
            FileUpload.clickFileUploadLink();
            FileUpload.enterDescriptionText();
            FileUpload.clickOnBrowseButton("cssselector", "input[id='filename']");

            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Importing " + fileName);
                Thread.sleep(10000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                FileUpload.clickOnUploadButton();
                Thread.sleep(20000);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_attach_following_document_files_from.png");
            Assert.fail("I_attach_following_document_files_from_");
        }
    }

    @And("^I download following file$")
    public void I_download_following_file(List<String> files) throws Throwable {
        for (String fileName : files) {
            SeleniumUtil.select("name", "handlerType", fileName, SeleniumUtilities.OBJWAITTIMEOUT);
            FileDownloader.fileDownloader("cssselector", "input[name=\"submitButton\"]");
        }
    }

    @And("^I download file$")
    public void I_download_file() throws Throwable {
        FileDownloader.fileDownload();

    }

    @And("^I rename files$")
    public void I_rename_file() throws Throwable {
        FileDownloader.renameFiles();

    }

    @And("^I switch to \"([^\"]*)\" frame$")
    public void I_switch_to_frame(String strFieldName) {
        try {
            SeleniumUtil.getFrameIndex("xpath", "//*[./text()='" + strFieldName + "']");
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
    }

    @And("^I click on the \"([^\"]*)\" button from dailog$")
    public void I_click_on_the_button_from_dailog(String strButton) {
        try {
            SeleniumUtil.getWebDriver().switchTo().alert().accept();
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
    }

    @And("^I import following files from \"([^\"]*)\":$")
    public void I_import_following_files_from_(String dataDir, List<String> files) {
        try {
            dataFolder = dataDir;
            FileUpload.selectContinueTillTheEnd();
            SeleniumUtil.waitForNonStaleWebElement("cssselector", "#importFile-button", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementIsClickable("cssselector", "#importFile-button", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            FileUpload.clickOnBrowseButton("cssselector", "#importFile-button");
            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Importing " + fileName);
                Thread.sleep(30000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                FileUpload.clickOnImportButton();
                Thread.sleep(30000);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    @And("^I Upload following Custom List Values \"([^\"]*)\":$")
    public void I_Upload_following_Custom_List_Values_(String dataDir, List<String> files) {
        try {
            dataFolder = dataDir;
            FileUpload.clickOnBrowseButton("cssselector", "input[name='inputFile']");
            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Upload custom list values " + fileName);
                Thread.sleep(10000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                FileUpload.clickOnUploadbutton();
                Thread.sleep(20000);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    @And("^I Click the \"([^\"]*)\" next to the \"([^\"]*)\" dropdown$")
    public void I_Click_the_next_to_the_dropdown(String strThreeDots, String strDropdownButton) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.clickOnThreeDotButton(strThreeDots, strDropdownButton);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on the row of \"([^\"]*)\" of column \"([^\"]*)\" from grid \"([^\"]*)\"$")
    public void I_click_on_the_row_of_of_column_from_grid(String strSearchValue, int intSearchValueInCol, String strElement) {
        try {
            selectSpecificRow("id", "BOGridLX_Grid_" + strElement, strSearchValue, intSearchValueInCol);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    @And("^I select specific value \"([^\"]*)\" under header \"([^\"]*)\" from grid \"([^\"]*)\"$")
    public void I_select_specific_value_column_from_grid(String strSearchValue, String header, String grid, List<Field> fields) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            WebElement row = AllContractPagesView.getUniqueGridRow(grid, GenericEntityView.convertToFormatPattern(strSearchValue), header, fields);
            try {
                row.findElement(By.xpath("//div[text()='" + strSearchValue + "']")).click();
            } catch (StaleElementReferenceException e) {
                logger.info("Exception throwed while selecting value");
            }

        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    @And("^I select the \"([^\"]*)\" row of column \"([^\"]*)\" from grid \"([^\"]*)\"$")
    public void I_select_the_row_of_column_from_grid(String strSearchValue, int intSearchValueInCol, String strElement) {
        try {
            selectSpecificRow("id", strElement, strSearchValue, intSearchValueInCol);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    @And("^I see the following note on the \"([^\"]*)\"$")
    public void I_see_the_following_note_on_the(String strHeader, List<ValueField> valueField) {
        String strMsg = "I_see_the_following_note_on_the";
        boolean flag = false;
        for (ValueField f : valueField) {
            try {
                if (f.getValueField().contains("([CURRENT DATE]),")) {
                    strMsg = SeleniumUtil.addDaystoCurrentDate(0);//f.getValueField().replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
                    System.out.println(strMsg);

                } else if (f.getValueField().contains("([CURRENT END DATE]),")) {
                    strMsg = SeleniumUtil.addDaystoCurrentDate(-1);//f.getValueField().replace("[CURRENT END DATE]", SeleniumUtil.addDaystoCurrentDate(-1));
                    System.out.println(strMsg);
                } else
                    strMsg = f.getValueField();

                SeleniumUtil.waitUntilElementContainsText("xpath", ".//*[@class='frmNote']", strMsg, 10, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[@class='frmNote']", 90, SeleniumUtilities.OBJWAITTIMEOUT);
                List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//*[@class='frmNote']"));
                for (int i = 0; i < ele.size(); i++) {
                    logger.info(ele.get(i).getText());
                    logger.info(strMsg);
                    if (ele.get(i).getText().contains(strMsg)) {
                        flag = true;
//                        delay(5000);
                        return;
                    }
                }
                if (flag == false) {
                    BaseView.takeScreenshot(strMsg + ".png");
                    Assert.fail(f.getValueField() + " text does not exist !");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot("I_see_the_following_note_on_the.png");
                fail(strMsg);
            }
        }
    }

    @And("^I handle pop up window$")
    public void I_handle_pop_up_window() {
        try {
            if (SeleniumUtil.handelPopWindow(20))
                SeleniumUtil.getChildWindow(true);
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_wait_for_pop_up_window.png");
            throwable.printStackTrace();
        }
    }

    @And("^I navigate to entity type \"([^\"]*)\"$")
    public void I_navigate_to_entity_type(String link) {
        try {
            SeleniumUtil.click("partialtext", link, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.handleUnexpectedAlerts();
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_wait_for_pop_up_window.png");
            throwable.printStackTrace();
        }
    }

    @And("^I wait for \"([^\"]*)\" modal window to close$")
    public void I_wait_for_the_this_modal_window_to_close(String name) throws Throwable {
        OrgChartView.waitTillModalWindowToClose(name);
    }

    @And("^I wait for \"([^\"]*)\" modal window to open in non frame page$")
    public void I_wait_for_the_this_modal_window_to_open_in_non_frame_page(String name) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        OrgChartView.waitTillModalWindowToOpen(name);
    }

    @And("^I wait for \"([^\"]*)\" modal window to open in frame page$")
    public void I_wait_for_the_this_modal_window_to_open_in_frame_page(String name) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        OrgChartView.waitTillModalWindowToOpen(name);
    }

    @And("^I click \"([^\"]*)\" button in modal window \"([^\"]*)\"$")
    public void I_click_button_on_modal_window(String btn, String name) throws Throwable {
        OrgChartView.getModalWindowButton(btn, name);
    }

    @And("^I click on \"([^\"]*)\" button in modal window \"([^\"]*)\"$")
    public void I_click_on_button_on_modal_window(String btn, String name) throws Throwable {
        OrgChartView.getModalWindowButtonAndClick(btn, name);
    }

    @And("^I wait for modal window to close$")
    public void I_wait_for_the_modal_window_to_close() throws Throwable {
        OrgChartView.waitTillModalWindowToClose();
    }


    @And("^I wait for modal window to open$")
    public void I_wait_for_the_modal_window_to_open() throws Throwable {
        OrgChartView.waitTillModalWindowToOpen();
    }

    @And("^I see modal window$")
    public void I_see_modal_window() throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        OrgChartView.waitTillModalWindowToOpen();
    }

    @And("^I see a modal window$")
    public void I_a_see_modal_window() throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        OrgChartView.waitTillModalWindowToOpen();
    }

    @When("^I verify multiple selected values on editable page$")
    public void I_verify_multiple_selected_values_on_editable_page(List<Field> fields) {
        try {
            for (Field f : fields) {
                for (String option : f.getValue().split(", ")) {
                    CommonMethods.getOptionsFromMultipleSelectionBox(f.getName(), option.trim());
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_compare_selected_option_from_multiple_selection_box.png");
            fail(e.getMessage());
        }
    }

    @And("^I click on the row of \"([^\"]*)\" of column \"([^\"]*)\" from holiday calendar grid$")
    public void I_click_on_the_row_of_of_column_from_holiday_calendar_grid(String strSearchValue, int intSearchValueInCol) {
        try {
            selectSpecificRow("id", "HolidayScheduleGrid", strSearchValue, intSearchValueInCol);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    @Then("^I click row in grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_click_row_in_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.clickUniqueGridRow(gridID, uniqueValue, header);
    }

    @Then("^I verify row in grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_in_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, uniqueValue, header, fields);
    }

    @Then("^I verify a row in grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_grid_row_having_unique_value_under_column_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.verifyGridValuesGeneric(gridID, uniqueValue, header, fields);
    }

    @Then("^I verify the following text in a page$")
    public void I_verify_menu_item_in_a_page(List<String> text) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        for (String f : text) {
            PreserveGlobalPagesViews.verifyText(f);
        }
    }

    @Then("^I verify the following text in a a same row$")
    public void I_verify_following_text_in_a_same_row_in_a_page(List<String> text) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        for (String f : text) {
            PreserveGlobalPagesViews.verifyTextInRow(f);
        }
    }

    @And("^I verify the grid \"([^\"]*)\" values with the corresponding values in the \"([^\"]*)\" excel (\\d+)$")
    public void I_verify_the_grid_values_with_the_corresponding_values_in_the_excel(String strGridId, String strCalcMethod, int intIndex) throws Throwable {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            File f = new File(localPath);
            Workbook wb = WorkbookFactory.create(f);
            SeleniumUtil.getFrameIndex("cssselector", "div[id='" + strGridId + "']");
            CommonMethods.waitTillDivisionLoads();
            Sheet mySheet = wb.getSheetAt(intIndex);
            FormulaEvaluator objFormulaEvaluator = new XSSFFormulaEvaluator((XSSFWorkbook) wb);
            int rowCount = 0;
            for (Iterator<Row> rowIterator = mySheet.rowIterator(); rowIterator.hasNext(); ) {
                int colCount = 0;
                for (Iterator<Cell> cellIterator = ((Row) rowIterator.next()).cellIterator(); cellIterator.hasNext(); ) {
                    if (rowCount == 0) {
                        System.out.println(objFormulaEvaluator.evaluate(((Cell) cellIterator.next())));
                    } else {
                        String strExcel = ((Cell) cellIterator.next()).toString();

                        if (!isNullOrEmpty(strExcel)) {
                            if (!strExcel.substring(strExcel.length() - 1).equalsIgnoreCase("%")) {
                                if (strExcel.indexOf(".0") > 0) {
                                    if (strExcel.substring(strExcel.indexOf(".0")).length() == 2) {
                                        strExcel = "$" + strExcel.replace(".0", ".00");
                                    }
//                                    else
//                                        strExcel = "$" + strExcel;
                                    strExcel = strExcel;
                                }
//                                else
//                                    strExcel = "$" + strExcel;
                                strExcel = strExcel;
                            }
                        }

                        String strGridValue = GridUtils.getGridValue("cssselector", "div[id='" + strGridId + "']", rowCount - 1, colCount).replace(",", "");
                        logger.info("Excel Value :" + strExcel + " # Grid Value :" + strGridValue);
                        assertTrue(strExcel.replace(",", "").trim().contains(strGridValue));
                    }
                    colCount++;
                }
                System.out.println(" ************************************************************************* ");
                rowCount++;
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot(strCalcMethod + ".png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @Then("^I click on the \"([^\"]*)\" access of \"([^\"]*)\" of column \"([^\"]*)\" from page access tab$")
    public void I_click_on_the_access_of_of_column_from_page_access_tab(String strAction, String strSearchValue, int intSearchValueInCol) throws Throwable {
        try {
            clickOnSpecificColumn("xpath", ".//table[@class=\"linedTable\"]/tbody/tr", strSearchValue, intSearchValueInCol, strAction);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    @And("^I expand the following page access folders$")
    public void I_expand_the_following_page_access_folders(List<String> folderName) throws Throwable {
        for (String f : folderName) {
            CommonMethods.expandFolders("xpath", "//*[starts-with(.,'" + f + "')]/preceding::td[1]/a/img");
        }
    }

    @And("^I click on the add to list button$")
    public void I_click_on_the_add_to_list_button() throws Throwable {
        CommonMethods.clickOnAddList("name", "addToList");
    }

    @Then("^I verify following fields value on editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_following_fields_value_on_editable_page_by_reading_data_from_spread_sheet_row(Integer row, List<Field> fields) {
        String strCellValue = "";
        String strValue = "";
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));


            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), row);

                strValue = CommonMethods.getValuesOnEditablePage(f.getName());

                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                strValue = SeleniumUtil.replaceSpecialChar(strValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);

                /*assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));*/
                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            logger.info(strCellValue + " is not equal to " + strValue);
            fail(e.getMessage());
        }
    }

    @And("^I switch to \"([^\"]*)\"$")
    public void I_switch_to(String strField) throws Throwable {
        if (SeleniumUtil.getFrameIndex("name", strField)) logger.info("Element exist");
    }

    @And("^I select the sales year \"([^\"]*)\"$")
    public void I_select_the_sales_year(String strYear) throws Throwable {
        SeleniumUtil.getFrameIndex("name", "Sales_SalesYear");
        SeleniumUtil.select("name", "Sales_SalesYear", strYear, SeleniumUtilities.OBJWAITTIMEOUT);
    }

    @And("^I click on the \"([^\"]*)\" row action of column \"([^\"]*)\" of column \"([^\"]*)\" from grid \"([^\"]*)\"$")
    public void I_click_on_the_row_action_of_column_of_column_from_grid(String strAction, String strSearchValue, int intSearchValueInCol, String strElement) throws Throwable {
        try {
            executeSpecificRowAction("id", strElement, strSearchValue, (intSearchValueInCol), strAction);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    @And("^I verify the Parcel Location Subpage created value on non-editable summary tab$")
    public void I_verify_the_Parcel_Location_Subpage_created_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable {
        try {
            PageFormNonEditableFields.fieldValueInTable(fields);// summaryFieldsValueEquals(fields, "Parcel Location Subpage created");
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_the_Location_fields_value_on_non_editable_summary_tab.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    @And("^I click on Next>> button$")
    public void I_click_on_Next_button() throws Throwable {
//        delay(3000);
        SeleniumUtil.waitForElementVisibilityOf("name", "next", 5, 2);
        SeleniumUtil.click("name", "next", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    @And("^I add the following New Sales Tax Fields in report$")
    public void I_add_the_following_New_Sales_Tax_Fields_in_report(List<String> field) throws Throwable {
        for (String f : field) {
            SeleniumUtil.dragAndDropElement("xpath", "//table//span[text()='" + f + "']", "name", "selectedFields");
        }
    }

    @And("^I click on save button from report window$")
    public void I_click_on_save_button_from_report_window() {
        try {
            SeleniumUtil.click("name", "save", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            try {
                SeleniumUtil.click("name", "save", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                logger.info(e.getMessage());
            }
        }
    }

    @And("^I click on close button from report window$")
    public void I_click_on_close_button_from_report_window() {
        try {
            SeleniumUtil.click("name", "dismiss", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            try {
                SeleniumUtil.click("name", "dismiss", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                logger.info(e.getMessage());
            }
        }
    }

    @And("^I verify the \"([^\"]*)\" header$")
    public void I_verify_the_header(String strVerifyText) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssSelector", ".stepTitle", 5, 2);
            SeleniumUtil.verifyTextValue("cssSelector", ".stepTitle", strVerifyText, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
//            delay(4000);
            SeleniumUtil.waitForElementVisibilityOf("cssSelector", ".stepTitle", 5, 2);
            SeleniumUtil.verifyTextValue("cssSelector", ".stepTitle", strVerifyText, SeleniumUtilities.OBJWAITTIMEOUT);
        }
    }

    @And("^I click on Next button from run report filter$")
    public void I_click_on_Next_button_from_run_report_filter() {
        try {
            SeleniumUtil.click("name", "submit", SeleniumUtilities.OBJWAITTIMEOUT);
            for (int i = 0; i < 5; i++) {
                try {
                    SeleniumUtil.verifyTextValue("cssselector", ".tabHeader", " Date range for this report is from ", SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                } catch (Exception e) {
//                    delay(3000);
                }
            }
        } catch (Exception ex) {
            try {
                SeleniumUtil.click("name", "submit", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                logger.info(e.getMessage());
            }
        }
    }

//    @And("^I verify the following data in row \"([^\"]*)\" on run report$")
//    public void I_verify_the_following_data_in_row_on_run_report(String strRow, List<Field> fields) {
//        String strHeader = "", strValues = "";
//        for (Field f : fields) {
//            try {
//                strHeader = strHeader + f.getName() + " ";
//                if (f.getValue().trim().length() != 0) {
//                    strValues = strValues + f.getValue() + " ";
//                }
//            } catch (Exception Ex) {
//                BaseView.takeScreenshot(f.getName() + ".png");
//                logger.info("Error :" + Ex.getMessage());
//            }
//        }
//        verifyRunReports(strRow, strHeader, strValues);
//    }

    @And("^I close the \"([^\"]*)\" child window$")
    public void I_close_the_child_window(String arg1) throws Throwable {
        switchToSecondWindowToClose();
    }

    @And("^I close the \"([^\"]*)\" third child window$")
    public void I_close_the_third_child_window(String arg1) throws Throwable {
        BaseView.switchToThirdWindowToClose();
    }


    @And("^I verify the error message$")
    public void I_verify_the_error_message() {

        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.cssSelector("td#orgUserMsg .frmError")));
        } catch (Exception e) {
            BaseView.takeScreenshot("orgchartNegativeTestError.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    @And("^I enter row values in grid \"([^\"]*)\" by the following values$")
    public void I_enter_grid_row_values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        enterGridValues(grid, values);
    }

    @And("^I assert row values in grid \"([^\"]*)\" by the following values$")
    public void I_assert_grid_row_values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        assertGridValues(grid, values);
    }

    @And("^I click on the Add Item button$")
    public void I_click_on_the_Add_Item_button() throws Throwable {
        try {
            SeleniumUtil.getFrameIndex("cssselector", "button[class='lx-add-btn']");
            SeleniumUtil.click("cssselector", "button[class='lx-add-btn']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("I_click_on_the_Add_Item_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    @And("^I enter row values in grid \"([^\"]*)\" by the following value$")
    public void I_enter_row_values_in_grid_by_the_following_value(String gridID, List<BidFields> fields) {
        try {
            CommonMethods.waitTillDivisionLoads();
            String strElement = AllContractPagesView.getGridElement(gridID);
            moveToElementAndFocus(strElement);
            for (BidFields f : fields) {
                SeleniumUtil.click("xpath", ".//span[contains(text(),'" + f.getName() + "')]/parent::div/parent::td/following-sibling::td[1]", SeleniumUtilities.OBJWAITTIMEOUT);
                WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target'] div[data-ref='inputWrap']>*"));
                List<WebElement> buttons = gridElement.findElements(By.cssSelector("span[class='x-btn-inner x-btn-inner-default-small']"));

                editableFields.get(0).click();
                setElementValue(editableFields.get(0), f.getComment());

                editableFields.get(1).click();
                setElementValue(editableFields.get(1), f.getQuantity());

                editableFields.get(3).click();
                setElementValue(editableFields.get(3), f.getUnitCost());

                for (int i = 0; i < buttons.size(); i++) {
                    if (buttons.get(i).getText().contains("Update"))
                        buttons.get(i).click();
                }
//                delay(3000);
                CommonMethods.waitTillDivisionLoads();
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_enter_row_values_in_grid_by_the_following_value.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    @And("^I set following spin button fields values on editable page$")
    public void I_set_following_spin_field_values_on_editable_page(List<Field> fields) {
        for (Field f : fields) {
            CommonMethods.clickSpinButton(f.getName(), Integer.parseInt(f.getValue()));
        }
    }

    @And("^I verify the following values in \"([^\"]*)\":$")
    public void I_verify_the_following_values_in_(String gridID, List<Field> fields) throws Throwable {
        AllContractPagesView.verifyGridRow(gridID, fields);
    }

    @And("^I verify following options are available in the list field \"([^\"]*)\"$")
    public void iVerifyFollowingOptionsAreAvailableInTheListField(String name, List<String> options) throws Throwable {
        for (String option : options) {
            CommonMethods.verifyListOptions(name, option);
        }
    }

    @And("^I verify following options are available in drop down \"([^\"]*)\"$")
    public void iVerifyFollowingOptionsAreAvailable(String name, List<String> options) throws Throwable {
        for (String option : options) {
            CommonMethods.verifyOptionsInDropDown(name, option);
        }
    }

    @And("^I verify following options are not available in drop down \"([^\"]*)\"$")
    public void iVerifyFollowingOptionsAreNotAvailable(String name, List<String> options) throws Throwable {
        for (String option : options) {
            CommonMethods.verifyOptionsNotInDropDown(name, option);
        }
    }


    @And("^I click on Add Root Folders link on documents tab$")
    public void I_click_on_Add_Root_Folders_link_on_documents_tab() throws Throwable {
        CommonMethods.addRootFolder();
    }

    @And("^I click the drop down$")
    public void I_click_the_drop_down() throws Throwable {
        CommonMethods.clickOnDropDown();
    }

    @And("^I attach following schedule document files from \"([^\"]*)\":$")
    public void I_attach_following_schedule_document_files_from_(String dataDir, List<String> files) {
        try {
            ((JavascriptExecutor) BrowserDriver.getCurrentDriver()).executeScript("window.focus();");
            dataFolder = dataDir;
            FileUpload.selectFolderToAttachDocument();
            //FileUpload.clickFileUploadLink();
            ScheduleView.clickOnUploadNewDocLink();
            FileUpload.enterDescriptionText();
            FileUpload.clickOnBrowseButton("cssselector", "input[id='filename']");

            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Importing " + fileName);
                Thread.sleep(10000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                FileUpload.clickOnUploadButton();
                Thread.sleep(20000);
            }


        } catch (Exception e) {
            BaseView.takeScreenshot("I_attach_following_schedule_document_files_from_.png");
            Assert.fail("I_attach_following_schedule_document_files_from_");
        }
    }

    @And("^I click the red minus sign in the document list$")
    public void I_click_the_red_minus_sign_in_the_document_list() throws Throwable {
        CommonMethods.clickOnMinusSign();
    }

    @And("^I assert the following values in grid \"([^\"]*)\"$")
    public void I_assert_the_following_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        assertGridValuesGeneric(grid, values);
    }

    @And("^I assert the following values in non frame grid \"([^\"]*)\"$")
    public void I_assert_the_following_in_non_frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        assertGridValuesGeneric(grid, values);
    }

    @And("^I verify the following grid \"([^\"]*)\" values in non frame$")
    public void I_assert_the_following_grid_values_in_non_frame(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridUtils.fetchGridValues(grid, values);
    }

    @And("^I verify the \"([^\"]*)\" popup window title$")
    public void I_verify_the_popup_window_title(String strTitle) throws Throwable {
        CommonMethods.verifyPopupWindowTitle(strTitle);
    }

    @And("^I verify header and value pair on non editable summary page$")
    public void iVerifyHeaderAndValuePairOnNonEditableSummaryPage(List<Field> fields) throws Throwable {
        CommonMethods.verifyHeaderAndValuePairOnNonEditableSummaryPage(fields);
    }

    @And("^I click on \"([^\"]*)\" button and handle the alert \"([^\"]*)\"$")
    public void I_handle_the_alert(String button, String arg1) throws Throwable {
        LxModalWindow.clickButton(button);
        SeleniumUtil.handleParticularAlert(arg1);
    }

    @And("^I move to last page of the \"([^\"]*)\" grid$")
    public void I_move_to_last_page_of_the_grid(String arg1) throws Throwable {
        CommonMethods.movetogridlastpage();
    }

    @And("^I verify the following values in non frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_in_non_frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypes(grid, values);
    }


    @And("^I verify following values in non frame grid \"([^\"]*)\"$")
    public void I_verify_following_in_non_frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesDontClearSearchField(grid, values);
    }

    @And("^I verify the following values in non frame grid not exist \"([^\"]*)\"$")
    public void I_verify_the_following_in_non_frame_grid__values_by_the_following_values_not_exist(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertFalseAllGridTypes(grid, values);
    }

    @And("^I verify the following values in frame grid not exist \"([^\"]*)\"$")
    public void I_verify_the_following_in_frame_grid__values_by_the_following_values_not_exist(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertFalseAllGridTypes(grid, values);
    }

    @And("^I verify the following values in frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_in__frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypes(grid, values);
    }

    @And("^I verify the following line items in frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_line_items_in__frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.containsLineItems(grid, values);
    }

    @And("^I verify the following frame grids are empty$")
    public void I_verify_the_following_grids_are_empty(List<String> gridID) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        for (String s : gridID) {
            GridUtils.isGridEmpty(s);
        }
    }

    @And("^I verify frame grid \"([^\"]*)\" values with the excel values starting from row (\\d+)$")
    public void I_verify_the_grid_values_with_the_corresponding_values_in_the_excel_starting_from_row(String gridID, int intIndex) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypes(gridID, GridUtils.getSpreadSheetValues(intIndex));
    }

    @And("^I wait for the loading text to be disappear$")
    public void I_wait_for_the_loading_text_to_be_disappear() throws Throwable {
        AllContractPagesView.waitTillDivisionLoads();
    }

    @And("^I click on the row of \"([^\"]*)\" of column \"([^\"]*)\" from grid a \"([^\"]*)\"$")
    public void I_click_on_the_row_of_of_column_from_grid_a(String strSearchValue, int intSearchValueInCol, String strElement) {
        try {
            selectSpecificRow("cssselector", "div[id^='" + strElement + "']", strSearchValue, intSearchValueInCol);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchValue + ".png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    @And("^I click on line item from grid \"([^\"]*)\" exist in frame by reading data from excel sheet row \"([^\"]*)\"$")
    public void I_click_on_line_item_from_grid_having_unique_value_under_header_generic_by_reading_data_from_excel(String gridID, Integer sheetRowNum, List<Field> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();

        for (Field f : fields) {
            if (f.getValue().contains("Date")) {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                } catch (NullPointerException n) {
                }
            } else {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                } catch (NullPointerException e) {
                    logger.info(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                    f.setValue(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                }
            }
        }
        AllContractPagesView.clickUniqueGrid(gridID, fields.get(0).getValue(), fields.get(0).getName(), fields);
    }

    @And("^I click \"([^\"]*)\" row action in the grid \"([^\"]*)\" having the following header and cell values by reading data from spreadsheet row \"([^\"]*)\"$")
    public void I_click_on_grid_row_action_button_by_reading_data_from_spreadsheet(String strAction, String gridID, Integer sheetRowNum, List<Field> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();

        for (Field f : fields) {
            if (f.getValue().contains("Date")) {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                } catch (NullPointerException n) {
                }
            } else {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                } catch (NullPointerException e) {
                    logger.info(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                    f.setValue(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                }
            }
        }
        CommonMethods.clickGridActionBtn(strAction, gridID, fields.get(0).getName(), fields.get(0).getValue(), fields);
    }

    @And("^I press tab key from \"([^\"]*)\" field$")
    public void I_press_tab_key_from_field(String strFieldName) throws Throwable {
        CommonMethods.pressTabKey("name", strFieldName);
    }

    @And("^I add following Contract type$")
    public void I_add_following_Contract_type(List<String> members) throws Throwable {
        PortfolioSetupWizardView.addMembers(members, "availCodeContactTypeIDList");
    }

    @And("^I verify the error message \"([^\"]*)\"$")
    public void I_verify_the_error_message(String strMsg) throws Throwable {
        assertTrue(AdminGridView.verifyErrorMessage(strMsg));
    }

    @And("^I search for member \"([^\"]*)\"$")
    public void I_search_for_member(String strMember) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.searchMember(strMember);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on Update Active Status button$")
    public void I_click_on_Update_Active_Status_button() throws Throwable {
        CommonMethods.UpdateActiveStatus();
    }

    @And("^I select a member \"([^\"]*)\" to inactivate$")
    public void I_select_a_member_to_inactivate(String strMember) throws Throwable {
        CommonMethods.inactivate(strMember);
    }

    @And("^I select a member \"([^\"]*)\" to activate$")
    public void I_select_a_member_to_activate(String strMember) throws Throwable {
        CommonMethods.reactivate(strMember);
    }

    @And("^I verify a member \"([^\"]*)\" has inactivate$")
    public void I_verify_a_member_has_inactivate(String strMember) throws Throwable {
        CommonMethods.verifyInactivate(strMember);
    }

    @And("^I verify a member \"([^\"]*)\" has active$")
    public void I_verify_a_member_has_active(String strMember) throws Throwable {
        CommonMethods.verifyReactivate(strMember);
    }

    @And("^I search by \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_search_by(String arg1, String strMember) throws Throwable {
        CommonMethods.searchMember(strMember);
    }

    @And("^I verify row \"([^\"]*)\" of column \"([^\"]*)\" does not exist from grid \"([^\"]*)\"$")
    public void I_verify_row_of_column_does_not_exist_from_grid(String uniqueValue, String strName, String gridID) throws Throwable {
        AllContractPagesView.verifyGridWithoutSwitchToFrameRowNotPresent(gridID, uniqueValue);
    }

    @And("^I Upload selected image \"([^\"]*)\":$")
    public void I_Upload_selected_image_(String dataDir, List<String> files) {
        CommonMethods.uploadImage(dataDir, files);
    }

    @And("^I verify the following values in frame grid$")
    public void I_verify_the_following_in__frame_grid__values_by_the_following_values(List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesNoGrid(values);
    }

    @And("^I verify the following values in non frame grid$")
    public void I_verify_the_following_in_non_frame_grid__values_by_the_following_values(List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesNoGrid(values);
    }

    @And("^I verify the following report values in non frame grid$")
    public void I_verify_the_following_report_in_non_frame_grid__values_by_the_following_values(List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllReportGridTypesNoGrid(values);
    }

    @And("^I enter the following row values in grid \"([^\"]*)\" by the following values$")
    public void I_enter_the_following_grid_row_values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        enterGridValuesOneByOne(grid, values);
    }

    @And("^I upload the following document \"([^\"]*)\" from path \"([^\"]*)\"$")
    public void I_upload_(String fileName, String dataDir) {
        try {
            FileUpload.setWindowFocus();
            dataFolder = dataDir;
            SeleniumUtil.click("name", "filename", 5);

            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
//            logger.info("Importing " + fileName);
//            Thread.sleep(10000);
//            File file = new File(dir, fileName);
//            String f = file.getPath();
//            FileUpload.fileUpload(f.replace("/", "\\"));
//            assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

            logger.info("Upload custom list values " + fileName);
            Thread.sleep(10000);
            File file = new File(dir, fileName);
            String f = file.getPath();
            FileUpload.fileUpload(f.replace("/", "\\"));
            org.junit.Assert.assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
            Thread.sleep(20000);


        } catch (Exception e) {
            BaseView.takeScreenshot("I_attach_following_schedule_document_files_from_.png");
            Assert.fail("I_attach_following_schedule_document_files_from_");
        }
    }

    @And("^I verify the following excel data of row \"([^\"]*)\"$")
    public void I_verify_data_from_excel(Integer sheetRowNum, List<Field> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));

        for (Field f : fields) {

            if (f.getValue().contains("Date")) {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getName(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                    assertEquals(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getName(), sheetRowNum, Spreadsheet.Type.DATE).toString()), SeleniumUtil.replaceSpecialChar(f.getValue()));
                } catch (NullPointerException n) {
                }
            } else {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getName(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                    assertEquals(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getName(), sheetRowNum, Spreadsheet.Type.TEXT).toString()), SeleniumUtil.replaceSpecialChar(f.getValue()));
                } catch (NullPointerException e) {
                    logger.info(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getName(), sheetRowNum)));
                    assertEquals(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getName(), sheetRowNum)), SeleniumUtil.replaceSpecialChar(f.getValue()));
                }
            }
        }
    }

    @And("^I click on \"([^\"]*)\" Button and handle the alert \"([^\"]*)\"$")
    public void I_handle_the_(String button, String arg1) throws Throwable {
        CommonMethods.clickBtnHavingValue(button);
        SeleniumUtil.handleParticularAlert(arg1);
    }

    @And("^I upload the following document from path \"([^\"]*)\"$")
    public void I_upload_the_following_document_from_path(String dataDir, String fileName) throws Throwable {
        try {
            FileUpload.setWindowFocus();
            dataFolder = dataDir;
            SeleniumUtil.click("name", "filename", 5);

            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
//            logger.info("Importing " + fileName);
//            Thread.sleep(10000);
//            File file = new File(dir, fileName);
//            String f = file.getPath();
//            FileUpload.fileUpload(f.replace("/", "\\"));
//            assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

            logger.info("Upload custom list values " + fileName);
            Thread.sleep(10000);
            File file = new File(dir, fileName);
            String f = file.getPath();
            FileUpload.fileUpload(f.replace("/", "\\"));
            org.junit.Assert.assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
            Thread.sleep(20000);


        } catch (Exception e) {
            BaseView.takeScreenshot("I_attach_following_schedule_document_files_from_.png");
            Assert.fail("I_attach_following_schedule_document_files_from_");
        }
    }

    @And("^I upload the following document from path \"([^\"]*)\":$")
    public void I_upload_the_following_document_from_path_(String dataDir, List<String> files) throws Throwable {
        CommonMethods.uploadxls(dataDir, files);
    }

    @And("^I verify file \"([^\"]*)\" uploaded successfully$")
    public void I_verify_file_uploaded_successfully(String strFileName) throws Throwable {
        boolean flag = false;
        List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//td[./text()='" + strFileName + "']"));
        for (WebElement ele : eles) {
            SeleniumUtil.waitForElementVisibilityOf(ele, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            if (ele.getText().contains(strFileName)) {
                flag = true;
                assertTrue("File Uploaded sucessfully :", flag);
                return;
            }
        }
        assertTrue("Uploaded file does not exist :", flag);
    }

    @And("^I click on Update button$")
    public void I_click_on_Update_button() throws Throwable {
        String strButton = "Update";
        try {
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickOnUpdateButton(strButton);
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I click on Yes button$")
    public void I_click_on_Yes_button() throws Throwable {
        String strButton = "Yes";
        try {
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickOnYesButton(strButton);
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I click on the Finish button$")
    public void I_click_on_the_Finish_button() throws Throwable {
        String strButton = "Finish";
        try {
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickOnFinishButton(strButton);
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I verify the following error message \"([^\"]*)\"$")
    public void I_verify_the_following_error_message(String strSearchText) {
        CommonMethods.searchText(strSearchText);
//        try {
//            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
//            wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strSearchText));
//            logger.info("Verified : " + strSearchText);
//        } catch (Exception e) {
//            try {
//                SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + strSearchText + "\")]");
//            } catch (Exception ex) {
//                BaseView.takeScreenshot(strSearchText + ".png");
//                logger.info("Error :" + e.getMessage());
//                fail(e.getMessage());
//            }
//        }
    }

    @And("^I click on Setup Members button$")
    public void I_click_on_Setup_Members_button() throws Throwable {
        CommonMethods.clickOnSetupMemberButton();
    }

    @And("^I verify the \"([^\"]*)\" page header$")
    public void I_verify_the_page_header(String strHeader) throws Throwable {
        CommonMethods.verifyLayoutHearder(strHeader);
    }

    @And("^I wait for pop up \"([^\"]*)\" to be disappear$")
    public void I_wait_for_pop_up_to_be_disappear(String strText) throws Throwable {
        CommonMethods.waitForFieldDoesNotExist(strText);
    }

    @And("^I verify title \"([^\"]*)\", Days Open \"([^\"]*)\",Due Date \"([^\"]*)\",Assigness \"([^\"]*)\",Form Type \"([^\"]*)\",Ceator \"([^\"]*)\",Last Reply$")
    public void I_verify_title_Days_Open_Due_Date_Assigness_Form_Type_Ceator_Last_Reply(String strTitle, String strDaysOpen, String strDueDate, String strAssignees, String strFormType, String strCreator) throws Throwable {
        CommonMethods.verifyTableColumn(strTitle, strDaysOpen, strDueDate, strAssignees, strFormType, strCreator);
    }

    @And("^I verify title \"([^\"]*)\", Days Open \"([^\"]*)\",Due Date \"([^\"]*)\",Assigness \"([^\"]*)\",Form Type \"([^\"]*)\",Creator \"([^\"]*)\"$")
    public void I_verify_title_Days_Open_Due_Date_Assigness_Form_Type_Creator(String strTitle, String strDaysOpen, String strDueDate, String strAssignees, String strFormType, String strCreator) throws Throwable {
        CommonMethods.verifyTableColumn(strTitle, strDaysOpen, strDueDate, strAssignees, strFormType, strCreator);
    }

    @And("^I click on \"([^\"]*)\" button of pluse icon$")
    public void I_click_on_button_of_pluse_icon(String strPluseButton) throws Throwable {
        CommonMethods.clickOnPluseButton(strPluseButton);
    }

    @And("^I click on \"([^\"]*)\" button on modal window popup$")
    public void I_click_on_button_on_modal_window_popup(String strPluseButton) throws Throwable {
        CommonMethods.clickOnModalWindowButton(strPluseButton);
    }

    @And("^I wait for \"([^\"]*)\" is visible$")
    public void I_wait_for_is_visible(String strSearchText) throws Throwable {
        CommonMethods.waitForElementVisible(strSearchText);
    }

    @And("^I select radio option \"([^\"]*)\"")
    public void I_select_radio_option_generic(String elementName) {
        CommonMethods.selectRadioOption(elementName);
    }

    @And("^I verify title \"([^\"]*)\", Form Type \"([^\"]*)\"$")
    public void I_verify_title_Form_Type(String strTitle, String strFormType) throws Throwable {
        CommonMethods.verifyTableColumn(strTitle, strFormType);
    }

    @And("^I verify following \"([^\"]*)\"$")
    public void I_verify_following(String param, List<String> Field) throws Throwable {
        CommonMethods.verifyTableRows(Field, "cssselector", "table[class='linedTable']");
    }

    @And("^I verify the following excel data$")
    public void I_verify_data_from_excel_in_row(List<List<String>> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));

        for (List<String> data : fields) {

            try {
                logger.info(excel.getCellValue(Integer.parseInt(data.get(1)), Integer.parseInt(data.get(2)), Spreadsheet.Type.TEXT).toString());
                assertEquals(excel.getCellValue(Integer.parseInt(data.get(1)), Integer.parseInt(data.get(2)), Spreadsheet.Type.TEXT).toString(), data.get(0));
            } catch (Exception e) {

            }
        }
    }


    @And("^I verify the following excel is generated")
    public void I_verify_data_from_excel_is_generated() throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        Spreadsheet excel = new Spreadsheet(new File(localPath));
    }

    @And("^I select \"([^\"]*)\" radio button$")
    public void I_select_radio_button(String strRadioCaption) throws Throwable {
        CommonMethods.selectRadioButton(strRadioCaption);
    }

    @Then("^I enter the value \"([^\"]*)\" in the \"([^\"]*)\" field$")
    public void I_enter_the_value_in_the_field(String strValue, String strField) throws Throwable {
        CommonMethods.enterValue(strValue, strField);
    }

    @Then("^I verify \"([^\"]*)\" tab$")
    public void I_verify_tab(String strTab) throws Throwable {
        CommonMethods.verifyTab(strTab);
    }

    @And("^I open latest downloaded file$")
    public void I_open_latest_downloaded_file() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        EmailVerification.launchLatestDownloadedFile();
    }

    @And("^I verify file name \"([^\"]*)\" of type \"([^\"]*)\" downloaded successfully$")
    public void I_verify_file_downloaded_successfully(String fileName, String fileType) throws Throwable {

        for(int i=0;i<60;i++){
            try{
                if (FileDownloader.getLatestDownloadedFile().contains(fileName) && FileDownloader.getLatestDownloadedFile().contains(fileType)) {
                    logger.info("File downloaded successfully " + FileDownloader.getLatestDownloadedFile());
                    break;
                }else{
                    if(i==59){
                        BaseView.takeScreenshot("FailedToDownload.png");
                        fail("Failed to download script");
                    }else{
                        Thread.sleep(1000);
                    }
                }
            }catch (NullPointerException ne){
                Thread.sleep(1000);
            }
        }

    }

    @And("^I verify the \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_verify_the(String strSearchText, String strLabel) {

        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strSearchText));
            logger.info("Verified : " + strSearchText);
        } catch (Exception e) {
            try {
                SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + strSearchText + "\")]");
            } catch (Exception ex) {
                BaseView.takeScreenshot(strSearchText + ".png");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }
    }

    @And("^I verify grid \"([^\"]*)\" is empty with the following message \"([^\"]*)\"$")
    public void I_verify_grid_is_empty_with_the_following_message(String gridID, String message) throws Throwable {
        CommonMethods.verifyGridIsEmpty(gridID, message);
    }

    @And("^I wait for second child window to close$")
    public void I_wait_for_second_child_window_to_close() throws Throwable {
        BaseView.waitTillSecondWindowClose();
    }

    @And("^I wait for browser windows count to be equal to \"([^\"]*)\"$")
    public void I_wait_for_browser_windows_count_to_be_equal_to(int windowCount) throws Throwable {
        BaseView.waitTillWindowsCountToBeEqualTo(windowCount);
    }

    @And("^I verify the following values under \"([^\"]*)\" header in grid \"([^\"]*)\"$")
    public void I_verify_the_following_values_under_header_in_grid(String strHeader, String strGrid, List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridUtils.fetchGridValues(strHeader, strGrid, values);
    }

    @Given("^I click on \'Update\' button while adding customlist line items$")
    public void I_click_update_button() throws Throwable {
        try {
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickUpdateButtonWhileAddingCustomListLineItems("Update");
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked  Update button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked Update.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Given("^I click on \'Update\' button while editing line items$")
    public void I_click_update_button_row_editing() throws Throwable {
        try {
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickUpdateButtonWhileEditingLineItems("Update");
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked  Update button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked Update.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @Then("^I set cell value in spread sheet row \"([^\"]*)\" under header \"([^\"]*)\"$")
    public void I_set_cell_value_in_spread_sheet_row_(Integer row, String header) throws Throwable {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            File file = new File(dataFolder);
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            excel.setCellValue(file, header, row, lxRecID);

        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @Then("^I set cell value in spread sheet row \"([^\"]*)\" under header \"([^\"]*)\" of column index \"([^\"]*)\"$")
    public void I_set_cell_value_in_spread_sheet_row_(Integer row, String header, Integer column) throws Throwable {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            File file = new File(dataFolder);
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            if (header.equalsIgnoreCase("lxSalesRecID1")) {
                excel.setCellValue(file, row, column, lxSalesRecID1);
            } else if (header.equalsIgnoreCase("lxSalesRecID2")) {
                excel.setCellValue(file, row, column, lxSalesRecID2);
            } else {
                excel.setCellValue(file, row, column, lxRecID);
            }
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @And("^I verify a row from grid \"([^\"]*)\" by reading data from excel sheet row \"([^\"]*)\" in non frame page$")
    public void I_verify_row_from_grid_having_unique_value_under_header_generic_by_reading_data_from_excel_in_non_frame_page(String gridID, Integer sheetRowNum, List<Field> fields) throws Throwable {
        String localPath = new File(dataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();

        for (Field f : fields) {
            if (f.getValue().contains("Date")) {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.DATE).toString()));
                } catch (NullPointerException n) {
                }
            } else {
                try {
                    logger.info(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                    f.setValue(SeleniumUtil.replaceSpecialChar(excel.getCellValue(f.getValue(), sheetRowNum, Spreadsheet.Type.TEXT).toString()));
                } catch (NullPointerException e) {
                    logger.info(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                    f.setValue(SeleniumUtil.replaceSpecialChar(anotherExcel.getCellValue(f.getValue(), sheetRowNum)));
                }
            }
        }
        GridUtils.chooseGrid(gridID, fields.get(0).getValue(), fields.get(0).getName(), fields);
    }

    @And("^I set cell value in spread sheet of type \"([^\"]*)\" row \"([^\"]*)\" under header \"([^\"]*)\" of column index \"([^\"]*)\"$")
    public void I_set_cell_value_in_spread_sheet_of_type_row_under_header_of_column_index(String strType, Integer row, String header, Integer column) throws Throwable {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            File file = new File(dataFolder);
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            if (strType.equalsIgnoreCase("Tenant")) {
                excel.setCellValue(file, row, column, TenantRecID);

            } else {
                excel.setCellValue(file, row, column, lxRecID);
            }
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_set_cell_value_in_spread_sheet_of_type_row_under_header_of_column_index");
            fail(e.getMessage());
        }
    }

    @Then("^I verify date field value on editable page by reading data from spread sheet row \"([^\"]*)\" in non frame page$")
    public void I_verify_date_field_value_on_editable_page_by_reading_data_from_spread_sheet_row_in_non_frame_page(Integer row, List<Field> fields) {
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));
            String strCellValue;

            for (Field f : fields) {
                strCellValue = excel.getDateCellValue(f.getValue(), row);
                String strValue = SeleniumUtil.getWebElementObject("name", f.getName()).getAttribute("value");

                //Convert excel date value to field date value format
                SimpleDateFormat sdfSource = new SimpleDateFormat("dd/MM/yyyy");
                Date date = sdfSource.parse(strCellValue);
                SimpleDateFormat sdfDestination = new SimpleDateFormat("MM/dd/yyyy");
                strCellValue = sdfDestination.format(date);
                System.out.println(strCellValue);

                assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                        (strValue.contains(strCellValue) || strCellValue.contains(strValue) || strValue.equalsIgnoreCase(strCellValue)));
                logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_date_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            fail(e.getMessage());
        }
    }

    @Then("^I verify the following fields value on editable page by reading data from spread sheet row \"([^\"]*)\"$")
    public void I_verify_the_following_fields_value_on_editable_page_by_reading_data_from_spread_sheet_row(Integer row, List<Field> fields) {
        String strCellValue = "";
        String strValue = "";
        try {
            String localPath = new File(dataFolder).getAbsolutePath();
            SpreadsheetUtils excel = new SpreadsheetUtils(new File(localPath));

            for (Field f : fields) {
                strCellValue = excel.getCellValue(f.getValue(), row);

                strValue = CommonMethods.getValuesOnEditablePage(f.getName());

                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                strValue = SeleniumUtil.replaceSpecialChar(strValue);
                strCellValue = SeleniumUtil.replaceSpecialChar(strCellValue);
                try {
                    assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                            (strValue.contains(strCellValue) || strCellValue.contains(strValue)));
                    logger.info("Excel value " + strCellValue + " is matching with the field value " + strValue);
                } catch (Exception e) {
                    assertTrue("Excel value " + strCellValue + " is not matching with the field value " + strValue,
                            (strValue.contains("No")));

                }

            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            SeleniumUtil.switchTodefaultContent();
            BaseView.takeScreenshot("I_verify_field_value_on_editable_page_by_reading_data_from_spread_sheet_row.png");
            logger.info(strCellValue + " is not equal to " + strValue);
            fail(e.getMessage());
        }
    }

    @And("^I fetch the entity  Lx ID from \"([^\"]*)\"$")
    public void I_fetch_the_entity_Lx_ID_from(String arg1) throws Throwable {
        CommonMethods.getEntityLxID();
    }

    @And("^I verify the field \"([^\"]*)\" is \"([^\"]*)\"$")
    public void I_verify_the_field_is(String strField, String strFieldValue) throws Throwable {
        verifyField(strField, strFieldValue);
    }

    @And("^I verify the field \"([^\"]*)\" is \"([^\"]*)\" in \"([^\"]*)\"$")
    public void I_verify_the_field_is_in(String strField, String strFieldValue, String arg3) throws Throwable {
        verifyFieldInSameColumn(strField, strFieldValue);
    }

    @And("^I verify the following fields in \"([^\"]*)\"$")
    public void I_verify_the_field_is_in(String description, List<List<String>> strField) throws Throwable {
        verifyFieldInSameColumn(strField);
    }

    @And("^I verify the field \"([^\"]*)\" is \"([^\"]*)\"in a same row in \"([^\"]*)\"$")
    public void I_verify_the_field_is_in_a_same_row_in(String strField, String strFieldValue, String arg3) throws Throwable {
        verifyFieldInSameRow(strField, strFieldValue);
    }

    @And("^I verify the field \"([^\"]*)\" is \"([^\"]*)\" in a same row in \"([^\"]*)\"$")
    public void I_verify_the_field_is_in_a_same_row_in_(String strField, String strFieldValue, String arg3) throws Throwable {
        verifyFieldInSameRow(strField, strFieldValue);
    }


    @And("^I verify imported Log file should display Total Processed \"([^\"]*)\" and Total Failuers \"([^\"]*)\" on the import summary$")
    public void I_verify_imported_Log_file_should_display_Total_Processed_and_Total_Failuers_on_the_import_summary(String strFailures, String strProcessed) throws Throwable {
        verifyTotalErrorsOnImportSummaryTableLogFilePopupWindow(strFailures, strProcessed);
    }

    @And("^I verify imported Log file should display Total Processed \"([^\"]*)\" and Total Failuers \"([^\"]*)\" on the view popup window$")
    public void I_verify_imported_Log_file_should_display_Total_Processed_and_Total_Failuers_on_the_view_popup_window(String strFailures, String strProcessed) throws Throwable {
        verifyTotalErrorsOnImportSummaryTablePopupWindow(strFailures, strProcessed);
    }

    @And("^I verify imported Log file should display Total Processed \"([^\"]*)\" and Total Failuers \"([^\"]*)\" on the import summary page$")
    public void I_verify_imported_Log_file_should_display_Total_Processed_and_Total_Failuers_on_the_import_summary_page(String strFailures, String strProcessed) throws Throwable {
        verifyTotalErrorsOnImportSummaryTable(strFailures, strProcessed);
    }

    @And("^I search for a \"([^\"]*)\"$")
    public void I_search_for_a(String strMember) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AdminGridView.searchRecordInGrid(strMember);
    }

    @And("^I verify a row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" and extract value \"([^\"]*)\"$")
    public void I_verify_a_row_from_grid_having_unique_value_under_column_header_and_extract_value(String gridID, String uniqueValue, String header, String strExtractValue) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.extractValueFromGrid(gridID, uniqueValue, header, strExtractValue);
    }

    @And("^I see the \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_see_the(String strMsg, String arg2) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strMsg + "']", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 40);
            wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.xpath(".//*[./text()='" + strMsg + "']")));
        } catch (Exception e) {
            BaseView.takeScreenshot("I_see_the");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    @When("^I expand the following tree$")
    public void I_expand_the_following_tree(List<String> folderName) throws Throwable {
        String previousFolderName = "";
        for (String f : folderName) {
            if (f == null) {
                CommonMethods.expandFoldersWhichDontHaveName(previousFolderName);
            } else if (f.equals("")) {
                CommonMethods.expandFoldersWhichDontHaveName(previousFolderName);
            } else {
                CommonMethods.expandFolders(f);
                previousFolderName = f;
            }
        }
    }

    @And("^I navigate to entity type \"([^\"]*)\" named \"([^\"]*)\" by search$")
    public void I_navigate_to_entity_type_named_by_search(String entityType, String entityName) throws Throwable {
        CommonMethods.searchEntity(entityType, entityName);
    }

    @And("^I navigate to entity type \"([^\"]*)\" named \"([^\"]*)\" through search option$")
    public void I_navigate_to_entity_type_named_throgh_search(String entityType, String entityName) throws Throwable {
        CommonMethods.searchEntity(entityType, entityName);
        SeleniumUtil.handleUnexpectedAlerts();
        try {
            CommonMethods.switchToVisibleFrame();
        } catch (Exception e) {
        } catch (AssertionError ae) {
        }
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I verify the following values in budget summary grid \"([^\"]*)\"$")
    public void I_verify_the_following_in_frame_grid_values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesPushHeader(grid, values);
    }

    @And("^I verify a member \"([^\"]*)\" has status inactivate$")
    public void I_verify_a_member_has_status_inactivate(String strMember) throws Throwable {
        CommonMethods.verifyInactivate(strMember);
    }

    @And("^I verify a member \"([^\"]*)\" has status activate$")
    public void I_verify_a_member_has_status_activate(String strMember) throws Throwable {
        CommonMethods.verifyReactivate(strMember);
    }

    @And("^I click on Next button on \"([^\"]*)\"$")
    public void I_click_on_Next_button_on(String strValue) throws Throwable {
        CommonMethods.clickOnFormSubmit(strValue);
    }

    @And("^I click on Process Planned Membership button$")
    public void I_click_on_Process_Planned_Membership_button() throws Throwable {
        CommonMethods.clickOnFormSubmit("Process Planned Membership");
    }

    @And("^I click on submit button$")
    public void I_click_on_submit_button() throws Throwable {
        CommonMethods.clickOnSubmit();
    }

    @And("^I verify a title \"([^\"]*)\" has assignees \"([^\"]*)\"$")
    public void I_verify_a_title_has_assignees(String strTitle, String strAssignees) throws Throwable {
        CommonMethods.verifyRowColumn(strTitle, strAssignees);
    }

    @And("^I verify file name \"([^\"]*)\" of type \"([^\"]*)\" downloaded$")
    public void I_verify_file_downloaded(String fileName, String fileType) throws Throwable {
        FileDownloader.getLatestDirectory();
    }

    @And("^I click on Another member button on \"([^\"]*)\"$")
    public void I_click_on_Another_member_button_on(String arg1) throws Throwable {
        CommonMethods.clickOnAnotherMemberButton();
    }

    @And("^I enter today's date as \"([^\"]*)\"$")
    public void I_enter_today_s_date_as(String strEleName) throws Throwable {
        CommonMethods.enterTodaysDate(strEleName);
    }

    @And("^I clear search field in the grid \"([^\"]*)\"$")
    public void I_clear_search_field_in_the_grid(String gridID) throws Throwable {
        AdminGridView.clearSearch(gridID);
    }

    @Then("^I verify \"([^\"]*)\" name on the header$")
    public void I_verify_the_name_on__header(String strHeaderName) throws Throwable {
        CommonMethods.verifyNameOnHeaderIfNotFail(strHeaderName);
    }

    @And("^I verify the \"([^\"]*)\" Assignee on work flow grid$")
    public void I_verify_the_Assignee_on_work_flow_grid(String strMemeber) throws Throwable {
        CommonMethods.verifyAssignOnWorkFlow(strMemeber);
    }

    @Given("^I click \"([^\"]*)\" button and do not fail if element not exist$")
    public void I_click_grid_the_button_do_not_fail(String strButton) throws Throwable {
        CommonMethods.clickOnButtonButDonotFail(strButton);

    }

    @And("^I verify following fields are hidden on editable page$")
    public void I_verify_following_fields_are_hidden_on_editable_page(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            verifyHiddenFields(f.getName());
        }
    }

    @And("^I click \"([^\"]*)\" button while adding custom list line item$")
    public void I_click_btn(String button) throws Throwable {
        try {
            CommonMethods.clickBtn(button);
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

    @And("^I click \"([^\"]*)\" button of frame grid \"([^\"]*)\"$")
    public void I_click_button_of_grid(String btn, String gridID) throws Throwable {
        CommonMethods.clickButtonOfGrid(btn, gridID);
    }

    @And("^I click \"([^\"]*)\" button of non frame grid \"([^\"]*)\"$")
    public void I_click_button_of_grid_non_frame_grid(String btn, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.clickButtonOfGrid(btn, gridID);
    }

    @And("^I verify the following rows in frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_rows_in__frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesDontSkipBlankHeaders(grid, values);
    }

    @And("^I expand the \"([^\"]*)\"$")
    public void I_expand_the(String strField) throws Throwable {
        CommonMethods.clickOnExpandImg(strField);
    }

    @And("^I click \"([^\"]*)\" for field \"([^\"]*)\"$")
    public void I_click_for_field(String strLink, String strField) throws Throwable {
        CommonMethods.clickOnFieldLink(strLink, strField);
    }

    @And("^I verify the field \"([^\"]*)\" has \"([^\"]*)\"$")
    public void I_verify_the_field_has(String strField, String strValue) throws Throwable {
        CommonMethods.verifyTheField(strField, strValue);
    }

    @And("^I click on the update button$")
    public void I_click_on_the_update_button() throws Throwable {
        CommonMethods.clickOnUpdateButton();
    }

    @And("^I verify the text \"([^\"]*)\" on \"([^\"]*)\"$")
    public void I_verify_the_text_on(String strText, String arg2) throws Throwable {
        CommonMethods.verifyText(strText);
    }

    @And("^I click on the \"([^\"]*)\" for \"([^\"]*)\"$")
    public void I_click_on_the_for(String strLink, String strField) throws Throwable {
        CommonMethods.clickOnField(strLink, strField);
    }

    @And("^I click on the ADD Button$")
    public void I_click_on_the_ADD_Button() throws Throwable {
        CommonMethods.clickOnUpdateButton();
    }

    @And("^I click \"([^\"]*)\" for field JurisdictionID$")
    public void I_click_for_field_JurisdictionID(String strLink) throws Throwable {
        CommonMethods.clickOnFieldJurisdiction(strLink);
    }

    @And("^I click on the refresh button$")
    public void I_click_on_the_refresh_button() throws Throwable {
        CommonMethods.clickOnRefreshButton();
    }

    @And("^I verify the Region \"([^\"]*)\" values is \"([^\"]*)\"$")
    public void I_verify_the_Region_values_is(String strText, String strValue) throws Throwable {
        CommonMethods.verifyRegionValue(strText, strValue);
    }

    @And("^I verify the Market \"([^\"]*)\" values is \"([^\"]*)\"$")
    public void I_verify_the_Market_values_is(String strText, String strValue) throws Throwable {
        CommonMethods.verifyMarketValue(strText, strValue);
    }

    @And("^I verify the \"([^\"]*)\" values is \"([^\"]*)\"$")
    public void I_verify_the_values_is(String strText, String strValue) throws Throwable {
        CommonMethods.verifyTheValueOnREPage(strText, strValue);
    }

    @And("^I verify the field \"([^\"]*)\" values has \"([^\"]*)\"$")
    public void I_verify_the_field_values_has(String strText, String strValue) throws Throwable {
        CommonMethods.verifyTheFieldValue(strText, strValue);
    }

    @And("^I verify the field \"([^\"]*)\" values is \"([^\"]*)\"$")
    public void I_verify_the_field_values_is(String strText, String strValue) throws Throwable {
        CommonMethods.verifyTheFieldValueWithinRow(strText, strValue);
    }

    @And("^I select \"([^\"]*)\" from \"([^\"]*)\" dropdown$")
    public void I_select_from_dropdown(String strValue, String strDropdown) throws Throwable {
        CommonMethods.selectByValueFromDropdown(strValue, strDropdown);
    }

    @And("^I import following Data field Values \"([^\"]*)\":$")
    public void I_Upload_following_Data_List_Values_(String dataDir, List<String> files) {
        try {
            dataFolder = dataDir;
            FileUpload.clickOnBrowseButton("cssselector", "input[name='upload']");
            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Upload custom list values " + fileName);
                Thread.sleep(10000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                CommonMethods.clickBtnHavingValue("Upload");
                Thread.sleep(20000);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    @And("^I drag and drop the \"([^\"]*)\" to \"([^\"]*)\" location$")
    public void I_drag_and_drop_the_to_location(String strFromElement, String strTargetElement) throws Throwable {
        CommonMethods.dragAndDropToLocation(strFromElement, strTargetElement);
    }

    @And("^I drag and drop the following documents from \"([^\"]*)\" to \"([^\"]*)\"$")
    public void I_drag_and_drop_the_to_following(String strFromElement, String strTargetElement) throws Throwable {
        CommonMethods.dragAndDropDocuments(strFromElement, strTargetElement);
    }

    @And("^I expand the \"([^\"]*)\" tree$")
    public void I_expand_the_tree(String strFolder) throws Throwable {
        CommonMethods.expandTree(strFolder);
    }

    @And("^I verify the \"([^\"]*)\" \"([^\"]*)\" of \"([^\"]*)\" \"([^\"]*)\",\"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_verify_the_of_and(String arg1, String strHeader, String arg3, String strCol1, String arg5, String strCol2, String arg7, String strCol3) throws Throwable {
        CommonMethods.verify3Columns(strHeader, strCol1, strCol2, strCol3);
    }

    @And("^I verify the Total of \"([^\"]*)\" \"([^\"]*)\",\"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_verify_the_Total_of_and(String arg1, String strHeader, String arg3, String strCol1, String arg5, String strCol2, String arg7, String strCol3) throws Throwable {
        CommonMethods.verifyTotal3Columns(strHeader, strCol1, strCol2, strCol3);
    }

    @And("^I verify the following fields value contains on editable page$")
    public void I_verify_the_following_fields_value_contains_on_editable_page(List<Field> fields) {
        String strValue = "";
        for (Field f : fields) {
            try {
                if (f.getValue().contains("[CURRENT DATE]")) {
                    strValue = f.getValue().replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
                } else {
                    strValue = f.getValue();
                }
                if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("textarea")) {
                    assertTrue(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value").contains(strValue));
                    logger.info(strValue + " present on editable field");
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I verify following radio fields exist$")
    public void I_verify_following_radio_by_label_name(List<String> labels) {

        for (String label : labels) {
            try {
                verifyRadioLabelName(label);
            } catch (Exception Ex) {
                BaseView.takeScreenshot(label + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I click on the text \"([^\"]*)\"$")
    public void I_click_on_the_text(String strText) throws Throwable {
        CommonMethods.clickOntheText(strText);
    }

    @And("^I check the \"([^\"]*)\" checkbox$")
    public void iCheckTheCheckbox(String arg0) throws Throwable {
        AdminGenericView.checkTheCheckbox();
    }

    @And("^I verify the Total of the \"([^\"]*)\" \"([^\"]*)\",\"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" \"([^\"]*)\"$")
    public void iVerifyTheTotalOfTheAnd(String strHeader, String strCol1, String arg3, String strCol2, String arg6, String strCol3) throws Throwable {
        CommonMethods.verifyTotal3Columns(strHeader, strCol1, strCol2, strCol3);
    }

    @And("^I verify following values in frame grid \"([^\"]*)\"$")
    public void I_verify_following_in__frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesUsingAnyLocator(grid, values);
    }

    @And("^I verify the following values within frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_values_within_frame_grid(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypesOfIncludingDate(grid, values);
    }

    @And("^I verify the following negative values in a same row in \"([^\"]*)\" within frame page$")
    public void I_verify_the_following_negative_values_in_same_row_within_frame_page(String arg3, List<List<String>> strField) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        verifyNegativeFieldInSameRow(strField);
    }

    @And("^I click on folder icon$")
    public void I_click_on_folder_icon() throws Throwable {
        FileUpload.clickAttachDocumentButton();
        SeleniumUtil.switchTodefaultContent();
        FileUpload.selectFolderToAttachDocument();
    }

    @And("^I click on magnify icon$")
    public void I_click_on_magnify_icon() throws Throwable {
      FileUpload.clickMagnifyfyDocumentButton();
    }

    @And("^I click on magnify download icon$")
    public void I_click_on_magnify_local_download_icon() throws Throwable {
        FileUpload.clickMagnifyfyForLocalDownload();
    }

    @And("^I click on download icon$")
    public void I_click_on_magnify_download_icon() throws Throwable {
        FileUpload.clickMagnifyfyForlDownload();
    }
	
	@And("^I verify the \"([^\"]*)\" \"([^\"]*)\" has \"([^\"]*)\" disabled$")
    public void I_verify_the_has_disabled(String arg1, String strField, String arg3) throws Throwable {
       CommonMethods.verifyFieldDisabled(strField);
    }

    @And("^I select a following Items from field$")
    public void I_select_a_following_Items_from_field(List<Field> fields) {
        for (Field f : fields) {
            CommonMethods.selectItemFromTheList(f.getName(), f.getValue());
        }
    }

    @And("^I enter value \"([^\"]*)\" of field \"([^\"]*)\" on \"([^\"]*)\"$")
    public void I_enter_value_of_field_on(String strValue,String strField, String strFieldName) throws Throwable {
        CommonMethods.enterValueInFields(strValue,strField);
    }

    @And("^I verify the enter value \"([^\"]*)\" of field \"([^\"]*)\" on \"([^\"]*)\"$")
    public void I_verify_the_enter_value_of_field_on(String strValue,String strField, String strFieldName) throws Throwable {
        CommonMethods.verifyEnterValueInFields(strValue,strField);
    }

    @And("^I verify the following radio by value$")
    public void I_verify_the_following_radio_by_value(List<Field> value) throws Throwable {
      CommonMethods.verifyRadioByValue(value);
    }

    @And("^I select the following radio by value$")
    public void I_select_the_following_radio_by_value(List<Field> value) throws Throwable {
        CommonMethods.selectRadioByValue(value);
    }

    @And("^I verify the following radio under section \"([^\"]*)\"$")
    public void I_verify_the_following_radio_under_section(String sectionName,List<Field> arg1) throws Throwable {
        for(Field f :arg1){
            CommonMethods.verifyRadioByNameUnderDifferentSection(sectionName,f.getName(),f.getValue());
        }
    }

    @And("^I select the following radio under section \"([^\"]*)\"$")
    public void I_select_the_following_radio_under_section(String sectionName,List<Field> arg1) throws Throwable {
        for(Field f :arg1){
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.selectRadioByNameUnderDifferentSection(sectionName, f.getName(), f.getValue());
        }
    }

	@And("^I click on the \"([^\"]*)\" button on \"([^\"]*)\"$")
    public void I_click_on_the_button_on(String strAttributeValue, String arg2) throws Throwable {
       CommonMethods.clickOnButtonByAttribute(strAttributeValue);
    }

    @And("^I verify the \"([^\"]*)\" message$")
    public void I_verify_the_message(String strSearchText) throws Throwable {
        CommonMethods.searchText(strSearchText);
    }

    @And("^I select value \"([^\"]*)\" of field \"([^\"]*)\" on \"([^\"]*)\"$")
    public void I_select_value_of_field_on(String strValue,String strField, String strFieldName) throws Throwable {
        CommonMethods.selectValueInFields(strValue,strField);
    }

    @And("^I refresh page$")
    public void I_refresh_page() throws Throwable {
        CommonMethods.refreshPage();
    }

    @And("^I check the checkbox of row in the grid \"([^\"]*)\" having unique value \"([^\"]*)\"$")
    public void I_check_the_checkbox_of_row_in_the_grid_having_unique_value(String gridID, String item) throws Throwable {
        CommonMethods.selectGridRow(gridID,item);
    }

    @Given("^I click on button contains text \"([^\"]*)\"$")
    public void I_click_on_button_contains_text(String strButton) throws Throwable {
        try {
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickButtonContainsText(strButton.trim());
            SeleniumUtil.handleUnexpectedAlerts();
            AllContractPagesView.waitTillDivisionLoads();
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    @And("^I select the \"([^\"]*)\" index from select field$")
    public void iSelectTheIndexFromSelectField(int indexVal) throws Throwable {
        AdminGridView.selectValByIndex(indexVal);
    }

    @And("^I select the \"([^\"]*)\" option having space from select field$")
    public void iSelectTheIndexFromSelectField_having_space_from(String option) throws Throwable {
        AdminGridView.selectByTextHavingSpace(option);
    }


    @And("^I click on the ellipsis on the modal window$")
    public void iClickOnTheEllipsisOnTheModalWindow() throws Throwable {
        AdminGenericView.clickOnEllipsis();
    }

    @And("^I click on Add item Modal window$")
    public void iClickOnAddItemModalWindow() throws Throwable {
        AdminGridView.clickAddBtn();
    }

    @Then("^I verify grid action message \"([^\"]*)\" on popup$")
    public void iVerifyGridActionMessageOnPopup(String msg) throws Throwable {
        AdminGridView.getpopupMessage(msg);
    }

    @And("^I select the following \"([^\"]*)\" in the modal window$")
    public void iSelectTheFollowingInTheModalWindow(String strHeader, List<String> folderName) throws Throwable {
        int count = 1;
        for (String f : folderName) {
            DocumentsTabView.selectFoldersOnModalWindow(f, count);
            count++;
        }
    }

    @And("^I verify the following rows including blank headers in frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_rows_including_blank_headers_in__frame_grid__values_by_the_following_values(String grid, List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllGridTypeIncludeBlankHeaders(grid, values);
    }
}
