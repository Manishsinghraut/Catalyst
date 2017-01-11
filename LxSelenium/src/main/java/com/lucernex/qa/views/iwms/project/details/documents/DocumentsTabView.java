package com.lucernex.qa.views.iwms.project.details.documents;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.iwms.project.details.forms.FormsPage;
import com.lucernex.qa.pages.iwms.project.details.forms.document.DocumentPage;
import com.lucernex.qa.utils.EmailVerification;
import com.lucernex.qa.utils.FileUtils;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.UnhandledAlertException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static com.lucernex.qa.utils.FileDownloader.fileDownload;
import static com.lucernex.qa.views.BaseView.takeScreenshot;
import static junit.framework.Assert.assertTrue;
import static org.junit.Assert.fail;

//import org.eclipse.jetty.util.log.Log;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by RLE0097 on 08/06/2016.
 */
public class DocumentsTabView {
    private static final DocumentPage documentPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), DocumentPage.class);
    private static final Logger logger = Logger.getLogger(DocumentsTabView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void downloadDocument(String docName, String strMenuOption) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
//                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + docName + "']")));
                CommonMethods.rightClick(SeleniumUtil.getElement("xpath", "//*[./text()='" + docName + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
                fileDownload();
                OrgChartView.waitTillModalWindow(5);
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + docName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to open task pop up.png");
                TestCase.fail("Failed to open task pop up" + e.getMessage());
            }
        }
    }

    public static void rightClick(String docName, String strMenuOption) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
