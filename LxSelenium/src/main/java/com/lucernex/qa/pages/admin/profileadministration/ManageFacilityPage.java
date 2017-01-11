package com.lucernex.qa.pages.admin.profileadministration;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Created by RLE0239 on 22-01-2016.
 */
public class ManageFacilityPage {
    @FindBy(how = How.CSS, using = "table.frmAdmin")
    public WebElement successMsg;

    @FindBy(how = How.CSS,using = "div[id^='messagebox'][class='x-component x-window-text x-box-item x-component-default']")
    public WebElement inactiveSchedule;

    @FindBy(how = How.CSS,using = "input[onclick='listActive(false);']")
    public WebElement listInactive;


}
