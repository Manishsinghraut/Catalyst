package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 03-06-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = "target/test-classes/iwms", //path to the features
        format = {"json:target/cucumber.json"},//what formatters to use
        tags = {"@smoke5Dot1"})//what tags to include(@)/exclude(@~)
public class Smoke5Dot1Tests {
}
