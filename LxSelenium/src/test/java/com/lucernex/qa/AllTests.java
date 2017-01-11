//package com.lucernex.qa;
//
//
//        import org.junit.runner.RunWith;
//        import org.junit.runners.Suite;
//
//@RunWith(Suite.class)
//@Suite.SuiteClasses({
//        AllCucumberTests.class,
//        NonCucumberTestSuite.class
//})
package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 30-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = "target/test-classes/iwms", //path to the features
        format = {"json:target/cucumber.json"},//what formatters to use
        tags = {"@smoke"})//what tags to include(@)/exclude(@~)
public class AllTests {
}
