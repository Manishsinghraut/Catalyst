package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = "target/test-classes/iwms", //path to the features
        format = {"json:target/cucumber.json"},//what formatters to use
        tags = {"@all"})//what tags to include(@)/exclude(@~)
public class AllCucumberTests {
}