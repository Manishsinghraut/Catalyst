package com.lucernex.qa.views.entity.contract.paymentinfo.percentagerent;

import com.lucernex.qa.pages.entity.contract.paymentinfo.percentagerent.PercentageRentPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * @since 1.0.0
 * @author Andrew.Subichev
 */
public class PercentageRentView extends BaseView {
    private static final Logger logger = Logger.getLogger(PercentageRentView.class.getName());

    private static PercentageRentPage percentageRentPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            PercentageRentPage.class
    );

    public static void clickEditFirstOffsetLink(String gridId) throws InterruptedException {
        logger.info("Clicking edit first offset link");
        switchToFrameWithField("#" + gridId);
        percentageRentPage.editFirstOffsetLink.click();
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void clickEditSecondOffsetLink(String gridId) throws InterruptedException {
        logger.info("Clicking edit second offset link");
        switchToFrameWithField("#" + gridId);
        percentageRentPage.editSecondOffsetLink.click();
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void clickEditThirdOffsetLink(String gridId) throws InterruptedException {
        logger.info("Clicking edit third offset link");
        switchToFrameWithField("#" + gridId);
        percentageRentPage.editThirdOffsetLink.click();
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void verifyCheckedRadioButton(String radioButtonValue) throws InterruptedException {
        logger.info("Verifying checked radio button");
        if(!StringUtils.equals(percentageRentPage.checkedOffsetRadioButton.getAttribute("value"), radioButtonValue)) {
            throw new RuntimeException("Invalid radio button selected");
        }
    }

}
