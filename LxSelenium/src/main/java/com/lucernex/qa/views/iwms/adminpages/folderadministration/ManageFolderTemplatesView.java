package com.lucernex.qa.views.iwms.adminpages.folderadministration;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class ManageFolderTemplatesView {
    private static final Logger logger = Logger.getLogger(ManageFolderTemplatesView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void verifyCreatedFolder(String strFolderName) throws Throwable{
        boolean boolStatus;
        try {
            Assert.assertTrue(SeleniumUtil.elementShouldContain("xpath", ".//span[./text()='" + strFolderName + "']", strFolderName));
        } catch (Exception e) {
            // TODO Auto-generated catch block
            SeleniumUtil.Log.info("Error :"+e.getMessage());
            TestCase.fail(e.getMessage());
            BaseView.takeScreenshot(strFolderName+".png");
            return;
        }
    }

    public static void verifyDeletedFolder(String strFolderName) throws Throwable{
        try {
            if(SeleniumUtil.isElementPresent(".//span[./text()='" + strFolderName + "']"))
                logger.info(strFolderName + "folder exist");
            else
                logger.info(strFolderName + "folder does not exist");
        } catch (Exception e) {
            BaseView.takeScreenshot("token.png");
            return;
        }
    }

    public static void verifyAssignTemplateFolder(String strFolderName) throws Throwable{
        boolean boolStatus;
        try {
            Assert.assertTrue(SeleniumUtil.elementShouldContain("xpath", ".//span[./text()='" + strFolderName + "']", strFolderName));
        } catch (Exception e) {
            // TODO Auto-generated catch block
            SeleniumUtil.Log.info("Error :"+e.getMessage());
            TestCase.fail(e.getMessage());
            BaseView.takeScreenshot(strFolderName+".png");
            return;
        }
    }

    public static void selectFolderTemplate(List<Field> fields) throws Throwable{
        for (Field f : fields) {
            try {
                SeleniumUtil.select("name", f.getName(), f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + e.getMessage());
            }
        }
    }
}
