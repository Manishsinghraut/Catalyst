package com.lucernex.qa.datamart;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.ArrayList;
import java.util.List;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;
import static org.junit.Assert.fail;

/**
 * Represents the Mapping Schedules grid within the Dashboard page.
 */
public class MappingSchedulesGrid extends Grid {
    private WebElement parent;
    private Dashboard dashboard;

    protected Row createRow(WebElement row) {
        List<WebElement> cells = row.findElements(By.cssSelector(".x-grid-cell"));

        if (cells == null || cells.isEmpty()) {
            return null;
        }

        ActionsCell actionsCell = null;
        List<String>        lst = new ArrayList<String>(cells.size());

        for (WebElement c : cells) {
            String cssClass = c.getAttribute("class");

            assertNotNull(cssClass);

            if (cssClass.contains("x-action-col-cell")) {
                actionsCell = new ActionsCell(BrowserDriver.getCurrentDriver(), c);
                assertNotNull(actionsCell);
                lst.add("Actions");
            } else {
                WebElement inner = c.findElement(By.cssSelector("div.x-grid-cell-inner"));

                assertNotNull(inner);
                lst.add(inner.getText());
            }
        }

        if (actionsCell == null) {
            return new Row(lst);
        } else {
            return new Row(actionsCell, lst);
        }
    }

    /**
     * Returns the column index of the column with a header matching specified
     * name or -1 if not found.
     *
     * @param name - desired column header name
     */
    public int findMappingColumnByName(String name) {
        List<String> columns = getColumnHeaders();
        int      columnIndex = -1;

        for (int i = 0; i < columns.size(); i++) {
            if (columns.get(i).equals(name)) {
                columnIndex = i;
                break;
            }
        }

        return columnIndex;
    }

    /**
     * Returns a list of Row instance that have a mapping name matching the
     * one specified.
     *
     * @param name - desired mapping name
     */
    public List<Row> findRowsByName(String name) {
        int columnIndex = -1;


        // The grid search can be slow right after creating a new mapping so we
        // need to be patient here.
        do {
            columnIndex = findMappingColumnByName("Name");
            if (columnIndex == -1) {
                try {
                    Thread.sleep(3000l);
                } catch (InterruptedException e) {
                }
            }
        } while (columnIndex == -1);

        assertTrue("Did not see the 'Name' column header!", columnIndex > -1);

        List<Row> rows = getRows();

        assertTrue(rows.size() > 0);

        List<Row> matches = new ArrayList<Row>(rows.size());

        for (Row r : rows) {
            String n = r.getCells().get(columnIndex);

            if (name.equals(n)) {
                matches.add(r);
            }
        }

        return matches;
    }

    private static long RUNNING_DOM_POLLING_INTERVAL = 100L;

    /**
     * Waits for the mapping execution to start executing (RUNNING state).
     *
     * @param mappingName - desired mapping name
     * @param timeout     - timeout in seconds
     */
    public boolean waitForMappingExecutionToStart(final String mappingName, int timeout) {
        final int statusColumn = findMappingColumnByName("ExecutionStatus");

        assertTrue("Did not see the 'ExecutionStatus' column header!", statusColumn > -1);

        ExpectedCondition<Boolean> finishedState = new
        ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver driver) {
                init(parent);

                List<Row> rows = findRowsByName(mappingName);

                for (Row r : rows) {
                    String status = r.getCells().get(statusColumn);

                    if (status.equals("RUNNING")) {
                        return Boolean.TRUE;
                    }
                }

                return Boolean.FALSE;
            }
        };

        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), timeout, RUNNING_DOM_POLLING_INTERVAL);

        return wait.until(finishedState);
    }

    private static long DOM_POLLING_INTERVAL = 4000L;

    /**
     * Waits for the mapping execution to reach something other than RUNNING state.
     *
     * @param mappingName - desired mapping name
     * @param timeout     - timeout in seconds
     */
    public boolean waitForMappingExecutionToFinish(final String mappingName, int timeout) {
        final int statusColumn = findMappingColumnByName("ExecutionStatus");

        assertTrue("Did not see the 'ExecutionStatus' column header!", statusColumn > -1);

        ExpectedCondition<Boolean> finishedState = new
        ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver driver) {
                int tries = 0;
                boolean stale;

                do {
                    try {
                        if (tries > 0) {
                            parent = driver.findElement(By.cssSelector("div#mappingTasksGrid"));
                        }
                        init(parent);
                        stale = false;
                    } catch (StaleElementReferenceException e) {
                        // This can happen because of server side push (cometd) which can
                        // cause the DOM to update.
                        stale  = true;

                        if (++tries > 5) {
                            fail(String.format("Unable create MappingSchedulesGrid after %d tries!", tries));
                        }
                    }
                } while (stale);

                List<Row> rows = findRowsByName(mappingName);

                for (Row r : rows) {
                    String status = r.getCells().get(statusColumn);

                    if (status.equals("FINISHED")) {
                        return Boolean.TRUE;
                    }
                }

                return Boolean.FALSE;
            }
        };

        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), timeout, DOM_POLLING_INTERVAL);

        return wait.until(finishedState);
    }

    public MappingSchedulesGrid(Dashboard dashboard, WebElement grid) {
        super(grid);
        this.dashboard = dashboard;
        this.parent    = grid;
    }
}