//                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + docName + "']")));
                CommonMethods.rightClick(SeleniumUtil.getElement("xpath", "//*[./text()='" + docName + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
                OrgChartView.waitTillModalWindow(5);
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + docName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to open task pop up.png");
                TestCase.fail("Failed to open task pop up" + e.getMessage());
            }
        }
    }

    public static void verifyMenuOptionDisabled(String docName, String strMenuOption) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(SeleniumUtil.getElement("xpath", "//*[./text()='" + docName + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT));
                WebElement ele = SeleniumUtil.getWebElementObject("xpath", "//span[./text()='" + strMenuOption + "']");
                if (ele.isEnabled()) {
                    OrgChartView.waitTillModalWindow(5);
                    SeleniumUtil.escape(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + docName + "']")));
                WebElement ele = SeleniumUtil.getWebElementObject("xpath", "//span[./text()='" + strMenuOption + "']");
                if (ele.isEnabled()) {
                    OrgChartView.waitTillModalWindow(5);
                    SeleniumUtil.escape(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
            } catch (Exception e) {
                BaseView.takeScreenshot("verifyMenuOptionDisabled");
                TestCase.fail("verifyMenuOptionDisabled" + e.getMessage());
            }
        }
    }

    public static void selectRightClickDownload(String strOption) {
        try {
            SeleniumUtil.click("cssselector", ".x-grid-cell-inner>a", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.rightClickSelectMenuOption("cssselector", ".x-grid-cell-inner>a", "cssselector", "a[id='ViewerMenuItem-itemEl']");
            fileDownload();
        } catch (Exception ex) {
            takeScreenshot("selectRightClickDownload");
            logger.info("Select and right click on Schedules.html and click Download");
            TestCase.fail("Failed to Select and right click on Schedules.html and click Download" + ex.getMessage());
        }
    }

    public static void verifyHTMLFile(List<String> expected) {
        try {
            String htmlPageContent = FileUtils.readFileContent((System.getProperty("user.dir") + "\\target\\DownloadFiles\\" + CommonMethods.getLatestDownloadedFile()));
            for (String strTaskName : expected) {
                String strTask = "<span style=\"\" class=\"x-tree-node-text \">" + strTaskName + "</span>";
                assertTrue(strTask + " : ", htmlPageContent.contains(strTask));
            }
            EmailVerification.launchLatestDownloadedFile();
            EmailVerification.closelaunchLatestDownloadedFile();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    public static List<WebElement> getGridAllRowsCount() throws Throwable {
        return DocumentsTabView.fetchGridLineItems();
    }

    public static List<WebElement> getGridAllRowsCounts() throws Throwable {
        return DocumentsTabView.fetchGridLineItems("class", "rowColor1");
    }

    public static void verifyButtonName(String buttonName) throws Throwable {
        if (BaseView.genericSecondWindowHandle != null) {
            try {
                if (!(SeleniumUtil.waitForElementContainText("tagname", "input", buttonName))) {
                    BaseView.takeScreenshot("Button name is not the expected one.png");
                    logger.info("Button name is not the expected one");
                }
            } catch (Exception e) {
            }
        } else {
            logger.info("window closed before verifying the button modification");
        }

    }

    public static List<WebElement> fetchGridLineItems() throws Throwable {
        List<WebElement> rows = new ArrayList<WebElement>();
        try {
            BaseView.pushShortTimeout();
            if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr[not(boolean(@style))][contains(@class,'display:none')]")).size() > 0) {
                rows = BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr[not(boolean(@style))][contains(@class,'display:none')]"));
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
        return rows;
    }

    public static List<WebElement> fetchGridLineItems(String strAttribute, String strDescription) throws Throwable {
        List<WebElement> rows = new ArrayList<WebElement>();
        try {
            BaseView.pushShortTimeout();
            if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr[not(boolean(@style))][contains(@" + strAttribute + ",'" + strDescription + "')]")).size() > 0) {
                rows = BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr[not(boolean(@style))][contains(@" + strAttribute + ",'" + strDescription + "')]"));
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
        return rows;
    }

    public static void verifyImageUpload() {
        try {
            assertTrue(SeleniumUtil.waitForElementVisibilityOf("cssselector", "img[alt='logo'][src*='data:image/gif;']", 6, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyImageupload");
            Assert.fail("verify Image upload");
        }
    }

    public static void verifyEntityPhoto() {
        try {
            assertTrue(SeleniumUtil.waitForElementVisibilityOf("cssselector", "img[src*='/DocumentDownload?type=prjEtyImage&']", 6, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyImageupload");
            Assert.fail("verify Image upload");
        }
    }


    public static void verifyCustomListBudget(String strBudget, String strBudgetCost, String strItemName, String strQuantity, String strUnitCost, String strMathTotal) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='" + strBudget + "']/following-sibling::td[1]", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strBudget + "']/following-sibling::td[1]", strBudgetCost, SeleniumUtilities.OBJWAITTIMEOUT));
            assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strBudget + "']/following-sibling::td[2]", strItemName, SeleniumUtilities.OBJWAITTIMEOUT));
            assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strBudget + "']/following-sibling::td[3]", strQuantity, SeleniumUtilities.OBJWAITTIMEOUT));
            assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strBudget + "']/following-sibling::td[4]", strUnitCost, SeleniumUtilities.OBJWAITTIMEOUT));
            assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strBudget + "']/following-sibling::td[5]", strMathTotal, SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyCustomListBudget");
            Assert.fail("verify verifyCustomListBudget");
        }
    }

    public static void uncheckTheReadyForRelease() {
        try {

            SeleniumUtil.waitForElementIsClickable(documentPage.readyForReleaseCheckBox, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.unCheckbox(documentPage.readyForReleaseCheckBox, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("uncheckTheReadyForRelease");
            Assert.fail("uncheckTheReadyForRelease");
        }
    }

    public static void verifyUncheckTheReadyForRelease() {
        try {
            SeleniumUtil.waitForElementIsClickable(documentPage.readyForReleaseCheckBox, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.verifyUncheckbox(documentPage.readyForReleaseCheckBox, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyUncheckTheReadyForRelease");
            Assert.fail("verifyUncheckTheReadyForRelease");
        }
    }

    public static void checkTheReadyForRelease() {
        try {
            SeleniumUtil.waitForElementIsClickable(documentPage.readyForReleaseCheckBox, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.checkbox(documentPage.readyForReleaseCheckBox, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("checkTheReadyForRelease");
            Assert.fail("checkTheReadyForRelease");
        }
    }

    public static void verifycheckTheReadyForRelease() {
        try {
            SeleniumUtil.waitForElementIsClickable(documentPage.readyForReleaseCheckBox, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.verifycheckbox(documentPage.readyForReleaseCheckBox, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifycheckTheReadyForRelease");
            Assert.fail("verifycheckTheReadyForRelease");
        }
    }

    public static void selectFolders(String folderName) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//span[contains(@class,'x-tree-node-text')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("xpath", "//span[contains(@class,'x-tree-node-text')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement ele : eles) {
                if (ele.getText().contains(folderName)) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }
            SeleniumUtil.handleUnexpectedAlerts();
        } catch (Exception e) {
            BaseView.takeScreenshot("selectFolders");
            fail("Selected folder " + e.getMessage());
        }
    }

    public static void selectFolders(String folderName, int intFolderSeqNumber) {
        try {
            int count = 1;
            SeleniumUtil.waitForElementIsClickable("xpath", "//span[contains(@class,'x-tree-node-text')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("xpath", "//span[contains(@class,'x-tree-node-text')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement ele : eles) {
                if (count == intFolderSeqNumber) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
                count++;
            }
            SeleniumUtil.handleUnexpectedAlerts();
        } catch (Exception e) {
            BaseView.takeScreenshot("selectFolders");
            fail("Selected folder " + e.getMessage());
        }
    }

    public static void rightClickRootFolderAndSelectOptn(String strFolderName, String menuOptionLink) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//span[contains(@class,'x-tree-node-text')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("xpath", "//span[contains(@class,'x-tree-node-text')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement ele : eles) {
                if (ele.getText().contains(strFolderName)) {
                    SeleniumUtil.rightClickSelectMenuOption(ele, menuOptionLink);
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot(strFolderName + ":" + menuOptionLink + ".png");
            logger.info("Error :" + e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot(strFolderName + ":" + menuOptionLink + ".png");
            logger.info("Error :" + throwable.getMessage());
        }
    }

//    public static void uncheckTheReadyForRelease() {
//        try {
//
//            SeleniumUtil.waitForElementIsClickable(documentPage.readyForReleaseCheckBox,8,SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.unCheckbox("xpath",".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input", SeleniumUtilities.OBJWAITTIMEOUT);
//        } catch (Exception e) {
//            BaseView.takeScreenshot("uncheckTheReadyForRelease");
//            Assert.fail("uncheckTheReadyForRelease");
//        }
//    }
//
//    public static void verifyUncheckTheReadyForRelease() {
//        try {
//            SeleniumUtil.waitForElementIsClickable("xpath",".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input",8,SeleniumUtilities.OBJWAITTIMEOUT);
//            assertTrue(SeleniumUtil.verifyUncheckbox("xpath", ".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input", SeleniumUtilities.OBJWAITTIMEOUT));
//        } catch (Exception e) {
//            BaseView.takeScreenshot("verifyUncheckTheReadyForRelease");
//            Assert.fail("verifyUncheckTheReadyForRelease");
//        }
//    }
//
//    public static void checkTheReadyForRelease() {
//        try {
//            SeleniumUtil.waitForElementIsClickable("xpath",".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input",8,SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.checkbox("xpath", ".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input", SeleniumUtilities.OBJWAITTIMEOUT);
//        } catch (Exception e) {
//            BaseView.takeScreenshot("checkTheReadyForRelease");
//            Assert.fail("checkTheReadyForRelease");
//        }
//    }
//
//    public static void verifycheckTheReadyForRelease() {
//        try {
//            SeleniumUtil.waitForElementIsClickable("xpath",".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input",8,SeleniumUtilities.OBJWAITTIMEOUT);
//            assertTrue(SeleniumUtil.verifycheckbox("xpath", ".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input", SeleniumUtilities.OBJWAITTIMEOUT));
//        } catch (Exception e) {
//            BaseView.takeScreenshot("verifycheckTheReadyForRelease");
//            Assert.fail("verifycheckTheReadyForRelease");
//        }
//    }

    public static void clickOnSearchOnPopup() {
        try {
            SeleniumUtil.waitForElementVisibilityOf("id", "doSearch-btnInnerEl", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", "doSearch-btnInnerEl", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked Search on popup");

        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnsearchOnPopup");
            fail("Failed to click search button " + e.getMessage());
        }
    }

    public static void verifyDisplayedMessage(String expStatement, String expValue) {
        expStatement = expStatement + "\"" + expValue + "\"";

        String actStr = BrowserDriver.getCurrentDriver().findElement(By.xpath("//div[contains(text(),'Search results for')]")).getText();
        assertTrue(expStatement.equals(actStr));
    }

    public static void verifyAlertMessage(String alertMessage) {
        Alert alert = BrowserDriver.getCurrentDriver().switchTo().alert();
        try {
            org.junit.Assert.assertTrue(alert.getText().contains(alertMessage));
            logger.info("Expected " + alertMessage + " \n Found " + alert.getText() + " are same");
            alert.accept();
            logger.info("Clicked on OK on Alert");
        } catch (Exception e) {
            logger.info("Expected " + alertMessage + " \n Found " + alert.getText() + " are not sme");
            BaseView.takeScreenshot("verifyAlertMessage");
        }
    }

    public static void clickArrowToRearrange(String arrow, String document) throws Throwable {
        try {
            SeleniumUtil.click("xpath", "//*[text()='" + document + "']//ancestor::td[1]//preceding-sibling::td//*[contains(@src,'" + arrow + "')]", 5);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click down arrow");
        }
    }

    public static void selectFoldersOnModalWindow(String folderName, int intFolderSeqNumber) {
        try {
            int count = 1;
            SeleniumUtil.waitForElementIsClickable("xpath", "//*[contains(@src,'folder')]/parent::a", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("xpath", "//*[contains(@src,'folder')]/parent::a", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement ele : eles) {
                if (count == intFolderSeqNumber) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
                count++;
            }
            SeleniumUtil.handleUnexpectedAlerts();
        } catch (Exception e) {
            BaseView.takeScreenshot("selectFolders");
            fail("Selected folder " + e.getMessage());
        }
    }
}