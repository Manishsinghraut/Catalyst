package com.lucernex.qa;

/**
 * Created by RLE0097 on 28-11-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/FormAAvailableForASpecificPortfolio.feature",
        "target/test-classes/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/FormNotAvailableForOtherPortfolios.feature",
        "target/test-classes/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/FormCAvailableForAllPortfolios.feature",
        "target/test-classes/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/WorkFlowKickedOffByFormCAvailableForAllPortfoliosCapitalPrograms.feature",
        "target/test-classes/iwms/Portfolio/Details/FilteringByPortfolioForWorkFlowAndForms/WorkFlowKickedOffByFormCAvailableForSpecificPortfoliosCapitalPrograms.feature",
    },
    format = {"json:target/cucumber.json", "html:FilteringByPortfolioForWorkFlowAndFormsTests"}
)
public class FilteringByPortfolioForWorkFlowAndFormsTests {
}
