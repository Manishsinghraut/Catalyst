package com.lucernex.qa.views.components;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.apache.commons.lang.NotImplementedException;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.fail;

public class GridView {
    private static final Logger logger = Logger.getLogger(GridView.class.getName());
    private static final String GRID_DIV_STYLE_TEMPLATE = "div[id^=\"%s\"]";
    private static final String GRID_HEADER_STYLE = ".x-grid3-hd-inner";
    private static final String GRID_ROW_STYLE = ".x-grid3-row";
    private static final String GRID_CELL_STYLE = ".x-grid3-cell";

    /**
     * Creates <div> element whose id attribute value begins with passed divId
     * @param divId
     * @return
     */
    private static String getGridDivCSS(String divId) {
        return String.format(GRID_DIV_STYLE_TEMPLATE, divId);
    }

    private static String getGridDivCSS(WebElement gridDiv) {
        return String.format(GRID_DIV_STYLE_TEMPLATE, gridDiv.getAttribute("id"));
    }

    private static WebElement getGridById(String divId, boolean topFrame, boolean otherWindow) throws InterruptedException {

        WebElement gridDiv = null;

        try {
            BaseView.pushShortTimeout();

            gridDiv = BrowserDriver.getCurrentDriver().findElement(
                    By.cssSelector(getGridDivCSS(divId))
            );

        } catch(NoSuchElementException ex) {

            if(!topFrame) {
                //give another try with top frame
                logger.info(String.format("Didn't find '%s' grid's DIV in second iFrame.  Searching in TOP frame...", getGridDivCSS(divId)));
                BrowserDriver.getCurrentDriver().switchTo().defaultContent();
                gridDiv = getGridById(divId, true, false);
            } else if(topFrame && !otherWindow) {
                //give one more try with another window
                logger.info(String.format("Didn't find '%s' grid's DIV in top and second iFrame.  Searching in other window...", getGridDivCSS(divId)));
                BaseView.switchToSecondWindow();
                gridDiv = getGridById(divId, true, true);
            } else {
                fail(String.format("Cannot find grid DIV by CSS '%s'", getGridDivCSS(divId)));
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
        return gridDiv;
    }


    private static List<String> getGridHeaders(WebElement gridDiv) throws InterruptedException {
        List<String> gridHeaders = Lists.newArrayList();

        try {

            List<WebElement> gridHeadersElem = gridDiv.findElements(
                    By.cssSelector(GRID_HEADER_STYLE)
            );

            if(CollectionUtils.isNotEmpty(gridHeadersElem)) {
                logger.info(String.format("Found %s headers in the '%s' grid", gridHeadersElem.size(), getGridDivCSS(gridDiv)));
                gridHeaders = Lists.transform(gridHeadersElem, new Function<WebElement, String>() {
                    public String apply(WebElement input) {
                        return StringUtils.trim(input.getText());
                    }
                });
            } else {
                logger.info(String.format("Found no headers in the '%s' grid", getGridDivCSS(gridDiv)));
            }

        } catch(NoSuchElementException ex) {
            fail(String.format("Cannot find any headers for grid '%s' by header style '%s'", getGridDivCSS(gridDiv), GRID_HEADER_STYLE));
        }

        return gridHeaders;
    }


    private static List<WebElement> getGridRows(WebElement gridDiv) throws InterruptedException {

        List<WebElement> gridRows = Lists.newArrayList();

        try {

            gridRows = gridDiv.findElements(
                    By.cssSelector(GRID_ROW_STYLE)
            );

            if(CollectionUtils.isNotEmpty(gridRows)) {
                logger.info(String.format("Found %s rows in the '%s' grid", gridRows.size(), getGridDivCSS(gridDiv)));
            } else {
                logger.info(String.format("Found no rows in the '%s' grid", gridDiv));
            }

        } catch(NoSuchElementException ex) {
            fail(String.format("Cannot find any rows for grid '%s' by row style '%s'", getGridDivCSS(gridDiv), GRID_ROW_STYLE));
        }

        return gridRows;
    }


    /**
     *
     * @param gridDiv
     * @param rowNumber one based
     * @return
     * @throws InterruptedException
     */
    private static List<WebElement> getGridCells(WebElement gridDiv, int rowNumber) throws InterruptedException {

        List<WebElement> gridRowCells = Lists.newArrayList();
        List<WebElement> gridRows = getGridRows(gridDiv);

        try {

            if(CollectionUtils.isNotEmpty(gridRows) && rowNumber > 0 && rowNumber-1 <= gridRows.size()) {

                WebElement row = gridRows.get(rowNumber-1);
                gridRowCells = row.findElements(
                        By.cssSelector(GRID_CELL_STYLE)
                );

                if(CollectionUtils.isNotEmpty(gridRowCells)) {
                    logger.info(String.format("Found %s cells in the '%s' grid %s row", gridRowCells.size(), getGridDivCSS(gridDiv), rowNumber));
                } else {
                    logger.info(String.format("Found no cells in the '%s' grid %s row", getGridDivCSS(gridDiv), rowNumber));
                }

            } else {
                fail(String.format("Row index %s is out of bound %s", rowNumber, gridRows.size()));
            }

        } catch(NoSuchElementException ex) {
            fail(String.format("Cannot find any cells for grid '%s' by row style '%s' and cell style '%s'", getGridDivCSS(gridDiv), GRID_ROW_STYLE, GRID_CELL_STYLE));
        }

        return gridRowCells;
    }


    /**
     *
     * @param gridDiv
     * @param rowNumber
     * @param headerName
     * @return
     * @throws InterruptedException
     */
    private static WebElement getGridCell(WebElement gridDiv, int rowNumber, String headerName) throws InterruptedException {
        WebElement gridCell = null;
        //headers
        List<String> gridHeaders = getGridHeaders(gridDiv);
        if(CollectionUtils.isNotEmpty(gridHeaders) && gridHeaders.contains(headerName)) {
            int cellNumber = gridHeaders.indexOf(headerName);

            List<WebElement> gridRowCells = getGridCells(gridDiv, rowNumber);
            if(CollectionUtils.isNotEmpty(gridRowCells) && cellNumber <= gridRowCells.size()) {
                gridCell = gridRowCells.get(cellNumber);
                logger.info(String.format("Found cell in the '%s' grid %s row %s cell", getGridDivCSS(gridDiv), rowNumber, cellNumber));
            } else {
                fail(String.format("Cell index %s is out of bound %s", cellNumber, gridRowCells.size()));
            }
        }

        return gridCell;
    }

    /**
     *
     * @param divId
     * @param rowNumber one based
     * @param headerName
     * @return
     * @throws InterruptedException
     */
    public static String getGridCellValue(String divId, int rowNumber, String headerName) throws InterruptedException {
        String cellValue = StringUtils.EMPTY;
        String currentWindowHandle = BaseView.getCurrentWindowHandle();

        try {
            BaseView.switchToSecondFrame();

            WebElement gridDiv = getGridById(divId, false, false);

            WebElement gridCell = getGridCell(gridDiv, rowNumber, headerName);
            if(gridCell != null) {
                cellValue = gridCell.getText();
                logger.info(String.format("Found '%s' value in the '%s' grid %s row %s header name", cellValue, getGridDivCSS(divId), rowNumber, headerName));
            } else {
                fail(String.format("Grid cell by header name %s is not found in %s", headerName, getGridDivCSS(gridDiv)));
            }

        } finally {
            BrowserDriver.getCurrentDriver().switchTo().window(currentWindowHandle);
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
        }

        return cellValue;
    }

    //TODO
    public static void clickOnLinkOrButtonByName() {
        throw new NotImplementedException("Pending implementation");
    }

    //TODO
    public static void clickOnCheckBox() {
        throw new NotImplementedException("Pending implementation");
    }

    //TODO
    public static void setValueInTextBox() {
        throw new NotImplementedException("Pending implementation");
    }

}

