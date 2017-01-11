package com.lucernex.qa.views.iwms.contract.details.forms;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.fail;

/**
 * Created by sowmya on 9/24/2015.
 */
public class FormsView extends BaseView {

    private static final Logger logger = Logger.getLogger(FormsView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void addPersons(List<String> members) throws Throwable {
        for (String s : members) {
            try {
                SeleniumUtil.select("name", "availablePersons", s.trim(), SeleniumUtilities.OBJWAITTIMEOUT);
               /* SeleniumUtil.clickElement("xpath", "/*//*[@*='>>'][2]", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);*/
                BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[value='>>']")).get(1).click();
                CommonMethods.getOptionsFromMultipleSelectionBox("AttentionPersonIDList", s);
            } catch (Exception e) {
                BaseView.takeScreenshot("UnableToAddPersons.png");
                fail("Unable to Add Persons");
            }
        }
    }
}
