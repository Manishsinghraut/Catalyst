package com.lucernex.qa.views.components;

import com.lucernex.qa.pages.components.LxSearchResultsPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertNotNull;

/**
 * Created by salomem on 5/12/14.
 */
public class LxSearchResultsView extends BaseView {
    private static final Logger LOGGER = Logger.getLogger(LxSearchResultsView.class.getName());
    private static final LxSearchResultsPage lxSearchResultPage = PageFactory.
            initElements(BrowserDriver.getCurrentDriver(), LxSearchResultsPage.class);

    /**
     * Returns the table WebElement that holds the matching search results for the given entity type
     * @param expectedEntityType - the entity type that is being searching for.
     * @return The WebElement that is underneath the entity tab of the expected entity tab
     * @throws InterruptedException
     */
    public static WebElement getEntityTypeResults(String expectedEntityType) throws InterruptedException {
        LOGGER.info("Searching for the expected entity type...");

        WebElement expectedEntityTab = null;
        LxSearchResultsPage.EntityType entityType = LxSearchResultsPage.EntityType.fromString(expectedEntityType);

        //  Find the correct entity tab
        int indexOfTab = 0;
        for(WebElement entityTab : lxSearchResultPage.entityTabs) {
            if(entityTab.getText().contains(entityType.getLabel())) {
                LOGGER.info("Found the expected entity type...");
                expectedEntityTab = entityTab;
                break;
            }
            indexOfTab++;
        }

        assertNotNull("Did not see the expected entity tab section!", expectedEntityTab);

        //  All of the links under the expected entity type
        LOGGER.info("Collecting all " + expectedEntityType + " results");
        int indexOfResultsTable = 1 + 4*indexOfTab;
        WebElement resultsTable = BrowserDriver.findElementWithTimeout(
                By.cssSelector("div.x-tab-strip-wrap:nth-child(" + indexOfResultsTable + ") + table + table.tblBorder"),5);

        return resultsTable;
    }

    /**
     * Clicks the link that contains the specified search text that is of the expected entity type. Clicks the first
     * result if none of the results under the expected entity type contain the expected search text.
     * @param expectedSearchText - Search text
     * @param expectedEntityType - The expected entity type
     */
    public static void clickLink(String expectedSearchText, String expectedEntityType) throws InterruptedException {
        //  Get the list of links that are of the expected entity type
        WebElement resultsTable = getEntityTypeResults(expectedEntityType);
        List<WebElement> resultLinks = resultsTable.findElements(By.tagName("a"));

        //  If there is more than one matching item
        if(resultLinks.size() > 1) {
            try {
                //  Click on the first item that matches exactly
                BaseView.pushShortTimeout();    //  Wait for a short while
                resultsTable.findElement(By.linkText(expectedSearchText)).click();
                LOGGER.info("Clicking the first exact match that was found...");
            } catch (NoSuchElementException e) {
                //  Click on the first item that contains a partial match
                resultsTable.findElement(By.partialLinkText(expectedSearchText)).click();
                LOGGER.info("Clicking the first partial match that was found...");
            } finally {
                BaseView.popDefaultTimeout();   //  Restore the default wait time
            }

        } else {
            LOGGER.info("Clicking the first link that was found...");
            resultLinks.get(0).click();
        }
    }
}
