package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by salomem on 5/21/14.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = "target/test-classes/iwms", //path to the features
        format = {"json:target/cucumber.json"},//what formatters to use
        tags = {"@smoke"})//what tags to include(@)/exclude(@~)
public class SmokeTest {
}