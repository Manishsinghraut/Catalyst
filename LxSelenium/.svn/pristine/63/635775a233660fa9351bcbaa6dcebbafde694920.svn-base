package com.lucernex.qa.pages.lxsiteadminpage;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertNotNull;

/**
 * Created by salomem on 7/15/2014.
 */
public class LxSiteAdminPage {
    /**
     * Enum to facilitate the selection of the correct button on the Lx Admin Page.
     */
    public enum LxAdminButton {
        CREATE_NEW_COMPANY, RUN_EMAIL_ALERTS;

        public static LxAdminButton fromString(String name) {
            if(isNullOrEmpty(name)) {
                throw new IllegalArgumentException("Required argument 'name' is null/empty!");
            }

            name = name.replace(" ", "_");

            for(LxAdminButton lxBtn : LxAdminButton.values()) {
                if(name.equalsIgnoreCase(lxBtn.name())) {
                    return lxBtn;
                }
            }

            throw new IllegalArgumentException(String.format("Specified name [%s] is unknown!", name));
        }
    }

    /*  The pages WebElements   */
    @FindBy(css = "input[value='Create New Company']")
    public WebElement createNewCompanyBtn;

    @FindBy(css = "input[value='Run Email Alerts']")
    public WebElement runEmailAlertsBtn;

    @FindBy(css = "form[action*='/admin/FirmEditOneClick.jsp']")
    public WebElement createFirmForm;

    public void clickButton(String name) {
        WebElement btnElement;

        switch (LxAdminButton.fromString(name)) {
            case CREATE_NEW_COMPANY:
                btnElement  =   this.createNewCompanyBtn;
                break;
            case RUN_EMAIL_ALERTS:
                btnElement = this.runEmailAlertsBtn;
                break;
            default:
                btnElement = null;
                break;
        }

        assertNotNull("Did not find the button on the Lx Admin Page", btnElement);

        btnElement.click();
    }
}
