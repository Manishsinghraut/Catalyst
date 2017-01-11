package com.lucernex.qa.datamart;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;

import static junit.framework.Assert.fail;

public class DashboardView {
    private static final Dashboard dashboard = AjaxEnabledPageFactory.ajaxInitElements(
            BrowserDriver.getCurrentDriver(),
            Dashboard.class
    );

    /**
     * Returns a representation of the [Mapping Schedules] grid within the Dashboard view.
     */
    public static MappingSchedulesGrid getMappingSchedulesGrid() {
        MappingSchedulesGrid grid = null;
        int tries = 0;

        do {
            try {
                grid = new MappingSchedulesGrid(dashboard, dashboard.mappingSchedulesGrid);
            } catch (StaleElementReferenceException e) {
                // We can get this exception due to server side push (cometd)
                // which can cause a rebuild of the [Mapping Schedules] grid.
                dashboard.mappingSchedulesGrid = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div#mappingTasksGrid"));

                if (++tries > 5) {
                    fail(String.format("Failed to query DOM after %d tries!", tries));
                }
            }
        } while (grid == null);

        return grid;
    }

    /**
     * Returns a representation of the [Execution Events] grid within the Dashboard view.
     */
    public static ExecutionEventsGrid getExecutionEventsGrid() {
        ExecutionEventsGrid grid = null;
        int tries = 0;

        do {
            try {
                grid = new ExecutionEventsGrid(dashboard, dashboard.executionEventsGrid);
            } catch (StaleElementReferenceException e) {
                // We can get this exception due to server side push (cometd)
                // which can cause a rebuild of the [Execution Events] grid.
                dashboard.executionEventsGrid = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div#dashboard div[id^=eventGrid-]"));

                if (++tries > 5) {
                    fail(String.format("Failed to query DOM after %d tries!", tries));
                }
            }
        } while (grid == null);

        return grid;
    }

    /**
     * Wait until we can see the [Mapping Schedules] grid which may take awhile
     * after we have clicked the Create button on the [Create Mapping] page.
     *
     * @return true if we saw it, otherwise false.
     */
    public static boolean waitForMappingSchedulesGrid() throws InterruptedException {
        WebElement we = BrowserDriver.findElementWithTimeout(By.cssSelector("div#mappingTasksGrid"), 15);

        return we.isDisplayed();
    }
}
