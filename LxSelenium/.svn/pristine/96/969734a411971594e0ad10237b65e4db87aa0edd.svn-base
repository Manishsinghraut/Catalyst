package com.lucernex.qa.utils;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

/**
 * Created by RLE0097 on 3/27/2015.
 */
public class PageFormNonEditableFields {
    private static final Logger logger = Logger.getLogger(PageFormNonEditableFields.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public static void summaryFieldsValue(List<Field> fields,String tableHeader) throws Throwable{
        try{
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            CommonMethods.waitTillDivisionLoads();
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            for (Field f : fields) {

                if((SeleniumUtil.verifyDataInNestedTables(tableEle, "cssselector", "table[class=\'noBorder\']", "cssselector", "span[class=\'optionalFieldLabel\']", tableHeader, f.getName(), f.getValue()))==false) {
                    BaseView.takeScreenshot(f.getName()+".png");
                    Assert.fail(f.getName() + " does not exist !");
                }
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("summaryFieldsValue.png");
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
        }
    }

	public static void summaryFieldsValueEquals(List<Field> fields,String tableHeader){
        try{
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            for (Field f : fields) {

                if((SeleniumUtil.verifyDataInNestedTablesEquals(tableEle, "cssselector", "table[class=\'noBorder\']", "cssselector", "span[class=\'optionalFieldLabel\']", tableHeader, f.getName(), f.getValue()))==false) {
                    BaseView.takeScreenshot(f.getName()+".png");
                    Assert.fail(f.getName() + " does not exist !");
                }
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("summaryFieldsValue.png");
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void fieldValueSplitInTwoColumn(List<Field> fields){
        try{
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            for (Field f : fields) {
                if((SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))==false)
                    Assert.fail(f.getName() + " does not exist !");
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    public static void fieldValueSameColumn(List<Field> fields){
        try{
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            for (Field f : fields) {
                if((SeleniumUtil.verifyDataInTableColumn(tableEle, f.getName(), f.getValue()))==false)
                    Assert.fail(f.getName() + " does not exist !");
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    public static void fieldValueSameRow(List<Field> fields) throws Throwable{
        try{
            /*WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
           SeleniumUtil.getFrameIndex("cssSelector","table[class=\'rowColor1\']");*/
            try{
                CommonMethods.switchToVisibleFrame();
                CommonMethods.waitTillDivisionLoads();
                CommonMethods.switchToVisibleFrame();
            }catch(Throwable e){
            }

            //WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            WebElement tableEle = SeleniumUtil.getWebElementWithoutStaleness("cssSelector", "table[class=\'rowColor1\']");

            for (Field f : fields) {
                if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                    try{
                        if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                            BaseView.takeScreenshot(f.getName()+".png");
                            Assert.fail(f.getName() + " does not exist !");
                        }
                    }catch(Exception ex){

                    }
                }
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("fieldValueSameRow.png");
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
        }
    }

	public static void fieldRowPairValue(List<Field> fields){
        try{
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            for (Field f : fields) {
                if((SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))==false)
                    Assert.fail(f.getName() + " does not exist !");
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }
    public static void fieldValueInTable(List<Field> fields){
        try{
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            for (Field f : fields) {
//                if(tableEle.getText().contains(f.getValue())==false){
//                    SeleniumUtilities.Log.info("value does not exist :"+f.getValue());
//                }
//                else
//                    SeleniumUtilities.Log.info("value exist :"+f.getValue());
                assertTrue("Value :"+"Name :"+f.getName()+ "Value :"+f.getValue(),(((tableEle.getText().contains(f.getValue())) && (tableEle.getText().contains(f.getName())))));
//                if(((tableEle.getText().contains(f.getValue())) && (tableEle.getText().contains(f.getName())))){
//
//                }
//                else
//                    Assert.fail(f.getName() + " does not exist !");

//                if(tableEle.getText().contains(f.getValue())==false){
//                    Assert.fail(f.getName() + " does not exist !");
//                }
//                if((SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))==false)
//                    Assert.fail(f.getName() + " does not exist !");
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    public static void fieldValueSameRowInNonFrame(List<Field> fields) throws Throwable{
        try{
            CommonMethods.waitTillDivisionLoads();
            WebElement tableEle = SeleniumUtil.getWebElementWithoutStaleness("cssSelector", "table[class=\'rowColor1\']");

            for (Field f : fields) {
                if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                    try{
                        if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                            BaseView.takeScreenshot(f.getName()+".png");
                            Assert.fail(f.getName() + " does not exist !");
                        }
                    }catch(Exception ex){

                    }
                }
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("fieldValueSameRow.png");
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
        }
    }
    public static void fieldValueSameRowInNonFramePage(List<Field> fields) throws Throwable{
        try{
            CommonMethods.waitTillDivisionLoads();
            WebElement tableEle = SeleniumUtil.getWebElementWithoutStaleness("cssSelector", "table[class=\'rowColor1\']");

            for (Field f : fields) {
                if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                    try{
                        if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                            BaseView.takeScreenshot(f.getName()+".png");
                            Assert.fail(f.getName() + " does not exist !");
                        }
                    }catch(Exception ex){

                    }
                }
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("fieldValueSameRow.png");
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void fieldValueSameRowNonFrame(List<Field> fields) throws Throwable{
        try{
            try{
                CommonMethods.waitTillDivisionLoads();
            }catch(Throwable e){
            }

            //WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector","table[class=\'rowColor1\']");
            WebElement tableEle = SeleniumUtil.getWebElementWithoutStaleness("cssSelector", "table[class=\'rowColor1\']");

            for (Field f : fields) {
                if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                    try{
                        if((!SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue()))) {
                            BaseView.takeScreenshot(f.getName()+".png");
                            Assert.fail(f.getName() + " does not exist !");
                        }
                    }catch(Exception ex){

                    }
                }
            }
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("fieldValueSameRow.png");
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
        }
    }
}
