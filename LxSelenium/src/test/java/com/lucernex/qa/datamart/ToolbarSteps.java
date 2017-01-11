package com.lucernex.qa.datamart;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.CucumberContext;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import org.openqa.selenium.support.PageFactory;

import java.net.URL;

import static junit.framework.Assert.assertNotNull;

public class ToolbarSteps {
    private static final Toolbar toolbar = PageFactory.initElements(BrowserDriver.getCurrentDriver(), Toolbar.class);

    /**
     * Click on the Dashboard button within the toolbar.
     */
    public void clickDashboardBtn() {
        toolbar.dashboardBtn.click();
    }

    /**
     * Click on the [Create Mapping] button within the toolbar.
     *
     * @return CreateMapping page which is shown when clicking this button
     */
    public CreateMapping clickCreateMappingBtn() {
        toolbar.createMappingBtn.click();

        return new CreateMapping(BrowserDriver.getCurrentDriver());
    }

    /**
     * Click on the [Log Events] button within the toolbar.
     */
    public void clickLogEventsBtn() {
        toolbar.logEventsBtn.click();
    }

    @Given("^I navigate to Datamart at \"([^\"]*)\"$")
    public void I_navigate_to_Datamart_at(String url) throws Throwable {
        BrowserDriver.loadPage(url);

        CucumberContext.getCucumberContext().put(CucumberContext.IWMS_URL, new URL(url));
    }

    @And("^I see the Toolbar$")
    public void I_see_the_Toolbar() throws Throwable {
        Toolbar toolbar = PageFactory.initElements(BrowserDriver.getCurrentDriver(), Toolbar.class);

        assertNotNull("Datamart toolbar not seen!", toolbar);

        CucumberContext.getCucumberContext().put(Toolbar.class.getSimpleName(), toolbar);
    }

    @And("^I click the \"([^\"]*)\" toolbar button$")
    public void I_click_the_toolbar_button(String button) throws Throwable {
        Toolbar toolbar = (Toolbar) CucumberContext.getCucumberContext().get(Toolbar.class.getSimpleName());

        assertNotNull(toolbar);

        if (button.equals("Dashboard")) {
            clickDashboardBtn();
        } else if (button.equals("Create Mapping")) {
            CreateMapping createMapping = clickCreateMappingBtn();
            CucumberContext.getCucumberContext().put(CreateMapping.class.getSimpleName(), createMapping);
        } else if (button.equals("Log Events")) {
            // TODO: implement
        }
    }
}
