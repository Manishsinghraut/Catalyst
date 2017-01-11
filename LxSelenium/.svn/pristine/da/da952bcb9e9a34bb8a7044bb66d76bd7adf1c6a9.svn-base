package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Represents the [Create Mapping] page.
 */
public class CreateMapping {
    private final WebDriver driver;

    private WebElement mappingNameFld;
    private WebElement descriptionFld;

    private WebElement editBtn;

    // IWMS Source Fields
    // ------------------
    private WebElement lxUrlFld;
    private WebElement lxUserIDFld;
    private WebElement lxPassWDFld;
    private WebElement lxFirmFld;

    // Database Target Fields
    // ----------------------
    private WebElement dbHostFld;
    private WebElement dbNameFld;
    private WebElement dbUserIDFld;
    private WebElement dbPassWDFld;

    private WebElement createBtn;

    public void setMappingName(String name) {
        mappingNameFld.sendKeys(name);
    }

    public void setLxUrl(String lxUrl) {
        // The LX URL field is an auto complete field and requires special care.
        lxUrlFld.sendKeys(lxUrl + "\t");
        try {
            Thread.sleep(500l);
        } catch (InterruptedException e) {
        }
    }

    public void setLxUserID(String lxUserID) {
        // The LX UserID field is an auto complete field and requires special care.
        lxUserIDFld.sendKeys(lxUserID + "\t");
        try {
            Thread.sleep(500l);
        } catch (InterruptedException e) {
        }
    }

    public void setLxPassWD(String lxPassWD) {
        lxPassWDFld.sendKeys(lxPassWD);
    }

    public void setLxFirm(String lxFirm) {
        lxFirmFld.sendKeys(lxFirm + "\t");
        try {
            Thread.sleep(500l);
        } catch (InterruptedException e) {
        }
    }

    public void setDBHost(String dbHost) {
        dbHostFld.sendKeys(dbHost + "\t");
        try {
            Thread.sleep(500l);
        } catch (InterruptedException e) {
        }
    }

    public void setDBName(String dbName) {
        dbNameFld.sendKeys(dbName + "\t");
    }

    public void setDBUserID(String dbUserID) {
        dbUserIDFld.sendKeys(dbUserID + "\t");
    }

    public void setDBPassWD(String dbPassWD) {
        dbPassWDFld.sendKeys(dbPassWD);
    }

    /**
     * Click the Edit button which will display the [Execution Schedule] dialog.
     *
     * @return ExecutionScheduleDialog which the Edit button displays
     */
    public ExecutionScheduleDialog clickEditButton() {
        editBtn.click();

        return new ExecutionScheduleDialog(driver);
    }

    /**
     * Clicks the Create button if it is enabled.
     *
     * @return true if button was enabled and was clicked
     */
    public boolean clickCreateButton() {
        if (!createBtn.isDisplayed()) {
            return false;
        }

        if (createBtn.getAttribute("aria-disabled") != null) {
            return false;
        }

        createBtn.click();

        return true;
    }

    public CreateMapping(WebDriver driver) {
        this.driver = driver;

        WebElement          page = driver.findElement(By.cssSelector("div[id^=createMapping-]"));
        List<WebElement> buttons = page.findElements(By.tagName("button"));

        assertTrue("The [Create Mapping] page is not visible!", page.isDisplayed());
        assertEquals(2, buttons.size());

        mappingNameFld = page.findElement(By.cssSelector("input[name=name]"));
        descriptionFld = page.findElement(By.cssSelector("input[name=description]"));
        editBtn        = buttons.get(0);

        lxUrlFld    = page.findElement(By.cssSelector("input[name=lxUrl]"));
        lxUserIDFld = page.findElement(By.cssSelector("input[name=lxUserID]"));
        lxPassWDFld = page.findElement(By.cssSelector("input[name=lxPassWD]"));
        lxFirmFld   = page.findElement(By.cssSelector("input[name=lxFirm]"));

        dbHostFld   = page.findElement(By.cssSelector("input[name=dbHost]"));
        dbNameFld   = page.findElement(By.cssSelector("input[name=dbName]"));
        dbUserIDFld = page.findElement(By.cssSelector("input[name=dbUserID]"));
        dbPassWDFld = page.findElement(By.cssSelector("input[name=dbPassWD]"));

        createBtn = buttons.get(1);
    }
}
