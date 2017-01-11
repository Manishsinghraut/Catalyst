package com.lucernex.qa.utils;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import org.apache.poi.ss.usermodel.*;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.io.File;
import java.text.ParseException;
import java.util.*;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0097
 */
public class GridUtils {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final Logger logger = Logger.getLogger(GridUtils.class.getName());

    /*    Method is used to select specific element from the grid
    @param strlocator: grid object locator
    @param strElement: object description
    @param strSearchValueInRows : Search value in grid rows
    @param intSearchValueInRowCol : Search value in grid rows specific column
    @param strAction : click on specified link*/

    public static void executeSpecificRowAction(String strLocator, String strElement, String strSearchValueInRows, int intSearchValueInRowCol, String strAction) throws Throwable {
        int col_num = 0;

        //to wait until grid to be loaded in the page, I tried explicit,
        // implicit and fluent wait did not work any of the selenium wait commands,
        // I finally tried with thread.sleep, need to be revisit the below line code
//        delay(8000);
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.waitForNonStaleWebElement(strLocator, strElement, 8, 2);
        SeleniumUtil.waitForElementIsClickable(strLocator, strElement, 8, 2);
        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
        //WebElement grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=BOGrid]");
        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {

            List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
            for (WebElement trElement : rows) {
                col_num = 0;
                List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                for (WebElement tdElement : Cols) {

                    if (col_num == intSearchValueInRowCol) {
                        String strColText = tdElement.getText().trim();

                        if (!isNullOrEmpty(strColText) && strColText.equalsIgnoreCase(strSearchValueInRows)) {

                            SeleniumUtilities.Log.info("Action grid row : " + strColText + " column : " + col_num);

                            List<WebElement> actionLinks = trElement.findElements(By.cssSelector("a"));
                            for (WebElement actionEle : actionLinks) {
                                String label = actionEle.getText().replace("| ", "");

                                if (!isNullOrEmpty(label) && label.contains(strAction)) {
                                    try {
//                                        actionEle.click();
                                        SeleniumUtil.waitForElementVisibilityOf(actionEle, 5, SeleniumUtilities.OBJWAITTIMEOUT);
                                        SeleniumUtil.click(actionEle, SeleniumUtilities.OBJWAITTIMEOUT);
                                        CommonMethods.waitTillDivisionLoads();
                                        SeleniumUtilities.Log.info("clicks on link : " + label + " Column : " + col_num);
                                    } catch (Exception ex) {
                                        CommonMethods.waitTillDivisionLoads();
                                        SeleniumUtilities.Log.error("Error message :" + ex.getMessage() + "\n");
                                    }
                                    return;
                                }
                            }
                        }
                    }
                    col_num++;
                }
            }
        }
    }

    public static void clickOnSpecificColumn(String strLocator, String strElement, String strSearchValueInRows, int intSearchValueInRowCol, String strAction) throws Exception {
        int col_num = 0;

        //to wait until grid to be loaded in the page, I tried explicit,
        // implicit and fluent wait did not work any of the selenium wait commands,
        // I finally tried with thread.sleep, need to be revisit the below line code
//        delay(8000);

//        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
//        //WebElement grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=BOGrid]");
//        List<WebElement> tables = SeleniumUtil.getWebDriver().findElements(By.tagName("table"));

//        for (WebElement tbElement : tables) {
        SeleniumUtil.waitForElementVisibilityOf("xpath", strElement, 8, 2);
        List<WebElement> rows = SeleniumUtil.getWebDriver().findElements(By.xpath(strElement));
        for (WebElement trElement : rows) {
            col_num = 0;
            List<WebElement> Cols = trElement.findElements(By.tagName("td"));
            for (WebElement tdElement : Cols) {

                if (col_num == intSearchValueInRowCol) {
                    String strColText = tdElement.getText().trim();

                    if (!isNullOrEmpty(strColText) && strColText.equalsIgnoreCase(strSearchValueInRows)) {

                        SeleniumUtilities.Log.info("Action grid row : " + strColText + " column : " + col_num);

                        List<WebElement> actionLinks = trElement.findElements(By.cssSelector("input[value='" + strAction + "']"));
                        for (WebElement actionEle : actionLinks) {
                            String label = actionEle.getText();//.replace("| ", "");

//                                if (!isNullOrEmpty(label) && label.contains(strAction)) {
                            try {
                                actionEle.click();
                                SeleniumUtilities.Log.info("clicks on link : " + label + " Column : " + col_num);
                            } catch (Exception ex) {
                                SeleniumUtilities.Log.error("Error message :" + ex.getMessage() + "\n");
                            }
                            return;
//                                }
                        }


                    }
                }
                col_num++;
            }
        }
//        }
    }

    public static void selectLastRow(String strLocator, String strElement) throws Throwable {
        int col_num = 0;

        //to wait until grid to be loaded in the page, I tried explicit,
        // implicit and fluent wait did not work any of the selenium wait commands,
        // I finally tried with thread.sleep, need to be revisit the below line code
//        delay(10000)
//        SeleniumUtil.getFrameIndex("id", strElement);

        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.waitForElementVisibilityOf("id", strElement, 5, 2);
        WebElement grid = SeleniumUtil.getClickableWebElementObject("id", strElement);
        List<WebElement> tables = grid.findElements(By.tagName("table"));
        int i = tables.size() - 1;
        tables.get(i).click();
        SeleniumUtilities.Log.info("Action grid row : " + tables.size() + " Row value : " + tables.get(tables.size() - 1).getText());


        SeleniumUtil.switchTodefaultContent();
    }


/*    Method is used to select specific element from the grid
    @param strlocator: grid object locator
    @param strElement: object description
    @param strSearchValueInRows : Search value in grid rows
    @param intSearchValueInRowCol : Search value in grid rows specific column
    @param strAction : click on specified link*/

