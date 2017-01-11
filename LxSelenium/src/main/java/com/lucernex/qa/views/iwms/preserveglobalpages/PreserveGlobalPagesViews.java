package com.lucernex.qa.views.iwms.preserveglobalpages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.components.EditableFormOrPage;
import com.lucernex.qa.utils.*;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.LoginView;
import com.lucernex.qa.views.components.ActionsView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import com.lucernex.swagger.util.Credentials;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;
import static org.junit.Assert.*;

/**
 * Created by rle0239 on 07/15/2015.
 */
public class PreserveGlobalPagesViews {
    private static final Logger logger = Logger.getLogger(PreserveGlobalPagesViews.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static String topMenuLink;
    private static String[] topMenuLinks;

    public static void getLink() throws Throwable {
        try {
            ActionsView.clickLinkActionPanelButtonAndVerifyPopUp();
            BrowserDriver.waitForElement(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window a:nth-of-type(3)")));
            topMenuLink = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window a:nth-of-type(3)")).getText();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch link.png");
            fail("Unable to fetch link " + e.getMessage());
        }
    }

    public static void getLinks() throws Throwable {
        Select list = new Select(BrowserDriver.getCurrentDriver().findElement(By.id("lx-hpicker")));
        int i = list.getOptions().size();
        topMenuLinks = new String[i];
        for (int j = 0; j < i; j++) {
            list.selectByVisibleText(list.getOptions().get(j).getText());
            CommonMethods.waitTillDivisionLoads();
            /*ActionsView.clickActionPanelButtonWhenReady("Link");*/
            ActionsView.clickLinkActionPanelButtonAndVerifyPopUp();
            OrgChartView.waitTillModalWindowToOpen();

            try {
                String link = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window")).getText();
                if (link.contains("Top Menu Link for current PotentialProject:")) {
                    String links1[] = link.split("Top Menu Link for current PotentialProject:");
                    String links2[] = links1[1].split("PotentialProject");
                    String links3[] = links2[0].split("\n");
                    topMenuLinks[j] = links3[1] + "PotentialProject";
                    System.out.println(topMenuLinks[j]);

                } else if (link.contains("Top Menu Item URL for current PotentialProject:")) {
                    String links1[] = link.split("Top Menu Item URL for current PotentialProject:");
                    String links2[] = links1[1].split("PotentialProject");
                    String links3[] = links2[0].split("\n");
                    topMenuLinks[j] = links3[1] + "PotentialProject";
                    System.out.println(topMenuLinks[j]);
                }

            } catch (Exception e) {
                BaseView.takeScreenshot("Unable to fetch link.png");
                fail("Unable to fetch link " + e.getMessage());
            }
            SeleniumUtil.click("cssselector", "img.x-tool-img.x-tool-close", SeleniumUtilities.OBJWAITTIMEOUT);
            OrgChartView.waitTillModalWindowToClose();
        }
    }

    public static boolean verifyLinksFetched(String[] topMenuLinks) {
        for (int i = 0; i < topMenuLinks.length; i++) {
            if (!topMenuLinks[i].matches(".+")) {
                return false;
            }
        }
        return true;
    }

  /*  public static void getLinksOfProject() throws Throwable {
        Select list = new Select(BrowserDriver.getCurrentDriver().findElement(By.id("lx-hpicker")));
        CommonMethods.waitTillDivisionLoads();
        int i = list.getOptions().size();

            topMenuLinks = new String[i];
            for (int j = 0; j < i; j++) {
                list.selectByVisibleText(list.getOptions().get(j).getText());
                CommonMethods.waitTillDivisionLoads();
            *//*ActionsView.clickActionPanelButtonWhenReady("Link");*//*
                ActionsView.clickLinkActionPanelButtonAndVerifyPopUp();
                OrgChartView.waitTillModalWindowToOpen();

                try {
                    String link = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window")).getText();
                    String links1[] = link.split("Top Menu Link for current Project:");
                    String links2[] = links1[1].split("=Project");
                    String links3[] = links2[0].split("\n");
                    topMenuLinks[j] = links3[1] + "=Project";
                    System.out.println(topMenuLinks[j]);
                } catch (Exception e) {
                    BaseView.takeScreenshot("Unable to fetch link.png");
                    fail("Unable to fetch link " + e.getMessage());
                }
                SeleniumUtil.click("cssselector", "img.x-tool-img.x-tool-close", SeleniumUtilities.OBJWAITTIMEOUT);
                OrgChartView.waitTillModalWindowToClose();
            }

    }*/

    public static void getLinksOfProject() throws Throwable {
        Select list = new Select(BrowserDriver.getCurrentDriver().findElement(By.id("lx-hpicker")));
        CommonMethods.waitTillDivisionLoads();
        int i = list.getOptions().size();
        String[] topMenuLinksLocal;
        int count = 0;
        do {
            count++;
            topMenuLinksLocal = new String[i];
            for (int j = 0; j < i; j++) {
                list.selectByVisibleText(list.getOptions().get(j).getText());
                CommonMethods.waitTillDivisionLoads();
            /*ActionsView.clickActionPanelButtonWhenReady("Link");*/
                ActionsView.clickLinkActionPanelButtonAndVerifyPopUp();
                OrgChartView.waitTillModalWindowToOpen();

                try {
                    String link = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window")).getText();
                    if(link.contains("Top Menu Item URL for current Project:")){
                        String links1[] = link.split("Top Menu Item URL for current Project:");
                        String links2[] = links1[1].split("=Project");
                        String links3[] = links2[0].split("\n");
                        topMenuLinksLocal[j] = links3[1] + "=Project";
                        System.out.println(topMenuLinksLocal[j]);

                    }else if(link.contains("Top Menu Link for current Project:")){
                        String links1[] = link.split("Top Menu Link for current Project:");
                        String links2[] = links1[1].split("=Project");
                        String links3[] = links2[0].split("\n");
                        topMenuLinksLocal[j] = links3[1] + "=Project";
                        System.out.println(topMenuLinksLocal[j]);
                    }

                } catch (Exception e) {
                    BaseView.takeScreenshot("Unable to fetch link.png");
                    fail("Unable to fetch link " + e.getMessage());
                }
                SeleniumUtil.click("cssselector", "img.x-tool-img.x-tool-close", SeleniumUtilities.OBJWAITTIMEOUT);
                OrgChartView.waitTillModalWindowToClose();
            }
        } while (!verifyLinksFetched(topMenuLinksLocal) && count < 5);

        if (!verifyLinksFetched(topMenuLinksLocal)) {
            fail("Unable to fetch links from the summary page");
        } else {
            topMenuLinks = new String[i];
            for (int k = 0; k < topMenuLinksLocal.length; k++) {
                topMenuLinks[k] = topMenuLinksLocal[k];
            }
        }
    }

    public static void getLinksOfFacility() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        Select list = new Select(BrowserDriver.getCurrentDriver().findElement(By.id("lx-hpicker")));
        int i = list.getOptions().size();
        topMenuLinks = new String[i];
        for (int j = 0; j < i; j++) {
            list.selectByVisibleText(list.getOptions().get(j).getText());
            CommonMethods.waitTillDivisionLoads();
           /* ActionsView.clickActionPanelButtonWhenReady("Link");*/
            ActionsView.clickLinkActionPanelButtonAndVerifyPopUp();
            OrgChartView.waitTillModalWindowToOpen();

            try {
                String link = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window")).getText();
//                String links1[] = link.split("Top Menu Link for current Facility:");
                if (link.contains("Top Menu Item URL for current Facility:")) {
                    String links1[] = link.split("Top Menu Item URL for current Facility:");
                    String links2[] = links1[1].split("=Facility");
                    String links3[] = links2[0].split("\n");
                    topMenuLinks[j] = links3[1] + "=Facility";
                    System.out.println(topMenuLinks[j]);

                } else if (link.contains("Top Menu Link for current Facility:")) {
                    String links1[] = link.split("Top Menu Link for current Facility:");
                    String links2[] = links1[1].split("=Facility");
                    String links3[] = links2[0].split("\n");
                    topMenuLinks[j] = links3[1] + "=Facility";
                    System.out.println(topMenuLinks[j]);
                }

            } catch (Exception e) {
                BaseView.takeScreenshot("Unable to fetch link.png");
                fail("Unable to fetch link " + e.getMessage());
            }
            SeleniumUtil.click("cssselector", "img.x-tool-img.x-tool-close", SeleniumUtilities.OBJWAITTIMEOUT);
            OrgChartView.waitTillModalWindowToClose();
        }
    }


