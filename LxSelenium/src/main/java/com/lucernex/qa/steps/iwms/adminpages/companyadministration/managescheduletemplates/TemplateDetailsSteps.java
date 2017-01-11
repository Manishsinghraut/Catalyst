package com.lucernex.qa.steps.iwms.adminpages.companyadministration.managescheduletemplates;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.managescheduletemplates.TemplateDetailsView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static com.lucernex.qa.views.iwms.adminpages.companyadministration.managepages.PageLayoutView.deletePageLayout;
import static org.junit.Assert.fail;

/**
 * Created by rle239 on 6/27/2015.
 */
public class TemplateDetailsSteps {

    private static final Logger logger = Logger.getLogger(Logger.class.getName());

    @And("^I click \"([^\"]*)\" link corresponding to \"([^\"]*)\" group$")
    public void I_click_delete_link_of_the_page_layout(String link, String group) throws Throwable{
        TemplateDetailsView.clickLinkWhenReady(group,link);
    }
}