    public static void selectSpecificRow(String strLocator, String strElement, String strSearchValueInRows, int intSearchValueInRowCol) throws Throwable {
        int col_num = 0;

        //to wait until grid to be loaded in the page, I tried explicit,
        // implicit and fluent wait did not work any of the selenium wait commands,
        // I finally tried with thread.sleep, need to be revisit the below line code
//        delay(10000);

        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.waitForElementVisibilityOf(strLocator, strElement, 5, 2);
        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {

            List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
            for (WebElement trElement : rows) {
                col_num = 0;
                List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                for (WebElement tdElement : Cols) {

                    if (col_num == intSearchValueInRowCol) {
                        String strColText = tdElement.getText().trim();

                        if (!isNullOrEmpty(strColText) && strColText.equalsIgnoreCase(strSearchValueInRows)) {
                            tdElement.click();
                            SeleniumUtilities.Log.info("Action grid row : " + strColText + " column : " + col_num);
                            return;
                        }
                    }
                    col_num++;
                }
            }
        }
    }

    public static boolean verifyRowValues(String strLocator, String strElement, String strSearchRowValues) throws Throwable {
        boolean flag = false;
        CommonMethods.waitTillDivisionLoads();

        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {

            List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
            for (WebElement trElement : rows) {
                if (trElement.getText().contains(strSearchRowValues)) {
                    logger.info(trElement.getText());
                    flag = true;
                    return flag;
                }
            }
        }
        return flag;
    }

    /*    Method is used to validate the grid column value from the grid
    @param strlocator: grid object locator
    @param strElement: object description
    @param strSearchValueInRows : Search value in grid rows
    @param intSearchValueInRowCol : Search value in grid rows specific column
    @param strAction : click on specified link*/

