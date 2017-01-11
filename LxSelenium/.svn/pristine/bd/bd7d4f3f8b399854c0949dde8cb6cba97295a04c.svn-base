package com.lucernex.qa.views.admin;


import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.*;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.*;
import static com.google.common.base.Strings.isNullOrEmpty;
import static com.google.common.base.Strings.repeat;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * When the user clicks on one of the Admin tabs they will see an ext-js grid,
 * hence this class.
 */
public class AdminGridView {
    private static final Logger logger = Logger.getLogger(AdminGridView.class.getName());
    private static final AdminPage adminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AdminPage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    /**
     * Returns true if there is a extjs grid with the given name.
     *
     * @param gridName - name of desired grid (e.g. 'Employer')
     */
    public static boolean findGrid(String gridName) {
        String id = "BOGridLX_Grid_" + gridName;
        WebElement we;

        try {
            we = BrowserDriver.findElementWithTimeout(By.id(id), 5);
            return we != null;
        } catch (InterruptedException e) {
            return false;
        }
    }

    private static WebElement findOuterGrid() throws InterruptedException {
        //String outterGridCSS = "div[id^=BOGridLX_]";
        String innerGridCSS = "div[id^=headercontainer]";
        WebElement we = BrowserDriver.findElementWithTimeout(By.cssSelector(innerGridCSS), 5);

        assertNotNull("Did not see the outer grid!", we.isDisplayed());
        adminPage.gridDiv = we;

        return we;
    }

    private static WebElement getOuterGrid() throws InterruptedException {
        String outterGridCSS = "div[id^=BOGridLX_]";
        WebElement we = BrowserDriver.findElementWithTimeout(By.cssSelector(outterGridCSS), 5);

        assertNotNull("Did not see the outer grid!", we.isDisplayed());
        adminPage.gridDiv = we;

        return we;
    }

    /**
     * Returns the name of the record type managed by the grid.
     */
    public static String getRecordType() throws InterruptedException {
        String id = getOuterGrid().getAttribute("id");

        assertNotNull(id);
        //assertTrue("Did not see the expected 'BOGridLX_Grid_' id prefix!", id.startsWith("BOGridLX_Grid_"));
        assertTrue("Did not see the expected 'BOListExtGrid' id prefix!", id.startsWith("BOGridLX_Grid_"));

        //return id.substring("BOGridLX_Grid_".length());
        return id.substring("BOGridLX_Grid_".length());
    }

    /**
     * Returns a list of grid column header labels.
     */
    public static List<String> getGridColumnHeaders() throws InterruptedException {
        for (int i = 0; i < 2; i++) {
            try {
                SeleniumUtil.waitForElementVisibilityOf("cssselector", "div.x-column-header-inner", 5, 2);
                List<WebElement> columnHdrs = findOuterGrid().findElements(By.cssSelector("div.x-column-header-inner"));

                assertNotNull("Did not see grid column headers!", columnHdrs);
                assertTrue("List of grid column headers is empty!", columnHdrs.size() > 0);

                List<String> names = new ArrayList<String>(columnHdrs.size());

                for (WebElement we : columnHdrs) {
                    names.add(we.getText());
                }

                return names;
            } catch (StaleElementReferenceException e) {
                // who knows why we get this exception?
            }
        }

        fail("Kept getting StaleElementReferenceException even though we retried the findElements call!");

        return null;
    }

    /**
     * Returns the index of the column with the given column name
     *
     * @param colName
     * @return
     * @throws InterruptedException
     */
    public static int getIndexOfColumn(String colName) throws InterruptedException {
        List<String> columnHeaders = AdminGridView.getGridColumnHeaders();
        int columnIndex = columnHeaders.indexOf(colName);

        return columnIndex;
    }

