package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 *
 * Returns a list of buttons as found in the Portfolio Navigation  panel to left of entity views. Click button clicks by the label name
 */
public class PortfolioNavigationView extends BaseView {
    public static Logger LOGGER = Logger.getLogger(PortfolioNavigationView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);


    public static List<WebElement> getPortfolioNavigationButtons() {
    WebElement actions = BrowserDriver.getCurrentDriver().findElement(
            By.xpath("//div//span[text()='Portfolio Navigation']")
    );

    assertNotNull(actions);

    WebElement parent = actions.findElement(By.xpath("../.."));

    assertNotNull(parent);

    List<WebElement> buttons = parent.findElements(By.cssSelector("button.x-btn-text"));

    if (buttons != null && buttons.size() > 0) {
        return buttons;
    } else {
        return null;
    }
}

    // Add support for comma delimit Click(button1, button2, button3...)
    public static void expandPortfolioNavigationTab() throws InterruptedException{
        try{
            // Expand portfolio navigation tab
            if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".x-tool-img.x-tool-expand-right")).size()>0) {
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-tool-img.x-tool-expand-right")).click();
            }
        }
        catch (ElementNotVisibleException ex){
            //if not visible then do nothing - because then it is already expanded
            System.out.println("it is in expanded mode");
        }
        finally {
            // do nothing exit
            System.out.println("Exiting");
            BaseView.popDefaultTimeout();
        }
    }

    public static void waitForElementVisibility(String locator){
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),5);
        try{
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(locator)));
        }catch(Exception e){
            System.out.println("waiting for element visibility crossed 5 min...\n Will continue to wait 5 more min");
            System.out.println(e.getMessage());
            try{
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(locator)));
            }catch(Exception ee){
                System.out.println("waiting for element visibility crossed 10 min...\n exiting");
                System.out.println(ee.getMessage());
            }
        }
    }

    public static void collapsePortfolioNavigationTab() throws InterruptedException{
        SeleniumUtil.switchTodefaultContent();
        try{
            BaseView.pushShortTimeout(1);
            // Expand portfolio navigation tab
            if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".x-tool-img.x-tool-collapse-left")).size()>0) {
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-tool-img.x-tool-collapse-left")).click();
                waitForElementVisibility(".x-tool-img.x-tool-expand-right");
            }
        }
        catch (ElementNotVisibleException ex){
            //if not visible then do nothing - because then it is already expanded
            System.out.println("it is in collapsed mode");
        }
        finally {
            // do nothing exit
            System.out.println("Exiting");
            BaseView.popDefaultTimeout();
        }
    }
// Portfolio Navigation via UI - Checks for already expanded folders

    public static void navigateToFolder( String delimitedFolderNames )throws InterruptedException {
        try {
            String[] inFolders = StringUtils.split(delimitedFolderNames, ",");
            for (String inFolderName : inFolders) {
                System.out.println("LOOKING FOR -------" + inFolderName);
                BaseView.pushShortTimeout();
                List<WebElement> allFolders = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.x-grid-row span.x-tree-node-text"));

                boolean foundFlag = false;
                for (WebElement webFolder : allFolders) {
                    if (StringUtils.equals(inFolderName, webFolder.getText())) {
                        WebElement parent = webFolder.findElement(By.xpath("../../.."));
                        foundFlag = true;

                        String expandedFolder = parent.getAttribute("class");
                        if(expandedFolder.contains("expanded")){
                            LOGGER.info("Folder is already Expanded");
                        } else {
                            parent.findElement(By.cssSelector("img.x-tree-expander")).click();
                        }
                        break;
                    }
                }

                assertTrue("Folder '" + inFolderName + "' wasn't found", foundFlag);
            }

        } catch (StaleElementReferenceException ex){
            LOGGER.info("StaleElementReferenceException... waiting for element to be visible");
        }
        catch (TimeoutException ex) {
            LOGGER.info("Did not find the link text...");
        } catch (NoSuchElementException ex) {
            LOGGER.info("Did not find the link text...");
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static boolean navigateToLinkInFolder(String delimitedFolders, String linkName)throws InterruptedException {
        boolean returnValue = false;
        try {
            expandPortfolioNavigationTab();
            navigateToFolder(delimitedFolders);

            BaseView.pushShortTimeout();
           //EXT --- BrowserDriver.findElementWithTimeout(By.linkText(linkName), 1).click();

            WebElement portfolioNavigation =  BrowserDriver.findElementWithTimeout(By.cssSelector("tr.x-grid-row span.x-tree-node-text"), 30);
            if(portfolioNavigation.getText().equals(linkName)){
                portfolioNavigation.click();
            }

            System.out.println("Clicked on portfolio " + linkName + "...");

            collapsePortfolioNavigationTab();

            returnValue = true;
        } catch (TimeoutException ex) {
            LOGGER.info("Did not find the link text...");
        } catch (NoSuchElementException ex) {
            LOGGER.info("Did not find the link text...");
        } finally {
            BaseView.popDefaultTimeout();
        }

        return returnValue;
    }

    public static void navigateToEntity(String entityName) throws Exception {
        expandPortfolioNavigationTab();
        int count=0;
        if(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + entityName+"']")).size()>0){
//            BrowserDriver.clickElement(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + entityName+"']")));
            SeleniumUtil.click("xpath","//span[text()='" + entityName+"']",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.Log.info("Clicking entity " + entityName);
        }else{
            BaseView.takeScreenshot("EntityNotFound.png");
            throw new NoSuchElementException("No entity of name "+entityName+" is found in portfolio navigation tab");
        }
    }

    public static void closeAlertInDashboard() throws InterruptedException{
        try{
            if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".x-tool-img.x-tool-close")).size()>0) {
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-tool-img.x-tool-close")).click();
            }
        }
        catch (ElementNotVisibleException ex){
            //if not visible then do nothing - because then it is already expanded
            System.out.println("it is closed");
        }
        finally {
            // do nothing exit
            System.out.println("Exiting");
            BaseView.popDefaultTimeout();
        }
    }

    public static void verifyEntityInLeftTree(String entityName) throws Exception {
        expandPortfolioNavigationTab();
        int count=0;
        if(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[contains(@class,'x-tree-node-text')][text()='" + entityName+"']")).size()>0){
            SeleniumUtil.Log.info("Found entity " + entityName);
        }else{
            BaseView.takeScreenshot("EntityNotFound.png");
            throw new NoSuchElementException("No entity of name "+entityName+" is found in portfolio navigation tab");
        }
    }
}