    public static boolean validatedTheColumnsOfTheGrid(String strLocator, String strElement, String strSearchValueInRows, int intSearchValueInRowCol) throws Exception {
        int col_num = 0;
        boolean boolRecordExist = false;

        /*to wait until grid to be loaded in the page, I tried explicit,
        implicit and fluent wait did not work any of the selenium wait commands,
        I finally tried with thread.sleep, need to be revisit the below line code*/

        WebElement grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=BOGrid]");
        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {

            List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
            for (WebElement trElement : rows) {
                col_num = 0;
                List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                for (WebElement tdElement : Cols) {

                    if (col_num == intSearchValueInRowCol) {
                        String strColText = tdElement.getText().trim();

                        if (!isNullOrEmpty(strColText) && strColText.equalsIgnoreCase(strSearchValueInRows)) {
                            SeleniumUtilities.Log.info("Grid type column  : " + strColText + "value exist on column : " + col_num);
                            boolRecordExist = true;
                            return true;
                        }
                    }
                    col_num++;
                }
            }
        }
        if (!boolRecordExist) {
            SeleniumUtilities.Log.error("Grid type column  : " + strSearchValueInRows + "value does not exist on column : " + col_num);
            return false;
        } else
            return true;
    }

    public static boolean validateSpecificRowOfTheGridValue(String strLocator, String strElement, int intSearchRowNumber, String strHeaderName, String strCellValue) throws Exception {
        int col_num = 0, intTableCount = 0, intSearchHeaderCellNo = 0;
        boolean boolRecordExist = false, boolSearchHeaderCellNo = false;

        /*to wait until grid to be loaded in the page, I tried explicit,
        implicit and fluent wait did not work any of the selenium wait commands,
        I finally tried with thread.sleep, need to be revisit the below line code*/
//        delay(5000);
        WebElement grid;

        //Not searching child elements
        if (isNullOrEmpty(strElement)) {
            SeleniumUtil.getFrameIndex("cssselector", "div[id^=BOGrid]");
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id^=BOGrid]", 5, 2);
            grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=BOGrid]");
        } else if (strElement.contains("WF^")) {
            SeleniumUtil.switchTodefaultContent();
            strElement = strElement.replace("WF^", "");
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id^=" + strElement + "]", 5, 2);
            grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=" + strElement + "]");
        } else if (strElement.contains("^")) {
            strElement = strElement.replace("^", "");
            SeleniumUtil.getFrameIndex("cssselector", "div[id^=" + strElement + "]");
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id^=" + strElement + "]", 5, 2);
            grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=" + strElement + "]");
        } else {
            SeleniumUtil.getFrameIndex("cssselector", "div[id=" + strElement + "]");
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id=" + strElement + "]", 5, 2);
            grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id=" + strElement + "]");
        }
        List<WebElement> getHeaderGridCellName = grid.findElements(By.cssSelector("span[class='x-column-header-text-container']"));

        for (int i = 0; i < getHeaderGridCellName.size(); i++) {
            if (getHeaderGridCellName.get(i).getText().equals(strHeaderName)) {
                intSearchHeaderCellNo = i;
                boolSearchHeaderCellNo = true;
                break;
            }
            if (boolSearchHeaderCellNo) break;
        }

        if (!boolSearchHeaderCellNo) {
            return false;
        }

        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {
            if (intTableCount == (intSearchRowNumber - 1)) {
                List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
                for (WebElement trElement : rows) {
                    col_num = 0;
                    List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                    for (WebElement tdElement : Cols) {

                        if (col_num == intSearchHeaderCellNo) {
                            String strColText = tdElement.getText().trim();

                            strColText = SeleniumUtil.replaceSpecialChar(strColText);
                            if (!isNullOrEmpty(strColText) && (strColText.equalsIgnoreCase(strCellValue) || strColText.contains(strCellValue) || strCellValue.contains(strColText))) {
                                SeleniumUtilities.Log.info("Grid type column  : " + strColText + "value exist on column : " + col_num);
                                boolRecordExist = true;
                                return true;
                            }
                        }
                        col_num++;
                    }
                }
            }
            intTableCount++;
        }
        SeleniumUtil.switchTodefaultContent();
        if (boolRecordExist == false) {
            BaseView.takeScreenshot("Grid type column  : " + strCellValue + "value does not exist on column : " + col_num + ".png");
            SeleniumUtilities.Log.error("Grid type column  : " + strCellValue + "value does not exist on column : " + col_num);
            return false;
        } else
            return true;
    }


    public static boolean clickSpecificColumnInGrid(String strTagName, String strActionLabel, String strSearchValueInRows, int intSearchValueInRowCol, String strLocator, String strElement) throws Exception {
        int col_num = 0;
        boolean flag = false;
        /*to wait until grid to be loaded in the page, I tried explicit,
        implicit and fluent wait did not work any of the selenium wait commands,
        I finally tried with thread.sleep, need to be revisit the below line code*/
//        delay(8000);
        SeleniumUtil.waitForElementVisibilityOf(strLocator, strElement, 8, 2);
        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
        List<WebElement> tables = grid.findElements(By.tagName("table"));
        for (WebElement tbElement : tables) {

            List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
            for (WebElement trElement : rows) {
                col_num = 0;
                List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                for (WebElement tdElement : Cols) {

                    if (col_num == intSearchValueInRowCol) {
                        String strColText = tdElement.getText().trim();

                        if (!isNullOrEmpty(strColText) && strColText.equalsIgnoreCase(strSearchValueInRows)) {

                            SeleniumUtilities.Log.info("Action grid row : " + strColText + " column : " + col_num);

                            List<WebElement> tagEle = trElement.findElements(By.tagName(strTagName));
                            for (WebElement actionEle : tagEle) {
                                if (!isNullOrEmpty(strActionLabel)) {
                                    String label = actionEle.getText().replace("| ", "");

                                    if (!isNullOrEmpty(label) && label.contains(strActionLabel)) {
                                        try {
                                            actionEle.click();
                                            flag = true;
                                            SeleniumUtilities.Log.info("clicks on link : " + label + " Column : " + col_num);
                                        } catch (Exception ex) {
                                            BaseView.takeScreenshot(strActionLabel + ".png");
                                            flag = false;
                                            SeleniumUtilities.Log.error("Error message :" + ex.getMessage() + "\n");
                                        }
                                        return flag;
                                    }
                                } else {
                                    try {
                                        tagEle.get(0).click();
                                        SeleniumUtilities.Log.info("clicks on element : " + trElement.getText() + " Column : " + col_num);
                                        flag = true;
                                    } catch (Exception ex) {
                                        BaseView.takeScreenshot(strActionLabel + ".png");
                                        flag = false;
                                        SeleniumUtilities.Log.error("Error message :" + ex.getMessage() + "\n");
                                    }
                                    return flag;
                                }

                            }

                        }
                    }
                    col_num++;
                }
            }
        }
        if (!flag) {
            BaseView.takeScreenshot(strActionLabel + ".png");
        }
        return flag;
    }

    public static boolean clickSpecificRowOfTheGridValue(String strLocator, String strElement, int intSearchRowNumber, String strHeaderName, String strCellValue) throws Throwable {
        int col_num = 0, intTableCount = 0, intSearchHeaderCellNo = 0;
        boolean boolRecordExist = false, boolSearchHeaderCellNo = false;

        /*to wait until grid to be loaded in the page, I tried explicit,
        implicit and fluent wait did not work any of the selenium wait commands,
        I finally tried with thread.sleep, need to be revisit the below line code*/
//        delay(8000);
        CommonMethods.waitTillDivisionLoads();
        WebElement grid;
        if (isNullOrEmpty(strElement)) {
            SeleniumUtil.getFrameIndex("cssselector", "div[id^=BOGrid]");
            grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=BOGrid]");
        } else {
            SeleniumUtil.getFrameIndex("cssselector", "div[id^=" + strElement + "]");
            grid = SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^=" + strElement + "]");
        }

        List<WebElement> getHeaderGridCellName = grid.findElements(By.cssSelector("span[class='x-column-header-text-container']"));

        for (int i = 0; i < getHeaderGridCellName.size(); i++) {
            if (getHeaderGridCellName.get(i).getText().equals(strHeaderName)) {
                intSearchHeaderCellNo = i;
                boolSearchHeaderCellNo = true;
                break;
            }
            if (boolSearchHeaderCellNo) break;
        }

        if (!boolSearchHeaderCellNo) {
            return false;
        }

        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {
            if (intTableCount == (intSearchRowNumber - 1)) {
                List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
                for (WebElement trElement : rows) {
                    col_num = 0;
                    List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                    for (WebElement tdElement : Cols) {

                        if (col_num == intSearchHeaderCellNo) {
                            String strColText = tdElement.getText().trim();

                            if (!isNullOrEmpty(strColText) && (strColText.equalsIgnoreCase(strCellValue) || strColText.contains(strCellValue))) {
                                tdElement.click();
                                SeleniumUtilities.Log.info("Grid type column  : " + strColText + "value exist on column : " + col_num);
                                boolRecordExist = true;
                                return true;
                            }
                        }
                        col_num++;
                    }
                }
            }
            intTableCount++;
        }
        SeleniumUtil.switchTodefaultContent();
        if (!boolRecordExist) {
            BaseView.takeScreenshot("Grid type column  : " + strCellValue + "value does not exist on column : " + col_num + ".png");
            SeleniumUtilities.Log.error("Grid type column  : " + strCellValue + "value does not exist on column : " + col_num);
            return false;
        } else
            return true;
    }

    public static void verifyGrid(String strLocator, String strElement, int intRowCount, String holidayName, String year, String month, String day) throws Exception {
        int col_num = 0, tableCount = 1;
        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {
            if (tableCount == intRowCount) {
                List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
                for (WebElement trElement : rows) {
                    col_num = 0;
                    List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                    for (WebElement tdElement : Cols) {
                        if (col_num == 0) {
                            String strColText = tdElement.getText().trim();
                            assertTrue(holidayName.contains(strColText));
                        }
                        if (col_num == 1) {
                            String strColText = tdElement.getText().trim();
                            assertTrue(year.contains(strColText));
                        }
                        if (col_num == 2) {
                            String strColText = tdElement.getText().trim();
                            assertTrue(month.contains(strColText));
                        }
                        if (col_num == 3) {
                            String strColText = tdElement.getText().trim();
                            assertTrue(day.contains(strColText));
                            return;
                        }
                        col_num++;
                    }
                }
            }
            tableCount++;
        }
    }

    public static String getGridValue(String strLocator, String strElement, int strSearchValueInRows, int intSearchValueInRowCol) throws Exception {
        int row_num = 0, col_num = 0;

        WebElement grid = SeleniumUtil.getClickableWebElementObject(strLocator, strElement);
        List<WebElement> tables = grid.findElements(By.tagName("table"));

        for (WebElement tbElement : tables) {

            if (row_num == strSearchValueInRows) {
                List<WebElement> rows = tbElement.findElements(By.xpath("./tbody/tr"));
                for (WebElement trElement : rows) {
                    col_num = 0;
                    List<WebElement> Cols = trElement.findElements(By.tagName("td"));
                    for (WebElement tdElement : Cols) {

                        if (col_num == intSearchValueInRowCol) {
                            return tdElement.getText().trim();
                        }
                        col_num++;
                    }
                }
            }
            row_num++;
        }
        return "";
    }

    public static void gridRowVerification(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        int finalCount = 0;
        int getRow = 0;
        int duplicateRows = 0;
        GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = AllContractPagesView.getGridElement(gridID);
        AllContractPagesView.moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        for (WebElement focusEachHeader : headers) {
            AllContractPagesView.focusWebElement(focusEachHeader);
        }
        int pageCount = AllContractPagesView.getPageCount(gridElement);

        for (int page = pageCount; page > 0; page--) {

            Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
            int tables = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']")).size();

            int staleElementCount = 0;
            int rowCount = 0;

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                String cell = "";
                List<String> columnValues = new ArrayList<String>();
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    AllContractPagesView.focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    do {
                        try {
                            cell = td.getText();
                            break;
                        } catch (StaleElementReferenceException se) {
                            staleElementCount++;
                        }
                    } while (!(staleElementCount > 20));
                    columnValues.add(cell);
                }
                cellValues.put(rowCount, columnValues);
                rowCount++;
            }

            int foundCount = 0;

            if (tables > 0) {
                for (int i = 0; i < cellValues.size(); i++) {
                    foundCount = 0;
                    for (int j = 0; j < cellValues.get(i).size(); j++) {
                        AllContractPagesView.focusWebElement(headers.get(j));
                        for (Field f : fields) {
                            if (cellValues.get(i).get(j).trim().equals(f.getValue()) &&
                                    headers.get(j).getText().trim().equals(f.getName())) {
                                foundCount++;
                            }
                        }
                    }

                    if (foundCount == fields.size()) {
                        finalCount = foundCount;
                        getRow = i;
                    }
                }
            }
            AllContractPagesView.clickPage("Next Page");
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected value is not present under column header");
        } else {
            try {
                gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']")).get(getRow).click();
            } catch (Exception e) {
            }
        }
        if (duplicateRows > 1) {
            logger.info("More than 1 line items present of same values");
        }
    }

    public static void findUniqueRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = AllContractPagesView.getGridElement(gridID);
        AllContractPagesView.moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
            AllContractPagesView.clickImportantGridRow(gridID, cellValue, header, fields);
        } else {
            gridRowVerification(gridID, cellValue, header, fields);
        }
    }

    public static List<WebElement> fetchGridLineItems(WebElement gridElement) throws Throwable {
        List<WebElement> rows = new ArrayList<WebElement>();
        try {
            BaseView.pushShortTimeout(1);
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                rows = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"));

            } else if (gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']")).size() > 0) {
                rows = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"));

            } else if (gridElement.findElements(By.cssSelector("tr.rowColor1")).size() > 0) {
                rows = gridElement.findElements(By.cssSelector("tr.rowColor1"));

            } else if (gridElement.findElements(By.cssSelector("tr[id^='ackid_NotifyMember']")).size() > 0) {
                rows = gridElement.findElements(By.cssSelector("tr[id^='ackid_NotifyMember']"));

            } else if (gridElement.findElements(By.xpath("//tr//td[@class='tblHeader']")).size() > 0) {
                rows = gridElement.findElements(By.xpath("//tr//td[@class='tblHeader']//parent::tr//following-sibling::tr"));

            } else if (gridElement.findElements(By.xpath("//tr//td[@class='tblSubHeader']")).size() > 0) {
                rows = gridElement.findElements(By.xpath("//tr//td[@class='tblSubHeader']//parent::tr//following-sibling::tr"));

            }
        } finally {
            BaseView.popDefaultTimeout();
        }
        return rows;
    }

    public static List<WebElement> fetchGridLineItemsManyPages(WebElement gridElement) throws Throwable {
        List<WebElement> newList = new ArrayList<WebElement>();
        int pageCount = AllContractPagesView.getPageCount(gridElement);
        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = new ArrayList<WebElement>();
            try {
                BaseView.pushShortTimeout();
                if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                    rows = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"));

                } else if (gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']")).size() > 0) {
                    rows = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"));

                } else if (gridElement.findElements(By.cssSelector("tr.rowColor1")).size() > 0) {
                    rows = gridElement.findElements(By.cssSelector("tr.rowColor1"));
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
            AllContractPagesView.clickPage("Next Page");
            CommonMethods.waitTillDivisionLoads();
            newList.addAll(rows);
        }
        AllContractPagesView.clickPage("First Page");
        CommonMethods.waitTillDivisionLoads();
        return newList;
    }

    public static List<WebElement> fetchGridHeaders(WebElement gridElement) {
        List<WebElement> headers = new ArrayList<>();
        try {
            BaseView.pushShortTimeout(1);
            if (gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper")).size() > 0) {
                headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

            } else if (gridElement.findElements(By.cssSelector(".tblSpacer .tblHeader")).size() > 0) {
                headers = gridElement.findElements(By.cssSelector(".tblSpacer .tblHeader"));

            } else if (gridElement.findElements(By.xpath("//td[contains(@class,'Header')][not(@class='tblHeader')]")).size() > 0) {
                headers = gridElement.findElements(By.xpath("//td[contains(@class,'Header')][not(@class='tblHeader')]"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblHeader")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblHeader"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblSubHeader")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblSubHeader"));
            }

        } finally {
            BaseView.popDefaultTimeout();
        }
        return headers;
    }

    public static List<WebElement> fetchGridHeaders() {
        List<WebElement> headers = new ArrayList<>();
        try {
            BaseView.pushShortTimeout(1);
            if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".tblSpacer .tblHeader")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".tblSpacer .tblHeader"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblHeader")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblHeader"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//td[contains(@class,'Header')][not(@class='tblHeader')]")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.xpath("//td[contains(@class,'Header')][not(@class='tblHeader')]"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader td")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader td"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader td.optionalFieldLabel")).size() > 0) {
                headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader td.optionalFieldLabel"));
            }

        } finally {
            BaseView.popDefaultTimeout();
        }
        return headers;
    }

    public static List<String> getApplicationHeaders(List<WebElement> headers) throws Throwable {
        List<String> applicationHeaders = new ArrayList<>();

        for (int j = 0; j < headers.size(); j++) {
            BaseView.pushShortTimeout(1);
            focusWebElementIfScrollExist(headers.get(j));
            if (j == 0) {
                applicationHeaders.add(headers.get(j).getText().trim());
            } else if (!headers.get(j).getText().equals("")) {
                applicationHeaders.add(headers.get(j).getText().trim());
            }
        }
        return applicationHeaders;
    }

    public static List<String> getApplicationHeadersDontSkipBlankHedaers(List<WebElement> headers) throws
            Throwable {
        List<String> applicationHeaders = new ArrayList<>();

        for (int j = 0; j < headers.size(); j++) {
            focusWebElementIfScrollExist(headers.get(j));
            applicationHeaders.add(headers.get(j).getText().trim());
        }
        return applicationHeaders;
    }

    public static void printGridItems(List<List<String>> grid) {
        int rowNum = 0;
        for (List<String> lineItem : grid) {
            rowNum = rowNum + 1;
            System.out.println("Row :" + rowNum);
            for (String cell : lineItem) {
                System.out.print(cell + " ");
            }
            System.out.print("\n");
        }
    }

    public static List<List<String>> replaceNewLine(List<List<String>> gridValues) throws Throwable {
        List<List<String>> updatedGridValues = new ArrayList<List<String>>();
        String strValue = "";

        for (List<String> tr : gridValues) {
            List<String> row = new ArrayList<String>();
            for (String td : tr) {
                strValue = "";
                if (td.contains(" \\\n ")) {
                    strValue = td.replace(" \\\n ", "\n");
                    row.add(strValue);
                    logger.info(strValue);
                } else {
                    strValue = td;
                    row.add(strValue);
                    logger.info(strValue);
                }
            }
            updatedGridValues.add(row);
        }
        return updatedGridValues;
    }

    public static List<List<String>> replaceListValuesWithDate(List<List<String>> gridValues) throws Throwable {
        List<List<String>> updatedGridValues = new ArrayList<List<String>>();
        String strValue = "";

        for (List<String> tr : gridValues) {
            List<String> row = new ArrayList<String>();
            for (String td : tr) {
                strValue = "";
                if (td.contains("[Today's Date]")) {
                    strValue = SeleniumUtil.addDaystoCurrentDate(0);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.contains("[Today's Date with Hour]")) {
                    strValue = SeleniumUtil.getCurrentDateWithHour();
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.contains("[Today's Date with Hour AM/PM]")) {
                    strValue = SeleniumUtil.getCurrentDateWithHourIn12HourFormat(0);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.contains("[Yesterday's Date with Hour AM/PM]")) {
                    strValue = SeleniumUtil.getCurrentDateWithHourIn12HourFormat(-1);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.contains("[Duration 30]")) {
                    String value = td.replace("[", "");
                    value = value.replace("]", "");
                    value = value.replace("Duration ", "");
                    int days = Integer.parseInt(value);
                    strValue = SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(days);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.contains("[Duration ")) {
                    String value = td.replace("[", "");
                    value = value.replace("]", "");
                    value = value.replace("Duration ", "");
                    int days = Integer.parseInt(value);
                    strValue = SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(days);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.contains("[Yesterday's Date]")) {
                    strValue = SeleniumUtil.addDaystoCurrentDate(-1);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.equals("[Yesterday's Date with Hour, min and sec]")) {
                    strValue = SeleniumUtil.getCurrentDateWithHourMinSecIn12HourFormat(-1);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.equals("[Today's date with Hour, min and Sec]")) {
                    strValue = SeleniumUtil.getCurrentDateWithHourMinSecIn12HourFormat(0);
                    row.add(strValue);
                    logger.info(strValue);
                } else if (td.equals("[Day Month Date Year Hour:]")) {
                    strValue = SeleniumUtil.getCurrentDateMonthDayHour(0);
                    row.add(strValue);
                    logger.info(strValue);
                } else {
                    row.add(td);
                }
            }

            updatedGridValues.add(row);
        }
        return updatedGridValues;
    }

    public static void containsLineItems(String gridID, List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushShortTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td.x-grid-cell:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                        BaseView.pushMillSecTimeout(10);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        BaseView.pushMillSecTimeout(1);
                        if (row.findElements(By.cssSelector("td.x-grid-cell:nth-of-type(" + index + ") input[type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.cssSelector("td.x-grid-cell:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td.x-grid-cell:nth-of-type(" + index + ")"))).trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage("Next Page");
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }

    public static void assertAllGridTypes(String gridID, List<List<String>> gridValues) throws Throwable {
        AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.xpath("./td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        BaseView.pushMillSecTimeout(1);
                        if (row.findElement(By.xpath("./td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]"))
                                .findElements(By.xpath(".//input[@type='checkbox']")).size() > 0) {
                            BaseView.pushMillSecTimeout(1);
                            String value = row.findElement(By.xpath("./td[" + index + "]//input[@type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            String value = AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.xpath("./td[" + index + "]"))).trim();
                            if (value.contains(" PM") || value.contains(" AM")) {
                                String[] date = value.split(":");
                                value = date[0];
                                String[] amOrPm = date[2].split("\\s");
                                value = value + " " + amOrPm[1];

                            } else if (value.contains(":") && value.contains("GMT")) {
                                String[] date = value.split(":");
                                value = date[0] + ":".trim();
                            }
                            lineItem.add(value.trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

    public static void assertFalseAllGridTypes(String gridID, List<List<String>> gridValues) throws Throwable {
        AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.xpath("./td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        BaseView.pushMillSecTimeout(1);
                        if (row.findElement(By.xpath("./td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]"))
                                .findElements(By.xpath(".//input[@type='checkbox']")).size() > 0) {
                            BaseView.pushMillSecTimeout(1);
                            String value = row.findElement(By.xpath("./td[" + index + "]//input[@type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            String value = AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.xpath("./td[" + index + "]"))).trim();
                            if (value.contains(" PM") || value.contains(" AM")) {
                                String[] date = value.split(":");
                                value = date[0];
                                String[] amOrPm = date[2].split("\\s");
                                value = value + " " + amOrPm[1];

                            } else if (value.contains(":") && value.contains("GMT")) {
                                String[] date = value.split(":");
                                value = date[0] + ":".trim();
                            }
                            lineItem.add(value.trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

  /*  public static void assertFalseAllGridTypes(String gridID, List<List<String>> gridValues) throws Throwable {
        AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    focusWebElementIfScrollExist(row.
                            findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                    lineItem.add(AllContractPagesView.getTextAndByPassException
                            (row.findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")"))).trim());
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage("Next Page");
            CommonMethods.waitTillDivisionLoads();
        }

        if (grid.containsAll(gridValues.subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }*/

    public static boolean reachElementUp(WebElement element) {
        boolean exist = false;
        try {
            BaseView.pushVeryShortTimeout();
            Actions action = new Actions(BrowserDriver.getCurrentDriver());
            for (int i = 0; i < 100; i++) {
                try {
                    action.sendKeys(Keys.ARROW_UP).build().perform();
                    try {
                        element.isDisplayed();
                        exist = true;
                        break;
                    } catch (Exception e) {
                    }
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        } finally {
            BaseView.popDefaultTimeout();
        }
        return exist;
    }

    public static boolean reachElementDown(WebElement element) {
        boolean exist = false;
        try {
            BaseView.pushVeryShortTimeout();
            Actions action = new Actions(BrowserDriver.getCurrentDriver());
            for (int i = 0; i < 100; i++) {
                try {
                    action.sendKeys(Keys.ARROW_DOWN).build().perform();
                    try {
                        element.isDisplayed();
                        exist = true;
                        break;
                    } catch (Exception e) {
                    }
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        } finally {
            BaseView.popDefaultTimeout();
        }
        return exist;
    }

    public static void focusWebElementIfScrollExist(WebElement ele) throws Throwable {
        try {
            if (reachElementUp(ele)) {
            } else {
                reachElementDown(ele);
            }
        } catch (Exception ee) {
        }
    }

    public static void isGridEmpty(String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        try {
            gridElement.findElement(By.cssSelector(".x-grid-empty"));
            logger.info(gridID + " Grid is empty");
        } catch (Exception e) {
            BaseView.takeScreenshot("Expected empty grid is not present.png");
            fail("Expected empty grid is not present" + e.getMessage());
        }
    }

    public static List<List<String>> getSpreadSheetValues(int intIndex) {
        List<List<String>> rowList = new ArrayList<List<String>>();
        try {
            String localPath = new File(GenericSteps.publicDataFolder).getAbsolutePath();
            File f = new File(localPath);
            Workbook wb = WorkbookFactory.create(f);
            Sheet mySheet = wb.getSheetAt(intIndex);
            for (Iterator<Row> rowIterator = mySheet.rowIterator(); rowIterator.hasNext(); ) {
                List<String> colList = new ArrayList<String>();
                for (Iterator<Cell> cellIterator = ((Row) rowIterator.next()).cellIterator(); cellIterator.hasNext(); ) {
                    String strExcel = "";
                    try {
                        strExcel = ((Cell) cellIterator.next()).toString();
                    } catch (NullPointerException ne) {
                        strExcel = "";
                    }
                    colList.add(strExcel);
                }
                rowList.add(colList);
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("valueMisMatch.png");
            logger.info("Error :" + ex.getMessage());
        }
        return rowList;
    }


    public static void assertAllGridTypesNoGrid(List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);

        List<WebElement> headers = fetchGridHeaders();
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount();
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems();
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.xpath(".//td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElements(By.xpath(".//td[" + index + "]//input[@type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.xpath(".//td[" + index + "]//input[@type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            String value = AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim();
                            if (value.contains(" PM") || value.contains(" AM")) {
                                String[] date = value.split(":");
                                value = date[0];
                                String[] amOrPm = date[2].split("\\s");
                                value = value + " " + amOrPm[1];
                            }
                            lineItem.add(value);
                            /*lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.xpath(".//td[" + index + "]"))).trim());*/
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage("Next Page");
            CommonMethods.waitTillDivisionLoads();
        }

        if (!grid.containsAll(replaceListValuesWithDate(replaceNewLine(gridValues)).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }

    public static List<WebElement> fetchGridLineItems() throws Throwable {
        List<WebElement> rows = new ArrayList<WebElement>();
        try {
            BaseView.pushShortTimeout();
            if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[class*='x-grid-row']")).size() > 0) {
                rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[class*='x-grid-row']"));

            } /*else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1")).size() > 0) {
                if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowHighLite")).size() > 0) {
                    rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1"));
                    rows.addAll(BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowHighLite")));
                } else {
                    rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1"));
                }

            } */ else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1")).size() > 0) {
                if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowHighLite")).size() > 0) {
                    rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1"));
                    rows.addAll(BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowHighLite")));
                } else {
                    rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1"));
                }

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[id^='ackid_NotifyMember']")).size() > 0) {
                rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[id^='ackid_NotifyMember']"));

            } else if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader~tr")).size() > 0) {
                rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader~tr"));
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
        return rows;
    }

    public static void fetchGridValues(String gridID, List<List<String>> gridValues) throws Throwable {
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        SeleniumUtil.waitForElementPresent("cssselector", strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> rows = gridElement.findElements(By.tagName("tr"));
        List<List<String>> grid = new ArrayList<List<String>>();

        assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

        for (int j = 0; j < rows.size(); j++) {
            List<String> columns = new ArrayList<String>();
            int cloumnSize = rows.get(j).findElements(By.tagName("td")).size();
            List<WebElement> td = rows.get(j).findElements(By.tagName("td"));
            for (int i = 0; i < cloumnSize; i++) {
                columns.add(AllContractPagesView.getTextAndByPassException(td.get(i)).trim());
            }
            grid.add(columns);
        }

        if (!grid.containsAll(replaceListValuesWithDate(gridValues))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }

    public static void fetchGridValues(String strHeader, String gridID, List<List<String>> gridValues) throws Throwable {
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        SeleniumUtil.waitForElementPresent("cssselector", strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> rows = gridElement.findElements(By.tagName("tr"));
        List<List<String>> grid = new ArrayList<List<String>>();

        assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);
        List<WebElement> gridHeaders = SeleniumUtil.getWebElementObjects("cssselector", ".x-column-header-text", 8, SeleniumUtilities.OBJWAITTIMEOUT);
        int intHeaderCol = 0;
        for (WebElement gridHeader : gridHeaders) {
            if (gridHeader.getText().equalsIgnoreCase(strHeader)) {
                break;
            }
            intHeaderCol++;
        }

        for (int j = 0; j < rows.size(); j++) {

            List<String> columns = new ArrayList<String>();
            int cloumnSize = rows.get(j).findElements(By.tagName("td")).size();
            List<WebElement> td = rows.get(j).findElements(By.tagName("td"));

            columns.add(AllContractPagesView.getTextAndByPassException(td.get(intHeaderCol)).trim());

//            for (int i = 0; i < cloumnSize; i++) {
//                if(AllContractPagesView.getTextAndByPassException(td.get(i)).trim().equalsIgnoreCase(strHeader)) {
//                    columns.add(AllContractPagesView.getTextAndByPassException(td.get(i)).trim());
//                }
//            }

            grid.add(columns);
        }

        if (!grid.containsAll(replaceListValuesWithDate(gridValues))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }

    public static void assertAllReportGridTypesNoGrid(List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);

        List<WebElement> headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader td.optionalFieldLabel"));
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount();
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.cstListHeader~tr"));
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(10);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                        BaseView.pushMillSecTimeout(10);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")")).
                                findElements(By.cssSelector("input[type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            String value = AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim();
                            if (value.contains(" PM") || value.contains(" AM")) {
                                String[] date = value.split(":");
                                value = date[0];
                                String[] amOrPm = date[2].split("\\s");
                                value = value + " " + amOrPm[1];
                            }
                            lineItem.add(value.trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage("Next Page");
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }

    public static void chooseImportantGridRow(WebElement gridElement, String cellValue, String header, List<Field> fields) throws Throwable {
        int finalCount = 0;
        int getRow = 0;
        GenericEntityView.convertToFormatPattern(cellValue);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = AllContractPagesView.getPageCount(gridElement);

        for (int page = pageCount; page > 0; page--) {

            Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
            int tables = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size();

            int staleElementCount = 0;
            int rowCount = 0;

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"))) {
                String cell = "";
                List<String> columnValues = new ArrayList<String>();
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    AllContractPagesView.focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    do {
                        try {
                            cell = td.getText();
                            break;
                        } catch (StaleElementReferenceException se) {
                            staleElementCount++;
                        }
                    } while (!(staleElementCount > 20));
                    columnValues.add(cell);
                }
                cellValues.put(rowCount, columnValues);
                rowCount++;
            }

            int foundCount = 0;

            if (tables > 0) {
                for (int i = 0; i < cellValues.size(); i++) {
                    foundCount = 0;
                    for (int j = 0; j < cellValues.get(i).size(); j++) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                            if (SeleniumUtil.replaceSpecialChar(cellValues.get(i).get(j)).contains(f.getValue()) &&
                                    headers.get(j).getText().equals(f.getName())) {
                                foundCount++;
                            }
                        }
                    }

                    if (foundCount == fields.size()) {
                        finalCount = foundCount;
                        getRow = i;
                    }
                }
            }
            AllContractPagesView.clickPage("Next Page");
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected value is not present under column header");
        } else {
            try {
                gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).
                        get(getRow).findElement(By.tagName("div")).click();

            } catch (Exception e) {
                try {
                    gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).get(getRow).click();
                } catch (Exception e1) {
                }
            }
        }
    }

    public static void chooseGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = AllContractPagesView.getGridElement(gridID);
        AllContractPagesView.moveToElementAndFocus(strElement);
        WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT); //BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                chooseImportantGridRow(gridElement, cellValue, header, fields);
            } else {
                chooseMainGrid(gridElement, cellValue, header, fields);
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void chooseMainGrid(WebElement gridElement, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);

        AllContractPagesView.focusWebElement(gridElement);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = AllContractPagesView.getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    AllContractPagesView.focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if ((AllContractPagesView.getTextAndByPassException(td).trim().equalsIgnoreCase(cellValue.trim()) || cellValue.trim().equalsIgnoreCase(AllContractPagesView.getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }
                }
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    AllContractPagesView.focusWebElement(cells.get(cells.size() - 1));
                    AllContractPagesView.focusWebElement(cell);
                    AllContractPagesView.focusWebElement(headers.get(row - 1));

                    if (headers.get(row - 1).getText().trim().length() == 0) {
                        row = row + 1;
                    }

                    if (headers.get(row - 1).getText().trim().length() > 0) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                            if ((AllContractPagesView.getTextAndByPassException(cell).trim().contains(GenericEntityView.convertToFormatPattern(f.getValue().trim()).trim()) || f.getValue().contains(GenericEntityView.convertToFormatPattern(AllContractPagesView.getTextAndByPassException(cell)).trim())) && headers.get(row - 1).getText().trim().equals(f.getName().trim())) {
                                logger.info("Value :" + AllContractPagesView.getTextAndByPassException(cell) + ":" + f.getValue() + "  -  Header :" + headers.get(row - 1).getText().trim() + " - " + (f.getName()));
                                foundCount++;
                                break;
                            }
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        AllContractPagesView.focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            if (!(count == fields.size())) {
                AllContractPagesView.clickPage("Next Page");
            }
            AllContractPagesView.waitTillDivisionLoads();
            AllContractPagesView.waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void assertAllGridTypesPushHeader(String gridID, List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> pushHeadersLeft = fetchGridHeaders(gridElement);
        List<WebElement> headers = pushHeadersLeft.subList(1, pushHeadersLeft.size());
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElements(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage("Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
    }

    public static void assertAllGridTypesDontSkipBlankHeaders(String gridID, List<List<String>> gridValues) throws Throwable {
        AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeadersDontSkipBlankHedaers(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElements(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

    public static void assertAllGridTypesDontClearSearchField(String gridID, List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.xpath(".//td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElements(By.xpath(".//td[" + index + "]//input[@type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.xpath(".//td[" + index + "]//input[@type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.xpath(".//td[" + index + "]"))).trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

    public static void assertAllGridTypesUsingAnyLocator(String gridID, List<List<String>> gridValues) throws Throwable {
        //AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridLocator(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElements(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }


    public static void assertAllGridTypesOfIncludingDate(String gridID, List<List<String>> gridValues) throws Throwable {
        AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + ")")));
                        BaseView.pushMillSecTimeout(1);
                        int index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        if (row.findElements(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            String value = AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim();
                            if (value.contains(" PM") || value.contains(" AM")) {
                                String[] date = value.split(":");
                                value = date[0];
                                String[] amOrPm = date[2].split("\\s");
                                value = value + " " + amOrPm[1];
                            }
                            lineItem.add(value);
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

    public static int getColSpan(WebElement td) {
        int colspan = 0;
        if (td.getAttribute("colspan") != null) {
            colspan = Integer.parseInt(td.getAttribute("colspan"));
        }
        return colspan;
    }

    public static WebElement getGridWebElement(String gridID, String subGridID) {
        WebElement gridElement = null;
        if (gridID != "") {
            String strElement = AllContractPagesView.getGridElement(gridID);
            CommonMethods.moveToElementAndFocus(strElement);
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

            strElement = AllContractPagesView.getSubGridElement(subGridID);
            CommonMethods.moveToElementAndFocus(strElement);
            for (WebElement element : gridElement.findElements(By.cssSelector(strElement))) {
                if (element.isDisplayed()) {
                    gridElement = element;
                }
            }

        } else {
            String strElement = AllContractPagesView.getSubGridElement(subGridID);
            CommonMethods.moveToElementAndFocus(strElement);
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
            for (WebElement element : BrowserDriver.getCurrentDriver().findElements(By.cssSelector(strElement))) {
                if (element.isDisplayed()) {
                    gridElement = element;
                }
            }
        }
        return gridElement;
    }

    public static void assertAllSubGridTypes(String gridID, String subGridID, List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);
        WebElement gridElement = getGridWebElement(gridID, subGridID);

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeaders(headers);

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushShortTimeout(1);
                        int skipCol = getColSpan(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (j + 1) + ")")));
                        int index = 0;
                        if (skipCol != 0) {
                            index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                            index = index - skipCol + 1;
                        } else {
                            index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        }
                        BaseView.pushShortTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.cssSelector("td:nth-of-type(" + (index) + ")")));
                        BaseView.pushShortTimeout(1);
                        if (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))
                                .findElements(By.cssSelector(" input[type='checkbox']")).size() > 0) {

                            String value = row.findElement(By.cssSelector("td:nth-of-type(" + index + ") input[type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            String value = AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.cssSelector("td:nth-of-type(" + index + ")"))).trim();
                            if (value.contains(" PM") || value.contains(" AM")) {
                                String[] date = value.split(":");
                                value = date[0];
                                String[] amOrPm = date[2].split("\\s");
                                value = value + " " + amOrPm[1];
                            }
                            lineItem.add(value.trim());
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

    public static void assertAllGridTypeIncludeBlankHeaders(String gridID, List<List<String>> gridValues) throws Throwable {
        AdminGridView.clearSearch(gridID);
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> headers = fetchGridHeaders(gridElement);
        assertTrue("No headers line items are fetched " + headers.size(), headers.size() > 0);

        int pageCount = AllContractPagesView.getPageCount(gridElement);
        List<List<String>> grid = new ArrayList<List<String>>();

        for (int i = 1; i <= pageCount; i++) {
            List<WebElement> rows = fetchGridLineItems(gridElement);
            assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

            List<String> applicationHeaders = getApplicationHeadersDontSkipBlankHedaers(headers);
            List<Integer> emptyHeaders = new ArrayList<>();
            for (int k = 0; k < applicationHeaders.size(); k++) {
                if (applicationHeaders.get(k).trim().equals("")) {
                    emptyHeaders.add(k);
                }
            }

            for (WebElement row : rows) {
                List<String> lineItem = new ArrayList<>();
                int emptyHeaderCount = 0;
                for (int j = 0; j < gridHeaders.size(); j++) {
                    try {
                        BaseView.pushMillSecTimeout(1);
                        focusWebElementIfScrollExist(row.
                                findElement(By.xpath("./td[" + (applicationHeaders.indexOf(gridHeaders.get(j)) + 1) + "]")));
                        BaseView.pushMillSecTimeout(1);
                        int index = 0;

                        if (gridHeaders.get(j).trim().equals("")) {
                            index = emptyHeaders.get(emptyHeaderCount) + 1;
                            emptyHeaderCount++;
                        } else {
                            index = applicationHeaders.indexOf(gridHeaders.get(j)) + 1;
                        }

                        if (row.findElements(By.xpath("./td[" + index + "]//input[@type='checkbox']")).size() > 0) {
                            String value = row.findElement(By.xpath("./td[" + index + "]//input[@type='checkbox']")).getAttribute("checked");
                            logger.info(value);
                            if (value == null) {
                                lineItem.add("unchecked");
                            } else {
                                lineItem.add("checked");
                            }
                        } else {
                            lineItem.add(AllContractPagesView.getTextAndByPassException
                                    (row.findElement(By.xpath("./td[" + index + "]"))).trim().replaceAll("\n"," "));
                        }

                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                grid.add(lineItem);
            }
            AllContractPagesView.clickPage(gridElement, "Next Page");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        }
        if (!grid.containsAll(replaceListValuesWithDate(gridValues).subList(1, gridValues.size()))) {
            BaseView.takeScreenshot("Headers mismatch.png");
            printGridItems(grid);
            fail("Line items mismatch");
        }
        AllContractPagesView.clickPage(gridElement, "First Page");
    }

}