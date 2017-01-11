package com.lucernex.qa.views.iwms.contract.details.summary;

/**
 * Created by RLE0239 on 02-12-2015.
 */

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.iwms.contract.details.summary.ExtendContractPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.junit.Assert;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;


public class ExtendContractView {

    private static final ExtendContractPage extendContractPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), ExtendContractPage.class);
    private static final Logger logger = Logger.getLogger(ExtendContractView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void validateContractExtendedSuccessMessage(List<String> text) throws Throwable {

       /* WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 60);
        wait.until(ExpectedConditions.visibilityOf(extendContractPage.donebutton));*/
        CommonMethods.waitTillDivisionLoads();
        for (String msg : text) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
                wait.until(ExpectedConditions
                        .textToBePresentInElement(extendContractPage.successMsg, msg));
                logger.info("text present " + msg + " in page");
            } catch (Exception Ex) {
                BaseView.takeScreenshot("successMessage.png");
                logger.info("Error :" + Ex.getMessage());
                Assert.fail("Error :" + Ex.getMessage());
            }
        }
    }
}