    private static WebElement findGrid() throws InterruptedException {
//        WebElement we = BrowserDriver.findElementWithTimeout(By.cssSelector("div[id^=BOGrid]"), 5);
        WebElement we = null;
        for (int i = 0; i < 5; i++) {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id^=BOGrid]", 5, 2);
            we = SeleniumUtil.getElement("cssselector", "div[id^=BOGrid]", 2);
            if (we != null) {
                assertTrue("Did not see the grid!", we.isDisplayed());
                adminPage.innerGridDiv = we;
                return we;
            }
        }
//        assertTrue("Did not see the grid!", we.isDisplayed());
//        adminPage.innerGridDiv = we;
//
//        return we;
        return we;
    }

    /**
     * Returns a row of grid cell values.
     *
     * @param row - desired grid cell row (0 is 1st).
     */
    public static List<String> getGridRow(int row) throws InterruptedException {
        for (int j = 0; j < 2; j++) {
            try {
                WebElement grid = findGrid();
                List<WebElement> gridRows = grid.findElements(By.cssSelector("table.x-grid-item"));

                assertNotNull("Did not see grid rows!", gridRows);
                checkPositionIndex(row, gridRows.size());

                List<WebElement> gridCells = gridRows.get(row).findElements(By.cssSelector("td.x-grid-cell"));

                assertNotNull(String.format("Did not see grid cells for row %s!", row), gridCells);

                List<String> cells = new ArrayList<String>(gridCells.size());
                int lastDataCell = gridCells.size() - 1;

                if (lastDataCell < 1) {
                    return cells;
                }

                for (int i = 0; i < lastDataCell; i++) {
                    WebElement cellValue = gridCells.get(i);

                    cells.add(cellValue.getText().trim());
                }

                return cells;
            } catch (StaleElementReferenceException e) {
                // who knows why we get this exception?
            }
        }

        fail("Kept getting StaleElementReferenceException even though we retried the findElements call!");

        return null;
    }

    /**
     * Returns the specified cell's value.
     *
     * @param row    - cell's row    (0 is 1st row)
     * @param column - cell's column (0 is 1st column)
     */
    public static String getGridCell(int row, int column) throws InterruptedException {
        List<String> cells = getGridRow(row);

        checkPositionIndex(column, cells.size());

        return cells.get(column);
    }

    /**
     * Returns the index of the grid row which has the specified cell value in
     * the provided column (-1 if not found).
     * <p/>
     * Note: 1 is 1st row in grid
     *
     * @param column - index of column
     * @param value  - cell value of specified column
     */
    public static int getGridRowIndex(int column, String value) throws InterruptedException {
        int limit = getGridRowCount();

        for (int row = 0; row < limit; row++) {
            List<String> rowValues = getGridRow(row);

            checkElementIndex(column, rowValues.size());

            String cell = rowValues.get(column);

            if (cell == null && value == null) {
                return row + 1;
            }

            if (value != null && value.equals(cell)) {
                return row + 1;
            }
        }

        return -1;
    }

    /**
     * Returns the index of the grid row which has the specified cell value in
     * the provided column (-1 if not found).
     * <p/>
     * Note:0 is 1st row in grid
     *
     * @param column - index of column
     * @param value  - cell value of specified column
     */
    public static int getGridRowIndexFromZero(int column, String value) throws InterruptedException {
        return getGridRowIndex(column, value) - 1;
    }

    /**
     * Returns the current number of records in the grid's current page.
     */
    public static int getGridRowCount() throws InterruptedException {
        WebElement grid = findGrid();
        List<WebElement> gridRows = grid.findElements(By.cssSelector("table.x-grid-item"));

        assertNotNull("Did not see grid rows!", gridRows);

        return gridRows.size();
    }

    /**
     * Returns a list of cell values for a specified column.
     *
     * @param column - cell's column (0 is 1st column)
     */
    public static List<String> getGridColumn(int column) throws InterruptedException {
        int limit = getGridRowCount();

        List<String> columnValues = new ArrayList(limit);

        for (int row = 0; row < limit; row++) {
            List<String> rowValues = getGridRow(row);

            columnValues.add(rowValues.get(column));
        }

        return columnValues;
    }

    /**
     * Returns the grid's current page (1 is 1st page).
     * Updated new EXT
     */
    public static int getCurrentPage() throws InterruptedException {
        WebElement grid = findGrid();
        WebElement toolBar = grid.findElement(By.cssSelector("div[id^=pagingtoolbar]"));
        WebElement we = toolBar.findElement(By.cssSelector("div.x-field input.x-form-field"));

        assertNotNull("Did not see grid page number field in the pagination controls!", we);

        String value = we.getAttribute("value");

        assertNotNull("The grid page number field in the pagination controls doesn't have a value!", value);

        return Integer.parseInt(value);
    }

    /**
     * Returns the grid's number of available pages.
     * updated - NEW EXT
     */
    public static int getPageCount() throws InterruptedException {
        WebElement grid = findGrid();
        WebElement toolBar = grid.findElement(By.cssSelector("div[id^=pagingtoolbar]"));
        List<WebElement> toolbars = toolBar.findElements(By.cssSelector("div.x-toolbar-text"));

        assertNotNull("Did not see the grid toolbars!", toolbars);

        String pages = null;

        for (WebElement we : toolbars) {
            String text = we.getText();

            if (!isNullOrEmpty(text) && text.startsWith("of ")) {
                pages = text.substring("of ".length());
            }
        }

        assertNotNull("The 'of x' text not found in the pagination controls!", pages);

        return Integer.parseInt(pages);
    }

    /**
     * Clicks grid's next page button.
     *
     * @return true if there was a next page to go to.
     */
    public static boolean gotoNextPage() {
        return true;
    }

    /**
     * Clicks grid's previous page button.
     *
     * @return true if there was a previous page to go to.
     */
    public static boolean gotoPreviousPage() {
        return true;
    }

    public static List<String> getActions() throws InterruptedException {
        return getActions(0);
    }

    /**
     * Returns the list of supported grid actions (e.g. [edit,delete]).
     */
    public static List<String> getActions(int rowIndex) throws InterruptedException {
        WebElement grid = findGrid();
        List<WebElement> allRows = grid.findElements(By.cssSelector("table.x-grid-item"));

        //WebElement firstRow = grid.findElement(By.cssSelector("div.x-grid3-row"));
        checkPositionIndex(rowIndex, allRows.size());
        WebElement firstRow = allRows.get(rowIndex);

        //assertNotNull("Did not see first grid row!", firstRow);
        assertNotNull("Did not see grid row at index " + rowIndex + "!", firstRow);

        List<WebElement> gridCells = firstRow.findElements(By.cssSelector("td.x-grid-cell"));

        assertNotNull("Did not see grid cells for first row!", gridCells);

        List<String> actions = new ArrayList<String>(gridCells.size());
        WebElement actionsCell = gridCells.get(gridCells.size() - 1);
        List<WebElement> actionLinks = actionsCell.findElements(By.cssSelector("a"));

        if (actionLinks == null || actionLinks.isEmpty()) {
            return actions;
        }

        for (WebElement we : actionLinks) {
            actions.add(we.getText());
        }

        return actions;
    }

    /**
     * Executes the specified grid action.
     *
     * @param action - grid action
     * @param row    - grid row who's action is to be clicked (1 is 1st)
     */
    public static void executeAction(String action, int row) throws Exception {
//        delay(5000);
        WebElement grid = findGrid();
        List<WebElement> rows = grid.findElements(By.cssSelector("table.x-grid-item"));

        assertNotNull("Did not see any grid rows!", rows);
        checkPositionIndex(row - 1, rows.size());

        List<WebElement> gridCells = rows.get(row - 1).findElements(By.cssSelector("td.x-grid-cell"));

        assertNotNull(String.format("Did not see grid cells for row '%d'!", row), gridCells);

        WebElement actionsCell = gridCells.get(gridCells.size() - 1);
        List<WebElement> actionLinks = actionsCell.findElements(By.cssSelector("a"));

        for (WebElement we : actionLinks) {
            String label = we.getText();

            if (!isNullOrEmpty(label) && label.equalsIgnoreCase(action)) {
                we.click();
                return;
            }
        }

        fail(String.format("Did not see grid row action '%s'!", action));
    }

    /**
     * Executes the Add action which is not a row action but instead an action
     * in the footer of the grid.
     */
    public static void executeAddAction() {
        try {
            WebElement grid = findGrid();
            WebElement button = grid.findElement(By.cssSelector("div.x-toolbar-docked-bottom div.x-box-inner div.x-box-target a.x-btn-pressed span.x-btn-inner"));

            assertNotNull("Did not see the grid Add button!", button);

            button.click();
            SeleniumUtil.waitForNonStaleWebElement(button, 5, 2);
        } catch (Exception ex) {
//            delay(5000);
            try {
                WebElement grid = findGrid();
                WebElement button = grid.findElement(By.cssSelector("div.x-toolbar-docked-bottom div.x-box-inner div.x-box-target a.x-btn-pressed span.x-btn-inner"));

                assertNotNull("Did not see the grid Add button!", button);

                button.click();
                SeleniumUtil.waitForNonStaleWebElement(button, 5, 2);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void getMessage(String msg) throws InterruptedException {
        for (int i = 0; i < 10; i++) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".frmNote"), msg));
            } catch (Exception Ex) {
                BaseView.takeScreenshot(msg);
            }

            if (i == 9) {
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                    wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".frmNote"), msg));
                    logger.info("Saw required grid message " + msg);
                    break;
                } catch (Exception Ex) {
                    BaseView.takeScreenshot("Did not see the required grid message.png");
                    fail("Did not see the required grid message DOM element!" + msg);
                }
            }
        }
    }

    public static boolean textToBePresentInElementsLocated(String text) throws Throwable {
        boolean result = false;

        for (WebElement msg : SeleniumUtil.getWebElementObjects("cssselector", ".frmError", 5, 1)) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.textToBePresentInElement(msg, text));
                result = true;
                break;
            } catch (Exception e) {
                result = false;
            }
        }
        return result;
    }

    public static void getErrorMessage(String msg) throws InterruptedException {
        for (int i = 0; i < 10; i++) {
            try {
            /*Wait<WebDriver> wait = new FluentWait<WebDriver>(BrowserDriver.getCurrentDriver())
                    .withTimeout(20, TimeUnit.SECONDS)
                    .pollingEvery(1, TimeUnit.SECONDS)
                    .ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);*/
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".frmError"), msg));
                logger.info("Saw required grid message " + msg);
                break;
            } catch (Exception Ex) {
                BaseView.takeScreenshot("Did not see the required grid message.png");
            }
            if (i == 9) {
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                    wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".frmError"), msg));
                    logger.info("Saw required grid message " + msg);
                    break;
                } catch (Exception Ex) {
                    BaseView.takeScreenshot("Did not see the required grid message.png");
                    fail("Did not see the required grid message DOM element!" + msg);
                }
            }
        }
    }

    /**
     * Returns the grid message if there is one, otherwise null.
     */
    public static String getGridMessage() throws Throwable {
        for (int i = 0; i < 2; i++) {
            Wait<WebDriver> wait = new FluentWait<WebDriver>(BrowserDriver.getCurrentDriver())
                    .withTimeout(20, TimeUnit.SECONDS)
                    .pollingEvery(1, TimeUnit.SECONDS)
                    .ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);
// Slider on the grid view pages not showing - this code validates the "Successfully added Employer" message on the slider
            /*wait.until( ExpectedConditions.presenceOfElementLocated(By.className("msg")) );

            WebElement gridHeader = BrowserDriver.getCurrentDriver().findElement(By.className("msg"));
            WebElement msg = gridHeader.findElement(By.cssSelector("div.x-box-mc"));*/


//            wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class=frmError]")));
//
//            WebElement msg = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[class=frmError]"));

            wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".frmError")));

            WebElement msg = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".frmError"));

