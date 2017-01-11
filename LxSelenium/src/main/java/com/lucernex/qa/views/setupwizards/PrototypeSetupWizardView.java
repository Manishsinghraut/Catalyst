package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.TypeFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import junit.framework.Assert;
//import org.eclipse.jetty.util.log.Log;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertTrue;

/**
 * Created by ToanD on 4/2/2014.
 */
public class PrototypeSetupWizardView {

    private static final Logger logger = Logger.getLogger(PrototypeSetupWizardView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void verifyValueAndLabelOnSummaryPage(List<Field> fields) throws Throwable {
        try {
            SeleniumUtil.switchTodefaultContent();
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            for (Field f : fields) {
                SeleniumUtil.verifyLabelAndValuePair(f.getName(), f.getValue());
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            org.junit.Assert.fail(e.getMessage());
        }
    }

    public static void verifyDescription(String strMember) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            String screenValue=SeleniumUtil.getTextValue("xpath", "//*[contains(text(),'" + strMember + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
            junit.framework.Assert.assertTrue(screenValue.contains(strMember));
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            junit.framework.Assert.fail(e.getMessage());
        }
    }
}