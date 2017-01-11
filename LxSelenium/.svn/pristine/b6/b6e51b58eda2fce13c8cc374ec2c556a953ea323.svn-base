package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.pages.iwms.portfolio.orgchart.OrgChartPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.fail;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

public class ActionsView {
    private static final AdminPage adminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AdminPage.class);
    private static final Logger logger = Logger.getLogger(ActionsView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    /**
     * Returns a list of buttons as found in the Actions panel to right of entity views.Click button clicks on the button by the label name
     */
    public static List<WebElement> getActionButtons() {

        for (int i = 0; i < 2; i++) {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "#LxActionPanel-innerCt", 5, 2);
            WebElement actions = BrowserDriver.getCurrentDriver().findElement(
                    By.cssSelector("#LxActionPanel-innerCt")
            );

            assertNotNull(actions);

            // Wait for the Actions area to appear.
            logger.log(Level.INFO, "Waiting for actions area to appear...");
            BrowserDriver.waitForElement(actions);
            logger.log(Level.INFO, "Actions area is present.");

            //WebElement parent = actions.findElement(By.xpath("../.."));

            //assertNotNull(parent);

            List<WebElement> buttons = actions.findElements(By.cssSelector("span.x-btn-text"));
//            List<WebElement> buttons = actions.findElements(By.cssSelector("span.x-btn-inner"));

            try {
                BrowserDriver.waitForAllElements(buttons);

                if (buttons != null && buttons.size() > 0) {
                    return buttons;
                } else {
                    return null;
                }
            } catch (StaleElementReferenceException e) {
            }
        }

        return null;
    }

    public static void clickButton(String button) {
        for (int i = 0; i < 3; i++) {
            List<WebElement> buttons = getActionButtons();

            try {
                for (WebElement we : buttons) {
                    String label = we.getText();
                    System.out.println(label);
                    if (!isNullOrEmpty(label) && label.equalsIgnoreCase(button) && we.isDisplayed()) {
                        // Wait for button to appear.
                        logger.log(Level.INFO, "Waiting for '" + button + "' button to appear...");
                        BrowserDriver.waitForElement(we, 10);
                        we.click();
                        logger.log(Level.INFO, "Clicked on '" + button + "' button.");
                        return;
                    }
                }
            } catch (StaleElementReferenceException e) {
                try {
                    Thread.sleep(1000l);
                } catch (InterruptedException ie) {
                }
            }
        }

        String screenshot = "did-not-see-" + button + "-button.png";

        HomeView.takeScreenshot(screenshot);

        fail(String.format("Did not see button '%s'; took screen shot '%s'!", button, screenshot));
    }

    public static void clickActionPanelButton(String buttonTitle) throws Throwable {
        int maxTries = 10;
        WebElement button = null;
        for (int count = 0; count < maxTries; count++) {
            logger.info("Try " + count + " for button: " + buttonTitle + "...");
            //  Get action panel buttons
            List<WebElement> buttons = ActionsView.getActionButtons();
            assertNotNull("No action panel buttons are fetched", buttons);
            for (WebElement btn : buttons) {
//                if (AllContractPagesView.getTextAndByPassException(btn).equals(buttonTitle)) {
                if (AllContractPagesView.getTextAndByPassException(btn).equalsIgnoreCase(buttonTitle)) {
                    button = btn;
                    break;
                }
            }
            if (button != null) {
                if(BrowserDriver.waitForElement(button).isEnabled())
                    SeleniumUtil.click(BrowserDriver.waitForElement(button),SeleniumUtilities.OBJWAITTIMEOUT);
                else
                org.junit.Assert.fail(button + " is disabled");
//                BrowserDriver.waitForElement(button).click();
                break;
            }
        }
    }

    /*public static void clickActionPanelButton(String buttonTitle){
        int maxTries = 10;
        for( int count = 0; count<maxTries; count++ ) {
            logger.info("Try " + count + " for button: " + buttonTitle + "...");
            //  Get action panel buttons
            List<WebElement> buttons = ActionsView.getActionButtons();
            List<String> buttonIDs = new ArrayList<String>();
            for( WebElement b : buttons ){
                buttonIDs.add(b.getAttribute("id"));
            }
            for (String id : buttonIDs) {
                WebElement btn = null;
                try {
                    btn = BrowserDriver.getCurrentDriver().findElement(By.id(id));
                }catch(Exception sre){
                    break; // dom changed, re-get button elements
                }
                String title = btn.getText().trim();

                if ( title.equalsIgnoreCase(buttonTitle)) {
                    //  Click then return
                    logger.info("clicking button: " + buttonTitle + "...");
                    //btn.click();

                    try {
                        BrowserDriver.getCurrentDriver().findElement(By.id(id)).click();
                    }catch(StaleElementReferenceException sre){
                        SeleniumUtil.waitForNonStaleWebElement("id",id,1);
                        break; // Stale element exception re-fetch element
                    }
                    return;
                }
            }

            try {
                //delay(1000);
            } catch (Exception e) {
            }
        }
    }*/

    /**
     * Clicks a button in the Action Panel.  Retries a number of times
     * to give time for the iframe to load and populate the Action Panel Buttons
     * TODO: We may be able to improve performance a bit by detecting
     * the iframe finishing its page load
     *
     * @param buttonTitle - the text on the button you want to click.
     */
    public static void clickActionPanelButtonWhenReady(String buttonTitle) throws Throwable {
        logger.info("Attempting to click action panel button: " + buttonTitle + "...");
        try {
            clickActionPanelButton(buttonTitle);
        } catch (Exception ex) {
            //delay(2000);
            // clickActionPanelButton(buttonTitle);
            fail("Did not find the action panel button " + buttonTitle + " after maximum attempts");
        }
    }

    /**
     * Verifies that the page footer is visible.
     */
    public static void verifyActionsDisplayed() {
        logger.info("Verifying Action buttons are visible...");
        WebElement actions = BrowserDriver.getCurrentDriver().findElement(
                By.xpath("//div//span[text()='Actions']")
        );
        BrowserDriver.waitForElement(actions);

        if (!actions.isDisplayed()) {
            BaseView.takeScreenshot("looking-for-action-buttons.png");
            fail("Did not see the action buttons!");
        }
    }

    public static void verifyActionsButtonDisable(String button) {
        logger.info("Verifying Action buttons are enabled...");
        try {
            if (SeleniumUtil.getWebElementObject("xpath", "//span[./text()='" + button + "']").isEnabled()) {
                BaseView.takeScreenshot("looking-for-action-buttons.png");
                fail(button + " action buttons enabled!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void verifyButton(String button, int position) {
        logger.info("Verifying Action buttons are in sequence...");
        try {
            List<WebElement> actionButtons = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("#LxActionPanel-innerCt a"));
            if (actionButtons.get(position).getText().equals(button)) {
                return;
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to locate action panel element.png");
            fail("Unable to locate action panel element " + e.getMessage());
            return;
        }
        BaseView.takeScreenshot("The action panel button is not in sequence.png");
        fail("The action panel button is not in sequence\n" + button + ":" + position);
    }

    public static void clickLinkActionPanelButtonAndVerifyPopUp() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.switchTodefaultContent();
        for (int attempts = 0; attempts < 10; attempts++) {
            try {
                if (CommonMethods.waitTillModalWindow(2)) {
                    logger.info("Link Modal window is opened...");
                    assertEquals("Modal window present but not the expected one " + adminPage.modalWindowLabelDiv.getText(), adminPage.modalWindowLabelDiv.getText(), "Links to this page");
                    return;
                } else {
                    logger.info("Attempt to click link button " + attempts);
                }
                clickActionPanelButton("Link");
            } catch (Exception ex) {

            }
        }

        if (!CommonMethods.waitTillModalWindow(2)) {
            BaseView.takeScreenshot("Did not see the modal window after clicking link button.png");
            fail("Did not see the modal window after clicking link button after maximum attempts");
        }
    }


    public static void edit() {
        clickButton("Edit");
    }

    public static void delete() {
        clickButton("Delete");
    }

    public static void printableView() {
        clickButton("Printable View");
    }

    public static void addContract() {
        clickButton("Add Contract");
    }

    public static void auditLog() {
        clickButton("Audit Log");
    }

    public static void saveToDocuments() {
        clickButton("Save To Documents");
    }

    public static void link() {
        clickButton("Link");
    }

    public static void addCapitalProject() {
        clickButton("Add Capital Project");
    }

    public static void addFacility() {
        clickButton("Add Facility");
    }

    public static void addLocation() {
        clickButton("Add Location");
    }

    public static void addParcel() {
        clickButton("Add Parcel");
    }

    public static void setUpFacility() {
        clickButton("Setup Facility");
    }

    public static void addOpeningProject() {
        clickButton("Add Opening Project");
    }

    public static void convertToProject() {
        clickButton("Convert to Project");
    }

    public static void addSite() {
        clickButton("Add Site");
    }

    public static void addPrototype() {
        clickButton("Add Prototype");
    }

    public static void view() {
        clickButton("View");
    }
}

