package com.lucernex.qa.views.iwms.contract.paymentinfo.transactions;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.iwms.contract.paymentInfo.recoveries.RecoveriesPage;
import com.lucernex.qa.pages.iwms.contract.paymentInfo.transactions.TransactionsPage;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by RLE0239 on 26-02-2016.
 */
public class TransactionsView {
    private static final Logger logger = Logger.getLogger(TransactionsView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final TransactionsPage transactionsPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            TransactionsPage.class
    );

    public static void fetchTransactionID() {
        try{
            GenericSteps.lxRecID = transactionsPage.transactionID.getText();
            logger.info("Fetched transaction ID "+GenericSteps.lxRecID);
        }catch (Exception e){
            BaseView.takeScreenshot("Unable to fetch transaction ID.png");
            Assert.fail("Unable to fetch transaction ID ");
        }
    }

    public static void fetchInsuranceID() {
        try{
            GenericSteps.lxRecID = SeleniumUtil.getElementText("cssselector","#Insurance_InsuranceID_span",5);
            logger.info("Fetched Insurance ID "+GenericSteps.lxRecID);
        }catch (Exception e){
            BaseView.takeScreenshot("Unable to fetch Insurance ID.png");
            Assert.fail("Unable to fetch Insurance ID ");
        }
    }

    public static void getEntityID() throws Throwable{
        try {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//*[@id='ContractID_label']/parent::td",1);
            GenericSteps.lxRecID = entityID.replaceAll("Contract RecID\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }
}
