package com.lucernex.qa.steps.iwms;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class EntityNavigationSteps {
    private static final Logger logger = Logger.getLogger(EntityNavigationSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I expand portfolio navigation tab$")
    public void I_expand_entity_navigation_tab() throws Throwable {
        PortfolioNavigationView.expandPortfolioNavigationTab();
    }

    @And("^I collapse portfolio navigation tab$")
     public void I_collapse_entity_navigation_tab() throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
    }

    @And("^I navigate to entity \"([^\"]*)\"$")
    public void I_navigate_to_entity(String entityName) throws Throwable {
        PortfolioNavigationView.navigateToEntity(entityName);
    }

    @And("^I close alert$")
    public void I_close_alert() throws Throwable {
        PortfolioNavigationView.closeAlertInDashboard();
    }

    @And("^I verify entity \"([^\"]*)\" in left panel$")
    public void I_verify_entity_in_left_panel(String entityName) throws Throwable {
        PortfolioNavigationView.verifyEntityInLeftTree(entityName);
    }
}