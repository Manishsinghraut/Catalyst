package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.TypeFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertTrue;

/**
 * Created by ToanD on 4/2/2014.
 */
public class PortfolioSetupWizardView {

    private static final Logger logger = Logger.getLogger(PortfolioSetupWizardView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void verifyOrgChart(String strChart) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            String screenValue=SeleniumUtil.getTextValue("xpath", "//*[contains(text(),\"" + strChart + "\")]", SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertEquals(screenValue, strChart);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyManagementMembersLink(String strMember) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            String screenValue=SeleniumUtil.getTextValue("linktext", strMember, SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertEquals(screenValue,strMember);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyMembers(String strMember) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            String screenValue=SeleniumUtil.getTextValue("xpath", "//*[contains(text(),'" + strMember + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertEquals(screenValue,strMember);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyManagersAndMembers(String strChart, List<TypeFields> fields) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            WebElement element = SeleniumUtil.getWebElementObject("xpath", "//td[text()='" + strChart + "']//ancestor::div[starts-with(@id,'orgn')]");
            for (TypeFields f : fields) {

                if (f.getLocator().equalsIgnoreCase("linktext")) {
                    assertTrue(element.findElement(By.linkText(f.getElement())).isDisplayed());
                    logger.info(f.getElement() + " is found within org chart");

                } else if (f.getLocator().equalsIgnoreCase("xpath")) {
                    assertTrue(element.findElement(By.xpath(f.getElement())).isDisplayed());
                    logger.info(f.getElement() + " is found within org chart");

                } else if (f.getLocator().equalsIgnoreCase("cssselector")) {
                    assertTrue(element.findElement(By.cssSelector(f.getElement())).isDisplayed());
                    logger.info(f.getElement() + " is found within org chart");
                }
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("OrgChart.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyDeleteRegion(String region) throws Throwable {
        try {
            SeleniumUtil.switchToFrameHavingElement("linktext", "<add Parent Region>");
            assertTrue(SeleniumUtil.getWebDriver().findElements(By.xpath("//*[contains(text(),'" + region + "')]")).size() == 0);
            logger.info("Deleted region '" + region + "' is not present in org chart");
        } catch (Exception e) {
            BaseView.takeScreenshot("DeletedRegionPresent.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyValuesOnAddParentPopup(List<Field> fields) throws Throwable {
        try {
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[id=\'LinkRegionManagerTable\']");
            for (Field f : fields) {
                if ((SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue())) == false) {
                    BaseView.takeScreenshot(f.getValue() + ".png");
                    Assert.fail(f.getName() + " does not exist !");
                }
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_values_on_add_parent_region_editable_pop_up.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void addMembers(List<String> members,String loctorValue)throws Throwable{
        for(String s : members){
            try{
                SeleniumUtil.select("name",loctorValue, s.trim(), SeleniumUtilities.OBJWAITTIMEOUT);
//                SeleniumUtil.clickElement("xpath", "//*[@*=' >> ']", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
                SeleniumUtil.clickElement("cssselector", "*[value*='>>']", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            }catch(Exception e){
                BaseView.takeScreenshot("AddMembersError.png");
            }
        }
    }

    public static void addProMembers(List<String> members,String strMemberType,String loctorValue)throws Throwable{
        WebElement ele = SeleniumUtil.getClickableWebElementObject("xpath","//div[@id='"+strMemberType+"']/following-sibling::table");
        for(String s : members){
            SeleniumUtil.select(ele.findElement(By.name(loctorValue)), s.trim(), SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click(ele.findElement(By.name("addApprover")), SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
        }
    }

    public static void clickOrgChartWindowButton() throws Throwable{
        BrowserDriver.waitForElement
                (BrowserDriver.getCurrentDriver().findElement(By.cssSelector(" span[id^='copyOrgChartCloseBtn'][class*='x-btn-inner']")),30);
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector(" span[id^='copyOrgChartCloseBtn'][class*='x-btn-inner']")).click();
        CommonMethods.waitTillDivisionLoads();
    }

    public static void validateSuccessMessageDontThrowError(List<String> text) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (String msg : text) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 60);
                wait.until(ExpectedConditions
                        .textToBePresentInElement(BrowserDriver.getCurrentDriver().findElement(By.tagName("*")), msg));
                logger.info("text present " + msg + " in page");
            } catch (Exception Ex) {
                BaseView.takeScreenshot("successMessage.png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }
}
