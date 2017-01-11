package com.lucernex.qa;

import com.lucernex.qa.browsers.BrowserDriver;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.runtime.junit.ExecutionUnitRunner;
import cucumber.runtime.junit.JUnitReporter;
import cucumber.runtime.model.CucumberFeature;
import cucumber.runtime.model.CucumberScenario;
import cucumber.runtime.model.StepContainer;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.lang.reflect.Field;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ScenarioLogger {
    private static final Logger logger = Logger.getLogger(ScenarioLogger.class.getName());

    private static void log(Scenario scenario, boolean before) throws Exception {
        Field reporterField = scenario.getClass().getDeclaredField("reporter");

        if (reporterField == null) {
            return;
        }

        reporterField.setAccessible(true);

        JUnitReporter reporter;

        try {
            reporter = (JUnitReporter)reporterField.get(scenario);
        } catch (Exception e) {
            return;
        }

        Field executionRunnerField = reporter.getClass().getDeclaredField("executionUnitRunner");

        if (executionRunnerField == null) {
            return;
        }

        executionRunnerField.setAccessible(true);

        ExecutionUnitRunner executionUnitRunner = (ExecutionUnitRunner) executionRunnerField.get(reporter);

        if (executionUnitRunner == null) {
            return;
        }

        Field cucumberScenarioField = executionUnitRunner.getClass().getDeclaredField("cucumberScenario");

        if (cucumberScenarioField == null) {
            return;
        }

        cucumberScenarioField.setAccessible(true);

        CucumberScenario cucumberScenario = (CucumberScenario) cucumberScenarioField.get(executionUnitRunner);
        Field        cucumberFeatureField = StepContainer.class.getDeclaredField("cucumberFeature");

        if (cucumberFeatureField == null) {
            return;
        }

        cucumberFeatureField.setAccessible(true);

        CucumberFeature cucumberFeature = (CucumberFeature)cucumberFeatureField.get(cucumberScenario);
        Field pathField = CucumberFeature.class.getDeclaredField("path");

        if (pathField == null) {
            return;
        }

        pathField.setAccessible(true);

        String path = (String)pathField.get(cucumberFeature);

        if (path == null) {
            return;
        }

        int offset = "target/test-classes".length() + 1;

        if (path.length() > offset) {
            path = path.substring(offset);
        }

        if (before) {
            String msg = String.format("Before executing scenario [%s] in feature file [%s]", scenario.getName(), path);

            logger.info(msg);
        } else {
            String msg = String.format("After executing scenario [%s] in feature file [%s]", scenario.getName(), path);

            logger.info(msg);
        }
    }

    @Before
    public static void beforeExecution(Scenario scenario) {
        try {
            log(scenario, true);
        } catch (Exception e) {
            logger.log(Level.INFO, "Unable to log before scenario execution", e);
        }
    }

    @After
    public static void afterExecution(Scenario scenario) {
        try {
            log(scenario, false);
        } catch (Exception e) {
            // ignore
        }

        if (scenario.isFailed()) {
            try {
                TakesScreenshot ts = (TakesScreenshot) BrowserDriver.getCurrentDriver();

                if (ts != null) {
                    byte[] bytes = ts.getScreenshotAs(OutputType.BYTES);

                    if (bytes != null) {
                        scenario.embed(bytes, "image/png");
                    }
                }
            } catch (Exception e) {
                // ignore
            }
        }
    }
}
