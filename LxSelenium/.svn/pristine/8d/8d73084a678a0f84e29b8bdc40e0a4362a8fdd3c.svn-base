package com.lucernex.qa.datamart;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Represents the Dashboard page in the Datamart web-ui.
 */
public class Dashboard {
    // Identifies the parent DOM element contains the [Mapping Schedules] grid.
    @FindBy(how = How.CSS, using = "div#mappingTasksGrid")
    public WebElement mappingSchedulesGrid;

    // Identifies the parent DOM element that contains the [Execution Events] grid.
    @FindBy(how = How.CSS, using = "div#dashboard div[id^=eventGrid-]")
    public WebElement executionEventsGrid;
}
