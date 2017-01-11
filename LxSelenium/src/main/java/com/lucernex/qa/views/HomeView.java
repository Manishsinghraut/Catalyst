package com.lucernex.qa.views;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.HomePage;
import com.lucernex.qa.pages.LxToolBar;
import com.lucernex.qa.pages.components.EntityTab;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.SeleniumUtilities;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;
import static junit.framework.TestCase.assertNotNull;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

public class HomeView extends BaseView {
    private static final Logger logger = Logger.getLogger(HomeView.class.getName());
    private static final HomePage homePage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), HomePage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    
    /**
     * Returns the authenticated firm name as provided by the IWMS web-ui (upper right corner).
     */
    public static String getFirmName() {
        if (homePage.firmSpan.isDisplayed()) {
            return homePage.firmSpan.getText();
        } {
            return null;
        }
    }

    /**
     * Returns true if the IWMS firm name <span> element with the name of the
     * authenticated firm is visible.
     */
    public static boolean isAuthenticatedPageDisplayed() {
        try {
            BrowserDriver.getCurrentDriver().manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);

            List<WebElement> lst = BrowserDriver.getCurrentDriver().findElements(By.id("firm_text"));

            return !(lst == null || lst.isEmpty());
        } catch (Exception e) {
            return false;
        } finally {
            BrowserDriver.getCurrentDriver().manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        }
    }

    /**
     * Returns true if the IWMS firm name <span> element with the name of the
     * authenticated firm is visible. Waits until the page is visible.
     */
    public static boolean waitForAuthenticatedPage() {
        try {
            BrowserDriver.waitForElement(homePage.firmSpan);
        } catch (Exception e) {
            return false;
        }

        return homePage.footerDiv.isDisplayed();
    }

    /**
     * Verifies that the page footer is visible.
     */
    public static void verifyFooterDisplayed() {
        logger.info("Verifying IWMS home page is visible...");

        BrowserDriver.waitForElement(homePage.footerDiv);

        if (!homePage.footerDiv.isDisplayed()) {
            takeScreenshot("looking-for-home-page.png");
            fail("Did not see the page footer!");
        } else {
            logger.info("Saw IWMS home page.");
        }
    }

    /**
     * Verifies that the IWMS home page is visible.
     */
    public static void verifyNavigationBarDisplayed() {
        logger.info("Verifying navigation bar is visible...");

        if (!isElementPresentNoWait(homePage.programMenuItem)) {
            takeScreenshot("looking-for-navigation-bar.png");
            fail("Did not see the navigation bar on the IWMS homepage!");
        }
    }

    /**
     * Verifies that the IWMS home page is visible.
     */
    public static void verifyNavigationBarNotDisplayed() {
        logger.info("Verifying navigation bar is not visible...");
        assertTrue("Do see the navigation bar but we should not!", !isElementPresentNoWait(homePage.programMenuItem));
    }

    /**
     * Returns Admin button if found otherwise null.
     */
    private static WebElement findAdminButton() {
        if (!homePage.adminButtonParent.isDisplayed()) {
            return null;
        }

        List<WebElement> buttons = homePage.adminButtonParent.findElements(By.id("adminBtn-btnIconEl"));

        if (buttons == null || buttons.isEmpty()) {
            return null;
        } else {
            return buttons.get(0);
        }
    }

    public static void clickAdminButton(){
        SeleniumUtil.switchTodefaultContent();
// Below code had commented as part of code refactoring 
//        WebElement adminBtn = findAdminButton();
//
//        if (adminBtn == null || !adminBtn.isDisplayed()) {
//            logger.log(Level.WARNING, "Admin button not found, taking screen shot 'findAdminButton.png'");
//            BaseView.takeScreenshot("findAdminButton.png");
//            fail("Did not see the Admin button!");
//        }
//
//        logger.info("Clicking Admin button...");
//
//        try {
//            adminBtn.click();
//        } catch (WebDriverException wde) {
//            logger.log(Level.WARNING, "Click failed, taking screen shot 'clickAdminButton.png'");
//            BaseView.takeScreenshot("clickAdminButton.png");
//            throw wde;
//        }
    	
    	//Selenium webdriver wrapper class has implemented

       /* try {
            SeleniumUtil.click("id", "adminBtn-btnIconEl", 1);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickAdminButton.png");
        }*/
    	try {
//            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),10);
//            for(int i = 0;i<4;i++){
//                try{
//                    wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver().findElement(By.id("adminBtn"))));
//                    wait.until(ExpectedConditions.elementToBeClickable(BrowserDriver.getCurrentDriver().findElement(By.id("adminBtn"))));
//                    try {
//                        logger.info("Attempting to click admin button "+i+"....");
//                        BrowserDriver.getCurrentDriver().findElement(By.id("adminBtn-btnIconEl")).click();
//                        try{
//                            wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),30);
//                            wait.until(ExpectedConditions.textToBePresentInElement(BrowserDriver.getCurrentDriver().findElement(By.className("frmHeader")),"System Administrator Dashboard"));
//                            break;
//                        }catch(Exception se){
//                        }
//                    } catch (Exception e) {
//                        BaseView.takeScreenshot("clickAdminButton.png");
//                    }
//                }catch(Exception ae){
//                }
//            }
//            wait.until(ExpectedConditions.textToBePresentInElement(BrowserDriver.getCurrentDriver().findElement(By.className("frmHeader")),"System Administrator Dashboard"));
            SeleniumUtil.waitForElementIsClickable("id","adminBtn",5,2);
            SeleniumUtil.click("id", "adminBtn-btnIconEl", SeleniumUtilities.OBJWAITTIMEOUT);
            for(int i=0;i<8;i++) {
                if(!SeleniumUtil.waitUntilElementContainsText("className", "frmHeader", "System Administrator Dashboard", 2)){
                    SeleniumUtil.click("id", "adminBtn-btnIconEl", SeleniumUtilities.OBJWAITTIMEOUT);
                }
                else{ return;
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("clickAdminButton.png");
            fail("Unable to click admin button");
		}
    }

    public static void clickCalendarIcon(){
        try {
            SeleniumUtil.waitForElementVisibilityOf("id","calendarBtn",5,2);
            SeleniumUtil.click("id", "calendarBtn-btnIconEl", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("calendarBtn-btnIconEl.png");
            fail("Unable to click calendar button");
        }
    }

    public static void clickButton(String strLoctor,String strElement) {
        try {
            SeleniumUtil.click(strLoctor, strElement, 1);
        } catch (Exception e) {
            BaseView.takeScreenshot(strElement+".png");
        }
    }

    public static void clickAdminReportsButton() {
        try {
            SeleniumUtil.click("xpath", "//div[@id='lxToolBar']//*[text()='Reports']", 2);
        } catch (Exception e) {
            fail("Failed to click admin reports button"+e.getMessage());
            BaseView.takeScreenshot("Failed to click admin reports button.png");
        }
    }

    /**
     * Returns the button element which matches the specified button label and
     * is found within the extjs message box that has a matching title.
     *
     * @param dialogTitle - message box title for which we are looking
     * @param buttonLabel - button label for which we are looking
     */
    private static WebElement findMessageBoxButton(String dialogTitle, String buttonLabel) {
        for (int attempt = 0; attempt < 2; attempt++) {
            try {
                Thread.sleep(500l);
            } catch (InterruptedException e) {
                // ignore
            }
            SeleniumUtil.waitForElementVisibilityOf("cssselector","div[id^='messagebox-'][class*='x-message-box']",10,2);
            List<WebElement> dialogs = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id^='messagebox-'][class*='x-message-box']"));

            if (dialogs != null && dialogs.size() > 0) {
                for (WebElement dialog : dialogs) {
//                    SeleniumUtil.waitForElementVisibilityOf("cssselector","div[id^='title-'][class^='x-title-text']",10,2);
//                    WebElement titleWE = dialog.findElement(By.cssSelector("div[id^='title-'][class^='x-title-text']"));
                    SeleniumUtil.waitForElementVisibilityOf("xpath",".//div[contains(./text(),'Confirm logout')]",10,2);
                    WebElement titleWE = dialog.findElement(By.xpath(".//div[contains(./text(),'Confirm logout')]"));

                    if (titleWE != null) {
                        String label = titleWE.getText();

                        if (label != null && label.contains(dialogTitle)) {
                            List<WebElement> buttons = dialog.findElements(By.cssSelector("a[id^='button-']"));

                            if (buttons != null && buttons.size() > 0) {
                                for (WebElement button : buttons) {
                                    WebElement labelWE = button.findElement(By.cssSelector("span[class^='x-btn-inner']"));

                                    if (labelWE != null) {
                                        label = labelWE.getText();

                                        if (label != null && label.contains(buttonLabel)) {
                                            return button; // we found what we were looking for
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return null;
    }

    public static void logout() {
        logger.info("Clicking Logout button...");

        WebElement logoutBtn;

//        try {
//            try {
//                //delay(10000);
//                logoutBtn = SeleniumUtil.getElement("cssselector","a#logoutBtn",10,2);//BrowserDriver.findElementWithTimeout(By.cssSelector("a#logoutBtn"), 10);
//                //delay(5000);
//            } catch (Exception e) {
//                try{
//                    //delay(5000);
////                    URL url = CucumberContext.getURL();
////                    BrowserDriver.loadPage(url);
//                    logoutBtn = SeleniumUtil.getElement("cssselector","a#logoutBtn",10,2);
////                    logoutBtn = BrowserDriver.findElementWithTimeout(By.cssSelector("a#logoutBtn"), 10);
//                    //delay(5000);
//                }
//                catch(Exception ex) {
//                    fail("Did not see the Logout button");
//                    return;
//                }
//            }
//
//            assertTrue("Did not see the Logout button", logoutBtn.isDisplayed());
////            Actions action = new Actions(BrowserDriver.getCurrentDriver());
////            action.moveToElement(logoutBtn).doubleClick(logoutBtn).build().perform();
////            logoutBtn.click();
//            try {
//                SeleniumUtil.click(logoutBtn,SeleniumUtilities.OBJWAITTIMEOUT);
//                if (logoutBtn.isDisplayed()) SeleniumUtil.click(logoutBtn,SeleniumUtilities.OBJWAITTIMEOUT);
//            }
//            catch(Exception ex){
//            }
//        } catch (UnhandledAlertException uae) {
//            try {
//                Alert alert = BrowserDriver.getCurrentDriver().switchTo().alert();
//
//                alert.dismiss();
//            } catch (NoAlertPresentException nape) {
//                // ignore
//            }
//
//            try {
//                logoutBtn = SeleniumUtil.getElement("cssselector","a#logoutBtn",10,2);
////                logoutBtn = BrowserDriver.findElementWithTimeout(By.cssSelector("a#logoutBtn"), 10);
//            } catch (Exception e) {
//                fail("Did not see the Logout button");
//                return;
//            }
//
//          //  assertTrue("Did not see the Logout button", logoutBtn.isDisplayed());
////            logoutBtn.click();
//            try {
//                SeleniumUtil.click(logoutBtn,SeleniumUtilities.OBJWAITTIMEOUT);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//
//
//
//        WebElement okBtn = findMessageBoxButton("Confirm logout", "OK");
//
//        assertTrue("Did not see the [Confirm logout] dialog", okBtn != null);
//        okBtn.click();
//        SeleniumUtilities.waitForNonStaleWebElement(okBtn,5,2);
//        try {
//            for(int i=0;i<10;i++) {
//                //delay(1000);
//                if (okBtn.isDisplayed()) okBtn.click();
//            }
//        }
//        catch(Exception ex){
//        }

        try{
            logoutBtn = SeleniumUtil.getElement("cssselector","a#logoutBtn",10,2);
            SeleniumUtil.click(logoutBtn,SeleniumUtilities.OBJWAITTIMEOUT);
            WebElement okBtn=null;
            for(int i=0;i<10;i++) {
                try {
                    okBtn = findMessageBoxButton("Confirm logout", "OK");
                    if (!okBtn.isDisplayed()) {
                        logoutBtn = SeleniumUtil.getElement("cssselector", "a#logoutBtn", 10, 2);
                        SeleniumUtil.click(logoutBtn, SeleniumUtilities.OBJWAITTIMEOUT);
                    }
                    else {
                        try {
                            SeleniumUtil.click(okBtn, SeleniumUtilities.OBJWAITTIMEOUT);
                            SeleniumUtil.waitForNonStaleWebElement(okBtn, 1, 2);
                            SeleniumUtil.Log.info("Log out !!!!");
                            CucumberContext.getCucumberContext().put("loggedIn", Boolean.FALSE);
                            BrowserDriver.getCurrentDriver().manage().deleteAllCookies();
                            return;
                        }catch (Exception ex){
                            SeleniumUtil.Log.info("Log out !!!!");
                            CucumberContext.getCucumberContext().put("loggedIn", Boolean.FALSE);
                            BrowserDriver.getCurrentDriver().manage().deleteAllCookies();
                            return;
                        }
                    }
                }
                catch (Exception e){}
            }

        }catch(Exception ex){
            BaseView.takeScreenshot("Logout");
            fail("Did not see the Logout button");
        }
    }

    /**
     * Clicks on the given entity tab.
     * @param entityType - the given entity tab that we are trying to click on
     */
    public static void clickEntityTab(String entityType) throws InterruptedException {
        logger.info("Clicking on the " + entityType + " entity tab...");
        EntityTab entityTab = EntityTab.valueOf(entityType);

        WebElement entityTabEle = BrowserDriver.findElementWithTimeout(By.cssSelector(entityTab.getCssSelector()), 5);
        entityTabEle.click();
    }

    public static void clickToolButton(String targetLoc) {
        logger.info("Attempting to find the target location, " + targetLoc + ", on the home view...");
        WebElement button;
        LxToolBar toolButton = LxToolBar.valueOf(targetLoc);

        switch (toolButton) {
            case Reports:
                button = homePage.reportsButton;
                break;
            case Calendar:
                button = homePage.calendarButton;
                break;
            case Dashboard:
                button = homePage.dashboardButton;
                break;
            case MyPortfolio:
                button = homePage.myPortfolioButton;
                break;
            case Tools:
                if (homePage.toolsButton.isDisplayed()) {
                    button = homePage.toolsButton;
                } else {
                    button = homePage.tildaToolsButton;
                }
                break;
            case Admin:
                button = findAdminButton();
                break;
            default:
                button = null;
                break;
        }

        //  Make sure the target location is on the homeview
        assertNotNull("Did not find " + targetLoc + " in the home view", button);

        List<WebElement> children = button.findElements(By.tagName("button"));

        if (children == null || children.isEmpty()) {
            fail(String.format("Did not see the '%s' button!", toolButton.name()));
        }

        //  Click on the WebElement
        logger.info("Clicking on the target location " + targetLoc + "...");
        children.get(0).click();
    }

    /**
     *
     * Clicks on the fourth level menu
     * @param itemName - the given item name that we are trying to click on
     */
    public static void selectFourthLevelMenu(String itemName) {

        assertTrue("ItemName is not specified", StringUtils.isNotEmpty(itemName));
        logger.info(String.format("Attempting to find the 4th level menu - '%s' on the home view.", itemName));

        if (homePage.fourthLevelMenuSelect.isDisplayed()) {
            Select dropDownMenu = new Select(homePage.fourthLevelMenuSelect);
            dropDownMenu.selectByVisibleText(itemName);
            verifyFooterDisplayed();
        } else {
            fail(String.format("Didn't find the 4th level menu by '%s' name.", itemName));
        }
    }

    /**
     * Searches all of Lx (limited to the current firm of course) for the given Search text.
     * @param searchText
     */
    public static void searchFor(String searchText) {
        logger.info("Entering the search text: " + searchText + "...");
        homePage.searchInputBox.sendKeys(searchText);

        logger.info("Searching for " + searchText + "...");
        homePage.searchInputBox.submit();
    }

    public static void verifyLxToolsDropDown() {
        logger.info("Verifying the tools drop down is visible");
        BrowserDriver.waitForElement(homePage.toolsDropDown);
        assertTrue("Tools drop down is not displayed!", homePage.toolsDropDown.isDisplayed());
    }
}
