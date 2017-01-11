package com.lucernex.qa.datamart;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

/**
 * Represents the 'Execution Events' grid which is on the Dashboard page.
 */
public class ExecutionEventsGrid extends Grid {
    private Dashboard dashboard;

    private WebElement findDetailsMessageBox() {
        BrowserDriver.waitForElement(dashboard.executionEventsGrid);
        assertTrue(
                "Did not see the [Execution Events] grid!",
                dashboard.executionEventsGrid.isDisplayed()
        );

        return dashboard.executionEventsGrid.findElement(By.cssSelector("div[id^=messagebox-]"));
    }

    public boolean isDetailsMessageBoxVisible() {
        WebElement messageBox = findDetailsMessageBox();

        if (messageBox == null) {
            return false;
        } else {
            return messageBox.isDisplayed();
        }
    }

    public void dismissDetailsMessageBox() {
        WebElement messageBox = findDetailsMessageBox();

        assertNotNull("Did not see the Details message box!", messageBox);

        WebElement okBtn = messageBox.findElement(By.cssSelector("button"));

        assertNotNull("Did not see the OK button on the Details message box!", messageBox);

        okBtn.click();
    }

    public ExecutionEventsGrid(Dashboard dashboard, WebElement grid) {
        super(grid);
        this.dashboard = dashboard;
    }
}
