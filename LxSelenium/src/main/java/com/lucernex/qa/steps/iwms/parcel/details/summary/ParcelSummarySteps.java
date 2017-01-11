package com.lucernex.qa.steps.iwms.parcel.details.summary;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.location.summary.SummaryView;
import com.lucernex.qa.views.iwms.parcel.ParcelSummaryView;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;

/**
 * Created by RLE0097 on 10/27/2015.
 */
public class ParcelSummarySteps {
    private static final Logger logger = Logger.getLogger(ParcelSummarySteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;

    @And("^I fetch entity ID from parcel summary page$")
    public void I_fetch_entity_ID_from_parcel_summary_page() throws Throwable {
        ParcelSummaryView.getEntityID();
    }
}
