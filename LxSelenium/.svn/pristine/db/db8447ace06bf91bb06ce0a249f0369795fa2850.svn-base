package com.lucernex.qa.views.iwms.adminpages.costmanagement;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.FileUpload;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.admin.AdminPageView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static org.eclipse.persistence.jpa.jpql.Assert.fail;
import static org.junit.Assert.assertEquals;

/**
 * Created by rle0239 on 02-05-2016.
 */
public class BudgetTemplateView {
    private static int defaultWaitTime = 30;
    private String dataFolder = null;
    private static final Logger logger = Logger.getLogger(BudgetTemplateView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void verifyCSICode( List<List<String>> data) throws Throwable {
     /*   String localPath = new File(GenericSteps.publicDataFolder).getAbsolutePath();
        SpreadsheetUtils anotherExcel = new SpreadsheetUtils(new File(localPath));
        Spreadsheet excel = new Spreadsheet(new File(localPath));

        for (List<String> row : data) {
            BaseView.pushShortTimeout();
            CommonMethods.setFields(row.get(0), row.get(1));

            for (int i = Integer.parseInt(row.get(2)); i <= Integer.parseInt(row.get(3)); i++) {
                String value = "";
                try {
                    value = excel.getCellValue(subDivision, i, Spreadsheet.Type.TEXT).toString();
                    logger.info(value);
                    BaseView.pushShortTimeout();
                    CommonMethods.selectFromComboBox(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='CodeCSIID_']")), value);
                } catch (NullPointerException e) {
                    value = anotherExcel.getCellValue(subDivision, i);
                    CommonMethods.selectFromComboBox(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='CodeCSIID_']")),value);
                }finally {
                    try{
                        BaseView.pushShortTimeout(2);
                        BrowserDriver.getCurrentDriver().findElement(By.xpath("/*//*[contains(text(),'" + value + "')]"));
                    }catch(Exception ee){
                        logger.info("Unable to find the option in field "+value+" under division\n"+row.get(1));
                        fail("drop down values not present"+value);
                    }
                    BaseView.popDefaultTimeout();
                }
            }
        }*/

        for (List<String> row : data) {
            BaseView.pushShortTimeout();
            CommonMethods.setFields(row.get(0), row.get(1));

            try {
                BaseView.pushShortTimeout();
                CommonMethods.selectFromComboBox(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='CodeCSIID_']")), row.get(2));
            } finally {
                try {
                    BaseView.pushShortTimeout(3);
                    BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[contains(text(),'" + row.get(2) + "')]"));
                } catch (Exception ee) {
                    logger.info("Unable to find the option in field " + row.get(2) + " under division\n" + row.get(1));
                    BaseView.switchToSecondWindowToClose();
                    fail("drop down values not present" + row.get(2));
                }
                BaseView.popDefaultTimeout();
            }
        }
    }

    public static void selectLineItemCode(String lineItem) throws Throwable {
        int count = 0;
        Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name("BudgetLineItemID")));
        do {
            count++;
            SeleniumUtil.click("name", "BudgetLineItemID", 5);
            OrgChartView.waitTillModalWindowToOpen();
            AdminPageView.clickLink(lineItem);
        } while (!select.getFirstSelectedOption().getText().trim().equals(lineItem) && count < 10);
        try {
            assertEquals(lineItem + " option is not selected", select.getFirstSelectedOption().getText().trim(), lineItem);
            logger.info(lineItem + " option is selected");
        } catch (AssertionError ae) {
            BaseView.takeScreenshot(lineItem + " option is not selected.png");
            fail(lineItem + " option is not selected");
        }
    }

    public static void verifyBudgetLineItemsOrder(String gridID, List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        SeleniumUtil.waitForElementPresent("cssselector", strElement);
        WebElement gridElement = SeleniumUtil.getWebElementWithoutStaleness("cssselector", strElement);
//        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("tr.tblHeader td"));
        int index = 1;

        List<WebElement> rows = new ArrayList<>();
        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr.rowColor1")).size() > 0) {
                rows = gridElement.findElements(By.cssSelector("tr.rowColor1"));
                //rows = gridElement.findElements(By.xpath("//tr[@class='rowColor1'][not(contains(@style,'display: none;'))]"));
            }
        } finally {
            BaseView.popDefaultTimeout();
        }

        assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

        for (int j = 0; j < gridValues.size() - 1; j++) {
            if (rows.get(j).isDisplayed()) {
                for (int i = 0; i < gridHeaders.size(); i++) {
                    if (headers.get(i).getText().equals(gridHeaders.get(i))) {

                        AllContractPagesView.focusWebElement(headers.get(i));
                        String headerValue = headers.get(i).getText();

                        AllContractPagesView.focusWebElement(rows.get(j).findElements(By.cssSelector("td")).get(i));
                        String cellValue = AllContractPagesView.getTextAndByPassException(rows.get(j).findElements(By.cssSelector("td")).get(i));
                        assertEquals("Expected " + cellValue + " is not present under header " + headerValue + " row:" + j + " column:" + i, cellValue.trim(), gridValues.get(index).get(i));
                        logger.info("Expected " + cellValue + " is present under header " + headerValue + " row:" + j + " column:" + i);
                    }
                }
                index++;
            }
        }
    }

    public static void clickArrows(String arrow, String lineItem) throws Throwable {
        try {
            SeleniumUtil.click("xpath", "//*[text()='" + lineItem + "']//ancestor::td[1]//following-sibling::td//*[contains(@src,'" + arrow + "')]", 5);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click down arrow");
        }

    }

    public static void createMathField() throws Throwable {
        try {
            SeleniumUtil.click("cssselector", "newcell[id^=extdd-]", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", "mathfield-textEl", SeleniumUtilities.OBJWAITTIMEOUT);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to create Math Field");
        }
    }

    public static void verifyBudgetName(String strText) throws Throwable {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//*[.='" + strText + "']", strText, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify budget name");
        }
    }

    public static void verifyBudgetNameTotal(String strText, String strTotal) throws Throwable {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//*[.='" + strText + "']/following-sibling::td[4]", strTotal, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify budget name");
        }
    }

    public static void clickOnValueofBudgetName(String strText, String strAction) throws Throwable {
        try {
            SeleniumUtil.click("xpath", ".//*[.='" + strText + "']/following-sibling::td[6]/a[contains(.,'" + strAction + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click on budget name of values");
        }
    }

    public static void enterValueOfBudgetName(String strText, String strValue) throws Throwable {
        try {
            SeleniumUtil.dblClick("xpath", ".//td[.='" + strText + "']/following-sibling::td[5]", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("cssselector", ".x-form-field.x-form-text.x-form-text-default.x-form-focus.x-field-form-focus.x-field-default-form-focus", strValue, SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to enter value in budget name");
        }
    }

    public static void verifyBudgetTemplate(String strBudgetName, String strItemName, String strBuildingCost, String strInstallation, String strInvestmentfactors, String strMathBudget, String strBuildingCostxInvestmentfactors, String strInstallationPercent, String strTotalAll) throws Throwable {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[2]", strBuildingCost, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[3]", strInstallation, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[4]", strInvestmentfactors, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[5]", strMathBudget, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[6]", strBuildingCostxInvestmentfactors, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[7]", strInstallationPercent, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strBudgetName + "']/parent::tr/following-sibling::tr/td[contains(./text(),'" + strItemName + "')]/following-sibling::td[8]", strTotalAll, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify budget template");
        }
    }

    public static void verifyBudgetTemplate(String strBuildingCost, String strInstallation, String strInvestmentfactors, String strMathBudget, String strBuildingCostxInvestmentfactors, String strInstallationPercent, String strTotalAll) throws Throwable {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[2]", strBuildingCost, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[3]", strInstallation, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[4]", strInvestmentfactors, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[5]", strMathBudget, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[6]", strBuildingCostxInvestmentfactors, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[7]", strInstallationPercent, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//td/b[./text()='Total']/parent::td/parent::tr/td[8]", strTotalAll, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify total budget template");
        }
    }

    public static void clickOnNumbericContantButton() throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "input[id='optNC']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[id='optNC']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click On Numberic Contant Button");
        }
    }

    public void uploadBudgetTemplate(String dataDir, String fileName) throws Throwable {
        try {
            FileUpload.setWindowFocus();
            dataFolder = dataDir;
            SeleniumUtil.click("name", "filename", 5);

            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

            logger.info("Upload custom list values " + fileName);
            Thread.sleep(10000);
            File file = new File(dir, fileName);
            String f = file.getPath();
            FileUpload.fileUpload(f.replace("/", "\\"));
            org.junit.Assert.assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
            Thread.sleep(20000);


        } catch (Exception e) {
            BaseView.takeScreenshot("I_attach_following_schedule_document_files_from_.png");
            Assert.fail("uploadBudgetTemplate");
        }
    }

    public static void verifyAddedField(String strField) throws Throwable {
//        try{
//            SeleniumUtil.waitUntilElementContainsText("cssselector", "div[class='optionalFieldLabel']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
//            boolean flag=false;
//            List<WebElement> eles= SeleniumUtil.getWebElementObjects("cssselector", "div[class='optionalFieldLabel']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
//            for(WebElement ele:eles){
//                if(ele.getText().contains(strField)){
//                    flag=true;
//                    return;
//                }
//            }
//            org.junit.Assert.assertTrue(flag);
//        }catch(Exception e){
//            BaseView.takeScreenshot("Unable to verify Added Field !!!");
//        }
    }

    public static void verifyImportSummaryPage(String strNoofBudgetLineItem, String strBudgetLineItemName, String strNoofBudgetTemplate, String strBudgetTemplateName, String strNoofTotalsName, String strNoofTotals) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//td[contains(./text(),'" + strBudgetLineItemName + "')]/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//td[contains(./text(),'" + strBudgetLineItemName + "')]/following-sibling::td[3]", strNoofBudgetLineItem, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//td[contains(./text(),'" + strBudgetTemplateName + "')]/following-sibling::td[3]", strNoofBudgetTemplate, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strNoofTotalsName + "')]/parent::td/following-sibling::td[3]", strNoofTotals, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify Import Summary Page");
        }
    }

    public static void verifyImportProgressbarStatus(String strProgressbarStatus) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("id", "progressBar-bar", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("id", "progressBar-bar", strProgressbarStatus, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify Import Progressbar Status");
        }
    }

    public static void verifyTheLineItemCode(String strName, String strLineItemCode, String strDefaultAmount) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//a[./text()='" + strName + "']/parent::td/following-sibling::td[4]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strName + "']/parent::td/following-sibling::td[4]", strLineItemCode, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strName + "']/parent::td/following-sibling::td[7]", strDefaultAmount, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify The Line Item Code");
        }
    }

    public static void clickOnThreeDot() throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "img[src='/en/img/options.gif']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "img[src='/en/img/options.gif']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click on ThreeDot");
        }
    }

    public static void clickOnOkButton() throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "input[value*='OK']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value*='OK']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click on clickOnOkButton");
        }
    }

    public static void clickOnlinkofRow(String strName,String strLink) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strName+"']/following-sibling::td//a[./text()='"+strLink+"']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='"+strName+"']/following-sibling::td//a[./text()='"+strLink+"']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click on clickOnlinkofRow");
        }
    }

    public static void enterValueInBudgetRow(String strBudgetname, String strQuantity, String strBudgetCost) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id^='customListGrid'] input[role='combobox']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles=SeleniumUtil.getWebElementObjects("cssselector", "div[id^='customListGrid'] input", 8, SeleniumUtilities.OBJWAITTIMEOUT);

            SeleniumUtil.click(eles.get(0),SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector","div[id$='-trigger-picker']",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("linktext",strBudgetname,SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.type(eles.get(0),strBudgetname,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type(eles.get(1), strQuantity, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type(eles.get(2),strBudgetCost,SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click on enterValueInBudgetRow");
        }
    }

    public static void verifyText(String strText) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//div[@id='IsEnabledLxJSCode_label']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//div[@id='IsEnabledLxJSCode_label']/parent::td", strText, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click on verifyText");
        }
    }

}