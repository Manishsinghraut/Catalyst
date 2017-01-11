package com.lucernex.qa.views.lxsiteadminpage;

import com.lucernex.qa.pages.lxsiteadminpage.LxSiteAdminPage;
import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static org.junit.Assert.assertNotNull;

/**
 * Created by salomem on 7/15/2014.
 */
public class LxSiteAdminPageView {
    private static final Logger LOGGER = Logger.getLogger(LxSiteAdminPageView.class.getName());

    private static LxSiteAdminPage lxSiteAdminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(),
            LxSiteAdminPage.class);

    public static void clickButton(String name) {
        WebElement btnElement;

        switch (LxSiteAdminPage.LxAdminButton.fromString(name)) {
            case CREATE_NEW_COMPANY:
                btnElement  =   lxSiteAdminPage.createNewCompanyBtn;
                break;
            case RUN_EMAIL_ALERTS:
                btnElement = lxSiteAdminPage.runEmailAlertsBtn;
                break;
            default:
                btnElement = null;
                break;
        }

        assertNotNull("Did not find the button on the Lx Admin Page", btnElement);

        LOGGER.info(String.format("Clicking on the '%s' button", name));
        btnElement.click();
    }
}
