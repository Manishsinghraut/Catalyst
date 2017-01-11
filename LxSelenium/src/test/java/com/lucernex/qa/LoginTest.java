package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = "target/test-classes/iwms/Login.feature", //path to the features
    format = {"html:target/cucumber", "json:target/cucumber.json" },
    strict = true,
    tags = {"@login"})//what tags to include(@)/exclude(@~)
public class LoginTest {
}
