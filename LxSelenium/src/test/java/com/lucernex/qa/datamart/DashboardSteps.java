package com.lucernex.qa.datamart;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.*;

public class DashboardSteps {
    private static final Logger logger = Logger.getLogger(DashboardSteps.class.getName());

    @And("^I see the Dashboard$")
    public void I_see_the_Dashboard() {
        logger.info("Saw the Dashboard.");
    }

    @And("^I see the Dashboard with a new mapping named \"([^\"]*)\"$")
    public void I_see_the_Dashboard_with_a_new_mapping_named(String mappingName) {
        try {
            Thread.sleep(2000l);
        } catch (InterruptedException e) {
        }

        try {
            DashboardView.waitForMappingSchedulesGrid();
        } catch (InterruptedException e) {
            String screenshotFile = "mapping-not-seen.png";

            BaseView.takeScreenshot(screenshotFile);
            logger.info(String.format("Took screenshot to file '%s'", screenshotFile));

            fail("Never saw the expected mapping named " + mappingName);
        }

        MappingSchedulesGrid grid = DashboardView.getMappingSchedulesGrid();
        List<Row>            rows = grid.findRowsByName(mappingName);

        assertNotNull(String.format("Did not see a mapping named '%s'", mappingName), rows);
        logger.info(String.format("Saw the new mapping named '%s'", mappingName));
    }

    @When("^I click the \"([^\"]*)\" action on mapping named \"([^\"]*)\"$")
    public void I_click_the_action_on_mapping_named(String action, String mapping) {
        MappingSchedulesGrid grid = DashboardView.getMappingSchedulesGrid();
        List<Row>            rows = grid.findRowsByName(mapping);
        int          statusColumn = grid.findMappingColumnByName("ExecutionStatus");

        assertNotNull(String.format("Did not see a mapping named '%s'", mapping), rows);
        assertTrue("Did not see the 'ExecutionStatus' column header!", statusColumn > -1);

        // Search the matching Row instances for one in the WAITING state.
        for (Row r : rows) {
            String status = r.getCells().get(statusColumn);

            if (status.equals("WAITING")) {
                r.getActionsCell().clickAction(action);

                // Wait for the confirmation dialog to appear.
                for (int i = 0; i < 2; i++) {
                    try {
                        ConfirmDialog cd = new ConfirmDialog(BrowserDriver.getCurrentDriver());

                        cd.clickYesButton();

                        logger.info(String.format("Executed action '%s' on mapping named '%s'", action, mapping));
                        return;
                    } catch (InterruptedException e) {
                        try {
                            Thread.sleep(1000l);
                        } catch (InterruptedException e1) {
                        }
                    }
                }
            }
        }

        String screenshotFile = "mapping-in-waiting-state-not-seen.png";

        BaseView.takeScreenshot(screenshotFile);
        logger.info(String.format("Took screenshot to file '%s'", screenshotFile));

        fail(String.format("Did not find a row with name '%s' and in the WAITING state!", mapping));
    }

    @Then("^I see the mapping \"([^\"]*)\" start execution$")
    public void I_see_the_mapping_start_execution(String mapping) {
        MappingSchedulesGrid grid = DashboardView.getMappingSchedulesGrid();

        assertTrue(
                String.format("Did not see mapping '%s' start execution!", mapping),
                grid.waitForMappingExecutionToStart(mapping, 10)
        );

        logger.info(String.format("Saw the mapping named '%s' start execution.", mapping));
    }

    private final static int THREE_HOURS = 3 * 60 * 60;

    @And("^I see the mapping \"([^\"]*)\" finish execution$")
    public void I_see_the_mapping_finish_execution(String mapping) {
        MappingSchedulesGrid grid = DashboardView.getMappingSchedulesGrid();

        assertTrue(
                String.format("Did not see mapping '%s' finish execution!", mapping),
                grid.waitForMappingExecutionToFinish(mapping, THREE_HOURS)
        );

        logger.info(String.format("Saw the mapping named '%s' finish execution.", mapping));

        String screenshotFile = "finished_execution.png";

        BaseView.takeScreenshot(screenshotFile);
        logger.info(String.format("Took screenshot to file '%s'", screenshotFile));
    }
}
