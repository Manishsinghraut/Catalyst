package com.lucernex.qa.views.admin;

import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

/**
 * When the user clicks on one of the Admin page links they will see a page that
 * consists of one or more tabs, hence this class.
 */
public class AdminTabsView {
    private static final AdminPage adminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AdminPage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    /**
     * Returns a map of tab names to tab links, clicking on a given tab link
     * will cause the display of the clicked tab.
     */
    private static Map<String,WebElement> getTabs() {
        BrowserDriver.waitForElement(adminPage.tabsDiv);

        assertTrue("Did not see the set of admin tabs!", adminPage.tabsDiv.isDisplayed());

        List<WebElement> tabs = adminPage.tabsDiv.findElements(By.cssSelector("a.x-tab-right"));

        assertNotNull("Did not see any admin tabs!", tabs);
        assertTrue("Admin tabs is empty!", tabs.size() > 0);

        Map<String,WebElement> name2link = new TreeMap<String,WebElement>();

        for (WebElement tabLink : tabs) {
            WebElement name = tabLink.findElement(By.cssSelector("span.x-tab-strip-text"));

            assertNotNull("Unable to find tab name span element!", name);

            name2link.put(name.getText(), tabLink);
        }

        return name2link;
    }

    /**
     * Returns a set of tab names of the current Admin page.
     */
    public static List<String> getTabNames() {
        BrowserDriver.waitForElement(adminPage.tabsDiv);

        assertTrue("Did not see the set of admin tabs!", adminPage.tabsDiv.isDisplayed());

        List<WebElement> tabs = adminPage.tabsDiv.findElements(By.cssSelector("a.x-tab-right"));

        assertNotNull("Did not see any admin tabs!", tabs);
        assertTrue("Admin tabs is empty!", tabs.size() > 0);

        List<String> names = new ArrayList<String>(tabs.size());

        for (WebElement tabLink : tabs) {
            WebElement name = tabLink.findElement(By.cssSelector("span.x-tab-strip-text"));

            assertNotNull("Unable to find tab name span element!", name);

            names.add(name.getText().trim());
        }

        return names;
    }

    /**
     * Click on the specified tab.
     *
     * @param name - tab name to click
     */
    public static void clickTab(String name) {
        Map<String,WebElement> name2link = getTabs();

        assertNotNull(name2link);

        WebElement link = name2link.get(name);

        assertNotNull(String.format("Did not find a tab named '%s'", name), link);

        link.click();
    }

    public static String getActiveTab() throws InterruptedException {
        WebElement activeTab;

        try {
            activeTab = BrowserDriver.findElementWithTimeout(By.cssSelector("a.x-tab-active"), 5);
        } catch (InterruptedException e) {
            // The [Lx Administrator Page] will not be found by the above CSS selector so...
            activeTab = BrowserDriver.findElementWithTimeout(By.cssSelector("li.x-tab-strip-active"), 5);
        }

        assertNotNull("Unable to find the current active tab", activeTab);

        return BrowserDriver.getTextFromElement(activeTab);
    }

    /**
     * Returns true if there is a extjs grid present that has the specified ID.
     *
     * @param gridID - grid id (e.g. 'BOGridProcessTimelineTemplate')
     */
    public static boolean isGridPresent(String gridID) throws InterruptedException {
//        WebElement activeTab = BrowserDriver.findElementWithTimeout(By.id(gridID), 5);
//        return (activeTab == null) ? false : activeTab.isDisplayed();
        boolean activeTab=false;
        for(int i=0;i<5;i++) {
            activeTab = SeleniumUtil.waitForElementVisibilityOf("id", gridID, 2);
            if(activeTab) return activeTab;
        }
        return activeTab;
    }
}
