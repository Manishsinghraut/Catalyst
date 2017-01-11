package com.lucernex.qa.views.iwms.adminpages.memberadministration;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.fail;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class MemberContactsImportView {
    private static final Logger logger = Logger.getLogger(MemberContactsImportView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void clickEditBtnOfMember(String strAction ,String strMember) throws Throwable {
        try{
            SeleniumUtil.clickElement("xpath","//td//div[contains(text(),'"+strMember+"')]//parent::td//following-sibling::td//div/a[contains(text(),'"+strAction+"')]",20);
        } catch (InterruptedException e) {
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyMember(String strChart) throws Throwable {
        String screenValue = "";
        int count = 0;
        while (!(count == 10)) {
            try {
                screenValue = SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),'" + strChart + "')]").getText().trim();
                Assert.assertEquals(screenValue, strChart);
                break;
            } catch (StaleElementReferenceException e) {
                count++;
            }
        }
    }

    public static void selectInactiveStatus(String member, String headerName) throws Throwable {
        int count = 0;
        int colIndex = 0;
        WebElement row = null;
        List<WebElement> rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.rowColor1"));
        for (WebElement tr:rows){
            AllContractPagesView.focusWebElement(tr);
            for(WebElement td :tr.findElements(By.tagName("td"))){
                AllContractPagesView.focusWebElement(td);
                if(AllContractPagesView.getTextAndByPassException(td).trim().equals(member)){
                    count = count+1;
                    row = tr;
                }
            }
        }

        for(WebElement td :BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td.tblHeader"))){
            AllContractPagesView.focusWebElement(td);
            if(AllContractPagesView.getTextAndByPassException(td).trim().equals(headerName)){
                break;
            }
            colIndex++;
        }

        if(count==1){
            logger.info("Info: "+member+" member is unique in the grid and continue selecting status...");
        }else{
            logger.info("Info: "+member+" member is not unique in the grid found "+count+"members of same name...");
            BaseView.takeScreenshot("MembersWithSameName.png");
            fail("Info: " + member + " member is not unique in the grid found " + count + "members of same name...");
        }

        if(colIndex == 0){
            logger.info("No column headers of name "+headerName+" present");
            BaseView.takeScreenshot("No column headers of name.png");
            fail("No column headers of name " + headerName + " present");
        }
        try{
            row.findElements(By.tagName("td")).get(colIndex).findElement(By.cssSelector("input[type='radio']")).click();
        }catch(Exception e){
            logger.info("Failed to click radio button"+e.getMessage());
            BaseView.takeScreenshot("Failed to click radio button.png");
            fail("Failed to click radio button"+e.getMessage());
        }
    }
}