    public static void addMenuItem(String name) throws Exception {
        try {
            CommonMethods.inputValueByName("PageLayoutName", name);
            CommonMethods.inputValueByName("URL", topMenuLink);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to add item.png");
            fail("Unable to add item " + e.getMessage());
        }
    }

    public static void addMenuItems(int i, String name) throws Exception {
        try {
            CommonMethods.inputValueByName("PageLayoutName", name);
            CommonMethods.inputValueByName("URL", topMenuLinks[i]);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to add item.png");
            fail("Unable to add item " + e.getMessage());
        }
    }

    public static void verifyText(String name) throws Exception {
        try {
            int size = BrowserDriver.getCurrentDriver().findElements(By.tagName("*")).size();
            int count = 0;
            for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("*"))) {
                count++;
                logger.info(ele.getText());
                if (count < size) {
                    if (ele.getText().contains(name)) {
                        logger.info("Expected task " + name + " is present");
                        break;
                    }
                } else {
                    TestCase.fail("Expected task " + name + " is not present");
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot(name + ".png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyTextInRow(String name) throws Exception {
        try {
            int size = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[class*='rowColor']")).size();
            int count = 0;
            for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr[class*='rowColor']"))) {
                count++;
                logger.info(ele.getText());
                if (count < size) {
                    if (ele.getText().replaceAll("\n","").contains(name.replaceAll("\n",""))) {
                        logger.info("Expected task " + name + " is present");
                        break;
                    }
                } else {
                    TestCase.fail("Expected task " + name + " is not present");
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot(name + ".png");
            Assert.fail(e.getMessage());
        }
    }

    public static void selectLayoutOption(String option) throws Exception {
        try {
            //BaseView.selectFromList(By.id("lx-hpicker"),option);
            SeleniumUtil.select("id", "lx-hpicker", option, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            System.out.println("Failed to select option " + option);
        }
    }

    public static WebElement verifySummaryDataHeader(List<List<String>> summaryData) throws Throwable {
        int count = 0;
        WebElement header = null;
        try {
            //List<WebElement> sectionHeaders = BrowserDriver.getCurrentDriver().findElements(By.xpath("//td[@class='tblHeader']/ancestor::tr[1]"));
            List<WebElement> sectionHeaders = BrowserDriver.getCurrentDriver().findElements(By.xpath("//*[@class='tblHeader']/ancestor::tr[1]"));
            assertNotEquals("Did not fetched any headers from grid", sectionHeaders.size(), 0);
            for (WebElement sectionHeader : sectionHeaders) {
                if (AllContractPagesView.getTextAndByPassException(sectionHeader).trim().contains(summaryData.get(0).get(0))) {
                    count++;
                    header = sectionHeader;
                }
            }
            assertNotNull("No header elements fetched " + summaryData.get(0).get(0), header);
//            assertTrue("Fetched duplicate headers in same page" + header.getText(), count == 1);
        } catch (Exception e) {
            BaseView.takeScreenshot("Fetched duplicate headers in same page.png");
            fail(e.getMessage());
        }
        return header;
    }

    public static void verifySummaryData(List<List<String>> summaryData) throws Throwable {
        List<List<String>> values = new ArrayList<List<String>>();
        WebElement sectionHeader = verifySummaryDataHeader(summaryData);
        int count = 0;
        try {
            BaseView.pushMillSecTimeout(10);
            List<WebElement> sectionRows = sectionHeader.findElements(By.xpath("//following-sibling::tr"));
            assertNotEquals("Did not fetched any rows from grid", sectionRows.size(), 0);
            for (WebElement sectionRow : sectionRows) {
                List<String> lineItem = new ArrayList<>();
                for (WebElement td : sectionRow.findElements(By.tagName("td"))) {
                    lineItem.add(AllContractPagesView.getTextAndByPassException(td).trim());
                }
                values.add(lineItem);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Fetched duplicate headers in same page.png");
            BaseView.popDefaultTimeout();
            //fail(e.getMessage());
        }

        /*for (int i = 0; i < values.size(); i++) {
            for (int j = 1; j < summaryData.size(); j++) {
                if (values.get(i).containsAll(summaryData.get(j))) {
                    count++;
                }
            }
        }
        */
        BaseView.popDefaultTimeout();
        for (int i = 0; i < values.size(); i++) {
            for (int j = 1; j < summaryData.size(); j++) {
                if (values.get(i).containsAll(summaryData.get(j))) {
                    System.out.print("\n"+values.get(i)+" = "+summaryData.get(j));
                    count++;
                }
            }
        }

        if (!(count >= summaryData.size() - 1)) {
            BaseView.takeScreenshot("Headers mismatch.png");
            GridUtils.printGridItems(values);
            fail("Line items mismatch");
        }
    }

    public static void verifySummaryDataNotPresent(List<List<String>> summaryData) throws Throwable {
        List<List<String>> values = new ArrayList<List<String>>();
        WebElement sectionHeader = verifySummaryDataHeader(summaryData);
        int count = 0;
        try {
            BaseView.pushMillSecTimeout(10);
            List<WebElement> sectionRows = sectionHeader.findElements(By.xpath("//following-sibling::tr"));
            assertNotEquals("Did not fetched any rows from grid", sectionRows.size(), 0);
            for (WebElement sectionRow : sectionRows) {
                List<String> lineItem = new ArrayList<>();
                for (WebElement td : sectionRow.findElements(By.tagName("td"))) {
                    lineItem.add(AllContractPagesView.getTextAndByPassException(td).trim());
                }
                values.add(lineItem);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Fetched duplicate headers in same page.png");
            BaseView.popDefaultTimeout();
            //fail(e.getMessage());
        }

        BaseView.popDefaultTimeout();
        for (int i = 0; i < values.size(); i++) {
            for (int j = 1; j < summaryData.size(); j++) {
                if (values.get(i).containsAll(summaryData.get(j))) {
                    System.out.print("\n"+values.get(i)+" = "+summaryData.get(j));
                    count++;
                }
            }
        }

        if (count >= summaryData.size() - 1) {
            BaseView.takeScreenshot("Headers mismatch.png");
            GridUtils.printGridItems(values);
            fail("Line items mismatch");
        }
    }
}
