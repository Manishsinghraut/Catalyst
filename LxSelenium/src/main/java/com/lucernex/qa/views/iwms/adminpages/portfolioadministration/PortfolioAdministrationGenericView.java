package com.lucernex.qa.views.iwms.adminpages.portfolioadministration;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.admin.profileadministration.ManageFacilityPage;
import com.lucernex.qa.pages.iwms.contract.details.summary.ExtendContractPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.java.en.And;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


/**
 * Created by RLE0239 on 01/22/2016.
 */
public class PortfolioAdministrationGenericView {
    private static final ManageFacilityPage manageFacilityPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), ManageFacilityPage.class);
    private static final Logger logger = Logger.getLogger(PortfolioAdministrationGenericView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void clickGridLink(String strAction, String gridID, String header, String cellValue, List<Field> fields) throws Throwable {
        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        WebElement clickableRow = null;
        int count = 0;

        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        //Fetch rows
        List<WebElement> fixRow = new ArrayList<WebElement>();

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                AllContractPagesView.focusWebElement(td);
                SeleniumUtilities.waitForNonStaleWebElement(td);
                if (td.getText().trim().equals(cellValue.trim()) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                    fixRow.add(BrowserDriver.getParent(td));
                }
            }
        }

        for (WebElement ele : fixRow) {
            List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
            row = 0;
            foundCount = 0;
            for (WebElement cell : cells) {
                row = row + 1;
                AllContractPagesView.focusWebElement(cells.get(cells.size() - 1));
                AllContractPagesView.focusWebElement(cell);
                for (Field f : fields) {
                    if (cell.getText().contains(f.getValue()) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                        foundCount++;
                    }
                }
            }

            if (foundCount == fields.size()) {
                try {
                    count = foundCount;
                    clickableRow = ele;
                    logger.info("Final Expected " + cellValue + " is present under column header " + header);
                    AllContractPagesView.focusWebElement(clickableRow.findElement(By.partialLinkText(strAction)));
                    clickableRow.findElement(By.partialLinkText(strAction)).click();
                } catch (Exception e) {
                    clickableRow.click();
                    try {
                        clickableRow.click();
                    } catch (Exception ex) {
                        clickableRow.click();
                    }
                }
            }
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            org.junit.Assert.fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void validateSuccessMessage(List<String> text) throws Throwable {
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
        for (String msg : text) {
            try {
                for (int i = 1; i < 10; i++) {
                    WebDriverWait waitIncrement = new WebDriverWait(BrowserDriver.getCurrentDriver(), i * 5);
                    try {
                        waitIncrement.until(ExpectedConditions
                                .textToBePresentInElement(manageFacilityPage.successMsg, msg));
                        break;
                    } catch (Exception e) {
                    }
                }
                wait.until(ExpectedConditions
                        .textToBePresentInElement(manageFacilityPage.successMsg, msg));
                logger.info("text present " + msg + " in page");
            } catch (Exception Ex) {
                BaseView.takeScreenshot("successMessage.png");
                logger.info("Error :" + Ex.getMessage());
                org.junit.Assert.fail("Error :" + Ex.getMessage());
            }
        }
    }

    public static void inactiveSchedulePopupMsg(String msg) throws Throwable {

        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
        try {
            for (int i = 1; i < 10; i++) {
                WebDriverWait waitIncrement = new WebDriverWait(BrowserDriver.getCurrentDriver(), i * 5);
                try {
                    waitIncrement.until(ExpectedConditions
                            .textToBePresentInElement(manageFacilityPage.inactiveSchedule, msg));
                    break;
                } catch (Exception e) {
                }
            }
            wait.until(ExpectedConditions
                    .textToBePresentInElement(manageFacilityPage.inactiveSchedule, msg));
            logger.info("text present " + msg + " in page");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("successMessage.png");
            logger.info("Error :" + Ex.getMessage());
            org.junit.Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void selectInactiveFacilities() throws Throwable {
        SeleniumUtil.click(manageFacilityPage.listInactive, 1);
    }
}