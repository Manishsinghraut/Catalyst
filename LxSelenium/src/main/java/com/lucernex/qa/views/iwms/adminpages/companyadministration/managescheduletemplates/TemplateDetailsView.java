package com.lucernex.qa.views.iwms.adminpages.companyadministration.managescheduletemplates;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static org.junit.Assert.fail;

/**
 * Created by rle239 on 6/27/2015.
 */
public class TemplateDetailsView {

    private static final Logger logger = Logger.getLogger(Logger.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void clickLinkWhenReady(String groupName, String link) throws  Throwable {
        logger.info("Attempting to click link " + link + "...");
        //time for the grid to load
        CommonMethods.waitTillDivisionLoads();

        int maxTries = 10;
        int count = 0;
        for (count = 0; count < maxTries; count++) {
            logger.info("Try " + count + " for link: " + link + "...");

            for (WebElement group : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.dataNormalHdr"))) {
                if (group.getText().contains(groupName)) {
                    for (WebElement links : group.findElements(By.xpath("following-sibling::td"))) {
                        if (links.getText().contains(link)) {
                            try {
                                try {
                                    links.findElement(By.linkText(link)).sendKeys("");
                                } catch (Exception e) {
                                    //Ignore
                                }
                                SeleniumUtil.waitForElementVisibilityOf("linktext",link,5,2);
                                links.findElement(By.linkText(link)).click();
                                return;
                            } catch (Exception e) {
                                //Ignore
//                                delay(1000);
                            }
                        }
                    }
                }
            }
        }
        BaseView.takeScreenshot("Did not find the link " + link + " after " + maxTries + " attempts.png");
        fail("Did not find the link " + link + " after " + maxTries + " attempts");
    }
}