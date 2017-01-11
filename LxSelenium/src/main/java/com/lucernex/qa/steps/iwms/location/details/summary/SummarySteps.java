package com.lucernex.qa.steps.iwms.location.details.summary;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.contract.paymentinfo.transactions.TransactionsView;
import com.lucernex.qa.views.iwms.location.summary.SummaryView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;

/**
 * Created by RLE0097 on 10/27/2015.
 */
public class SummarySteps {
    private static final Logger logger = Logger.getLogger(SummarySteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;

    @And("^I verify the \"([^\"]*)\"$")
    public void I_verify_the(String strValue) throws Throwable {
        SeleniumUtil.getFrameIndex("xpath","//div[@id='TaxRate1_label']/parent::td");
        String ExtractValue = SeleniumUtil.getTextValue("xpath", "//div[@id='TaxRate1_label']/parent::td", SeleniumUtilities.OBJWAITTIMEOUT);
        assertTrue(ExtractValue.replaceAll("[\\t\\n\\r]"," ").contains(strValue));
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I Select \"([^\"]*)\" from \"([^\"]*)\" filter drop-down and enter \"([^\"]*)\"$")
    public void I_Select_from_filter_drop_down_and_enter(String strValue, String strFieldName, String strEnterValue) throws Throwable {
        SeleniumUtil.select("cssselector",".linedTable>tbody>tr>td>select",strValue,SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.type("cssselector", ".linedTable>tbody>tr>td>input", strEnterValue, SeleniumUtilities.OBJWAITTIMEOUT);
    }

    @And("^I fetch entity ID from location summary page$")
    public void I_fetch_entity_ID_from_location_summary_page() throws Throwable {
        SummaryView.getEntityID();
    }
}
