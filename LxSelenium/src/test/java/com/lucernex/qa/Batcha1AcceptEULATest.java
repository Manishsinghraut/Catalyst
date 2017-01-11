package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = "target/test-classes/AcceptEULA.feature",
//      format = {"html:target/cucumber", "json:target/cucumber.json" },
        format = {"json:target/cucumber.json","html:Batch1AcceptEULATest"},
      strict = true)
public class Batcha1AcceptEULATest {
}
