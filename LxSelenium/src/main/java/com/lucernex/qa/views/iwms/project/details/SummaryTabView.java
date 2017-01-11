package com.lucernex.qa.views.iwms.project.details;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/**
 * Created by rle0239 on 28-04-2015.
 */
public class SummaryTabView {

    private static final Logger logger = Logger.getLogger(SummaryTabView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public static int SEQUENCE_NUMBER = 0;

    public static void verifyUniqueTableGridRow(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        WebElement fixRow = null;
        String strElement = "";
        int colIndex = 0;

        if (gridID.contains("^"))
            strElement = "table[id^='" + gridID.replace("^", "") + "']";
        else
            strElement = "table[id='" + gridID + "']";

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        try {
            //Traverse cells value now
            List<WebElement> headers = gridElement.findElements(By.cssSelector("td.optionalFieldLabel"));
            List<WebElement> cells = fixRow.findElements(By.cssSelector("td.linedTable"));
            for(int i=0;i<fields.size();i++){
                assertTrue(cells.get(i).getText().contains(fields.get(i).getValue()));
                assertTrue(headers.get(i).getText().contains(fields.get(i).getName()));
            }
        } catch (Exception e) {

        }
    }

    public static void clickCollapseButton(String sectionName){
        try{
            if(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + sectionName + "']/preceding-sibling::img[@src='/RolloutManager/img/rtri.gif']")).isDisplayed()){
                BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + sectionName + "']/preceding-sibling::img[@src='/RolloutManager/img/rtri.gif']")).click();
            }
            logger.info("Collapse the section successfully");
        }catch(Exception e){
            BaseView.takeScreenshot("UnableToCollapseSection.png");
            fail("Unable to collapse the section "+e.getMessage());
        }
    }

    public static void clickHideButton(String sectionName) {
        for (int i = 0; i <= SeleniumUtilities.WEBDRIVER_WAIT_SMALL; i++) {

            if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + sectionName + "']/preceding-sibling::img[@src='/RolloutManager/img/dtri.gif'][not(@style='display: none;')]")).size()>0) {
                BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + sectionName + "']/preceding-sibling::img[@src='/RolloutManager/img/dtri.gif'][not(@style='display: none;')]")).click();
                if (SeleniumUtil.waitForElementVisibilityOf("xpath", "//span[text()='" + sectionName + "']/preceding-sibling::img[@src='/RolloutManager/img/rtri.gif'][not(@style='display: none;')]", 2)) {
                    logger.info("Custom list is Hided for the attempt count.." + i + " continuing\n");
                    logger.info("Hided the section successfully");
                    break;
                } else if ((i == SeleniumUtilities.WEBDRIVER_WAIT_SMALL) &&
                        !(SeleniumUtil.waitForElementVisibilityOf("xpath", "//span[text()='" + sectionName + "']/preceding-sibling::img[@src='/RolloutManager/img/rtri.gif'][not(@style='display: none;')]", 2))) {
                    BaseView.takeScreenshot("UnableToHideSection.png");
                    fail("Unable to Hide the section ");
                } else {
                    logger.info("Custom list is not Hided for the attempt count.." + i + " continuing");
                }
            }
        }
    }

    public static void verifyGridInvisibility(String grid){
        try{
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),30);
            String strElement = AllContractPagesView.getGridElement(grid);
            wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(strElement)));
            logger.info("Hided the section successfully");
        } catch(Exception ne) {
            BaseView.takeScreenshot("UnableToCollapseSection.png");
            fail("Unable to collapse the section " + ne.getMessage());
        }
    }

    public static void verifyPopupWindowValues(String strLabel,String strValue){
        try{
            assertTrue((SeleniumUtil.getTextValue("xpath", ".//div[@id='" + strLabel + "_label']/parent::td", SeleniumUtilities.OBJWAITTIMEOUT).contains(strValue)));
        } catch(Exception ne) {
            BaseView.takeScreenshot("verifyPopupWindowValues");
            fail("Error: " + ne.getMessage());
        }
    }

    public static void getEntityID() throws Throwable{
        try {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//*[@id='EntityId_label']/parent::td",1);
            GenericSteps.lxRecID = entityID.replaceAll("Entity LxID\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }


    public static void verifyMemberOnworkflow(int intCol,String strSteps,String strMember){
        try{
            assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//td[contains(./text(),'"+strSteps+"')]/parent::tr//following-sibling::tr[1]/td["+intCol+"]",strMember, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch(Exception ne) {
            BaseView.takeScreenshot("verifyMemberOnworkflow");
            fail("Error: " + ne.getMessage());
        }
    }


    public static void fetchEntitySequenceNumber(String entity) {
        try {
            SEQUENCE_NUMBER = Integer.parseInt(BrowserDriver.getCurrentDriver().findElement(By.name(entity)).
                    getAttribute("value"));
        } catch (Exception ne) {
            BaseView.takeScreenshot("Failed to fetch "+entity+" sequence number.png");
                    fail("Error: Failed to fetch "+entity+" sequence number" + ne.getMessage());
        }
    }

    public static void verifySequenceNumber(String label) throws Throwable {
        try {
            String value = AllContractPagesView.getTextAndByPassException(
                    BrowserDriver.getCurrentDriver().
                            findElement(By.xpath(".//*[./text()='" + label + "']/parent::td[1]")));
            value = value.replaceAll(label, "");
            assertEquals("Sequence number is not the expected one " + Integer.toString(SEQUENCE_NUMBER) + "found " + value, value.trim(), Integer.toString(SEQUENCE_NUMBER));
        } catch (Exception ne) {
            BaseView.takeScreenshot("Failed to verify" + label + ".png");
            fail("Error: Failed to verify + label+" + ne.getMessage());
        }
    }

    public static void getModalWindowButtonNew(String buttonName, String modalWindowName) throws Throwable {
        try {
            SeleniumUtil.click("xpath", "//div[text()='" + modalWindowName + "'][contains(@class,'x-title-text')]//ancestor::div[starts-with(@class,'x-window')]//div[text()='" + buttonName + "']", 5);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click modal window button.png");
            fail(e.getMessage());
        }
    }
}