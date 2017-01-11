package com.lucernex.qa.views.components;

import com.lucernex.qa.pages.components.EXTListPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;

/**
 * Created by salomem on 3/25/14.
 *
 * List view is for list widgets that are not in a BOGridLX_Grid_ element type, such as Job Function, Job Title, and User Class codes.
 */
public class EXTListView extends BaseView {
    //  Logger
    public static final Logger LOGGER = Logger.getLogger(EXTListView.class.getName());
    //  Page Object
    public static final EXTListPage extListPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), EXTListPage.class);

    /*  Static methods that interact with the Page Object   */

    /**
     * Helper method that finds the line item by it's name.
     * @param lineItemName
     * @return A WebElement that represents the line item.
     */
    public static WebElement getLineItem(String lineItemName) {
        LOGGER.info("Searching for line item: " + lineItemName + "...");
        boolean lineItemFound = false;
        WebElement lineFound = null;

        //  Wait for the list to load
        BrowserDriver.waitForAllElements(extListPage.lineItemsInCurrentPage);

        for(WebElement myLineItem : extListPage.lineItemsInCurrentPage) {
            String myLineItemName = BrowserDriver.getTextFromElement(myLineItem.findElement(By.cssSelector("div.x-grid3-col-ShortName")));
            if(myLineItemName.equals(lineItemName)) {
                lineItemFound = true;
                lineFound   =   myLineItem;
                break;
            }
        }

        assertTrue("Did not find a line item with name " + lineItemName + "!", lineItemFound);
        return lineFound;
    }

    /**
     * Verifies that the Add Button IS visible
     */
    public static void verifyAddButtonDisplayed() {
        LOGGER.info("Verifying that the Add Button is visible...");
        BrowserDriver.waitForElement(extListPage.addButton);
        assertTrue("Did not see the Add Button!", extListPage.addButton.isDisplayed());
    }

    /**
     * Verifies that the Add Button IS NOT visible
     */
    public static void verifyAddButtonNotDisplayed() {
        LOGGER.info("Verifying that the Add Button is not visible...");
        assertTrue("Did see the Add Button!", !isElementPresentNoWait(extListPage.addButton));
    }

    /**
     * Verifies that the line items have the 'view' links
     */
    public static void verifyViewLinksDisplayed() {
        EXTListView.verifyActionLinkDisplayed("view");
    }

    /**
     * Verifies that the line items do not have the 'view' links
     */
    public static void verifyViewLinksNotDisplayed() {
        EXTListView.verifyActionLinkNotDisplayed("view");
    }

    public static void verifyEditLinksDisplayed() {
        EXTListView.verifyActionLinkDisplayed("edit");
    }

    public static void verifyEditLinksNotDisplayed() {
        EXTListView.verifyActionLinkNotDisplayed("edit");
    }

    public static void verifyDeleteLinksDisplayed() {
        EXTListView.verifyActionLinkDisplayed("delete");
    }

    public static void verifyDeleteLinksNotDisplayed() {
        EXTListView.verifyActionLinkNotDisplayed("delete");
    }

    /**
     * Verifies that the link, with the given partial link text, is displayed under the 'Actions' column.
     * @param partialLinkText - the partial link text that should be displayed for all line items.
     */
    public static void verifyActionLinkDisplayed(String partialLinkText) {
        LOGGER.info("Verifying that all " + partialLinkText + " links are visible...");
        boolean actionLinksDisplayed = true;    //  Assume all links are displayed

        String faiMessage = "Did not see a '" + partialLinkText + "' link for the line item named ";
        BrowserDriver.waitForAllElements(extListPage.lineItemsInCurrentPage);   //  Wait for all line items to load

        //  Go through each line item, and make sure it has a 'view' link
        for(WebElement lineItem : extListPage.lineItemsInCurrentPage) {
            //  Check for a 'view' link
            if(!BrowserDriver.getTextFromElement(lineItem).contains(partialLinkText)) {     //  Line Item does not have the link displayed
                //  Check that it's not the default security in User Class (This is the only item that shouldn't have any links displayed)
                String lineItemName = BrowserDriver.getTextFromElement(lineItem.findElement(By.cssSelector("div.x-grid3-col-ShortName"))).trim();
                if(!lineItemName.equals("Default Security")) {      //  The line item is not 'Default Security'
                    actionLinksDisplayed = false;   //  Flag that we found a missing link
                    faiMessage += lineItemName;
                    break;      //  Stop looking for a missing link
                }
            }
        }

        assertTrue(faiMessage, actionLinksDisplayed);
    }

    /**
     * Verifies that the link, with the given partial link text, is not displayed under the 'Actions' column.
     * @param partialLinkText - - the partial link text that should not be displayed for all line items.
     */
    public static void verifyActionLinkNotDisplayed(String partialLinkText) {
        LOGGER.info("Verifying that all " + partialLinkText + " links are not visible...");
        boolean actionLinksDisplayed = false;
        String failMessage = "Did see a '" + partialLinkText + "' link for the line item named ";
        //BrowserDriver.waitForAllElements(extListPage.lineItemsInCurrentPage);

        //  Go through each line item, and make sure that none of them have a 'view' link
        for(WebElement lineItem : extListPage.lineItemsInCurrentPage) {
            //  Check for the <partialLinkText> link
            String actionsColumn = BrowserDriver.getTextFromElement(BrowserDriver
                    .waitForElement(lineItem.findElement(By.cssSelector("div.x-grid3-col-EditDeleteLink"))));
            if(actionsColumn.contains(partialLinkText)) {
                actionLinksDisplayed = true;
                failMessage += BrowserDriver.getTextFromElement(lineItem.findElement(By.cssSelector("div.x-grid3-col-ShortName")) ).trim();
                break;
            }
        }

        assertTrue(failMessage, !actionLinksDisplayed);
    }

    public static void clickLineItemActionLink(String lineItemName, String actionName) {
        LOGGER.info("Clicking " + lineItemName + "'s " + actionName + " link...");
        //  Find the line item
        //  Click the action by its 'actionName'
    }

    public static void clickAddButton() {
        LOGGER.info("Clicking the Add button...");
        BrowserDriver.clickElement(extListPage.addButton);
    }

    /**
     * Verifies that the line item with the given expectedName and expectedDescription exists.
     * @param expectedName - the line item's expectedName.
     * @param expectedDescription - the line item's expectedDescription.
     */
    public static void verifyItemExistsWith(String expectedName, String expectedDescription) {
        LOGGER.info("Verifying that the line item with expectedName: " + expectedName + " and expected description: " + expectedDescription + " exists.");
        boolean itemExists   =   false;

        //  This assumes that there are not enough items to require more than one page in the EXT List.
        BrowserDriver.waitForAllElements(extListPage.lineItemsInCurrentPage);

        //  Go through each line item, util one with a matching expectedName and expectedDescription are found
        for(WebElement lineItem : extListPage.lineItemsInCurrentPage) {
            //  Get the expectedName and expectedDescription
            String itemName = BrowserDriver.getTextFromElement(BrowserDriver
                    .waitForElement(lineItem.findElement(By.cssSelector("div.x-grid3-col-ShortName"))));
            String itemDescription = BrowserDriver.getTextFromElement(BrowserDriver
                    .waitForElement(lineItem.findElement(By.cssSelector("div.x-grid3-col-1"))));

            //  Check the expectedName and expectedDescription
            if(itemName.equals(expectedName) && itemDescription.equals(expectedDescription)) {
                itemExists  =   true;
                break;
            }
        }

        assertTrue(
                "The line item with expected name: " + expectedName + " and expected description: " + expectedDescription + " was not found.",
                itemExists
        );
    }

    /**
     * Verifies that the given message is displayed on the EXT List, above the column header.
     * @param expectedMessage - the message that should be displayed.
     */
    public static void verifyMessageDisplayed(String expectedMessage) {
        LOGGER.info("Verifying that '" + expectedMessage + "' is the message being displayed...");
        String msgDisplayed =   BrowserDriver.getTextFromElement(extListPage.messageText);

        assertTrue("The message displayed does not equal the expected message '" + expectedMessage + ".'", msgDisplayed.equals(expectedMessage));
    }
}
