package com.lucernex.qa.views.iwms.adminpages.companyadministration.managecustomlist;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.iwms.adminpages.companyadministration.managecustomlist.CustomListPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class CustomListView {
    protected static final CustomListPage customListPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), CustomListPage.class);
    private static final Logger logger = Logger.getLogger(Logger.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void moveNumericValue() {
        try {
            customListPage.moveNumericField.click();
        } catch (Exception e) {
            BaseView.takeScreenshot("MoveNumericFieldError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void moveSelectedValue() {
        try {
            customListPage.moveSelectedField.click();
        } catch (Exception e) {
            BaseView.takeScreenshot("MoveSelectedFieldError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void selectCLFields(List<String> clFields) throws Throwable {
        for (String s : clFields) {
            try {
                SeleniumUtil.select("cssSelector", "select[name^='selectBoxHeader']", s, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("cssSelector", "input[value='Save Layout']", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.takeScreenshot("FailedToSelect.png");
                Assert.fail("Failed to select " + e.getMessage());
            }
        }
    }

    public static void addLineItem() {
        try {
            customListPage.addLineItem.click();
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickaddLineItemError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addLineItemsToForm() {
        try {
            List<WebElement> addBtns = BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='Add']"));
            SeleniumUtil.waitForElementIsClickable(addBtns.get(1), 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click(addBtns.get(1), SeleniumUtilities.OBJWAITTIMEOUT);
//            addBtns.get(1).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickaddLineItemError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void enterLabelName(String name) {
        try {
            customListPage.labelName.sendKeys(name);
        } catch (Exception e) {
            BaseView.takeScreenshot("FailedToAddLabelName.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void verifyUniqueGridRow(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        boolean found = false;
        WebElement fixRow = null;
        WebElement fixCol = null;
        int colIndex = 0;
        WebElement gridElement = null;
        String strElement;

        if (gridID.contains("^"))
            strElement = "div[id^='" + gridID.replace("^", "") + "']";
        else
            strElement = "div[id='" + gridID + "']";

        /*if (gridID.contains("^")) {
            gridID = gridID.replace("^","");
            //Focusing the grid
            try{
                SeleniumUtil.moveToElement("cssSelector","div[id^='" + gridID + "']",SeleniumUtilities.OBJWAITTIMEOUT);
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='" + gridID + "']")).sendKeys("");
            }catch(Exception e){

            }
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='" + gridID + "']"));
        }else{
            //Focusing the grid
            try{
                SeleniumUtil.moveToElement("cssSelector","div[id='" + gridID + "']",SeleniumUtilities.OBJWAITTIMEOUT);
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
            }catch(Exception e){

            }

        }
*/
        AllContractPagesView.moveToElementAndFocus(strElement);
        gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                if (td.getText().trim().equalsIgnoreCase(uniqueValue.trim())) {
                    fixRow = BrowserDriver.getParent(td);
                    fixCol = td;

                    try {
                        //Traverse cells value now
                        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        Assert.assertTrue("Expected cell value " + uniqueValue + "is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(uniqueValue));
                        Assert.assertTrue("Expected cell value " + uniqueValue + "is not present under Column header" + header, headers.get(colIndex - 1).getText().contains(header));
                        logger.info("Cell value " + uniqueValue + "is present under Column header" + header);
                        found = true;
                        break;
                    } catch (Exception e) {

                    }
                }
            }
            if (found) {
                break;
            }
        }

        if (!found) {
            Assert.fail("Final Expected " + uniqueValue + " is not present under column header" + header);
        }
        //Traverse cells value now
        int headerCount = 0;
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
        for (Field f : fields) {
            assertEquals(headers.size(),
                    fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
            logger.info("Row cells are same as header cells");

            Assert.assertTrue("Expected cell value " + f.getValue() + "is not present under Column header " + f.getName(), cells.get(headerCount).getText().contains(f.getValue()));
            Assert.assertTrue("Expected cell value " + f.getValue() + "is not present under Column header" + f.getName(), headers.get(headerCount).getText().contains(f.getName()));
            logger.info("Cell value " + f.getValue() + "is present under Column header" + f.getName());
            headerCount++;
        }
    }

    public static void verifyGridRowNotPresent(String gridID, String uniqueValue) throws Throwable {
        WebElement fixRow = null;
        WebElement gridElement = null;

        if (gridID.contains("^")) {
            gridID = gridID.replace("^", "");
            //Focusing the grid
            try {
                SeleniumUtil.moveToElement("cssSelector", "div[id^='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='" + gridID + "']")).sendKeys("");
            } catch (Exception e) {

            }
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='" + gridID + "']"));
        } else {
            //Focusing the grid
            try {
                SeleniumUtil.moveToElement("cssSelector", "div[id='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
            } catch (Exception e) {

            }
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        }
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().contains(uniqueValue)) {
                    Assert.fail("Expected row present in the grid");
                }
            }
        }
        logger.info("Expected row not present in the grid");
    }

    public static void expandTheSummaryInformationGroup() {
        try {
            List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//font[./text()='Summary Information']/preceding-sibling::img"));


            Actions builder = new Actions(BrowserDriver.getCurrentDriver());
            builder.click(ele.get(ele.size() - 1)).perform();

        } catch (Exception e) {
            BaseView.takeScreenshot("expandTheSummaryInformationGroup.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void expandDataFields(List<String> fieldNames) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (String fieldName : fieldNames) {
            try {

                List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr[contains(@class,'row')][not(@style='display:none')]//font[./text()='" + fieldName + "']/preceding-sibling::img"));
                if (ele.get(ele.size() - 1).getAttribute("src").contains("plus.gif")) {
                    AllContractPagesView.focusWebElement(ele.get(ele.size() - 1));
                    Actions builder = new Actions(BrowserDriver.getCurrentDriver());
                    builder.click(ele.get(ele.size() - 1)).perform();
                    CommonMethods.waitTillDivisionLoads();
                }

            } catch (Exception e) {
                BaseView.takeScreenshot("expandTheSummaryInformationGroup.png");
                fail("Failed to click " + e.getMessage());
            }
        }
    }

    public static void collapseDataFields(List<String> fieldNames) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (String fieldName : fieldNames) {
            try {

                List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr[contains(@class,'row')][not(@style='display:none')]//font[./text()='" + fieldName + "']/preceding-sibling::img"));
                if (ele.get(ele.size() - 1).getAttribute("src").contains("minus.gif")) {
                    CommonMethods.waitTillDivisionLoads();AllContractPagesView.focusWebElement(ele.get(ele.size() - 1));
                    Actions builder = new Actions(BrowserDriver.getCurrentDriver());
                    builder.click(ele.get(ele.size() - 1)).perform();
                    CommonMethods.waitTillDivisionLoads();
                }

            } catch (Exception e) {
                BaseView.takeScreenshot("expandTheSummaryInformationGroup.png");
                Assert.fail("Failed to click " + e.getMessage());
            }
        }
    }

    public static void chooseCustomListType() {
        try {
//            WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.xpath(".//font[./text()='Choose Custom List Type']/preceding-sibling::input"));
//            Actions builder = new Actions(BrowserDriver.getCurrentDriver());
//            builder.click(ele).perform();
            SeleniumUtil.click("xpath",".//font[./text()='Choose Custom List Type']/preceding-sibling::input",SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("chooseDropDownType.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addFieldForTheCustomListsGroup() {
        try {
            SeleniumUtil.waitForNonStaleWebElement("xpath", ".//*[./text()='Custom Lists']/parent::td/following-sibling::td[10]/a",8,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='Custom Lists']/parent::td/following-sibling::td[10]/a",20, SeleniumUtilities.OBJWAITTIMEOUT);

            SeleniumUtil.selectHitEnterKey("xpath", ".//*[./text()='Custom Lists']/parent::td/following-sibling::td[10]/a", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("addFieldForTheCustomListsGroup.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addFieldForTheCustomListsGroup(String group) {
        try {
//            SeleniumUtil.click("xpath", "(//*[./text()='"+group+"'])[2]/../following-sibling::td/a[text()='Add Field']",SeleniumUtilities.OBJWAITTIMEOUT);
            WebElement element = SeleniumUtil.getWebElementObject("xpath", "(//*[./text()='Address Info'])[2]/../following-sibling::td/a[text()='Add Field']");
            element.findElement(By.linkText("Add Field")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("addFieldForTheCustomListsGroup.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addFieldForTheCustomListsGroup(String field, String group) {
        try {
            WebElement element = null;
            BaseView.pushShortTimeout();
            try {
                element = SeleniumUtil.getWebElementObject("xpath", "//*[./text()='" + group + "']/parent::td/parent::tr[@class='rowColor1'][not(@style='display:none')]");
            } catch (Exception e) {
                element = SeleniumUtil.getWebElementObject("xpath", "//*[./text()='" + group + "']/parent::td/parent::tr[@class='rowHighLite'][not(@style='display:none')]");
            }
            AllContractPagesView.focusWebElement(element.findElement(By.linkText(field)));
            element.findElement(By.linkText(field)).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("addFieldForTheCustomListsGroup.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }


    public static void addButton() {
        try {
            SeleniumUtil.click("id", "submitButton", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("addButton.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addGridButton() {
        try {
            SeleniumUtil.getFrameIndex("xpath", ".//span[./text()='Add']");
            SeleniumUtil.click("xpath", ".//span[./text()='Add']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("addGridButton.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void updateGridButton() {
        try {
            SeleniumUtil.getFrameIndex("xpath", ".//span[./text()='Update']");
            SeleniumUtil.click("xpath", ".//span[./text()='Update']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("updateGridButton.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void clickOnExpenseAllocationOrganizationID() {
        try {
            SeleniumUtil.click("cssselector", "*[id^='ExpenseAllocation_OrganizationID'][id*='trigger-info']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnExpenseAllocationOrganizationID.png");
            Assert.fail("Failed to click " + e.getMessage());
        }

    }

    public static void verifyOrgInfoInPopup(List<Field> fields) {
        try {
            //delay(2000);
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                try {
                    SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue());
                } catch (Exception ex) {
                    BaseView.takeScreenshot(f.getValue() + ".png");
                    logger.info("Error :" + ex.getMessage());
                }
            }
            SeleniumUtil.switchTodefaultContent();

        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_values_on_non_editable_summary_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void checkCustomListRadio(String gridID, List<String> labels) {
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        for (String label : labels) {
            try {
                gridElement.findElement(By.xpath("//*[text()='" + label + "']/preceding-sibling::input[@*='radio'][1]")).click();
                return;
            } catch (Exception Ex) {
                BaseView.takeScreenshot("UnableToSelectCheckBoxByLabel.png");
                logger.info("Error :" + Ex.getMessage());
                fail("Error :" + Ex.getMessage());
            }
        }
    }

    public static void clickDotDotField(String name) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
           /* BrowserDriver.getCurrentDriver()
                    .findElement(By.cssSelector("div[id^='" + name + "'] a")).click(); */
            BrowserDriver.getCurrentDriver()
                    .findElement(By.cssSelector("div[id^='" + name + "'][id$='-trigger-options']")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToclickTypeField.png");
        }
    }

    public static void expandDataSubFields(List<String> fieldNames) throws Throwable{
        CommonMethods.waitTillDivisionLoads();
        for(String fieldName: fieldNames){
            try{
                List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//font[./text()='"+fieldName+"']/preceding-sibling::img"));
//                Actions builder = new Actions(BrowserDriver.getCurrentDriver());
//                builder.click(ele.get(ele.size()-2)).perform();
                SeleniumUtil.click(ele.get(ele.size()-2),SeleniumUtilities.OBJWAITTIMEOUT);
                CommonMethods.waitTillDivisionLoads();
            }catch(Exception e){
                BaseView.takeScreenshot("expandTheSummaryInformationGroup.png");
                Assert.fail("Failed to click " + e.getMessage());
            }
        }
    }

    public static void addFieldForTheCustomListGroup(String group) {
        try {
            AllContractPagesView.focusWebElement(BrowserDriver.getCurrentDriver().findElement(By.xpath("(//*[./text()='"+group+"'])[2]/../following-sibling::td/a[text()='Add Field']")));
            SeleniumUtil.click("xpath", "(//*[./text()='"+group+"'])[2]/../following-sibling::td/a[text()='Add Field']",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("addFieldForTheCustomListGroup.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void selectRadioButtonInCustomListFiled(String strRadioCaption) throws Throwable {
        try {
            if (strRadioCaption.equals("Yes")) {
                try {
                    SeleniumUtil.click("cssselector", "input[value='true'][name='CltExtClientListRow__Values1']", SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception ee) {
                }

            }

            if (strRadioCaption.equals("No")) {
                try {
                    SeleniumUtil.click("cssselector", "input[value='false'][name='CltExtClientListRow__Values1']", SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception ee) {
                }
            }

        } catch (Exception ex) {
            BaseView.takeScreenshot("selectRadioButton");
            fail("Unable to click radio");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void openDocUploadWinOnFormCustomList() {
        try {
            try {
                SeleniumUtil.click("xpath", "//div[contains(@id, 'displayfield')]/preceding-sibling::div[contains(@id,'ext-comp')]//div[2]", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Unable to open document upload" + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void clickAndEditCustomListReport() {
        try {
            SeleniumUtil.mouseOver("cssSelector","table[id^='ClientListRow']",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssSelector",".editableTextImg",SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("td.x-grid-cell")).click();
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("clickAndEditCustomListReport");
        }
    }

    public static void clickOnCustomListInReport() {
        try {
            SeleniumUtil.mouseOver("cssSelector","table[id^='ClientListRow']",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssSelector",".editableTextImg",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("clickAndEditCustomListReport");
        }
    }
}