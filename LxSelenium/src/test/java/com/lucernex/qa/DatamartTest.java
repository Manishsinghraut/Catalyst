package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * This test does not need the Firefox profile which can be disabled via this JVM property:
 *     -Dno-browser-profile=true
 * So when running this test, specify the above JVM property.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = "target/test-classes/datamart", // we specify target vs src because we want maven filtered .feature files
    format = {"json:target/integration_cucumber.json"},//what formatters to use
    tags = {"@datamart"})//what tags to include(@)/exclude(@~)
public class DatamartTest {
}
