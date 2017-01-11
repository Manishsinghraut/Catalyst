package com.lucernex.qa.views.admin.lxadmin;

import com.lucernex.qa.PageUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

/**
 * Represents the series of two IWMS pages that creates a new firm after clicking
 * the Add button on the Create Enterprise Company form.
 */
public class SetupFirmWizardView {
    private static final String   ADD_BTN = "Add";
    private static final String START_BTN = "Start Processing";
    private static final String RESET_BTN = "Reset";
    private static final int TIMEOUT_SECS = 20;
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private boolean clickButton(String buttonName, WebElement button, PageUtilities utilities) {
        try {
//            utilities.waitForElementDisplayed(button, TIMEOUT_SECS);
            for(int i=0;i<10;i++) {
                boolean buttonExist= SeleniumUtil.waitForElementVisibilityOf(button, 2);
                if(buttonExist) break;
            }

        } catch (Exception e) {
            fail(
                String.format(
                    "Did not see the '%s' button after waiting %d seconds",
                    buttonName,
                    TIMEOUT_SECS
                )
            );
        }

        if (!button.isDisplayed()) {
            return false;
        }

        button.click();
        return true;
    }

    /**
     * Attempts to click the specified setup firm wizard button waiting for it to
     * appear first.
     *
     * @param buttonName - name of wizard button for which we are looking
     *
     * @return true if saw the specified button and was able to click it
     */
    public boolean clickButton(String buttonName) {
        BaseView.pushShortTimeout(120);
        assertNotNull("Required argument 'buttonName' is null!", buttonName);

        WebDriver            wd = BrowserDriver.getCurrentDriver();
        PageUtilities utilities = new PageUtilities(wd);

        if (buttonName.equalsIgnoreCase(ADD_BTN)) {
            WebElement addButton = wd.findElement(By.id("submitButton"));

            return clickButton(ADD_BTN, addButton, utilities);
        } else if (buttonName.equalsIgnoreCase(START_BTN)) {
            WebElement startButton = wd.findElement(By.cssSelector("input[value='Start Processing'][type='submit']"));

            return clickButton(START_BTN, startButton, utilities);
        } else if (buttonName.equalsIgnoreCase("Reset")) {
            WebElement resetButton = wd.findElement(By.cssSelector("input[value='Reset'][type='submit']"));

            boolean ok = clickButton(RESET_BTN, resetButton, utilities);

            HomeView.verifyFooterDisplayed(); // Wait until home page is visible
            HomeView.takeScreenshot("CreateEnterpriseCompany.png");
            return ok;
        } else {
            fail(String.format("Unknown setup firm wizard button '%s' specified!", buttonName));
            return false; // will never reach here
        }
    }
}