//            wait.until( ExpectedConditions.presenceOfElementLocated(By.id("msgRow")) );
//
//            WebElement msg = BrowserDriver.getCurrentDriver().findElement(By.id("msgRow"));

            assertNotNull("Did not see the required grid message DOM element!", msg);

            //String text = msg.getText();
            String text = getTextAndByPassException(msg);

            // Need to wait until a non-empty grid message if found. class=frmError
            if (!isNullOrEmpty(text)) {
                return text;
            }

            Thread.sleep(5000L); // Give the grid action task a chance to complete its async work.
        }

        String errorMsg = getLxModalMessage();

        if (errorMsg != null) {
            fail(errorMsg);
        } else {
            fail("Did not see the grid message!");
        }

        return null;
    }

    public static Boolean verifyErrorMessage(String strMsg) {
        try {
            if (strMsg.contains("[CURRENTDATE]")) {
                strMsg = strMsg.replace("[CURRENTDATE]", SeleniumUtil.currentDate(0));
            }
            return AdminGridView.getGridMessage().contains(strMsg);
        } catch (Throwable throwable) {
            return false;
        }
    }


    public static String getLxModalMessage() throws InterruptedException {
        String cssSelector = "div.lxmodalwindow div.x-panel-body-noheader > div.frmError";
        //String cssSelector = "#msgRow";
        return getMessageFromElementWithBy(By.cssSelector(cssSelector));
    }

    public static String getTextAndByPassException(WebElement td) throws Throwable {
        int staleElementCount = 0;
        String cell = "";
        do {
            try {
                cell = td.getText();
                break;
            } catch (StaleElementReferenceException se) {
//                delay(1000);
                staleElementCount++;
            }
        } while (!(staleElementCount > 40));
        return cell;
    }


    private static String getMessageFromElementWithBy(By msgElementBy) throws InterruptedException {
        for (int i = 0; i < 7; i++) {
            WebElement msg = BrowserDriver.findElementWithTimeout(msgElementBy, 120);

            checkNotNull(msg);

            String text = msg.getText();

            // Need to wait until a non-empty grid message if found.
            if (!isNullOrEmpty(text)) {
                return text;
            }

            Thread.sleep(1000l);
        }

        fail("Did not see the grid message!");
        return null;
    }

    public static void searchFor(String searchText) throws InterruptedException {
        String cssSelector = "div.x-form-field-wrap > input[id^=ext-comp-].x-form-text";
//        WebElement searchBox = BrowserDriver.findElementWithTimeout(By.cssSelector(cssSelector), 5);
        WebElement searchBox = SeleniumUtil.getElement("cssselector", cssSelector, 3, 2);

        checkNotNull(searchBox);

        searchBox.sendKeys(searchText + "\n");
    }

    public static String getRecordType(String strLoctor, String strElement) throws Exception {
        WebElement we = BrowserDriver.findElementWithTimeout(SeleniumUtil.getElementBy(strLoctor, strElement), 5);

        assertNotNull("Did not see the outer grid!", we.isDisplayed());

        String id = we.getAttribute("id");

        assertNotNull(id);

        assertTrue("Did not see the expected 'BOGrid' id prefix!", id.contains(strElement));

        return id;
    }

    public static void clickAddBtnOnModalWindow(String buttonName) throws Throwable {
        try {
            SeleniumUtil.click("xpath", ".//span[./text()='" + buttonName + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    public static void clickEntityNameOnPopup(String strEntityName) throws Throwable {
        //        AdminPageView.clickLink(strEntityName);
        SeleniumUtil.enter("paritallinktext", strEntityName, SeleniumUtilities.OBJWAITTIMEOUT);
        HomeView.verifyFooterDisplayed();
    }

    public static void filterContacts(String radio) throws Throwable {
        try {
            SeleniumUtil.click("cssselector", "input[onclick='setShowType(" + radio + ")']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToSelectContactsRadio");
        }
    }

    private static void failWithScreenshot(String filename, String fmt, Object... args) {
        BaseView.takeScreenshot(filename);
        logger.info(String.format("Took screenshot to file '%s'", filename));
        fail(String.format(fmt, args));
    }

    public static void seeErrorMsgOnActiveLxModalWindow(String expectedLabel) throws Throwable {
        try {
            if ((SeleniumUtil.verifyTextValue("cssselector", "div[class=frmError]", expectedLabel, SeleniumUtilities.OBJWAITTIMEOUT)) == false) {
                failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                return;
            }

        } catch (Exception e) {
            try {
//                delay(4000);
                SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[class=frmError]", 5, 2);
                if ((SeleniumUtil.verifyTextValue("cssselector", "div[class=frmError]", expectedLabel, SeleniumUtilities.OBJWAITTIMEOUT)) == false) {
                    failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                    return;
                }
            } catch (Exception ex) {
                fail(e.getMessage());
            }
        }
    }

    public static void seeActiveModalWindow(String expectedLabel) throws Throwable {
        try {
            String label = SeleniumUtil.getLastIndexTextValue("cssselector", "div[id^=title-]", SeleniumUtilities.OBJWAITTIMEOUT);

            if (label == null) {
                failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                return;
            }

            if (!label.startsWith(expectedLabel)) {
                failWithScreenshot("expected-modal-window-label-not-seen.png", "Modal window label '%s' not the expected '%s'!", label, expectedLabel);
            }
        } catch (Exception e) {
            try {
//                delay(4000);
                SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id^=title-]", 5, 2);
                String label = SeleniumUtil.getLastIndexTextValue("cssselector", "div[id^=title-]", SeleniumUtilities.OBJWAITTIMEOUT);

                if (label == null) {
                    failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                    return;
                }

                if (!label.startsWith(expectedLabel)) {
                    failWithScreenshot("expected-modal-window-label-not-seen.png", "Modal window label '%s' not the expected '%s'!", label, expectedLabel);
                }
            } catch (Exception ex) {
                fail(e.getMessage());
            }
        }
    }

    public static void seeErrorMsgOnLxModalWindow(String expectedMsg) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        //        assert expectedMsg != null;
//
//        String msg;
//
//        try {
//            msg = AdminGridView.getLxModalMessage();
//        } catch (InterruptedException e) {
//            fail(e.getMessage());
//            return;
//        }
//
//        if (!msg.contains(expectedMsg)) {
//            fail(String.format(
//                "Modal dialog has error message '%s' but expected '%s'",
//                msg,
//                expectedMsg
//            ));
//        }

        int repeatExecutionIfFail = 0;
        for (int i = 0; i < 100; ++i) {
            try {
                repeatExecutionIfFail++;
                if ((SeleniumUtil.verifyTextValue("cssselector", "div[class=frmError]", expectedMsg, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS)) == false) {
                    if (repeatExecutionIfFail > 100) {
                        failWithScreenshot("did-not-see-modal-window-label.png", "Modal window label is null!");
                        return;
                    }
                } else if ((SeleniumUtil.verifyTextValue("cssselector", "div[class=frmError]", expectedMsg, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS)) == true) {
                    logger.info("Verified message " + expectedMsg);
                    return;
                }

            } catch (Exception e) {
                if (repeatExecutionIfFail > 100)
                    fail(e.getMessage());
            }
        }
    }

    public static void getGridActionMessage(String msg) throws InterruptedException {
        for (int i = 0; i < 2; i++) {
            Wait<WebDriver> wait = new FluentWait<WebDriver>(BrowserDriver.getCurrentDriver())
                    .withTimeout(20, TimeUnit.SECONDS)
                    .pollingEvery(1, TimeUnit.SECONDS)
                    .ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);
            try {
                wait.until(ExpectedConditions.presenceOfElementLocated(By.id("msgRow")));
                wait.until(ExpectedConditions.textToBePresentInElementLocated(By.id("msgRow"), msg));
            } catch (NoSuchElementException ne) {
                BaseView.takeScreenshot("NoGridMsg.png");
                fail("No grid element is found" + ne.getMessage());
            } catch (Exception e) {
                BaseView.takeScreenshot("TextDifferentThanExpected.png");
                fail("Element present but text msg is different than expected " + e.getMessage());
            }
        }
    }

    public static void searchRecordInGrid(String record) throws Throwable {
        try {
            for (int i = 0; i < 5; i++) {
                WebElement ele = SeleniumUtil.getElement("xpath", "//*[text()='Search: ']//following-sibling::*//input", 2);
                if (ele != null) {
                    try {
                        ele.clear();
                        ele.sendKeys(record);
                        ele.sendKeys(Keys.ENTER);
                    } catch (Exception e) {
                    }
                    SeleniumUtil.hitEnterKey("xpath", "//*[text()='Search: ']//following-sibling::*//input", SeleniumUtilities.OBJWAITTIMEOUT);
//                    SeleniumUtil.click("cssselector",".x-form-search-trigger",SeleniumUtilities.OBJWAITTIMEOUT);
                    CommonMethods.waitTillDivisionLoads();
                    return;
                }
            }
//            BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[text()='Search: ']//following-sibling::*//input")).clear();
//            BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[text()='Search: ']//following-sibling::*//input")).sendKeys(record);
//            BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-form-search-trigger")).click();
//            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to search record.png");
            fail("Unable to search a record.. " + record);
        }
    }

    public static void filterShowTypeRadioButton(String strShowTypeRadioButton) throws Throwable {
        try {
            List<WebElement> radioButtons = SeleniumUtil.getWebDriver().findElements(By.cssSelector("input[name='showType']"));
            for (WebElement radioButton : radioButtons) {
                if (radioButton.getAttribute("onclick").contains(strShowTypeRadioButton)) {
                    SeleniumUtil.click(radioButton, SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to filter ShowType RadioButton");
            fail("Unable to filterShowTypeRadioButton" + strShowTypeRadioButton);
        }
    }


    public static void getActionSuccessFullMessage(String msg) throws Throwable {
        for (int i = 0; i < 10; i++) {

            if (textToBePresentInElementsLocated(msg)) {
                logger.info("Saw required grid message " + msg);
                break;
            }
            if (i == 9) {
                if (!textToBePresentInElementsLocated(msg)) {
                    logger.info("Did not see the required grid message " + msg);
                    BaseView.takeScreenshot("Unable to filter ShowType RadioButton");
                    fail("Did not see the required grid message " + msg);
                }
            }
        }
    }

    public static void clearSearch(String gridID) throws Throwable {
        for (int i = 0; i < 10; i++) {
            try {

                String strElement = AllContractPagesView.getGridElement(gridID);
                AllContractPagesView.moveToElementAndFocus(strElement);
                WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                try {
                    BaseView.pushShortTimeout(5);
                    gridElement.findElement(By.cssSelector("div.x-form-clear-trigger")).click();
                    if (gridElement.findElement(By.xpath("//*[text()='Search: ']//following-sibling::*//input")).getAttribute("value").equals("")) {
                        CommonMethods.waitTillDivisionLoads();
                        break;
                    }
                } catch (Exception e) {
                    logger.info("Clear search field not present continue....");
                    break;
                }

            } catch (NoSuchElementException ne) {
                BaseView.takeScreenshot("No search elemnt found.png");
            } catch (Exception e) {
                BaseView.takeScreenshot("Search input is not cleared.png");
                fail("Element present but text msg is different than expected " + e.getMessage());
            }
        }
    }

    public static void selectValByIndex(int indexVal) throws Exception {
        try {
            SeleniumUtil.selectByIndex("name", "FolderID", indexVal, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    public static void selectByTextHavingSpace(String option) throws Exception {
        try {
            SeleniumUtil.select("name", "FolderID", option, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }


    public static void clickAddBtn() throws Exception {
        try {
            SeleniumUtil.click("xpath", "//*[contains(text(),'Add item')]/ancestor::div[1]/ancestor::div[1]/ancestor::div[1]/ancestor::div[1]/following-sibling::div[2]//*[text()='Add']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }

    public static void getpopupMessage(String msg) {
        for (int i = 0; i < 2; i++) {
            Wait<WebDriver> wait = new FluentWait<WebDriver>(BrowserDriver.getCurrentDriver())
                    .withTimeout(20, TimeUnit.SECONDS)
                    .pollingEvery(1, TimeUnit.SECONDS)
                    .ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);
            try {
                wait.until(ExpectedConditions.presenceOfElementLocated(By.className("x-box-mc")));
                wait.until(ExpectedConditions.textToBePresentInElementLocated(By.className("x-box-mc"),msg));
            } catch (NoSuchElementException ne) {
                BaseView.takeScreenshot("NoGridMsg.png");
                fail("No grid element is found"+ne.getMessage());
            }catch (Exception e){
                BaseView.takeScreenshot("TextDifferentThanExpected.png");
                fail("Element present but text msg is different than expected "+e.getMessage());
            }
        }
    }
}