package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/15/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/PreserveGlobalPages/CapitaProjectPreserveGlobalPages.feature",
                "target/test-classes/iwms/PreserveGlobalPages/LocationPreserveGlobalPages.feature",
                "target/test-classes/iwms/PreserveGlobalPages/ParcelPreserveGlobalPages.feature",
                "target/test-classes/iwms/PreserveGlobalPages/PortfolioPreserveGlobalPages.feature",
                "target/test-classes/iwms/PreserveGlobalPages/SitePreserveGlobalPages.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchb9PreserveGlobalPages"}
)
public class Batchb9PreserveGlobalPagesTests {
}
