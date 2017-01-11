package com.lucernex.qa.views.iwms.portfolio.orgchart;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.iwms.portfolio.orgchart.OrgChartPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
//import org.eclipse.jetty.util.log.Log;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertTrue;

/**
 * Created by rle0239 on 05-05-2015.
 */
public class OrgChartView {
    private static int defaultWaitTime = 30;

    private static final OrgChartPage orgChartPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), OrgChartPage.class);
    private static final Logger logger = Logger.getLogger(OrgChartView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public static int marketCount = 0;

    public static void switchToOrgChartFrame() throws Throwable {
        //Need delay when we exit from modal window
        /*try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        SeleniumUtil.switchToFrameHavingElement("linktext", "<add Parent Region>");*/
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();

    }

    public static void setMarketCount() throws Throwable {
        //Need delay when we exit from modal window
        try {
            AllContractPagesView.switchToFrame();
            marketCount = BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[starts-with(@id,'omkt')]//td[text()='Legacy Market Area']")).size();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static int getMarketCount() throws Throwable {
        //Need delay when we exit from modal window
        try {
            AllContractPagesView.switchToFrame();
            return BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[starts-with(@id,'omkt')]//td[text()='Legacy Market Area']")).size();
        } catch (InterruptedException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static void switchToMoveOrgChartFrame() {
        //Need delay when we exit from modal window
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        SeleniumUtil.switchToFrameHavingElement("id", "destProgramID");
    }

    public static void switchToRestoreOrgChartFrame() {
        //Need delay when we exit from modal window
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        SeleniumUtil.switchToFrameHavingElement("cssselector", "input[value='Reset']");
    }

    public static void checkAddAsManager() {
        try {
            if (!orgChartPage.addMemberAsManager.isSelected()) {
                orgChartPage.addMemberAsManager.getLocation();
                logger.info("Selected checkbox 'Add Member as Manager");
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Add Member as Manager.png");
            fail(e.getMessage());
        }
    }

    public static void unCheckAddAsManager() {
        try {
            if (!orgChartPage.addMemberAsManager.isSelected()) {
                orgChartPage.addMemberAsManager.getLocation();
                logger.info("Selected checkbox 'Add Member as Manager");
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Add Member as Manager.png");
            fail(e.getMessage());
        }
    }

    public static void clickActions(String regionName, String link) {
        try {
            SeleniumUtil.getClickableWebElementObject("xpath", "//td[text()='" + regionName + "']//following-sibling::td/a[text()='" + link + "']").click();
        } catch (Exception e) {
            BaseView.takeScreenshot("Add Member as Manager.png");
            fail(e.getMessage());
        }
    }

    public static void verifyManagersAndMembersInOrgChart(String strChart, String name, String value) throws Throwable {

        int count = 0;
        boolean found = false;
        WebElement element = null;
        try {
            BaseView.pushShortTimeout(3);
            element = SeleniumUtil.getWebElementObject
                    ("xpath", "//td[text()='" + strChart + "']//ancestor::div[starts-with(@id,'orgn')]/table");
        } catch (Exception e) {
            try {
                element = SeleniumUtil.getWebElementObject
                        ("xpath", "//td[text()='" + strChart + "']//ancestor::div[starts-with(@id,'omkt')]/table");
            } catch (Exception ee) {
            }

        } finally {
            BaseView.popDefaultTimeout();
        }

        if (element != null) {
            try {
                for (WebElement tr : element.findElements(By.tagName("tr"))) {
                    count = 0;
                    for (WebElement td : tr.findElements(By.tagName("td"))) {
                        if (td.getText().contains(name)) {
                            count++;
                            found = true;
                        } else if (td.getText().contains(value)) {
                            count++;
                            found = true;
                        }
                    }
                }
                if (!found) {
                    fail(name + " : " + value + " pair not present");
                }
                logger.info(name + " : " + value + " pair present");
            } catch (Exception e) {
                BaseView.takeScreenshot("OrgChart.png");
                logger.info(name + " : " + value + " pair not present" + e.getMessage());
                Assert.fail(e.getMessage());
            }
        } else {
            BaseView.takeScreenshot("Unable to fetch org chart.png");
            fail("Unable to fetch org chart");
        }
    }

    public static void verifyManagersAndMembersInOrgChartNotPresent(String strChart, String name, String value) throws Throwable {

        int count = 0;
        boolean memberType = false;
        boolean member = false;
        WebElement element = null;
        try {
            BaseView.pushShortTimeout(3);
            element = SeleniumUtil.getWebElementObject
                    ("xpath", "//td[text()='" + strChart + "']//ancestor::div[starts-with(@id,'orgn')]/table");
        } catch (Exception e) {
            try {
                element = SeleniumUtil.getWebElementObject
                        ("xpath", "//td[text()='" + strChart + "']//ancestor::div[starts-with(@id,'omkt')]/table");
            } catch (Exception ee) {
            }

        } finally {
            BaseView.popDefaultTimeout();
        }

        if (element != null) {
            try {
                for (WebElement tr : element.findElements(By.tagName("tr"))) {
                    count = 0;
                    for (WebElement td : tr.findElements(By.tagName("td"))) {
                        if (td.getText().contains(name)) {
                            count++;
                            member = true;
                        } else if (td.getText().contains(value)) {
                            count++;
                            memberType = true;
                        }
                    }
                }
                if (memberType && member) {
                    fail(name + " : " + value + " pair not present");
                }
                logger.info(name + " : " + value + " pair present");
            } catch (Exception e) {
                BaseView.takeScreenshot("OrgChart.png");
                logger.info(name + " : " + value + " pair not present" + e.getMessage());
                Assert.fail(e.getMessage());
            }
        } else {
            BaseView.takeScreenshot("Unable to fetch org chart.png");
            fail("Unable to fetch org chart");
        }
    }

    public static void waitTillModalWindowToClose() {
        BaseView.pushShortTimeout();
        WebDriverWait waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), 15);
        for (int attempt = 1; attempt < 10; attempt++) {
            logger.info("waiting for modal window at close attempt " + attempt + "...");
            try {
                waitModalWindow.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("div.x-css-shadow+div.x-window")));
                logger.info("Modal window not present continuing....");
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("DelayInClosingModalWindow.png");
                logger.info("Modal window still present after 45 seconds wait....");
            }
        }
        try {
            waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
            waitModalWindow.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("div.x-css-shadow+div.x-window")));
            logger.info("Modal window not present continuing....");
        } catch (Exception e) {
            BaseView.takeScreenshot("DelayInClosingModalWindow.png");
            logger.info("Modal window still present after long wait....");
            fail(e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void waitTillModalWindowToClose(String modalWindowName) throws Throwable {
        BaseView.pushShortTimeout();
        WebDriverWait waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), 15);
        WebElement expectedModalWindow = null;

        List<WebElement> modalWindows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-css-shadow+div.x-window div.x-title-text"));
        for (WebElement modalWindow : modalWindows) {
            if (AllContractPagesView.getTextAndByPassException(modalWindow).contains(modalWindowName)) {
                expectedModalWindow = modalWindow;
            }
        }
        if (expectedModalWindow != null) {
            for (int attempt = 1; attempt < 10; attempt++) {
                logger.info("waiting for modal window at close attempt " + attempt + "...");
                try {
                    waitModalWindow.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(expectedModalWindow)));
                    logger.info("Modal window not present continuing....");
                    break;
                } catch (Exception e) {
                    BaseView.takeScreenshot("DelayInClosingModalWindow.png");
                    logger.info("Modal window still present after 45 seconds wait....");
                }
            }
            try {
                waitModalWindow.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(expectedModalWindow)));
                logger.info("Modal window not present continuing....");
            } catch (Exception e) {
                BaseView.takeScreenshot("DelayInClosingModalWindow.png");
                logger.info("Modal window still present after long wait....");
                fail(e.getMessage());
            } finally {
                BaseView.popDefaultTimeout();
            }
        } else {
            BaseView.popDefaultTimeout();
        }
    }


    public static void getModalWindowButton(String buttonName, String modalWindowName) throws Throwable {
        for(int i=0; i<10; i++){
            try {
                WebElement window = BrowserDriver.getCurrentDriver().findElement(By.xpath("//div[text()='" + modalWindowName + "'][contains(@class,'x-title-text')]//ancestor::div[starts-with(@class,'x-window')]//span[text()='" + buttonName + "']"));
                if(window.isEnabled()){
                    logger.info("Button is enabled clicking");
                    SeleniumUtil.click("xpath", "//div[text()='" + modalWindowName + "'][contains(@class,'x-title-text')]//ancestor::div[starts-with(@class,'x-window')]//span[text()='" + buttonName + "']", 5);
                    break;
                }else{
                    logger.info("Button is not enabled yet try after 1 second");
                }

            } catch (Exception e) {
                BaseView.takeScreenshot("Unable to click modal window button.png");
                fail(e.getMessage());
            }
        }
    }

    public static void getModalWindowButtonAndClick(String buttonName, String modalWindowName) throws Throwable {
        if (modalWindowName.contains("blank")) {
            try {
                WebElement gotModalWindow = null;
                for (WebElement blankModalWindow : BrowserDriver.getCurrentDriver().findElements(By.xpath(".//div[contains(@class,'x-title-text')]"))) {
                    if (AllContractPagesView.getTextAndByPassException(blankModalWindow).equals("") ||
                            AllContractPagesView.getTextAndByPassException(blankModalWindow).equals(" ")) {
                        gotModalWindow = blankModalWindow;
                        BaseView.pushShortTimeout();
                        try{
                            gotModalWindow.findElement(By.xpath(".//ancestor::div[starts-with(@class,'x-window')]//span[contains(text(),'" + buttonName + "')]")).click();
                            BaseView.popDefaultTimeout();
                            break;
                        }catch(Exception e){

                        }
                    }
                }
            } catch (Exception e) {
                BaseView.takeScreenshot("Unable to click modal window button.png");
                fail(e.getMessage());
            }

        } else {
            try {
                SeleniumUtil.click("xpath", "//div[contains(text()='" + modalWindowName + "')][contains(@class,'x-title-text')]//ancestor::div[starts-with(@class,'x-window')]//span[text()='" + buttonName + "']", 5);
            } catch (Exception e) {
                BaseView.takeScreenshot("Unable to click modal window button.png");
                fail(e.getMessage());
            }
        }
    }


    public static void waitTillModalWindowToOpen() {
        try {
            WebDriverWait waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
            waitModalWindow.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.x-css-shadow+div.x-window")));
            logger.info("Modal window present continuing....");
        } catch (Exception e) {
            BaseView.takeScreenshot("DelayInClosingModalWindow.png");
            fail(e.getMessage());
        }
    }

    public static void waitTillModalWindow(int... times) {
        int waitTime = defaultWaitTime;
        for (int time : times) {
            waitTime = time;
        }
        try {
            WebDriverWait waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), waitTime);
            waitModalWindow.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.x-css-shadow+div.x-window")));
            logger.info("Modal window PRESENT continuing....");
        } catch (Exception e) {
            logger.info("Modal window not PRESENT continuing....");
        }
    }

    public static void orgChartMigrationSuccess(String referenced, String used) {
        try {
            SeleniumUtil.getWebElementObject("xpath", "/[contains(text(),'Finished processing')]");
            SeleniumUtil.getWebElementObject("xpath", "/[contains(text(),\"Mapped Portfolio '" + used + "' to use Org Chart from Portfolio '" + referenced + "'\")]");
            logger.info("Verified the success message");
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("Org_Chart_Migration_UnSuccess.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void orgChartMigrationSuccessMsg(String referenced, String used) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            for (int i = 0; i < 10; i++) {
                try {
                    SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),'Finished processing')]");
                    SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"Mapped Portfolio '" + used + "' to use Org Chart from Portfolio '" + referenced + "'\")]");
                    logger.info("Verified the success message");
                    SeleniumUtil.switchTodefaultContent();
                    return;
                } catch (StaleElementReferenceException e) {
                    //wait for one sec
                    Thread.sleep(1000);
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Org_Chart_Migration_UnSuccess.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void orgChartMigrationSuccessToRestoreOriginal(String used) {
        try {
            for (int i = 0; i < 10; i++) {
                try {
                    SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),'Finished processing')]");
                    SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"Configured Portfolio '" + used + "' to use it's own Org Chart\")]");
                    logger.info("Verified the success message");
                    SeleniumUtil.switchTodefaultContent();
                    return;
                } catch (StaleElementReferenceException e) {
                    //wait for one sec
                    Thread.sleep(1000);
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Org_Chart_Migration_To_Original_UnSuccess.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void expandRegionTree(String regionName) {
        try {
            if (SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img")).size() > 0) {
                SeleniumUtil.click("xpath", "//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img", 10);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    public static void expandRegionTreeUpdated(String regionName) {
        try {
            BaseView.pushShortTimeout();
            if (SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]")).size() > 0) {
                SeleniumUtil.click("xpath", "//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]", 10);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            BaseView.popDefaultTimeout();
            Assert.fail(e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void expandSubRegionTreeUpdated(String subRegionName) {
        try {
            BaseView.pushShortTimeout();
            if (SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + subRegionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]")).size() > 0) {
                SeleniumUtil.click("xpath", "//td[text()='" + subRegionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]", 10);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            BaseView.popDefaultTimeout();
            Assert.fail(e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void expandSubRegionTree(String subRegionName) {
        try {
            if (SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + subRegionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img")).size() > 0) {
                SeleniumUtil.click("xpath", "//td[text()='" + subRegionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img", 10);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyMarketInSubRegion(String strMarket) throws Throwable {
        try {
            OrgChartView.switchToOrgChartFrame();
            assertTrue(SeleniumUtil.getWebElementObject("xpath", "//td[text()='" + strMarket + "']//ancestor::div[starts-with(@id,'omkt')]").isDisplayed());
            logger.info(strMarket + " is present in org chart");
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("MarketNotFound.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyDeletedMarket(String market, String subRegion) throws Throwable {
        try {
            OrgChartView.switchToOrgChartFrame();
            assertTrue(SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + subRegion + "']//ancestor::tr//following-sibling::tr//td[contains(text(),'" + market + "')]")).size() == 0);
            logger.info("Deleted market '" + market + "' is not present in org chart");
        } catch (Exception e) {
            BaseView.takeScreenshot("DeletedMarketPresent.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyDeletedMarketInRegion(String market, String region) throws Throwable {
        try {
            OrgChartView.switchToOrgChartFrame();
            assertTrue(SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + region + "']//ancestor::tr//following-sibling::tr//td[contains(text(),'" + market + "')]")).size() == 0);
            logger.info("Deleted market '" + market + "' is not present in org chart");
        } catch (Exception e) {
            BaseView.takeScreenshot("DeletedMarketPresent.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyEntityType(String used) {
        try {
            SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),'Finished processing')]");
            SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + used + "\")]");
            logger.info("Verified the success message");
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("Org_Chart_Migration_To_Original_UnSuccess.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyHorizontallyOrganizedRegion(String regions) throws Throwable {
        for (String s : regions.split(",")) {
            try {
                OrgChartView.switchToOrgChartFrame();
                assertTrue("Region '" + s + "' is not displayed horizontally", SeleniumUtil.getWebDriver().findElements(By.xpath("//td[@valign='top']//td[text()=\"" + s + "\"]")).size() > 0);

                logger.info("Region '" + s + "' is displayed horizontally");
            } catch (Exception e) {
                BaseView.takeScreenshot("HorizontalOrgChartDisplayError.png");
                Assert.fail(e.getMessage());
            }
        }
    }

    public static void verifyVerticallyOrganizedRegion(String regions) throws Throwable {
        for (String s : regions.split(",")) {
            try {
                OrgChartView.switchToOrgChartFrame();
                assertTrue("Region '" + s + "' is not displayed vertically", SeleniumUtil.getWebDriver().findElements(By.xpath("//tr[@valign='top']//td[text()='" + s + "']")).size() > 0);

                logger.info("Region '" + s + "' is displayed vertically");
            } catch (Exception e) {
                BaseView.takeScreenshot("VerticalOrgChartDisplayError.png");
                Assert.fail(e.getMessage());
            }
        }
    }

    public static void clickAddLink(String member) {
        try {
            SeleniumUtil.clickElement("linktext", "add", 10);
            logger.info("Clicked add link to add " + member);
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickAddLinkError.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickDeleteLink(String member) {
        try {
            SeleniumUtil.clickElement("linktext", "delete", 10);
            logger.info("Clicked delete link to delete " + member);
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickDeleteLinkError.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickActionLinkCorrespondingToMember(String member, String action) {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//td[text()='" + member + "']//following-sibling::td//a[text()='" + action + "']")).click();
            logger.info("Clicked " + action + " link of member " + member);
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickDeleteLinkError.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void waitTillModalWindowToOpen(String modalWindowName) throws Throwable {

        for (int attempt = 1; attempt < 10; attempt++) {
            List<WebElement> modalWindows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-css-shadow+div.x-window div.x-title-text"));
            for (WebElement modalWindow : modalWindows) {
                if (AllContractPagesView.getTextAndByPassException(modalWindow).contains(modalWindowName)) {
                    return;
                }
            }
        }

        BaseView.takeScreenshot("Modal window not present" + modalWindowName);
        fail("Modal window not present" + modalWindowName);
    }


    public static void verifyRegionManager(String strRegion, String strManager) {
        try {
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strRegion + "']/parent::tr//following-sibling::tr[2]/following-sibling::tr[1]", strManager, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("Verify :" + strManager);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyRegionManager");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyRegionMember(String strRegion, String strManager) {
        try {
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strRegion + "']/parent::tr//following-sibling::tr[4]/following-sibling::tr[1]", strManager, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("Verify :" + strManager);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyRegionMember");
            Assert.fail(e.getMessage());
        }
    }

    public static void expandRegionTreeAndVerifyTheMember(String regionName, String strMember) {
        try {
            BaseView.pushShortTimeout();
            if (SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]")).size() > 0) {
                SeleniumUtil.click("xpath", "//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]", 10);
                SeleniumUtil.verifyTextValue("xpath", "//*[text()='" + regionName + "']/parent::tr/following-sibling::tr//*/a", strMember, SeleniumUtilities.OBJWAITTIMEOUT);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            BaseView.popDefaultTimeout();
            Assert.fail(e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void expandRegionTreeAndVerifyTheLinks(String regionName, String strLinks) {
        try {
            BaseView.pushShortTimeout();
            if (SeleniumUtil.getWebDriver().findElements(By.xpath("//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]")).size() > 0) {
                SeleniumUtil.click("xpath", "//td[text()='" + regionName + "']//ancestor::div/parent::td/preceding-sibling::td/a/img[contains(@src,'botplus.gif')]", 10);
                SeleniumUtil.verifyTextValue("xpath", "//*[text()='" + regionName + "']/parent::tr//*", strLinks, SeleniumUtilities.OBJWAITTIMEOUT);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            BaseView.popDefaultTimeout();
            Assert.fail(e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }
}